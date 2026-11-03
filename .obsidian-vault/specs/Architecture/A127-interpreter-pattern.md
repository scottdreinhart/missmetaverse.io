---
slug: interpreter-pattern
sources:
  - https://en.wikipedia.org/wiki/Interpreter_pattern
  - https://martinfowler.com/eaaDev/interpreter.html
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - status/complete
  - type/reference
  - domain/architecture
  - interpreter-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
---

# Interpreter Pattern

## Definition

Interpreter Pattern is a **behavioral design pattern that defines a grammatical representation for a language and provides an interpreter to deal with this representation**.

> "The Interpreter pattern defines a grammatical representation for a language and provides an interpreter to deal with this representation." — GoF

## Problem Addressed

Without interpreter pattern:
- **Complexity**: Grammar is complex
- **Inflexibility**: Can't change grammar
- **Testing**: Hard to test grammar
- **Maintenance**: Hard to maintain grammar

## Scope and Boundaries

- Interpreter Pattern ≠ Interpreter (interpreter pattern is a pattern, interpreter is an implementation)
- Interpreter Pattern ≠ Grammar (interpreter pattern is a pattern, grammar is a representation)
- Interpreter Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When grammar matters
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Interpreter pattern is complex |
| **Time** — Interpreter pattern takes time |
| **Over-interpreter** — Don't use interpreter for everything |

## Common Misuses

- **Everything interpreter**: Not everything needs interpreter pattern
- **Confusing with interpreter**: Interpreter pattern ≠ interpreter
- **Over-interpreter**: Too many interpreters create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) — Interpreter pattern with DDD
- [Interpreter](Architecture/interpreter.md) — Interpreter pattern with interpreter
- [Grammar](Architecture/grammar.md) — Interpreter pattern with grammar

## Project Observations

- The project uses interpreter pattern:
  - The project's architecture patterns note covers interpreter pattern (from existing notes)
  - No evidence of interpreter pattern in existing code (src/ is empty)
- File naming conventions support interpreter pattern:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]




