---
slug: pnpm-best-practices
sources:
  - https://pnpm.io/cli/install
  - https://pnpm.io/cli/add
  - https://pnpm.io/workspaces
  - https://pnpm.io/settings
  - https://pnpm.io
date: 2025-01-15
tags:
  - pnpm
  - package-manager
  - performance
  - security
  - workspace
  - best-practices
---

# pnpm: Best Practices, Security & Performance

## Overview

pnpm (Performant NPM) is a fast, disk space efficient package manager. It uses a content-addressable store and hardlinks symlinks for dependencies.

## Core Concepts

### Content-Addressable Store

pnpm stores packages in a global store keyed by their integrity hash. Each project's `node_modules` uses **hardlinks** to the store, saving disk space.

```
Global Store:
├── .store/
│   ├── lodash@4.17.21/
│   │   └── index.js (hardlinked)
│   └── react@19.0.0/
│       └── index.js (hardlinked)

Project node_modules:
├── node_modules/
│   ├── lodash -> ../../.store/lodash@4.17.21/index.js (hardlink)
│   └── react -> ../../.store/react@19.0.0/index.js (hardlink)
```

### Strict Node Modules

By default, pnpm enforces a strict `node_modules` structure — only explicitly declared dependencies are accessible. This prevents "phantom dependencies."

```json
// package.json
{
  "dependencies": {
    "react": "^19.0.0"
  }
}
```

```tsx
// GOOD: Explicitly declared dependency
import React from 'react';

// BAD: Phantom dependency — will fail with pnpm
import lodash from 'lodash'; // Not in dependencies!
```

## Installation Best Practices

### Basic Install

```bash
# Install all dependencies
pnpm install

# Alias: pnpm i
pnpm i
```

### CI/CD Best Practices

```bash
# CI: Frozen lockfile (default in CI environments)
pnpm install

# Allow lockfile updates in CI (when needed)
pnpm install --no-frozen-lockfile

# Preview changes without writing
pnpm install --dry-run

# Only update lockfile, don't install
pnpm install --lockfile-only
```

### Production-Only Install

```bash
# Install only production dependencies
pnpm install --prod

# Alias
pnpm i -P
```

### Workspace Install

```bash
# Install all workspace projects
pnpm install

# Install only root project
pnpm install --filter root

# Install specific workspace package
pnpm install --filter ./packages/ui
```

## Package Management

### Adding Packages

```bash
# Add to dependencies (production)
pnpm add lodash

# Add to devDependencies
pnpm add -D typescript

# Add to optionalDependencies
pnpm add -O esbuild

# Exact version
pnpm add lodash --save-exact
pnpm add lodash -E

# Specific version
pnpm add lodash@4.17.21

# From next tag
pnpm add lodash@next

# Package alias
pnpm add babel-core@npm:@babel/core@8.0.6

# Workspace package
pnpm add my-shared-lib --workspace

# Save types alongside package
pnpm add express --save-types
# Saves: express to dependencies, @types/express to devDependencies
```

### Supported Package Sources

```bash
# npm registry (default)
pnpm add express

# JSR registry
pnpm add jsr:@std/http

# Git repository
pnpm add github:owner/repo

# Local file
pnpm add ./local-package

# Remote tarball
pnpm add https://example.com/package.tgz

# Cargo crate
pnpm add crate:serde

# Python package
pnpm add pypi:requests

# Package URL (purl)
pnpm add pkg:npm/express@4.18.2
```

## Workspace Configuration

### pnpm-workspace.yaml

```yaml
# pnpm-workspace.yaml
packages:
  - 'apps/*'
  - 'packages/*'

# Settings
settings:
  # Auto-deduplicate compatible versions
  autoDedupe: true
  
  # Network concurrency for downloads
  network:
    networkConcurrency: 5
  
  # Store settings
  store:
    preferFrozenLockfile: true
    frozenStore: false
  
  # Build settings
  build:
    ignoreScripts: false
    allowBuilds:
      esbuild: true
      '!core-js': false
```

