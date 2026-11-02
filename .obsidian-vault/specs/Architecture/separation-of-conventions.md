---
slug: separation-of-conventions
sources:
  - https://en.wikipedia.org/wiki/Convention_over_configuration
  - https://en.wikipedia.org/wiki/Configuration-driven_development
date: 2026-11-02
tags:
  - conventions
  - separation-of-conventions
  - configuration
  - patterns
---

# Separation of Conventions

## Definition

Separation of Conventions is a **principle where code organization follows consistent naming and location conventions rather than explicit configuration**.

> "Convention over configuration reduces the amount of configuration needed by following consistent conventions." — Software engineering principle

## Problem Addressed

Explicit configuration leads to:
- **Boilerplate**: Configuring everything explicitly
- **Complexity**: Many configuration options
- **Inconsistency**: Different conventions in different places
- **Maintenance**: More config to maintain

## Scope and Boundaries

- Conventions ≠ Configuration (conventions are about structure, configuration is about behavior)
- Conventions ≠ Standards (conventions are about structure, standards are about quality)
- Conventions is a **principle**, not a specific pattern

## When to Apply

- When building frameworks or libraries
- When consistency matters
- When reducing configuration is important
- When onboarding new developers

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Flexibility** — Conventions may not fit all cases |
| **Learning curve** — Need to learn conventions |
| **Debugging** — Hard to trace convention-based behavior |

## Common Misuses

- **Everything by convention**: Not everything should follow conventions
- **Confusing with standards**: Conventions ≠ standards
- **Over-convention**: Too many conventions create rigidity

## Related Concepts

- [Configuration-Driven Development](Architecture/configuration-driven-development.md) — Complementary approach
- [Data-Driven Design](Architecture/data-driven-design.md) — Complementary approach
- [File Separation Conventions](Architecture/file-level-separation-conventions.md) — Project-specific conventions

## Project Observations

- The project uses conventions:
  - File naming conventions (from existing notes)
  - Folder structure conventions (src/ folder)
  - TypeScript conventions (from existing notes)
- No evidence of explicit configuration in existing setup

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
