---
slug: logging-patterns
sources:
  - https://sentry.io/
  - https://github.com/winstonjs/winston
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/security
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - logging
  - observability
  - debugging
  - monitoring
---

# Logging Patterns

## Definition

Logging Patterns are **design patterns for recording application events, errors, and diagnostic information for debugging, monitoring, and analysis**.

> "Logging is the recording of events that occur in a software application, for later review and analysis." — Wikipedia

## Problem Addressed

Without logging patterns:
- **Unknown errors**: Can't diagnose production issues
- **No audit trail**: Can't track user actions
- **Poor debugging**: Hard to reproduce issues
- **No monitoring**: Can't detect anomalies

## Scope and Boundaries

- Logging Patterns ≠ Logging (logging patterns are patterns, logging is a technique)
- Logging Patterns = Monitoring (logging patterns are patterns, monitoring is a feature)
- Logging Patterns is a **technique**, not a pattern

## When to Apply

- When building applications
- when debugging matters
- when monitoring is important
- when compliance requires audit trails

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Logging adds complexity to code |
| **Time** — Log analysis takes time |
| **Over-logging** — Too much log data is as bad as too little |

## Common Misuses

- **Logging everything**: Log only what matters for debugging and monitoring
- **Logging sensitive data**: Never log passwords, tokens, or PII
- **Confusing logging with monitoring**: Logging records events, monitoring detects anomalies

## Related Concepts

- [Monitoring](Security/monitoring.md) — Monitoring uses logging data
- [Observability](Quality%20& Delivery/observability.md) — Observability includes logging
- [Error Handling](Security/error-handling.md) — Error handling uses logging

## Project Observations

- The project uses logging patterns:
  - Sentry provides logging and error tracking
  - Node.js provides console logging
  - TypeScript provides type-safe logging
  - No evidence of logging patterns in existing code (src/ is empty)
- File naming conventions support logging:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]