### Workspace Protocols

```json
// package.json
{
  "dependencies": {
    "my-shared-lib": "workspace:*",      // Any version matching
    "my-shared-lib": "workspace:^",       // Caret range
    "my-shared-lib": "workspace:~",       // Tilde range
    "my-shared-lib": "workspace:1.0.0"   // Exact version
  }
}
```

### Catalogs (Centralized Versions)

```yaml
# pnpm-workspace.yaml
catalog:
  react: ^19.0.0
  typescript: ^5.0.0

catalogs:
  my-team:
    eslint: ^9.0.0
    prettier: ^3.0.0
```

```bash
# Save to catalog
pnpm add eslint --save-catalog
pnpm add prettier --save-catalog=my-team
```

## Security Best Practices

### Integrity Verification

pnpm verifies package integrity using SHA-512 hashes stored in `pnpm-lock.yaml`:

```bash
# Default: integrity mismatch is a hard failure
pnpm install

# Update checksums (when registry rewrote tarballs)
pnpm install --update-checksums

# Trust lockfile against supply-chain policies
pnpm install --trust-lockfile
```

### Allow-Build Security

Control which packages can run lifecycle scripts:

```bash
# Allow specific package to run postinstall
pnpm install --allow-build=esbuild

# Deny specific package
pnpm add --allow-build=!core-js lodash
```

```yaml
# pnpm-workspace.yaml
allowBuilds:
  esbuild: true
  core-js: false
```

### Ignore Scripts

```bash
# Never run lifecycle scripts
pnpm install --ignore-scripts

# Or via setting
# pnpm-workspace.yaml
# settings:
#   build:
#     ignoreScripts: true
```

### Protecting Against Supply Chain Attacks

```bash
# Frozen lockfile in CI (prevents lockfile tampering)
pnpm install --frozen-lockfile

# Dry run to preview changes
pnpm install --dry-run

# Update checksums only when verified
pnpm install --update-checks
```

### .env Security

```bash
# .env.local (never commit — contains secrets)
DB_PASSWORD=secret
API_KEY=secret123

# .env (safe to commit — only VITE_ prefix exposed to client)
VITE_APP_TITLE=My App
```

## Performance Optimization

### Disk Space Efficiency

pnpm uses hardlinks, so installing the same package across 100 projects uses disk space for only one copy:

```
100 projects × lodash@4.17.21
npm: 100 × 1.3MB = 130MB
pnpm: 1 × 1.3MB + symlinks = ~1.5MB
```

### Fast Installation

```bash
# Use offline mode (from store only)
pnpm install --offline

# Prefer cached data
pnpm install --prefer-offline

# Network concurrency (default: 5)
pnpm install --network-concurrency 10
```

### Auto-Dedupe

```yaml
# pnpm-workspace.yaml
settings:
  autoDedupe: true
```

This deduplicates compatible dependency versions across the workspace, reducing total install size.

### CI Optimization

```yaml
# .github/workflows/ci.yml
- name: Install dependencies
  run: pnpm install --frozen-lockfile
  
# Cache node_modules
- name: Cache pnpm store
  uses: actions/cache@v4
  with:
    path: ~/.local/share/pnpm/store
    key: ${{ runner.os }}-pnpm-${{ hashFiles('**/pnpm-lock.yaml') }}
    restore-keys: |
      ${{ runner.os }}-pnpm-
```

## Advanced Configuration

### Node Linker Options

```yaml
# pnpm-workspace.yaml
settings:
  node-modules:
    linker: isolated  # Default — strict node_modules
    # linker: hoisted  # Flat structure (like npm/yarn — discouraged)
    # linker: pnp      # Plug'n'Play (no node_modules)
```

### Environment Variables

```bash
# Vite env vars (only VITE_ prefix exposed to client)
VITE_API_URL=https://api.example.com

# Non-VITE vars (server-only)
DB_PASSWORD=secret

# Override in command
VITE_APP_TITLE="My App" pnpm dev
```

