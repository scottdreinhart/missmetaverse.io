---
slug: logging
sources:
  - https://en.wikipedia.org/wiki/Logging_(computing)
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - logging
  - debugging
  - observability
  - monitoring
---

# Logging

## Definition

Logging is a **practice of recording events that occur in software for debugging, monitoring, and analysis**.

> "Logging is the act of recording events that occur in software for debugging, monitoring, and analysis." — Wikipedia

## Problem Addressed

Without logging:
- **Debugging difficulty**: Hard to debug without logs
- **Monitoring gaps**: Can't monitor without logs
- **Analysis**: Can't analyze without logs
- **Compliance**: Can't meet compliance requirements

## Scope and Boundaries

- Logging ≠ Monitoring (logging is recording, monitoring is observing)
- Logging ≠ Error Handling (logging is recording, error handling is responding)
- Logging is a **recording practice**, not a response practice

## When to Apply

- When building software
- When debugging is important
- When monitoring matters
- When compliance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Storage** — Logs use storage |
| **Performance** — Logging has overhead |
| **Complexity** — Logging is complex |

## Common Misuses

- **Everything logged**: Not everything needs logging
- **Confusing with monitoring**: Logging ≠ monitoring
- **Over-logging**: Too much logging creates noise

## Related Concepts

- [Observability](Architecture/observability.md) — Logging with observability
- [Error Handling](Architecture/error-handling.md) — Logging with error handling
- [Sentry](Architecture/sentry.md) — Logging with Sentry

## Project Observations

- The project uses logging:
  - The project's quality and delivery note covers logging (from existing notes)
  - No evidence of logging in existing code (src/ is empty)
- File naming conventions support logging:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
