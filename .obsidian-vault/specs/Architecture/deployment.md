---
slug: deployment
sources:
  - https://en.wikipedia.org/wiki/Software_deployment
  - https://docs.github.com/en/actions/deployment
date: 2026-11-02
tags:
  - deployment
  - devops
  - github-actions
  - ci-cd
---

# Deployment

## Definition

Deployment is a **process of releasing software to production or other environments**.

> "Software deployment is the process of releasing a software release or update for use." — Wikipedia

## Problem Addressed

Without deployment:
- **Release difficulty**: Hard to release software
- **Inconsistency**: Releases are inconsistent
- **Risk**: Releases are risky
- **User experience**: Users don't get new features

## Scope and Boundaries

- Deployment ≠ CI/CD (deployment is releasing, CI/CD is automating)
- Deployment ≠ Testing (deployment is releasing, testing is verifying)
- Deployment is a **release process**, not an automation process

## When to Apply

- When building software
- When releasing matters
- When consistency is important
- When user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Deployment is complex |
| **Time** — Deployment takes time |
| **Over-deployment** — Don't deploy everything |

## Common Misuses

- **Everything deployed**: Not everything needs deployment
- **Confusing with CI/CD**: Deployment ≠ CI/CD
- **Over-deployment**: Too much deployment creates complexity

## Related Concepts

- [CI/CD](Architecture/cicd-github-actions.md) — Deployment with CI/CD
- [Docker Deployment](Architecture/docker-deployment.md) — Deployment with Docker
- [Nginx](Architecture/nginx.md) — Deployment with Nginx

## Project Observations

- The project uses deployment:
  - The project's CI/CD note covers deployment (from existing notes)
  - No evidence of deployment in existing code (src/ is empty)
- File naming conventions support deployment:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