### TypeScript IntelliSense for Env Vars

```ts
// src/vite-env.d.ts
interface ImportMetaEnv {
  readonly VITE_APP_TITLE: string
  readonly VITE_API_URL: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
```

## CLI Reference

### Common Commands

| Command | Description |
|---------|-------------|
| `pnpm install` / `pnpm i` | Install all dependencies |
| `pnpm add <pkg>` | Add package to dependencies |
| `pnpm add -D <pkg>` | Add to devDependencies |
| `pnpm remove <pkg>` | Remove package |
| `pnpm update` | Update dependencies |
| `pnpm list` / `pnpm ls` | List installed packages |
| `pnpm run <script>` | Run package.json script |
| `pnpm exec <cmd>` | Run command from node_modules/.bin |

### Install Options

| Option | Description |
|--------|-------------|
| `--frozen-lockfile` | Fail if lockfile needs update |
| `--lockfile-only` | Only update lockfile |
| `--offline` | Install from store only |
| `--prefer-offline` | Prefer cached data |
| `--prod` / `-P` | Install only dependencies |
| `--dev` / `-D` | Install only devDependencies |
| `--no-optional` | Skip optionalDependencies |
| `--ignore-scripts` | Skip lifecycle scripts |
| `--force` | Force reinstall |
| `--dry-run` | Preview changes |
| `--filter <pkg>` | Filter to specific package |
| `--update-checksums` | Re-resolve integrity hashes |

### Add Options

