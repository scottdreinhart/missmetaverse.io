---
slug: git
sources:
  - https://git-scm.com/
  - https://git-scm.com/book/en/v2
date: 2026-11-02
tags:
  - git
  - version-control
  - collaboration
  - source-control
---

# Git

## Definition

Git is a **distributed version control system for tracking changes in source code**.

> "Git is a distributed version control system for tracking changes in source code." — Git SCM

## Problem Addressed

Without Git:
- **Data loss**: Changes are lost
- **Collaboration difficulty**: Hard to collaborate
- **Reverting**: Hard to revert changes
- **Branching**: Hard to branch and merge

## Scope and Boundaries

- Git ≠ GitHub (Git is a tool, GitHub is a platform)
- Git ≠ Version Control (Git is a tool, version control is a concept)
- Git is a **version control tool**, not a platform

## When to Apply

- When building software
- When collaborating
- When tracking changes matters
- When reverting is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Git is complex |
| **Time** — Git takes time |
| **Over-gitting** — Don't use Git for everything |

## Common Misuses

- **Everything Git**: Not everything needs Git
- **Confusing with GitHub**: Git ≠ GitHub
- **Over-gitting**: Too much Git creates complexity

## Related Concepts

- [Version Control](Architecture/version-control.md) — Git with version control
- [CI/CD](Architecture/cicd-github-actions.md) — Git with CI/CD
- [Commit Management](Architecture/commit-management-integration.md) — Git with commits

## Project Observations

- The project uses Git:
  - The project's commit management note covers Git (from existing notes)
  - No evidence of Git in existing code (src/ is empty)
- File naming conventions support Git:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
