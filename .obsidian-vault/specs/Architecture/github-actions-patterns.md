---
slug: github-actions-patterns-original
sources:
  - https://docs.github.com/en/actions
  - https://github.com/features/actions
date: 2026-11-02
tags:
  - github-actions
  - ci-cd
  - automation
  - patterns
---

# GitHub Actions Patterns

## Definition

GitHub Actions Patterns are **design patterns for working with GitHub Actions**.

> "GitHub Actions makes it easy to automate all your software workflows, now with continuous integration, continuous delivery, or continuous deployment." — GitHub

## Problem Addressed

Without GitHub Actions patterns:
- **Manual processes**: Processes are manual and error-prone
- **Slow feedback**: Feedback is slow
- **Inconsistency**: Processes are inconsistent
- **Complexity**: Processes are complex

## Scope and Boundaries

- GitHub Actions Patterns ≠ GitHub Actions (GitHub Actions patterns are patterns, GitHub Actions is a tool)
- GitHub Actions Patterns ≠ CI/CD (GitHub Actions patterns are patterns, CI/CD is a practice)
- GitHub Actions Patterns is a **patterns**, not a tool

## When to Apply

- When building software
- when automation matters
- when consistency is important
- when speed matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — GitHub Actions patterns are complex |
| **Time** — GitHub Actions patterns take time |
| **Over-GitHub-Actions** — Don't use GitHub Actions for everything |

## Common Misuses

- **Everything GitHub Actions**: Not everything needs GitHub Actions patterns
- **Confusing with CI/CD**: GitHub Actions patterns ≠ CI/CD
- **Over-GitHub-Actions**: Too much GitHub Actions creates complexity

## Related Concepts

- [CI/CD](Architecture/ci-cd.md) — GitHub Actions patterns with CI/CD
- [Deployment](Architecture/deployment-patterns.md) — GitHub Actions patterns with deployment
- [Version Control](Architecture/version-control-patterns.md) — GitHub Actions patterns with version control

## Project Observations

- The project uses GitHub Actions patterns:
  - The project's CI/CD note covers GitHub Actions patterns (from existing notes)
  - No evidence of GitHub Actions patterns in existing code (src/ is empty)
- File naming conventions support GitHub Actions patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Decision Tree: GitHub Actions Workflow Design

```mermaid
graph TD
    A[Need GitHub Actions workflow?]\n    A --> B{Trigger?}
    B -->|Push| C[Push to branch]
    B -->|PR| D[Pull request]
    B -->|Schedule| E[Cron job]
    B -->|Manual| F[Workflow dispatch]
    C --> G{What branch?}
    G -->|Main| H[Deploy to prod]
    G -->|Other| I[Build + test]
    D --> J{Auto merge?}
    J -->|Yes| K[Auto merge on success]
    J -->|No| L[Manual approval]
    E --> M{Frequency?}
    M -->|Daily| N[Daily scan]
    M -->|Weekly| O[Weekly report]
```

### When to Use Each GitHub Actions Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Push trigger** | Auto build/test | Push to main/develop |
| **PR trigger** | Review before merge | PR to main |
| **Schedule** | Regular tasks | Daily cleanup, weekly report |
| **Manual** | On-demand | Deploy to staging |
| **Fork** | Open source | PR from fork |

---

## Procedural Guidance: GitHub Actions Setup

### Step 1: Create Basic CI Workflow

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main, develop]
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

### Step 2: Create Deployment Workflow

```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]

permissions:
  contents: read
  deployments: write

jobs:
  deploy:
    runs-on: ubuntu-latest

    environment:
      name: production
      url: https://yourapp.com

    steps:
      - uses: actions/checkout@v4

      - name: Deploy to production
        run: |
          echo "Deploying to production..."
          # Add your deployment script here
        env:
          DEPLOY_TOKEN: ${{ secrets.DEPLOY_TOKEN }}
```

### Step 3: Create Scheduled Workflow

```yaml
# .github/workflows/scheduled.yml
name: Scheduled Tasks

on:
  schedule:
    # Run at 00:00 UTC every day
    - cron: '0 0 * * *'

jobs:
  cleanup:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Run cleanup
        run: |
          echo "Running cleanup..."
          # Add your cleanup script here

      - name: Send notification
        if: failure()
        run: |
          echo "Cleanup failed!"
          # Send Slack/email notification
```

### Step 4: Create Manual Deployment

```yaml
# .github/workflows/manual-deploy.yml
name: Manual Deploy

on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Environment to deploy to'
        required: true
        default: 'staging'
        type: choice
        options:
          - staging
          - production

jobs:
  deploy:
    runs-on: ubuntu-latest

    environment:
      name: ${{ github.event.inputs.environment }}

    steps:
      - uses: actions/checkout@v4

      - name: Deploy to ${{ github.event.inputs.environment }}
        run: |
          echo "Deploying to ${{ github.event.inputs.environment }}..."
          # Add your deployment script here
```

### Step 5: Add Security Scanning

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

      - name: Upload audit results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: audit-results
          path: audit-results.json
```

---

## Copilot Instructions

### When to Read This Note
- Creating GitHub Actions workflows
- Setting up CI/CD pipelines
- Automating deployments
- Adding security scanning
- Configuring scheduled tasks

### What to Do With This Information
1. **Use push triggers**: Auto build/test on push to main/develop
2. **Use PR triggers**: Review before merge to main
3. **Add environments**: Configure staging/production environments
4. **Add security scanning**: Run npm audit, OWASP ZAP
5. **Use secrets**: Store sensitive data in GitHub Secrets

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
- Read [ci-cd-patterns](D/ci-cd-patterns.md) for CI/CD deployment patterns
- read [docker-deployment](https://docs.docker.com/deployment/) for Docker deployment patterns
- Read [deployment-patterns](D/deployment-patterns.md) for deployment strategies
- Read [monitoring-patterns](D/monitoring-patterns.md) for monitoring deployments

### Common Pitfalls
- Don't hardcode secrets in workflows (use GitHub Secrets)
- Don't skip caching (cache dependencies to speed up builds)
- Don't deploy directly to production (use staging first)
- Don't forget to test workflows locally (use act)
- Don't ignore workflow failures (configure notifications)

### Quick Validation Checklist
- [ ] Are workflows cached for dependencies?
- [ ] Are environments configured?
- [ ] Is security scanning included?
- [ ] Are secrets stored in GitHub Secrets?
- [ ] Are notifications configured?
- [ ] Are workflows tested?

