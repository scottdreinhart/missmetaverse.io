---
slug: continuous-deployment
sources:
  - https://martinfowler.com/articles/continuousDeployment.html
  - https://docs.github.com/en/actions/deployment
date: 2026-11-02
tags:
  - cd
  - devops
  - github-actions
  - deployment
---

# Continuous Deployment

## Definition

Continuous Deployment (CD) is a **software development practice where code changes are automatically deployed to production after passing automated tests**.

> "Continuous deployment is a software development approach in which software releases are automated." — Martin Fowler

## Problem Addressed

Without CD:
- **Slow releases**: Releases are manual and slow
- **Risk**: Manual deployments are error-prone
- **Feedback delay**: Users don't get new features quickly
- **Inconsistency**: Manual deployments vary

## Scope and Boundaries

- CD ≠ CI (CD is about deployment, CI is about integration)
- CD ≠ Manual deployment (CD is automated, manual is not)
- CD is a **deployment practice**, not a tool

## When to Apply

- When automation matters
- When frequent releases are needed
- When quality is important
- When user feedback is valuable

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Risk** — Automated deployments can fail |
| **Infrastructure** — CD requires infrastructure |
| **Complexity** — CD pipelines are complex |

## Common Misuses

- **Everything CD**: Not every project needs CD
- **Confusing with CI**: CD ≠ CI
- **Skipping tests**: CD without tests is dangerous

## Related Concepts

- [Continuous Integration](Architecture/continuous-integration.md) — CD with CI
- [Automated Testing](Architecture/quality-delivery-maintainability.md) — CD includes testing
- [Docker Deployment](Architecture/docker-nginx-deployment.md) — CD with Docker

## Project Observations

- The project uses CD:
  - GitHub Actions is configured (from existing notes)
  - Docker is configured for deployment (from existing notes)
  - The project's CI note covers GitHub Actions
- No evidence of CD in existing code (src/ is empty)
- File naming conventions support CD:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