| Option | Description |
|--------|-------------|
| `-D` / `--save-dev` | Save to devDependencies |
| `-O` / `--save-optional` | Save to optionalDependencies |
| `-E` / `--save-exact` | Exact version (no semver) |
| `-g` / `--global` | Install globally |
| `--workspace` | Only add if in workspace |
| `--save-types` | Save @types/* alongside package |
| `--save-catalog` | Save to catalog |
| `--allow-build=<pkg>` | Allow postinstall scripts |

## Best Practices Checklist

- [x] **Use `pnpm-lock.yaml`** — commit to version control
- [x] **Use `--frozen-lockfile` in CI**
- [x] **Never use `--shamefully-hoist`** — keep strict node_modules
- [x] **Add `.pnpm-store` to `.gitignore`** (global store)
- [x] **Add `.vitest/` to `.gitignore`** (test artifacts)
- [x] **Use workspace protocols** for monorepos
- [x] **Use catalogs** for centralized dependency versions
- [x] **Enable autoDedupe** for workspace efficiency
- [x] **Use `--allow-build`** to control lifecycle scripts
- [x] **Use `--trust-lockfile`** for supply-chain security
- [x] **Never commit `.env.local`** files
- [x] **Only expose `VITE_` prefixed vars** to client
- [x] **Use `--dry-run`** to preview dependency changes
- [x] **Cache pnpm store** in CI for faster installs

## Cross-References

- See [vite-optimization-security](D/vite-optimization-security.md) for Vite build optimization
- See [vitest-testing](D/vitest-testing.md) for Vitest testing setup
- See [react-performance-security](D/react-performance-security.md) for React integration

---

## Decision Tree: pnpm Workspace Setup

```mermaid
graph TD
    A[Need package management?]\n    A --> B{Single or Multi?}
    B -->|Single| C[Single package.json]
    B -->|Multi| D[pnpm workspace]
    C --> E{Need dev deps?}
    E -->|Yes| F[devDependencies]
    E -->|No| G[dependencies only]
    D --> H{Shared packages?}
    H -->|Yes| I[Create shared package]
    H -->|No| J[Independent packages]
    I --> K[Link with pnpm]
    J --> L[Independent installs]
```

### When to Use Each pnpm Feature

| Feature | When to Use | Example |
|---------|-------------|---------|
| **Workspace** | Monorepo with multiple packages | apps/, packages/ |
| **Peer Dependencies** | Shared UI libraries | @radix-ui/react-* |
| **Override** | Force specific versions | pnpm.overrides |
| **Alias** | Rename packages | lodash-es as lodash |
| **Global** | CLI tools | pnpm add -g typescript |

---

## Procedural Guidance: pnpm Setup

### Step 1: Install pnpm

```bash
# Install pnpm globally
corepack enable
corepack prepare pnpm@latest --activate

# Verify installation
pnpm --version
```

### Step 2: Initialize Project

```bash
# Create package.json
pnpm init

# Add dependencies
pnpm add react react-dom

# Add dev dependencies
pnpm add -D typescript vitest @testing-library/react

# Add peer dependencies
pnpm add -P @radix-ui/react-dropdown-menu
```

### Step 3: Configure Workspace (Monorepo)

```yaml
# pnpm-workspace.yaml
packages:
  - 'apps/*'
  - 'packages/*'
```

```json
// apps/web/package.json
{
  "name": "@myapp/web",
  "dependencies": {
    "@myapp/ui": "workspace:*",
    "@myapp/utils": "workspace:*"
  }
}
```

```json
// packages/ui/package.json
{
  "name": "@myapp/ui",
  "peerDependencies": {
    "react": "^19.0.0",
    "react-dom": "^19.0.0"
  }
}
```

### Step 4: Add Scripts

```json
// package.json
{
  "scripts": {
    "dev": "pnpm -r --parallel dev",
    "build": "pnpm -r build",
    "test": "pnpm -r test",
    "lint": "pnpm -r lint",
    "clean": "pnpm -r clean"
  }
}
```

### Step 5: CI/CD Integration

```yaml
# .github/workflows/ci.yml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Setup pnpm
        uses: pnpm/action-setup@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Build
        run: pnpm build

      - name: Test
        run: pnpm test
```

---

## Copilot Instructions

### When to Read This Note
- Setting up pnpm for a new project
- Configuring pnpm workspaces
- Managing dependencies in monorepos
- Implementing security best practices
- Optimizing CI/CD with pnpm

### What to Do With This Information
1. **Use corepack**: Enable corepack for pnpm management
2. **Use workspaces**: Create pnpm workspaces for monorepos
3. **Frozen lockfile**: Use --frozen-lockfile in CI
4. **Security**: Control allow-build, ignore-scripts
5. **Cache pnpm store**: Cache in CI for faster installs

### Tools to Use
- **VS Code Extension**: Error Lens — for inline pnpm error display
- **npm Package**: `@pnpm/logger` — for pnpm logging
- **Terminal Command**: `pnpm install` — install dependencies
- **Terminal Command**: `pnpm add <package>` — add dependency
- **Terminal Command**: `pnpm remove <package>` — remove dependency
- **Terminal Command**: `pnpm list` — list installed packages

### Agents to Invoke
- **Security Review Agent**: Run when adding new dependencies
- **Code Review Agent**: Run when reviewing PRs with dependency changes

### Integration with Other Notes
- Read [[Quality Delivery/ci-cd-patterns]] for CI/CD deployment patterns
- read [[Bundler/vite-configuration]] for Vite configuration
- Read [docker-deployment](D/docker-deployment.md) for Docker deployment patterns
- Read [testing-patterns](D/testing-patterns.md) for testing strategies

### Common Pitfalls
- Don't use npm/pnpm interchangeably (stick to one)
- Don't ignore --frozen-lockfile in CI
- Don't allow-build without restriction
- Don't forget to cache pnpm store in CI
- Don't use phantom dependencies (pnpm enforces strict node_modules)

### Quick Validation Checklist
- [ ] Is corepack used for pnpm management?
- [ ] Are workspaces configured for monorepos?
- [ ] Is --frozen-lockfile used in CI?
- [ ] Are dependencies audited regularly?
- [ ] Is pnpm store cached in CI?
- [ ] Are peer dependencies properly declared?
