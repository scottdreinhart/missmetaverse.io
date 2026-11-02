---
slug: fail-fast
sources:
  - https://en.wikipedia.org/wiki/Fail-fast
  - https://en.wikipedia.org/wiki/Fail-safe
date: 2026-11-02
tags:
  - fail-fast
  - principles
  - error-handling
  - debugging
---

# Fail Fast

## Definition

Fail Fast is the principle that **systems should detect and report errors as early as possible**, rather than allowing invalid states to propagate.

> "Fail fast means that a program should immediately detect and report conditions that could lead to errors." — Software engineering principle

## Problem Addressed

Not failing fast leads to:
- **Delayed errors**: Bugs manifest far from their source
- **Data corruption**: Invalid data propagates through the system
- **Debugging difficulty**: Hard to trace back to the root cause
- **Security risks**: Invalid states may create vulnerabilities

## Scope and Boundaries

- Fail Fast ≠ Crash immediately (graceful failure is still fail fast)
- Fail Fast ≠ No error handling (it's about early detection)
- Fail Fast is about **detection timing**, not **failure handling**

## When to Apply

- When validating input
- When checking preconditions
- When checking invariants
- When checking postconditions

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Performance** — Early checks add overhead |
| **Over-validation** — Checking too many things |
| **User experience** — Early errors may frustrate users |

## Common Misuses

- **Fail everywhere**: Checking everything at every level
- **Fail silently**: Not failing fast but also not handling the error
- **Confusing with fail-safe**: Fail-fast detects early, fail-safe handles gracefully

## Related Concepts

- **Design by Contract** — Fail fast is a practical application
- **Input Validation** — Fail fast at boundaries
- **Type Systems** — TypeScript catches errors at compile time (fail fast)

## Project Observations

- The project follows fail fast:
  - TypeScript strict mode catches errors at compile time
  - Zod schemas validate at runtime (fail fast at boundaries)
  - Commitlint validates commit messages (fail fast in git workflow)
  - ESLint catches errors before runtime
- No evidence of fail-fast violations in existing configuration

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]
