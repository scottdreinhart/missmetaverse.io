---
slug: declarative-programming
sources:
  - https://en.wikipedia.org/wiki/Declarative_programming
  - https://en.wikipedia.org/wiki/Imperative_programming
date: 2026-11-02
tags:
  - declarative
  - programming-paradigm
  - data-driven
  - configuration-driven
---

# Declarative Programming

## Definition

Declarative Programming is a **paradigm where you describe WHAT should be done rather than HOW to do it**. The implementation details are handled by the framework or language.

> "Declarative programming is a programming paradigm that expresses the logic of a computation without describing its control flow." — Wikipedia

## Problem Addressed

Imperative programming leads to:
- **Boilerplate**: Describing every step
- **Complexity**: Control flow obscures intent
- **Testing difficulty**: Hard to test complex imperative code
- **Maintenance**: More code to maintain

## Scope and Boundaries

- Declarative ≠ Functional (declarative is broader than functional)
- Declarative ≠ Data-driven (declarative is a paradigm, data-driven is an approach)
- Declarative is a **programming paradigm**, not a specific technique

## When to Apply

- When using frameworks (React, SQL, CSS)
- When describing desired state
- When the framework handles implementation
- When readability matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Abstraction** — Hard to control implementation |
| **Debugging** — Hard to trace what's happening |
| **Limitations** — May not support all requirements |

## Common Misuses

- **Everything declarative**: Some things need imperative control
- **Confusing with data-driven**: Declarative ≠ data-driven
- **Over-abstraction**: Too much abstraction hides important details

## Related Concepts

- [Data-Driven Design](Architecture/data-driven-design.md) — Complementary approach
- [Configuration-Driven Development](Architecture/configuration-driven-development.md) — Declarative configuration
- [React Patterns](../React/react-patterns) — React is declarative

## Project Observations

- The project uses declarative patterns:
  - React (declarative UI)
  - Tailwind CSS (declarative styling)
  - TypeScript (declarative types)
  - Vite (declarative configuration)
- No evidence of imperative patterns in existing configuration

## Sources

- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]

