---
slug: plugin-architecture
sources:
  - https://en.wikipedia.org/wiki/Plugin_(computing)
  - https://martinfowler.com/articles/pluginPlugin.html
date: 2026-11-02
tags:
  - plugin-architecture
  - architecture
  - patterns
  - extensibility
---

# Plugin Architecture

## Definition

Plugin Architecture is an **architecture style that allows functionality to be added or removed dynamically**.

> "Plugin architecture allows functionality to be added or removed dynamically." — Martin Fowler

## Problem Addressed

Without plugin architecture:
- **Extensibility**: Hard to add functionality
- **Flexibility**: Hard to remove functionality
- **Modularity**: Hard to modularize code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Plugin Architecture ≠ Modular Monolith (plugin architecture is for extensibility, modular monolith is for organization)
- Plugin Architecture ≠ Microservices (plugin architecture is for plugins, microservices is for services)
- Plugin Architecture is an **architecture style**, not a specific pattern

## When to Apply

- When building applications
- When extensibility matters
- When flexibility is important
- When modularity is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Plugin architecture is complex |
| **Time** — Plugin architecture takes time |
| **Over-plugin** — Don't plugin everything |

## Common Misuses

- **Everything plugin**: Not everything needs plugin architecture
- **Confusing with modular monolith**: Plugin architecture ≠ modular monolith
- **Over-plugin**: Too many plugins create complexity

## Related Concepts

- [Modular Monolith](Architecture/modular-monolith.md) — Plugin architecture with modular monolith
- [Microservices](Architecture/microservices.md) — Plugin architecture with microservices
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Plugin architecture with SoC

## Project Observations

- The project uses plugin architecture:
  - The project's architecture patterns note covers plugin architecture (from existing notes)
  - No evidence of plugin architecture in existing code (src/ is empty)
- File naming conventions support plugin architecture:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

