---
slug: cicd-github-actions
sources:
  - https://docs.github.com/en/actions/use-cenarios/building-and-testing
  - https://docs.github.com/en/actions/deployment
  - https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions
  - https://vite.dev/guide/static-deploy
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/security
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/accessibility
  - domain/devops
  - integration
  - ci-cd
  - github-actions
  - testing
  - deployment
  - automation
---

# CI/CD with GitHub Actions

## Overview

This note covers setting up a complete CI/CD pipeline using GitHub Actions for a React + Vite + TypeScript project. It includes linting, testing, building, security scanning, and deployment to various platforms.

---

## 1. Pipeline Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                     GITHUB ACTIONS PIPELINE                      │
│                                                                  │
│  On Push / PR to main/develop                                  │
│         │                                                        │
│         ▼                                                        │
│  ┌──────────────────┐                                           │
│  │  Job: Validate   │                                           │
│  │  - Lint          │                                           │
│  │  - Format Check  │                                           │
│  │  - Type Check    │                                           │
│  └────────┬─────────┘                                           │
│           │                                                      │
│           ▼                                                      │
│  ┌──────────────────┐                                           │
│  │  Job: Test       │                                           │
│  │  - Unit Tests    │                                           │
│  │  - Integration   │                                           │
│  │  - Coverage      │                                           │
│  └────────┬─────────┘                                           │
│           │                                                      │
│           ▼                                                      │
│  ┌──────────────────┐                                           │
│  │  Job: Build      │                                           │
│  │  - Vite Build    │                                           │
│  │  - Analyze       │                                           │
│  │  - Artifact      │                                           │
│  └────────┬─────────┘                                           │
│           │                                                      │
│           ▼                                                      │
│  ┌──────────────────┐                                           │
│  │  Job: Security   │                                           │
│  │  - Audit         │                                           │
│  │  - SAST          │                                           │
│  │  - Container     │                                           │
│  └────────┬─────────┘                                           │
│           │                                                      │
│           ▼                                                      │
│  ┌──────────────────┐                                           │
│  │  Job: Deploy     │  (main branch only)                       │
│  │  - Docker Build  │                                           │
│  │  - Push Image    │                                           │
│  │  - Deploy        │                                           │
│  └──────────────────┘                                           │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. Main CI Workflow

### `.github/workflows/ci.yml`

```yaml
name: CI Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

env:
  NODE_VERSION: '22'
  PNPM_VERSION: '9'
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

permissions:
  contents: read
  packages: write
  security-events: write

jobs:
  # ═══════════════════════════════════════════════════════════
  # Job 1: Validate (Lint + Format + Types)
  # ═══════════════════════════════════════════════════════════
  validate:
    name: Validate Code
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'pnpm'

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: ${{ env.PNPM_VERSION }}

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Run ESLint
        run: pnpm lint

      - name: Check Prettier formatting
        run: pnpm format:check

      - name: Run TypeScript type check
        run: pnpm type-check

  # ═══════════════════════════════════════════════════════════
  # Job 2: Test (Unit + Integration + Coverage)
  # ═══════════════════════════════════════════════════════════
  test:
    name: Run Tests
    runs-on: ubuntu-latest
    needs: [validate]
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'pnpm'

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: ${{ env.PNPM_VERSION }}

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Run Vitest (Unit + Integration)
        run: pnpm test:run --coverage

      - name: Upload coverage reports
        uses: codecov/codecov-action@v4
        with:
          token: ${{ secrets.CODECOV_TOKEN }}
          files: ./coverage/lcov.info
          fail_ci_if_error: false

  # ═══════════════════════════════════════════════════════════
  # Job 3: Build
  # ═══════════════════════════════════════════════════════════
  build:
    name: Build Application
    runs-on: ubuntu-latest
    needs: [test]
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'pnpm'

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: ${{ env.PNPM_VERSION }}

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Build with Vite
        run: pnpm build
        env:
          VITE_API_URL: ${{ secrets.VITE_API_URL }}

      - name: Upload build artifacts
        uses: actions/upload-artifact@v4
        with:
          name: dist
          path: dist/
          retention-days: 7

      - name: Build size analysis
        run: pnpm build:analyze
        if: always()

  # ═══════════════════════════════════════════════════════════
  # Job 4: Security
  # ═══════════════════════════════════════════════════════════
  security:
    name: Security Checks
    runs-on: ubuntu-latest
    needs: [validate]
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'pnpm'

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: ${{ env.PNPM_VERSION }}

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Audit dependencies
        run: pnpm audit --audit-level=moderate
        continue-on-error: true

      - name: Run Snyk security scan
        uses: snyk/actions/node@master
        continue-on-error: true
        env:
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}

      - name: Run CodeQL analysis
        uses: github/codeql-action/init@v3
        with:
          languages: javascript

      - name: Perform CodeQL analysis
        uses: github/codeql-action/analyze@v3

  # ═══════════════════════════════════════════════════════════
  # Job 5: Deploy (main branch only)
  # ═══════════════════════════════════════════════════════════
  deploy:
    name: Deploy to Production
    runs-on: ubuntu-latest
    needs: [build, security]
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    environment:
      name: production
      url: https://missmetaverse.io

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Download build artifacts
        uses: actions/download-artifact@v4
        with:
          name: dist
          path: dist/

      - name: Log in to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build and push Docker image
        uses: docker/build-push-action@v6
        with:
          context: .
          push: true
          tags: |
            ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
            ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:latest
          build-args: |
            VITE_API_URL=${{ secrets.VITE_API_URL }}
          cache-from: type=gha
          cache-to: type=gha,mode=max

      - name: Deploy to server
        uses: appleboy/ssh-action@v1
        with:
          host: ${{ secrets.DEPLOY_HOST }}
          username: ${{ secrets.DEPLOY_USER }}
          key: ${{ secrets.DEPLOY_KEY }}
          script: |
            cd /opt/missmetaverse
            docker compose pull
            docker compose up -d --no-deps app
            docker image prune -f
```

