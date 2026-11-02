---
slug: pnpm-workspace
sources:
  - https://pnpm.io/package-json
  - https://pnpm.io/cli/install
  - https://pnpm.io/workspaces
date: 2026-11-02
tags:
  - pnpm
  - package-manager
  - workspace
  - dependencies
  - scripts
  - lockfile
---

# pnpm Package Manager

## Overview

pnpm (Performant npm) is a fast, disk-space efficient package manager that uses content-addressable storage and symlinks.

---

## 1. Installation & Setup

```bash
# Install pnpm globally
corepack enable
corepack prepare pnpm@latest --activate

# Verify installation
pnpm --version

# Initialize project
pnpm init

# Add dependencies
pnpm add react react-dom
pnpm add -D vite @vitejs/plugin-react typescript

# Add peer dependencies
pnpm add @radix-ui/react-dropdown-menu --peer
```

---

## 2. Package.json Scripts

```json
{
  "name": "my-app",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview",
    "lint": "eslint src --ext .ts,.tsx",
    "lint:fix": "eslint src --ext .ts,.tsx --fix",
    "format": "prettier --write \"src/**/*.{ts,tsx,css}\"",
    "type-check": "tsc --noEmit",
    "test": "vitest",
    "test:run": "vitest run",
    "test:coverage": "vitest --coverage",
    "e2e": "playwright test",
    "e2e:ui": "playwright test --ui",
    "clean": "rm -rf dist node_modules/.vite",
    "prepare": "husky install"
  },
  "dependencies": {
    "react": "^19.0.0",
    "react-dom": "^19.0.0"
  },
  "devDependencies": {
    "@types/react": "^19.0.0",
    "@vitejs/plugin-react": "^4.0.0",
    "typescript": "^5.0.0",
    "vite": "^6.0.0"
  }
}
```

---

## 3. Workspace Configuration

### Monorepo Setup

```yaml
# pnpm-workspace.yaml
packages:
  - 'apps/*'
  - 'packages/*'
  - 'libs/*'
```

```
project/
├── apps/
│   ├── web/
│   │   ├── package.json
│   │   └── vite.config.ts
│   └── admin/
│       ├── package.json
│       └── vite.config.ts
├── packages/
│   ├── ui/
│   │   ├── package.json
│   │   └── tsconfig.json
│   └── utils/
│       ├── package.json
│       └── tsconfig.json
└── pnpm-workspace.yaml
```

### Workspace Dependencies

```json
// packages/ui/package.json
{
  "name": "@my/ui",
  "version": "1.0.0",
  "dependencies": {
    "react": "^19.0.0"
  }
}

// apps/web/package.json
{
  "name": "@my/web",
  "version": "1.0.0",
  "dependencies": {
    "@my/ui": "workspace:*",
    "@my/utils": "workspace:*"
  }
}
```

---

## 4. Dependency Management

### Dependency Types

```json
{
  "dependencies": {
    "react": "^19.0.0"
  },
  "devDependencies": {
    "typescript": "^5.0.0"
  },
  "peerDependencies": {
    "react": "^19.0.0"
  },
  "optionalDependencies": {
    "fsevents": "^2.3.0"
  }
}
```

### Lockfile

```bash
# Generate lockfile
pnpm install

# Update lockfile only (no package changes)
pnpm update --lockfile-only

# Verify lockfile integrity
pnpm audit

# Check for outdated packages
pnpm outdated

# Update all dependencies
pnpm update

# Update specific package
pnpm update react

# Update to latest major version
pnpm update react --latest
```

---

## 5. pnpm Commands

### Install

```bash
# Install all dependencies
pnpm install

# Install production dependencies only
pnpm install --prod

# Install with frozen lockfile (CI)
pnpm install --frozen-lockfile

# Install with no-lockfile (CI cache)
pnpm install --no-frozen-lockfile
```

### Add/Remove

```bash
# Add package
pnpm add react

# Add dev dependency
pnpm add -D typescript

# Add peer dependency
pnpm add @radix-ui/react-dropdown-menu --peer

# Remove package
pnpm remove react

# Remove dev dependency
pnpm remove -D typescript
```

### Run Scripts

```bash
# Run script
pnpm run build

# Run script with args
pnpm run build -- --mode production

# Run multiple scripts in parallel
pnpm run -r build

# Run script in specific workspace
pnpm --filter @my/web build
```

---

## 6. Store & Caching

```bash
# View store location
pnpm store path

# Prune store (remove unused packages)
pnpm store prune

# Clean node_modules and reinstall
pnpm install --force

# View dependency tree
pnpm list --depth=0
pnpm list --recursive --depth=0
```

---

## 7. Best Practices

### Workspace Protocol

```json
// Use workspace protocol for internal packages
{
  "dependencies": {
    "@my/ui": "workspace:*",
    "@my/utils": "workspace:^1.0.0"
  }
}
```

### Strict Peer Dependencies

```json
// pnpm-config.json (in .npmrc)
strict-peer-dependencies=true
auto-install-peers=true
```

```
# .npmrc
strict-peer-dependencies=false
auto-install-peers=true
```

### Avoid Hoisting Issues

```bash
# Create .npmrc to control hoisting
# Never hoist specific packages
never-hoist=typescript

# Always hoist to root
hoist-pattern=*
```

---

## Cross-References

- [CI/CD GitHub Actions](./cicd-github-actions.md)
- [Docker Nginx Deployment](./docker-nginx-deployment.md)
- [Commit Management](../Commit%20Management/commit-management-integration.md)
