---
slug: api-versioning
sources:
  - https://swagger.io/blog/api-versioning/
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design
date: 2026-11-02
tags:
  - maturity/deprecated
  - api
  - versioning
  - rest
  - backward-compatibility
  - --
# API Versioning

## Definition

API Versioning is the practice of **managing changes to an API while maintaining backward compatibility for existing consumers**.

> "API versioning allows you to evolve your API without breaking existing clients." â€” Microsoft API Design Guide

## Problem Addressed

Without versioning:
- **Breaking changes**: Changes break existing clients
- **Migration difficulty**: Clients can't upgrade gradually
- **Deprecation**: Hard to deprecate old versions
- **Testing**: Hard to test multiple versions

## Scope and Boundaries

- Versioning â‰  Changelog (versioning is for APIs, changelog is for releases)
- Versioning â‰  Semantic versioning (API versioning is different from package versioning)
- Versioning is a **lifecycle management practice**, not a technical pattern

## When to Apply

- When changing API contracts
- When deprecating endpoints
- When adding new features
- When building public APIs

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Maintenance** â€” Multiple versions to maintain |
| **Complexity** â€” Routing between versions |
| **Documentation** â€” Multiple versions to document |

## Common Misuses

- **Versioning everything**: Not every change needs a version
- **Confusing with semver**: API versioning â‰  package versioning
- **Version in URL only**: Multiple versioning strategies exist

## Related Concepts

- [REST](Architecture/architecture-patterns.md) â€” REST API versioning
- [Backward Compatibility](Architecture/architecture-patterns.md) â€” Versioning enables compatibility
- [DTOs](Architecture/architecture-patterns.md) â€” Versioned data transfer

## Project Observations

- No API is implemented yet (src/ is empty)
- The project's architecture patterns note covers API versioning
- File naming conventions support API versioning:
  - `*.schema.ts` â€” Versioned schemas
  - `*.dto.ts` â€” Versioned data transfer

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



