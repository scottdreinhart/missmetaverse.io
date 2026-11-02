---
slug: design-patterns-overview
sources:
  - https://en.wikipedia.org/wiki/Software_design_pattern
  - https://refactoring.guru/design-patterns
date: 2026-11-02
tags:
  - design-patterns
  - gof
  - patterns
  - software-design
---

# Design Patterns Overview

## Definition

Design Patterns Overview is a **collection of 23 classic software design patterns categorized into three groups: creational, structural, and behavioral**.

> "Design patterns are typical solutions to commonly occurring problems in software design." — Wikipedia

## Problem Addressed

Without design patterns:
- **Reinventing**: Solutions are reinvented
- **Complexity**: Solutions are complex
- **Communication**: Solutions are hard to communicate
- **Maintenance**: Solutions are hard to maintain

## Scope and Boundaries

- Design Patterns ≠ Architecture (design patterns are for code, architecture is for systems)
- Design Patterns ≠ Patterns (design patterns are a specific type of pattern)
- Design Patterns is a **collection**, not a specific pattern

## When to Apply

- When building software
- when solutions matter
- when communication is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Design patterns are complex |
| **Time** — Design patterns take time |
| **Over-design-patterns** — Don't use design patterns for everything |

## Common Misuses

- **Everything design pattern**: Not everything needs design patterns
- **Confusing with architecture**: Design patterns ≠ architecture
- **Over-design-patterns**: Too many design patterns create complexity

## Related Concepts

- [Creational Patterns](Architecture/factory-method-pattern.md) — Design patterns with creational patterns
- [Structural Patterns](Architecture/adapter-pattern.md) — Design patterns with structural patterns
- [Behavioral Patterns](Architecture/strategy-pattern.md) — Design patterns with behavioral patterns

## Project Observations

- The project uses design patterns:
  - The project's architecture patterns note covers design patterns (from existing notes)
  - No evidence of design patterns in existing code (src/ is empty)
- File naming conventions support design patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/goF-1994|goF-1994]]
