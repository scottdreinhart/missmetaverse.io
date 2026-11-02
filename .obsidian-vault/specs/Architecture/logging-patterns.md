---
slug: logging-patterns
sources:
  - https://en.wikipedia.org/wiki/Logging_(computing)
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - logging
  - debugging
  - observability
  - patterns
---

# Logging Patterns

## Definition

Logging Patterns are **design patterns for logging software events**.

> "Logging is the act of recording events that occur in software for debugging, monitoring, and analysis." — Wikipedia

## Problem Addressed

Without logging patterns:
- **Debugging difficulty**: Hard to debug without logs
- **Monitoring gaps**: Can't monitor without logs
- **Analysis**: Can't analyze without logs
- **Compliance**: Can't meet compliance requirements

## Scope and Boundaries

- Logging Patterns ≠ Logging (logging patterns are patterns, logging is a practice)
- Logging Patterns ≠ Monitoring (logging patterns are patterns, monitoring is a practice)
- Logging Patterns is a **patterns**, not a practice

## When to Apply

- When building software
- when debugging is important
- when monitoring matters
- when compliance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Logging patterns are complex |
| **Time** — Logging patterns take time |
| **Over-logging** — Don't log everything |

## Common Misuses

- **Everything logged**: Not everything needs logging patterns
- **Confusing with monitoring**: Logging patterns ≠ monitoring
- **Over-logging**: Too much logging creates complexity

## Related Concepts

- [Observability](Architecture/observability.md) — Logging patterns with observability
- [Error Handling](Architecture/error-handling.md) — Logging patterns with error handling
- [Sentry](Architecture/sentry.md) — Logging patterns with Sentry

## Project Observations

- The project uses logging patterns:
  - The project's quality and delivery note covers logging patterns (from existing notes)
  - No evidence of logging patterns in existing code (src/ is empty)
- File naming conventions support logging patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

