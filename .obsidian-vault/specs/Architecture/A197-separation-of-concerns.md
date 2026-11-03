---
slug: separation-of-concerns
sources:
  - https://en.wikipedia.org/wiki/Separation_of_concerns
  - https://www.cs.utexas.edu/users/EWD/ewd02xx/EWD215.PDF
date: 2026-11-02
tags:









  - separation-of-concerns
  - principles
  - dijkstra
  - architecture
---

# Separation of Concerns

## Definition

Separation of Concerns (SoC) is the principle of **dividing a computer program into distinct sections such that each section addresses a separate concern**. A concern is any feature or behavior that affects a program.

> "The basic idea is to separate a system into parts, where each part handles a distinct concern." — Edsger W. Dijkstra (1974)

## Problem Addressed

Without SoC:
- **Tangled code**: Multiple responsibilities mixed in one module
- **Cohesive changes**: Changing one feature requires modifying many places
- **Testing difficulty**: Hard to test isolated behavior
- **Team coordination**: Multiple developers interfere with each other's work

## Scope and Boundaries

- SoC is a **fundamental design principle**, not a specific pattern
- It applies at all levels: modules, classes, functions, files
- SoC is **not** the same as Separation of Concerns in UI (which is a specific architectural pattern)

## When to Apply

- When designing module boundaries
- When organizing code into files and directories
- When choosing an architectural style
- When reviewing code for mixed responsibilities

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Over-separation** | Too many layers add complexity and indirection |
| **Fragmentation** | Related code spread across too many files |
| **Boilerplate** | More interfaces and abstractions to maintain |

## Common Misuses

- **Granularity obsession**: Separating at the function level when module-level is sufficient
- **Ignoring cross-cutting concerns**: Logging, error handling, validation span all layers
- **Confusing with file separation**: More files ≠ better separation

## Related Concepts

- **Single Responsibility Principle** — SoC at the module level
- **High Cohesion** — Related concerns grouped together
- **Low Coupling** — Independent concerns separated
- **Clean Architecture** — SoC at the architectural level

## Project Observations

- File naming conventions (`*.view.tsx`, `*.logic.ts`, `*.data.ts`) enforce SoC at the file level
- The project's architecture (React + Vite + TypeScript) naturally separates concerns:
  - React handles UI
  - Vite handles build
  - TypeScript handles types
  - Tailwind handles styling
- No evidence of mixed concerns in existing configuration

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




