---
slug: deployment-patterns-original
sources:
  - https://en.wikipedia.org/wiki/Software_deployment
  - https://docs.github.com/en/actions/deployment
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - domain/security
  - type/concept
  - domain/testing
  - type/guide
  - domain/optimization
  - domain/frontend
  - domain/accessibility
  - domain/devops
  - domain/database
  - status/complete
  - type/reference
  - domain/architecture
  - deployment
  - devops
  - github-actions
  - patterns
---

# Deployment Patterns

## Definition

Deployment Patterns are **design patterns for deploying software**.

> "Software deployment is the process of releasing a software release or update for use." — Wikipedia

## Problem Addressed

Without deployment patterns:
- **Release difficulty**: Hard to release software
- **Inconsistency**: Releases are inconsistent
- **Risk**: Releases are risky
- **User experience**: Users don't get new features

## Scope and Boundaries

- Deployment Patterns ≠ Deployment (deployment patterns are patterns, deployment is a practice)
- Deployment Patterns ≠ CI/CD (deployment patterns are patterns, CI/CD is a practice)
- Deployment Patterns is a **patterns**, not a practice

## When to Apply

- When building software
- when releasing matters
- when consistency is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Deployment patterns are complex |
| **Time** — Deployment patterns take time |
| **Over-deployment** — Don't deploy everything |

## Common Misuses

- **Everything deployed**: Not everything needs deployment patterns
- **Confusing with CI/CD**: Deployment patterns ≠ CI/CD
- **Over-deployment**: Too much deployment creates complexity

## Related Concepts

- [CI/CD](Architecture/ci-cd.md) — Deployment patterns with CI/CD
- [Docker Deployment](Architecture/docker-deployment-patterns.md) — Deployment patterns with Docker
- [Nginx](Architecture/nginx-patterns.md) — Deployment patterns with Nginx

## Project Observations

- The project uses deployment patterns:
  - The project's CI/CD note covers deployment patterns (from existing notes)
  - No evidence of deployment patterns in existing code (src/ is empty)
- File naming conventions support deployment patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Decision Tree: Deployment Strategy

```mermaid
graph TD
    A[Need to deploy?]\n    A --> B{Risk level?}
    B -->|Low| C[Simple Deploy]
    B -->|Medium| D[Blue-Green]
    B -->|High| E[Canary]
    C --> F{Need rollback?}
    F -->|Yes| G[Versioned Deploy]
    F -->|No| H[Direct Deploy]
    D --> I{Auto or Manual?}
    I -->|Auto| J[Auto Switch]
    I -->|Manual| K[Manual Switch]
    E --> L{Gradual?}
    L -->|Yes| M[5% → 25% → 50% → 100%]
    L -->|No| N[Canary + Monitor]
```

### When to Use Each Deployment Strategy

| Strategy | When to Use | Risk | Rollback |
|----------|-------------|------|----------|
| **Simple** | Low risk, internal tools | Low | Full revert |
| **Blue-Green** | Zero-downtime needed | Medium | Instant switch |
| **Canary** | High risk, production | Low | Rollback canary |
| **Rolling** | Gradual rollout | Medium | Partial rollback |
| **Feature Flags** | Independent deploy/test | Low | Disable flag |

---

## Procedural Guidance: Deployment Checklist

### Step 1: Pre-Deployment Checklist

```bash
# Run all tests
pnpm test

# Run linting
pnpm lint

# Build for production
pnpm build

# Run security audit
pnpm audit --prod

# Check environment variables
echo $DATABASE_URL
echo $API_KEY
```

### Step 2: Deployment Script

```bash
#!/bin/bash
# deploy.sh

set -e

echo "Starting deployment..."

# 1. Pull latest code
git pull origin main

# 2. Install dependencies
pnpm install --frozen-lockfile

# 3. Build
pnpm build

# 4. Run migrations
pnpm db:migrate

# 5. Restart services
docker-compose up -d

# 6. Health check
sleep 10
curl -f http://localhost:3000/health || exit 1

echo "Deployment successful!"
```

### Step 3: Rollback Procedure

```bash
#!/bin/bash
# rollback.sh

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: ./rollback.sh <version>"
  exit 1
fi

echo "Rolling back to $VERSION..."

# 1. Pull previous version
git checkout $VERSION

# 2. Rebuild
pnpm build

# 3. Restart services
docker-compose up -d

# 4. Verify
sleep 10
curl -f http://localhost:3000/health || exit 1

echo "Rollback successful!"
```

### Step 4: Monitoring

```bash
# Check deployment status
docker-compose ps

# View logs
docker-compose logs -f app

# Check health
curl http://localhost:3000/health

# Check metrics
curl http://localhost:3000/metrics
```

### Step 5: Post-Deployment Verification

```bash
# Run smoke tests
pnpm test:smoke

# Check error rates
curl http://localhost:3000/errors

# Check performance
curl -w "@perf-format.txt" -o /dev/null -s http://localhost:3000

# Verify features
curl http://localhost:3000/api/features
```

---

## Copilot Instructions

### When to Read This Note
- Planning deployment strategy
- Creating deployment scripts
- Implementing rollback procedures
- Setting up monitoring
- Post-deployment verification

### What to Do With This Information
1. **Choose strategy**: Use simple for low risk, blue-green for zero-downtime, canary for high risk
2. **Pre-deployment**: Run tests, linting, build, security audit
3. **Rollback**: Have automated rollback procedure ready
4. **Monitor**: Check health, logs, metrics after deployment
5. **Verify**: Run smoke tests and verify features

### Tools to Use
- **VS Code Extension**: Docker — for Docker management
- **VS Code Extension**: Error Lens — for inline deployment error display
- **npm Package**: `@actions/core` — for GitHub Actions scripting
- **Terminal Command**: `pnpm test` — run tests before deploy
- **Terminal Command**: `pnpm build` — build for production
- **Terminal Command**: `docker-compose up -d` — start services

### Agents to Invoke
- **Security Review Agent**: Run before production deployment
- **Performance Review Agent**: Run after deployment to verify performance

### Integration with Other Notes
- Read [ci-cd-patterns](D/ci-cd-patterns.md) for CI/CD deployment patterns
- read [docker-deployment](https://docs.docker.com/deployment/) for Docker deployment patterns
- Read [nginx-patterns](D/nginx-patterns.md) for nginx configuration
- Read [monitoring-patterns](D/monitoring-patterns.md) for monitoring deployments

### Common Pitfalls
- Don't deploy without testing (run tests first)
- Don't skip rollback procedure (have it ready)
- Don't forget health checks (verify deployment)
- Don't ignore monitoring (watch for errors)
- Don't deploy during peak hours (schedule maintenance windows)

### Quick Validation Checklist
- [ ] Are all tests passing?
- [ ] Is linting clean?
- [ ] Is the build successful?
- [ ] Is security audit clean?
- [ ] Is rollback procedure tested?
- [ ] Are health checks passing?
- [ ] Is monitoring configured?
- [ ] Are smoke tests passing?




