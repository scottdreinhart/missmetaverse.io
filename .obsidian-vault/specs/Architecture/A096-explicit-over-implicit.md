---
slug: explicit-over-implicit
sources:
  - https://pragmaticprogrammer.com/books/pp
  - https://pragmaticprogrammer.com/titles/tpphr/
date: 2026-11-02
tags:











  - explicit
  - principles
  - design
  - pragmatie-programmer
---

# Explicit over Implicit

## Definition

Explicit over Implicit is the principle that **code should make its intentions, dependencies, and behavior clear and visible rather than hidden or automatic**.

> "Explicit is better than implicit." — From The Zen of Python (Tim Peters)

## Problem Addressed

Implicit behavior leads to:
- **Hidden dependencies**: Hard to understand what a module needs
- **Surprising behavior**: Automatic behavior that developers don't expect
- **Testing difficulty**: Hard to test without understanding implicit behavior
- **Debugging difficulty**: Hard to trace implicit data flow

## Scope and Boundaries

- Explicit ≠ Verbose (clarity ≠ length)
- Implicit has its place (conventions, defaults, inference)
- The goal is **predictable implicit behavior**, not eliminating all implicit behavior

## When to Apply

- When choosing between explicit and implicit approaches
- When designing APIs
- When configuring tools
- When reviewing code for hidden behavior

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Verbosity** — Explicit code is longer |
| **Repetition** — Explicit code may repeat information |
| **Developer experience** — Too much explicit code is tiring |

## Common Misuses

- **Explicit everywhere**: No conventions, no defaults, no inference
- **Implicit everywhere**: Magic behavior, hidden dependencies
- **Confusing with verbosity**: Explicit ≠ verbose (you can be explicit and concise)

## Related Concepts

- **Principle of Least Astonishment** — Explicit code is less surprising
- **Fail Fast** — Explicit errors are clearer than implicit failures
- **Type Systems** — TypeScript types make types explicit

## Project Observations

- The project follows explicit over implicit:
  - TypeScript explicit types (not inferred `any`)
  - Explicit imports (not global variables)
  - Explicit configuration (not magic values)
  - Explicit error handling (not silent failures)
- AGENTS.md explicitly prohibits implicit behavior ("Do not add a CSS-in-JS library")

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]



