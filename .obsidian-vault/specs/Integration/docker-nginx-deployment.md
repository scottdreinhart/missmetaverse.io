---
slug: docker-nginx-deployment
sources:
  - https://docs.docker.com/build/building/multi-stage/
  - https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/
  - https://vite.dev/guide/static-deploy
  - https://vite.dev/config/build-options.html
date: 2026-11-02
tags:
  - integration
  - docker
  - nginx
  - deployment
  - multi-stage
  - static-content
---

# Docker & Nginx Deployment

## Overview

This note covers containerizing a React + Vite + TypeScript application using multi-stage Docker builds and serving it with Nginx. This produces a minimal, secure, production-ready container image.

---

## 1. Multi-Stage Dockerfile

### Production Dockerfile

```dockerfile
# syntax=docker/dockerfile:1

# ═══════════════════════════════════════════════════════════
# STAGE 1: Build
# ═══════════════════════════════════════════════════════════
FROM node:22-alpine AS build

# Install dependencies first (layer caching)
WORKDIR /app

# Copy package files for dependency installation
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Install dependencies (with native addons for platform)
RUN pnpm install --frozen-lockfile

# Copy source code
COPY . .

# Build environment variables
ARG VITE_API_URL
ENV VITE_API_URL=${VITE_API_URL}

# Build the application
RUN pnpm build

# ═══════════════════════════════════════════════════════════
# STAGE 2: Production (Nginx)
# ═══════════════════════════════════════════════════════════
FROM nginx:1.27-alpine AS production

# ─── Copy built assets ──────────────────────────────────
COPY --from=build /app/dist /usr/share/nginx/html

# ─── Custom Nginx configuration ─────────────────────────
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# ─── Security headers file ──────────────────────────────
COPY nginx/security.conf /etc/nginx/snippets/security.conf

# ─── Create non-root user ───────────────────────────────
RUN addgroup -g 1001 -S nonroot && \
    adduser -S nonroot -u 1001 -G nonroot && \
    chown -R nonroot:nonroot /usr/share/nginx/html && \
    chown -R nonroot:nonroot /var/cache/nginx && \
    chown -R nonroot:nonroot /var/log/nginx && \
    chown -R nonroot:nonroot /etc/nginx/conf.d && \
    chown -R nonroot:nonroot /run

# ─── Health check ───────────────────────────────────────
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80/ || exit 1

# ─── Expose port ────────────────────────────────────────
EXPOSE 80

# ─── Run as non-root ────────────────────────────────────
USER nonroot

# ─── Start Nginx ────────────────────────────────────────
CMD ["nginx", "-g", "daemon off;"]
```

### Development Dockerfile (Multi-Target)

```dockerfile
# syntax=docker/dockerfile:1

# ═══════════════════════════════════════════════════════════
# STAGE 1: Dependencies
# ═══════════════════════════════════════════════════════════
FROM node:22-alpine AS deps

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install --frozen-lockfile

# ═══════════════════════════════════════════════════════════
# STAGE 2: Build
# ═══════════════════════════════════════════════════════════
FROM node:22-alpine AS build

WORKDIR /app

# Copy dependencies from deps stage
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/package.json ./package.json
COPY --from=deps /app/pnpm-lock.yaml ./pnpm-lock.yaml

# Copy source
COPY . .

# Build
ARG VITE_API_URL
ENV VITE_API_URL=${VITE_API_URL}
RUN pnpm build

# ═══════════════════════════════════════════════════════════
# STAGE 3: Production (Nginx)
# ═══════════════════════════════════════════════════════════
FROM nginx:1.27-alpine AS production

COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx/security.conf /etc/nginx/snippets/security.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# ═══════════════════════════════════════════════════════════
# STAGE 4: Development (Node.js)
# ═══════════════════════════════════════════════════════════
FROM node:22-alpine AS dev

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install --frozen-lockfile

COPY . .

ENV NODE_ENV=development
ENV VITE_APP_URL=http://localhost:5173

EXPOSE 5173
CMD ["pnpm", "dev", "--", "--host", "0.0.0.0"]
```

---

## 2. Nginx Configuration

### `nginx/nginx.conf`

