---
slug: github-actions
sources:
  - https://docs.github.com/en/actions
  - https://github.com/features/actions
date: 2026-11-02
tags:
  - github-actions
  - ci-cd
  - automation
  - devops
---

# GitHub Actions

## Definition

GitHub Actions is a **continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline**.

> "GitHub Actions makes it easy to automate all your software workflows, now with continuous integration, continuous delivery, or continuous deployment." — GitHub

## Problem Addressed

Without GitHub Actions:
- **Manual processes**: Processes are manual and error-prone
- **Slow feedback**: Feedback is slow
- **Inconsistency**: Processes are inconsistent
- **Complexity**: Processes are complex

## Scope and Boundaries

- GitHub Actions ≠ CI/CD (GitHub Actions is a tool, CI/CD is a practice)
- GitHub Actions ≠ GitHub (GitHub Actions is a feature, GitHub is a platform)
- GitHub Actions is a **CI/CD tool**, not a practice

## When to Apply

- When building software
- When automation matters
- When consistency is important
- When speed matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — GitHub Actions is complex |
| **Time** — GitHub Actions takes time |
| **Over-automation** — Don't automate everything |

## Common Misuses

- **Everything automated**: Not everything needs GitHub Actions
- **Confusing with CI/CD**: GitHub Actions ≠ CI/CD
- **Over-automation**: Too much automation creates complexity

## Related Concepts

- [CI/CD](Architecture/cicd-github-actions.md) — GitHub Actions with CI/CD
- [Deployment](Architecture/deployment.md) — GitHub Actions with deployment
- [Version Control](Architecture/version-control.md) — GitHub Actions with version control

## Project Observations

- The project uses GitHub Actions:
  - The project's CI/CD note covers GitHub Actions (from existing notes)
  - No evidence of GitHub Actions in existing code (src/ is empty)
- File naming conventions support GitHub Actions:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
