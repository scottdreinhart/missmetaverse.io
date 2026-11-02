---
slug: plugin-architecture-patterns
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

# Plugin Architecture Patterns

## Definition

Plugin Architecture Patterns are **design patterns for working with plugin architecture**.

> "Plugin architecture allows functionality to be added or removed dynamically." — Martin Fowler

## Problem Addressed

Without plugin architecture patterns:
- **Extensibility**: Hard to add functionality
- **Flexibility**: Hard to remove functionality
- **Modularity**: Hard to modularize code
- **Maintenance**: Hard to maintain code

## Scope and Boundaries

- Plugin Architecture Patterns ≠ Plugin Architecture (plugin architecture patterns are patterns, plugin architecture is an architecture style)
- Plugin Architecture Patterns ≠ Modular Monolith (plugin architecture patterns are patterns, modular monolith is an architecture style)
- Plugin Architecture Patterns is a **patterns**, not an architecture style

## When to Apply

- When building applications
- when extensibility matters
- when flexibility is important
- when modularity is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Plugin architecture patterns are complex |
| **Time** — Plugin architecture patterns take time |
| **Over-plugin-architecture** — Don't use plugin architecture for everything |

## Common Misuses

- **Everything plugin**: Not everything needs plugin architecture patterns
- **Confusing with modular monolith**: Plugin architecture patterns ≠ modular monolith
- **Over-plugin-architecture**: Too many plugins create complexity

## Related Concepts

- [Modular Monolith](Architecture/modular-monolith.md) — Plugin architecture patterns with modular monolith
- [Microservices](Architecture/microservices-patterns.md) — Plugin architecture patterns with microservices
- [Separation of Concerns](Architecture/separation-of-concerns.md) — Plugin architecture patterns with SoC

## Project Observations

- The project uses plugin architecture patterns:
  - The project's architecture patterns note covers plugin architecture patterns (from existing notes)
  - No evidence of plugin architecture patterns in existing code (src/ is empty)
- File naming conventions support plugin architecture patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