```nginx
server {
    listen 80;
    server_name _;

    # ─── Root directory ─────────────────────────────────
    root /usr/share/nginx/html;
    index index.html;

    # ─── Security Headers ───────────────────────────────
    include /etc/nginx/snippets/security.conf;

    # ─── Gzip Compression ───────────────────────────────
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types
        text/plain
        text/css
        text/xml
        text/javascript
        application/json
        application/javascript
        application/x-javascript
        application/xml
        application/xml+rss
        application/vnd.ms-fontobject
        font/opentype
        image/svg+xml
        image/x-icon;
    gzip_min_length 1024;

    # ─── Static Asset Caching ───────────────────────────
    # Assets directory (Vite content-hashed files)
    location /assets/ {
        expires 1y;
        cache-control "public, immutable";
        add_header Cache-Control "public, max-age=31536000, immutable";
        access_log off;
    }

    # ─── Favicon ────────────────────────────────────────
    location = /favicon.ico {
        access_log off;
        log_not_found off;
    }

    # ─── Robots.txt ─────────────────────────────────────
    location = /robots.txt {
        access_log off;
        log_not_found off;
    }

    # ─── SPA Routing (History Mode) ─────────────────────
    # For React Router with history mode
    location / {
        try_files $uri $uri/ /index.html;
    }

    # ─── Security ───────────────────────────────────────
    # Disable directory listing
    autoindex off;

    # Hide server version
    server_tokens off;

    # ─── Error Pages ────────────────────────────────────
    error_page 404 /index.html;
    error_page 500 502 503 504 /50x.html;

    location = /50x.html {
        root /usr/share/nginx/html;
        internal;
    }
}
```

### `nginx/security.conf`

```nginx
# ─── Content Security Policy ────────────────────────────
add_header Content-Security-Policy "default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' data: blob:; font-src 'self' data:; connect-src 'self'; media-src 'self'; object-src 'none'; frame-src 'none'; frame-ancestors 'none'; base-uri 'self'; form-action 'self';" always;

# ─── X-Frame-Options ───────────────────────────────────
add_header X-Frame-Options "SAMEORIGIN" always;

# ─── X-Content-Type-Options ────────────────────────────
add_header X-Content-Type-Options "nosniff" always;

# ─── X-XSS-Protection ──────────────────────────────────
add_header X-XSS-Protection "1; mode=block" always;

# ─── Referrer-Policy ───────────────────────────────────
add_header Referrer-Policy "no-referrer-when-downgrade" always;

# ─── Permissions-Policy ────────────────────────────────
add_header Permissions-Policy "geolocation=(), microphone=(), camera=(), payment=(), usb=()" always;

# ─── Strict-Transport-Security (HTTPS only) ────────────
# add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;

# ─── Cross-Origin Policies ─────────────────────────────
add_header Cross-Origin-Opener-Policy "same-origin" always;
add_header Cross-Origin-Resource-Policy "same-origin" always;
add_header Cross-Origin-Embedder-Policy "require-corp" always;
```

---

## 3. Docker Compose

### `docker-compose.yml`

```yaml
services:
  # ─── Production ───────────────────────────────────────
  app:
    build:
      context: .
      target: production
      args:
        VITE_API_URL: ${VITE_API_URL:-https://api.example.com}
    image: missmetaverse-io:latest
    container_name: missmetaverse-app
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - nginx-ssl-certs:/etc/nginx/ssl
    networks:
      - app-network
    healthcheck:
      test: ["CMD", "wget", "--quiet", "--tries=1", "--spider", "http://localhost:80/"]
      interval: 30s
      timeout: 3s
      retries: 3
      start_period: 10s
    logging:
      driver: json-file
      options:
        max-size: "10m"
        max-file: "3"

  # ─── Development ──────────────────────────────────────
  dev:
    build:
      context: .
      target: dev
    image: missmetaverse-io:dev
    container_name: missmetaverse-dev
    restart: unless-stopped
    ports:
      - "5173:5173"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - NODE_ENV=development
      - CHOKIDAR_USEPOLLING=true
    networks:
      - app-network

networks:
  app-network:
    driver: bridge

volumes:
  nginx-ssl-certs:
    driver: local
```

---

## 4. Build & Run Commands

### Build Commands

```bash
# Build production image
docker build -t missmetaverse-io:latest \
  --target production \
  --build-arg VITE_API_URL=https://api.example.com \
  .

# Build with Docker Compose
docker compose build --target production

# Build for specific platform
docker build --platform linux/amd64 -t missmetaverse-io:latest .

# Build with multi-platform support
docker buildx build --platform linux/amd64,linux/arm64 \
  -t missmetaverse-io:latest \
  --push \
  .
```

### Run Commands

```bash
# Run production container
docker run -d \
  --name missmetaverse-app \
  -p 80:80 \
  -e VITE_API_URL=https://api.example.com \
  missmetaverse-io:latest

# Run with Docker Compose
docker compose up -d app

# Run in development mode
docker compose up -d dev
```

---

## 5. Image Size Optimization

