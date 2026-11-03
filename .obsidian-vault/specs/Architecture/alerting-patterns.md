---
slug: alerting-patterns-original
sources:
  - https://en.wikipedia.org/wiki/Alert_management
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - alerting
  - monitoring
  - observability
  - patterns
---

# Alerting Patterns

## Definition

Alerting Patterns are **design patterns for alerting stakeholders**.

> "Alerting is the process of notifying stakeholders when specific conditions are met in a system." — Wikipedia

## Problem Addressed

Without alerting patterns:
- **Issues**: Can't notify stakeholders of issues
- **Response**: Can't respond to issues quickly
- **User experience**: Users experience issues before stakeholders
- **Reliability**: Can't ensure reliability

## Scope and Boundaries

- Alerting Patterns ≠ Alerting (alerting patterns are patterns, alerting is a practice)
- Alerting Patterns ≠ Monitoring (alerting patterns are patterns, monitoring is a practice)
- Alerting Patterns is a **patterns**, not a practice

## When to Apply

- When building software
- when reliability matters
- when quick response is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Alerting patterns are complex |
| **Time** — Alerting patterns take time |
| **Over-alerting** — Don't alert on everything |

## Common Misuses

- **Everything alerted**: Not everything needs alerting patterns
- **Confusing with monitoring**: Alerting patterns ≠ monitoring
- **Over-alerting**: Too much alerting creates complexity

## Related Concepts

- [Monitoring](Architecture/monitoring-patterns.md) — Alerting patterns with monitoring
- [Observability](Architecture/observability.md) — Alerting patterns with observability
- [Logging](Architecture/logging-patterns.md) — Alerting patterns with logging

## Project Observations

- The project uses alerting patterns:
  - The project's quality and delivery note covers alerting patterns (from existing notes)
  - No evidence of alerting patterns in existing code (src/ is empty)
- File naming conventions support alerting patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

