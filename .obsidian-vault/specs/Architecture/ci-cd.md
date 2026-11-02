---
slug: ci-cd
sources:
  - https://martinfowler.com/articles/continuousIntegration.html
  - https://docs.github.com/en/actions
date: 2026-11-02
tags:
  - ci-cd
  - devops
  - automation
  - deployment
---

# CI/CD

## Definition

CI/CD (Continuous Integration/Continuous Deployment) is a **software development practice where code changes are automatically built, tested, and deployed**.

> "Continuous integration (CI) and continuous deployment (CD) are key practices in DevOps that automate the software development process." — Martin Fowler

## Problem Addressed

Without CI/CD:
- **Integration hell**: Changes conflict when integrating
- **Slow releases**: Releases are slow and risky
- **Manual errors**: Manual processes are error-prone
- **Feedback delay**: Feedback is slow

## Scope and Boundaries

- CI/CD ≠ GitHub Actions (CI/CD is a practice, GitHub Actions is a tool)
- CI/CD ≠ Deployment (CI/CD is automation, deployment is releasing)
- CI/CD is a **practice**, not a tool

## When to Apply

- When building software
- When automation matters
- When consistency is important
- When speed matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — CI/CD is complex |
| **Time** — CI/CD takes time |
| **Over-automation** — Don't automate everything |

## Common Misuses

- **Everything automated**: Not everything needs CI/CD
- **Confusing with GitHub Actions**: CI/CD ≠ GitHub Actions
- **Over-automation**: Too much automation creates complexity

## Related Concepts

- [GitHub Actions](Architecture/github-actions.md) — CI/CD with GitHub Actions
- [Deployment](Architecture/deployment.md) — CI/CD with deployment
- [Version Control](Architecture/version-control.md) — CI/CD with version control

## Project Observations

- The project uses CI/CD:
  - The project's CI/CD note covers CI/CD (from existing notes)
  - No evidence of CI/CD in existing code (src/ is empty)
- File naming conventions support CI/CD:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