---

## 3. E2E Testing Workflow

### `.github/workflows/e2e.yml`

```yaml
name: E2E Tests

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  e2e:
    name: Playwright E2E
    runs-on: ubuntu-latest
    timeout-minutes: 30

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: 9

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Install Playwright browsers
        run: npx playwright install --with-deps

      - name: Build application
        run: pnpm build

      - name: Run Playwright tests
        run: npx playwright test
        env:
          VITE_API_URL: http://localhost:4173

      - name: Upload test results
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: playwright-report
          path: playwright-report/
          retention-days: 30

      - name: Upload screenshots on failure
        uses: actions/upload-artifact@v4
        if: failure()
        with:
          name: screenshots
          path: test-results/
          retention-days: 7
```

---

## 4. Deployment Workflows

### Deploy to GitHub Pages

```yaml
# .github/workflows/deploy-pages.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: 9

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Build with Vite (base: /)
        run: pnpm build
        env:
          VITE_BASE_PATH: /${{ github.event.repository.name }}/

      - name: Setup Pages
        uses: actions/configure-pages@v5

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: 'dist'

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### Deploy to Vercel

```yaml
# .github/workflows/deploy-vercel.yml
name: Deploy to Vercel

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: 9

      - name: Install Vercel CLI
        run: pnpm add -g vercel

      - name: Pull Vercel Environment Information
        run: vercel pull --yes --environment=production --token=${{ secrets.VERCEL_TOKEN }}

      - name: Build for Vercel
        run: vercel build --prod --token=${{ secrets.VERCEL_TOKEN }}

      - name: Deploy to Vercel
        id: deployment
        run: |
          echo "url=$(vercel deploy --prod --token=${{ secrets.VERCEL_TOKEN }})" >> $GITHUB_OUTPUT
```

### Deploy to Netlify

```yaml
# .github/workflows/deploy-netlify.yml
name: Deploy to Netlify

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'

      - name: Setup pnpm
        uses: pnpm/action-setup@v4
        with:
          version: 9

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Build
        run: pnpm build

      - name: Deploy to Netlify
        uses: nwtgck/actions-netlify@v3
        with:
          publish-dir: './dist'
          production-branch: main
          github-token: ${{ secrets.GITHUB_TOKEN }}
          deploy-message: 'Deploy from GitHub Actions'
          enable-pull-request-comment: true
          enable-commit-comment: true
          overwrites-pull-request-deployment: true
        env:
          NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
          NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
```

---

## 5. Docker Build & Push Workflow

### `.github/workflows/docker.yml`

```yaml
name: Docker Build & Push

on:
  release:
    types: [published]
  push:
    tags:
      - 'v*'

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

permissions:
  contents: read
  packages: write

