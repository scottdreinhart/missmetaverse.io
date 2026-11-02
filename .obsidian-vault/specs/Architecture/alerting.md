---
slug: alerting
sources:
  - https://en.wikipedia.org/wiki/Alert_management
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - alerting
  - monitoring
  - observability
  - notifications
---

# Alerting

## Definition

Alerting is a **practice of notifying stakeholders when specific conditions are met in a system**.

> "Alerting is the process of notifying stakeholders when specific conditions are met in a system." — Wikipedia

## Problem Addressed

Without alerting:
- **Issues**: Can't notify stakeholders of issues
- **Response**: Can't respond to issues quickly
- **User experience**: Users experience issues before stakeholders
- **Reliability**: Can't ensure reliability

## Scope and Boundaries

- Alerting ≠ Monitoring (alerting is notifying, monitoring is observing)
- Alerting ≠ Logging (alerting is notifying, logging is recording)
- Alerting is a **notifying practice**, not an observing practice

## When to Apply

- When building software
- When reliability matters
- When quick response is important
- When user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Alerting is complex |
| **Time** — Alerting takes time |
| **Over-alerting** — Don't alert on everything |

## Common Misuses

- **Everything alerted**: Not everything needs alerting
- **Confusing with monitoring**: Alerting ≠ monitoring
- **Over-alerting**: Too much alerting creates noise

## Related Concepts

- [Monitoring](Architecture/monitoring.md) — Alerting with monitoring
- [Observability](Architecture/observability.md) — Alerting with observability
- [Logging](Architecture/logging.md) — Alerting with logging

## Project Observations

- The project uses alerting:
  - The project's quality and delivery note covers alerting (from existing notes)
  - No evidence of alerting in existing code (src/ is empty)
- File naming conventions support alerting:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

