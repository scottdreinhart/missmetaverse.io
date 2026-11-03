---
slug: nginx-patterns-original
sources:
  - https://nginx.org/
  - https://docs.nginx.com/
date: 2026-11-02
tags:
  - nginx
  - web-server
  - reverse-proxy
  - patterns
---

# Nginx Patterns

## Definition

Nginx Patterns are **design patterns for working with Nginx as a web server and reverse proxy**.

> "Nginx is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache." — Wikipedia

## Problem Addressed

Without Nginx patterns:
- **Performance**: Hard to handle many connections
- **Reverse proxy**: Hard to proxy to backend services
- **Load balancing**: Hard to balance load
- **SSL**: Hard to manage SSL certificates

## Scope and Boundaries

- Nginx Patterns ≠ Nginx (Nginx patterns are patterns, Nginx is a tool)
- Nginx Patterns ≠ Web Server (Nginx patterns are patterns, web server is a concept)
- Nginx Patterns is a **patterns**, not a tool

## When to Apply

- When building web applications
- when performance matters
- when reverse proxy is needed
- when load balancing is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Nginx patterns are complex |
| **Time** — Nginx patterns take time |
| **Over-Nginx** — Don't use Nginx for everything |

## Common Misuses

- **Everything Nginx**: Not everything needs Nginx patterns
- **Confusing with Nginx**: Nginx patterns ≠ Nginx
- **Over-Nginx**: Too much Nginx creates complexity

## Related Concepts

- [Docker Deployment](Architecture/docker-deployment-patterns.md) — Nginx patterns with Docker
- [CI/CD](Architecture/ci-cd.md) — Nginx patterns with CI/CD
- [Deployment](Architecture/deployment.md) — Nginx patterns with deployment

## Project Observations

- The project uses Nginx patterns:
  - The project's Docker deployment note covers Nginx patterns (from existing notes)
  - No evidence of Nginx patterns in existing code (src/ is empty)
- File naming conventions support Nginx patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Decision Tree: Nginx Configuration

```mermaid
graph TD
    A[Need Nginx configuration?]\n    A --> B{What role?}
    B -->|Reverse Proxy| C[Proxy to backend]
    B -->|Static Files| D[Serve static assets]
    B -->|Load Balancer| E[Balance multiple backends]
    B -->|SSL/TLS| F[HTTPS termination]
    C --> G{Single or Multiple?}
    G -->|Single| H[Single upstream]
    G -->|Multiple| I[Multiple upstreams]
    D --> J{Need caching?}
    J -->|Yes| K[Proxy cache]
    J -->|No| L[Direct serve]
    E --> M{Algorithm?}
    M -->|Round Robin| N[Default]
    M -->|Least Conn| O[least_conn]
    M -->|IP Hash| P[ip_hash]
```

### When to Use Each Nginx Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Reverse Proxy** | Proxy to backend | /api → localhost:3000 |
| **Static Files** | Serve assets | /static → /var/www/static |
| **Load Balancer** | Multiple backends | 3x app servers |
| **SSL Termination** | HTTPS | Let's Encrypt |
| **Rate Limiting** | Prevent abuse | 100 req/min |
| **Caching** | Improve performance | Proxy cache |

---

## Procedural Guidance: Nginx Setup

### Step 1: Basic Reverse Proxy

```nginx
# /etc/nginx/sites-available/myapp
server {
    listen 80;
    server_name myapp.com;

    # Redirect to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name myapp.com;

    # SSL configuration
    ssl_certificate /etc/letsencrypt/live/myapp.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/myapp.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    # Reverse proxy to backend
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }

    # Static files
    location /static/ {
        alias /var/www/myapp/static/;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }

    # API routes
    location /api/ {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Step 2: Load Balancing

```nginx
# Upstream configuration
upstream backend {
    least_conn;
    server 127.0.0.1:3001;
    server 127.0.0.1:3002;
    server 127.0.0.1:3003;
}

server {
    listen 80;
    server_name myapp.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### Step 3: Rate Limiting

```nginx
# Rate limiting configuration
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

server {
    listen 80;
    server_name myapp.com;

    location /api/ {
        limit_req zone=api burst=20 nodelay;
        proxy_pass http://localhost:3000;
    }

    # Custom error page for 429
    error_page 429 /429.html;
    location = /429.html {
        return 429 '{"error": "Too many requests"}';
    }
}
```

### Step 4: Caching

```nginx
# Proxy cache configuration
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=my_cache:10m max_size=1g inactive=60m;

server {
    listen 80;
    server_name myapp.com;

    location / {
        proxy_cache my_cache;
        proxy_cache_valid 200 302 10m;
        proxy_cache_valid 404 1m;
        proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
        add_header X-Cache-Status $upstream_cache_status;

        proxy_pass http://localhost:3000;
    }
}
```

### Step 5: Docker Integration

```dockerfile
# Dockerfile
FROM nginx:alpine

# Copy custom configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static files
COPY dist/ /usr/share/nginx/html/

# Expose ports
EXPOSE 80 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
```

```yaml
# docker-compose.yml
version: '3.8'

services:
  nginx:
    build: .
    ports:
      - "80:80"
      - "443:443"
    depends_on:
      - app

  app:
    build: ../app
    ports:
      - "3000:3000"
```

---

## Copilot Instructions

### When to Read This Note
- Configuring Nginx as reverse proxy
- Setting up load balancing
- Implementing SSL/TLS
- Adding rate limiting
- Configuring caching

### What to Do With This Information
1. **Use reverse proxy**: Proxy to backend services with proper headers
2. **Add security headers**: X-Frame-Options, X-Content-Type-Options, HSTS
3. **Implement load balancing**: Use least_conn or round_robin
4. **Add rate limiting**: Prevent abuse with limit_req_zone
5. **Enable caching**: Improve performance with proxy_cache

### Tools to Use
- **VS Code Extension**: Nginx Configuration Language Support — for Nginx autocomplete
- **VS Code Extension**: Error Lens — for inline Nginx error display
- **npm Package**: `nginx-config-validator` — for Nginx config validation
- **Terminal Command**: `nginx -t` — test Nginx configuration
- **Terminal Command**: `nginx -s reload` — reload Nginx configuration
- **Terminal Command**: `systemctl restart nginx` — restart Nginx service

### Agents to Invoke
- **Security Review Agent**: Run when adding SSL/TLS configuration
- **Performance Review Agent**: Run when configuring caching

### Integration with Other Notes
- Read [docker-deployment](https://docs.docker.com/deployment/) for Docker deployment patterns
- read [ci-cd-patterns](D/ci-cd-patterns.md) for CI/CD deployment patterns
- Read [deployment-patterns](D/deployment-patterns.md) for deployment strategies
- Read [monitoring-patterns](D/monitoring-patterns.md) for monitoring Nginx

### Common Pitfalls
- Don't forget security headers (X-Frame-Options, HSTS)
- Don't hardcode IPs (use variables)
- Don't skip SSL configuration (use TLSv1.2+)
- Don't ignore rate limiting (prevent abuse)
- Don't forget to reload Nginx after changes

### Quick Validation Checklist
- [ ] Are security headers added?
- [ ] Is SSL/TLS properly configured?
- [ ] Is rate limiting implemented?
- [ ] Is caching enabled where appropriate?
- [ ] Are proxy headers set correctly?
- [ ] Is Nginx tested with nginx -t?