jobs:
  build:
    name: Build & Push Docker Image
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Log in to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          tags: |
            type=semver,pattern={{version}}
            type=semver,pattern={{major}}.{{minor}}
            type=sha
            type=raw,value=latest

      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          context: .
          platforms: linux/amd64,linux/arm64
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          build-args: |
            VITE_API_URL=${{ secrets.VITE_API_URL }}
          cache-from: type=gha
          cache-to: type=gha,mode=max
```

---

## 6. Security Hardening

### GitHub Actions Security Best Practices

```yaml
# .github/workflows/ci.yml — Security additions

jobs:
  security:
    steps:
      # ─── Use specific action versions ─────────────────
      - uses: actions/checkout@v4        # ✅ Pin version
      # - uses: actions/checkout@main   # ❌ Never use main

      # ─── Restract permissions ─────────────────────────
      permissions:
        contents: read                  # Least privilege
        packages: write

      # ─── Avoid checking out untrusted code ────────────
      # Never run code from PRs with write permissions

      # ─── Use Dependabot ───────────────────────────────
      # .github/dependabot.yml (see below)

      # ─── Secret Scanning ──────────────────────────────
      # GitHub automatically scans for secrets

      # ─── CodeQL ───────────────────────────────────────
      - uses: github/codeql-action/init@v3
      - uses: github/codeql-action/analyze@v3
```

### Dependabot Configuration

```yaml
# .github/dependabot.yml
version: 2
updates:
  # ─── GitHub Actions ─────────────────────────────────
  - package-ecosystem: 'github-actions'
    directory: '/'
    schedule:
      interval: 'weekly'
    commit-message:
      prefix: 'chore'
    labels:
      - 'dependencies'
      - 'github-actions'

  # ─── npm (pnpm) ─────────────────────────────────────
  - package-ecosystem: 'npm'
    directory: '/'
    schedule:
      interval: 'weekly'
    commit-message:
      prefix: 'chore'
    labels:
      - 'dependencies'
    open-pull-requests-limit: 10
    ignore:
      - dependency-name: '*'
        update-types: ['version-update:semver-major']

  # ─── Docker ─────────────────────────────────────────
  - package-ecosystem: 'docker'
    directory: '/'
    schedule:
      interval: 'weekly'
    commit-message:
      prefix: 'chore'
    labels:
      - 'dependencies'
      - 'docker'
```

---

## 7. Workflow Triggers & Conditions

### Common Trigger Patterns

```yaml
# On all pushes
on: push

# On pushes to specific branches
on:
  push:
    branches: [main, develop]

# On pull requests
on:
  pull_request:
    branches: [main]

# On specific events
on:
  push:
    branches: [main]
    paths:
      - 'src/**'
      - 'package.json'
      - 'vite.config.ts'
  pull_request:
    branches: [main]

# On schedule (daily at midnight UTC)
on:
  schedule:
    - cron: '0 0 * * *'

# On workflow dispatch (manual trigger)
on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Deployment environment'
        required: true
        default: 'staging'
        type: choice
        options:
          - staging
          - production
```

### Job Conditions

```yaml
jobs:
  deploy:
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    # Only deploy on main branch pushes

  test:
    if: github.event_name == 'pull_request'
    # Only run on PRs

  security:
    needs: [validate]
    # Depends on validate job
```

---

## 8. Environment Variables in CI/CD

### Setting Environment Variables

```yaml
jobs:
  build:
    env:
      NODE_ENV: production
      VITE_API_URL: ${{ secrets.VITE_API_URL }}
      VITE_APP_VERSION: ${{ github.sha }}
    steps:
      - run: pnpm build
```

### Using Secrets

```yaml
# Store in GitHub Settings > Secrets and variables > Actions
secrets:
  VITE_API_URL: https://api.example.com
  SNYK_TOKEN: snyk-token-here
  DEPLOY_HOST: production-server
  DEPLOY_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

---

## Cross-References

- [Integration Master Config](./integration-master-config.md)
- [Docker & Nginx Deployment](./docker-nginx-deployment.md)
- [Vite Optimization & Security](./vite-optimization-security.md)
- [Vitest Testing](./Testing/vitest-testing.md)
- [Playwright E2E Testing](./playwright-e2e.md)
- [Linting & Husky Pipeline](./linting-husky-pipeline.md)
- [TypeScript Best Practices](./TypeScript/ts-best-practices.md)

## See Also
- [[I02-docker-nginx-deployment]]
- [[I03-integration-master-config]]
- [[I04-linting-husky-pipeline]]
- [[I05-ts-path-resolution]]


