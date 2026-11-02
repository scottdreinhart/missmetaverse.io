---
slug: version-control
sources:
  - https://git-scm.com/
  - https://en.wikipedia.org/wiki/Version_control
date: 2026-11-02
tags:
  - version-control
  - git
  - collaboration
  - source-control
---

# Version Control

## Definition

Version Control is a **system that records changes to files over time so that specific versions can be retrieved later**.

> "Version control or source control is the management of changes to documents, programs, websites, and other files or information." — Wikipedia

## Problem Addressed

Without version control:
- **Data loss**: Changes are lost
- **Collaboration difficulty**: Hard to collaborate
- **Reverting**: Hard to revert changes
- **Branching**: Hard to branch and merge

## Scope and Boundaries

- Version Control ≠ Git (version control is a concept, Git is a tool)
- Version Control ≠ CI/CD (version control is tracking changes, CI/CD is automating)
- Version Control is a **tracking system**, not an automation system

## When to Apply

- When building software
- When collaborating
- When tracking changes matters
- When reverting is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Version control is complex |
| **Time** — Version control takes time |
| **Over-versioning** — Don't version everything |

## Common Misuses

- **Everything versioned**: Not everything needs version control
- **Confusing with CI/CD**: Version control ≠ CI/CD
- **Over-versioning**: Too much versioning creates complexity

## Related Concepts

- [CI/CD](Architecture/cicd-github-actions.md) — Version control with CI/CD
- [Git](Architecture/git.md) — Version control with Git
- [Commit Management](Architecture/commit-management-integration.md) — Version control with commits

## Project Observations

- The project uses version control:
  - The project's commit management note covers version control (from existing notes)
  - No evidence of version control in existing code (src/ is empty)
- File naming conventions support version control:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
