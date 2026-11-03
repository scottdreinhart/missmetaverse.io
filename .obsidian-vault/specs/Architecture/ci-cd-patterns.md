---
slug: ci-cd-patterns
sources:
  - https://martinfowler.com/articles/continuousIntegration.html
  - https://docs.github.com/en/actions
date: 2026-11-02
tags:
  - ci-cd
  - devops
  - automation
  - patterns
---

# CI/CD Patterns

## Definition

CI/CD Patterns are **design patterns for continuous integration and continuous deployment**.

> "Continuous integration (CI) and continuous deployment (CD) are key practices in DevOps that automate the software development process." — Martin Fowler

## Problem Addressed

Without CI/CD patterns:
- **Integration hell**: Changes conflict when integrating
- **Slow releases**: Releases are slow and risky
- **Manual errors**: Manual processes are error-prone
- **Feedback delay**: Feedback is slow

## Scope and Boundaries

- CI/CD Patterns ≠ CI/CD (CI/CD patterns are patterns, CI/CD is a practice)
- CI/CD Patterns ≠ GitHub Actions (CI/CD patterns are patterns, GitHub Actions is a tool)
- CI/CD Patterns is a **patterns**, not a practice

## When to Apply

- When building software
- when automation matters
- when consistency is important
- when speed matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — CI/CD patterns are complex |
| **Time** — CI/CD patterns take time |
| **Over-CI-CD** — Don't use CI/CD for everything |

## Common Misuses

- **Everything CI/CD**: Not everything needs CI/CD patterns
- **Confusing with GitHub Actions**: CI/CD patterns ≠ GitHub Actions
- **Over-CI-CD**: Too much CI/CD creates complexity

## Related Concepts

- [GitHub Actions](Architecture/github-actions-patterns.md) — CI/CD patterns with GitHub Actions
- [Deployment](Architecture/deployment-patterns.md) — CI/CD patterns with deployment
- [Version Control](Architecture/version-control-patterns.md) — CI/CD patterns with version control

## Project Observations

- The project uses CI/CD patterns:
  - The project's CI/CD note covers CI/CD patterns (from existing notes)
  - No evidence of CI/CD patterns in existing code (src/ is empty)
- File naming conventions support CI/CD patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Decision Tree: CI/CD Pipeline Design

```mermaid
graph TD
    A[Need CI/CD pipeline?]\n    A --> B{What stage?}
    B -->|Build| C[Compile/Bundle]
    B -->|Test| D[Unit/Integration]
    B -->|Lint| E[Code Quality]
    B -->|Deploy| F[Production/Staging]
    C --> G{Need caching?}
    G -->|Yes| H[Dependency Cache]
    G -->|No| I[Direct Build]
    D --> J{Need parallel?}
    J -->|Yes| K[Parallel Tests]
    J -->|No| L[Sequential Tests]
    F --> M{What environment?}
    M -->|Staging| N[Auto Deploy]
    M -->|Production| O[Manual Approval]
```

### When to Use Each CI/CD Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Continuous Integration** | Every push/PR | Build + test on every commit |
| **Continuous Deployment** | Automated releases | Auto-deploy to production |
| **Continuous Delivery** | Manual deployment | Ready to deploy, manual trigger |
| **Blue-Green** | Zero-downtime | Two identical environments |
| **Canary** | Gradual rollout | 5% → 25% → 50% → 100% |
| **Feature Flags** | Independent deploy/test | Deploy hidden, enable later |

---

## Procedural Guidance: GitHub Actions Setup

### Step 1: Create Workflow File

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [20.x]

    steps:
      - uses: actions/checkout@v4

      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Build
        run: pnpm build

      - name: Test
        run: pnpm test

      - name: Lint
        run: pnpm lint
```

### Step 2: Add Deployment Workflow

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    needs: build

    environment:
      name: production
      url: https://yourapp.com

    steps:
      - uses: actions/checkout@v4

      - name: Deploy to production
        run: |
          echo "Deploying to production..."
          # Add your deployment script here
          # Example: ssh user@server "cd /app && git pull && docker-compose up -d"
```

### Step 3: Add Environment-Specific Workflows

```yaml
# .github/workflows/deploy-staging.yml
name: Deploy Staging

on:
  push:
    branches: [develop]

jobs:
  deploy:
    runs-on: ubuntu-latest

    environment:
      name: staging

    steps:
      - uses: actions/checkout@v4

      - name: Use Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'

      - name: Install dependencies
        run: pnpm install --frozen-lockfile

      - name: Build
        run: pnpm build

      - name: Deploy to staging
        run: |
          echo "Deploying to staging..."
          # Add your staging deployment script here
```

### Step 4: Add Security Scanning

```yaml
# .github/workflows/security.yml
name: Security

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  security:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Run npm audit
        run: pnpm audit --prod --json > audit-results.json || true

      - name: Run OWASP ZAP
        uses: zaproxy/action-baseline@v0.10.0
        with:
          target: 'http://localhost:3000'

      - name: Run ESLint security checks
        run: pnpm eslint --ext .ts src/
```

### Step 5: Add Notifications

```yaml
# .github/workflows/notify.yml
name: Notify

on:
  pull_request:
    types: [opened, closed]
  deployment:
    types: [completed]

jobs:
  notify:
    runs-on: ubuntu-latest

    steps:
      - name: Send Slack notification
        if: github.event_name == 'pull_request'
        run: |
          curl -X POST -H 'Content-type: application/json' \
            --data '{"text":"PR ${{ github.event.pull_request.title }} by ${{ github.actor }}"}' \
            ${{ secrets.SLACK_WEBHOOK_URL }}
```

---

## Copilot Instructions

### When to Read This Note
- Setting up CI/CD pipelines
- Creating GitHub Actions workflows
- Implementing deployment strategies
- Adding security scanning
- Configuring environment-specific deployments

### What to Do With This Information
1. **Use GitHub Actions**: Create workflows for build, test, lint, and deploy
2. **Cache dependencies**: Use pnpm cache to speed up builds
3. **Environment-specific**: Create separate workflows for staging and production
4. **Add security scanning**: Run npm audit, OWASP ZAP, ESLint security checks
5. **Add notifications**: Send Slack/email notifications on PR/deployment events

### Tools to Use
- **VS Code Extension**: GitHub Actions — for workflow management
- **VS Code Extension**: Error Lens — for inline workflow error display
- **npm Package**: `@actions/core` — for GitHub Actions scripting
- **Terminal Command**: `pnpm test` — run tests in CI
- **Terminal Command**: `pnpm lint` — run linting in CI
- **Terminal Command**: `pnpm build` — build in CI

### Agents to Invoke
- **Security Review Agent**: Run when adding security scanning workflows
- **Code Review Agent**: Run when reviewing PRs with workflow changes

### Integration with Other Notes
- Read [[docker-deployment]] for Docker deployment patterns
- read [[nginx-patterns]] for nginx configuration
- Read [[deployment-patterns]] for deployment strategies
- Read [[monitoring-patterns]] for monitoring deployments

### Common Pitfalls
- Don't hardcode secrets in workflows (use GitHub Secrets)
- Don't skip caching (cache dependencies to speed up builds)
- Don't deploy directly to production (use staging first)
- Don't forget security scanning (run npm audit, OWASP ZAP)
- Don't ignore failure notifications (configure Slack/email alerts)

### Quick Validation Checklist
- [ ] Are workflows cached for dependencies?
- [ ] Are environment-specific workflows created?
- [ ] Is security scanning included?
- [ ] Are notifications configured?
- [ ] Are secrets stored in GitHub Secrets?
- [ ] Is production deployment protected (manual approval)?