### Size Comparison

| Stage | Image Size | Description |
|-------|-----------|-------------|
| `node:22-alpine` | ~180 MB | Base Node.js image |
| After `pnpm install` | ~600 MB | Dependencies installed |
| After `pnpm build` | ~700 MB | Build artifacts included |
| **Final (Nginx)** | **~45 MB** | **Only static files + Nginx** |

### Optimization Techniques

```dockerfile
# 1. Use Alpine-based images (smallest)
FROM node:22-alpine
FROM nginx:1.27-alpine

# 2. Multi-stage builds (only final stage matters)
FROM node:22-alpine AS build
RUN pnpm build
FROM nginx:1.27-alpine
COPY --from=build /app/dist /usr/share/nginx/html
# Build tools are NOT in final image

# 3. .dockerignore (don't send unnecessary context)
# See .dockerignore below

# 4. Install only production dependencies
# (Not needed here since we use multi-stage)

# 5. Remove unnecessary files in same layer
RUN apk add --no-cache \
        wget \
    && rm -rf /var/cache/apk/*
```

### `.dockerignore`

```gitignore
# Development
node_modules
dist
.vite
coverage
playwright-report
test-results

# IDE
.vscode
.idea
*.swp
*.swo

# Git
.git
.gitignore

# Documentation
README.md
docs
*.md

# CI/CD
.github
.gitlab-ci.yml

# Docker
Dockerfile
docker-compose.yml
.dockerignore

# Environment
.env
.env.*
!.env.example

# OS
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*
```

---

## 6. Nginx Performance Tuning

### Optimized Nginx Configuration

```nginx
# /etc/nginx/nginx.conf (main config)

user nginx;
worker_processes auto;          # Auto-detect CPU cores
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    # ─── Logging ──────────────────────────────────────
    log_format main '$remote_addr - $remote_user [$time_local] '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent"';
    access_log /var/log/nginx/access.log main;

    # ─── Performance ──────────────────────────────────
    sendfile on;                  # Direct file transfer
    tcp_nopush on;                # Combine headers with data
    tcp_nodelay on;               # Disable Nagle's algorithm
    keepalive_timeout 65;         # Connection reuse
    types_hash_max_size 2048;

    # ─── Compression ─────────────────────────────────
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml;

    # ─── Buffer Sizes ───────────────────────────────
    client_body_buffer_size 16k;
    client_header_buffer_size 1k;
    large_client_header_buffers 4 8k;

    include /etc/nginx/conf.d/*.conf;
}
```

---

## 7. Deployment Strategies

### Strategy 1: Direct Deployment

```bash
# Build and push
docker build -t registry.example.com/missmetaverse-io:latest .
docker push registry.example.com/missmetaverse-io:latest

# Deploy
docker pull registry.example.com/missmetaverse-io:latest
docker stop missmetaverse-app || true
docker rm missmetaverse-app || true
docker run -d --name missmetaverse-app -p 80:80 registry.example.com/missmetaverse-io:latest
```

### Strategy 2: Blue-Green Deployment

```bash
# Deploy to new container
docker run -d --name missmetaverse-app-green -p 8080:80 registry.example.com/missmetaverse-io:latest

# Verify health
docker exec missmetaverse-app-green wget --quiet --tries=1 --spider http://localhost:80/

# Switch traffic (update load balancer or reverse proxy)
# Then stop old container
docker stop missmetaverse-app
docker rm missmetaverse-app

# Rename green to production
docker rename missmetaverse-app-green missmetaverse-app
```

### Strategy 3: Rolling Update (Docker Compose)

```bash
# Update and restart
docker compose pull
docker compose up -d --no-deps app
```

---

## 8. Health Checks & Monitoring

### Docker Health Check

```dockerfile
# In Dockerfile
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80/ || exit 1
```

### Check Health

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' missmetaverse-app

# View health logs
docker inspect missmetaverse-app | jq '.[0].State.Health'
```

### Nginx Status Endpoint

```nginx
# Add to nginx.conf for monitoring
location = /nginx-health {
    access_log off;
    return 200 "healthy\n";
    add_header Content-Type text/plain;
}
```

---

## Cross-References

- [Integration Master Config](./integration-master-config.md)
- [CI/CD GitHub Actions](./cicd-github-actions.md)
- [Vite Optimization & Security](./vite-optimization-security.md)
- [TypeScript Best Practices](./TypeScript/ts-best-practices.md)
- [HTML5 Best Practices](./Hypertext%20Markup/html5-best-practices.md)
- [CSS3 Performance & Security](./Cascading%20Stylesheets/css3-performance-security.md)
