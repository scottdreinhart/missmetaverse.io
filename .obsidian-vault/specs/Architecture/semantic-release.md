---
slug: semantic-release
sources:
  - https://semantic-release.gitbook.io/semantic-release/
  - https://github.com/semantic-release/semantic-release
date: 2026-11-02
tags:
  - semantic-release
  - release
  - automation
  - patterns
---

# Semantic Release

## Definition

Semantic Release is a **tool for automating release management**.

> "Semantic release automates the whole package release workflow including: determining the next version number, generating the release notes and publishing the package." — Semantic Release Docs

## Problem Addressed

Without semantic release:
- **Release consistency**: Releases are inconsistent
- **Versioning**: Versioning is hard to automate
- **Changelog**: Changelog is hard to generate
- **Maintenance**: Hard to maintain releases

## Scope and Boundaries

- Semantic Release ≠ Semantic Versioning (semantic release is a tool, semantic versioning is a convention)
- Semantic Release ≠ Release (semantic release is a tool, release is a process)
- Semantic Release is a **tool**, not a convention

## When to Apply

- When building applications
- when release consistency matters
- when versioning is important
- when changelog is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Semantic release is complex |
| **Time** — Semantic release takes time |
| **Over-semantic-release** — Don't use semantic release for everything |

## Common Misuses

- **Everything semantic release**: Not everything needs semantic release
- **Confusing with semantic versioning**: Semantic release ≠ semantic versioning
- **Over-semantic-release**: Too much semantic release creates complexity

## Related Concepts

- [Semantic Versioning](Architecture/semantic-versioning.md) — Semantic release with semantic versioning
- [Conventional Commits](Architecture/conventional-commits.md) — Semantic release with conventional commits
- [CI/CD](Architecture/ci-cd.md) — Semantic release with CI/CD

## Project Observations

- The project uses semantic release:
  - The project's release note covers semantic release (from existing notes)
  - No evidence of semantic release in existing code (src/ is empty)
- File naming conventions support semantic release:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
