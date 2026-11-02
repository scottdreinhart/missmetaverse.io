---
slug: alerting-patterns
sources:
  - https://sentry.io/
  - https://opentelemetry.io/
date: 2026-11-02
tags:
  - alerting
  - monitoring
  - production
  - incident-response
---

# Alerting Patterns

## Definition

Alerting Patterns are **design patterns for notifying teams of production issues based on monitored metrics, logs, and traces to enable rapid incident response**.

> "Alerting is the process of notifying relevant personnel when a system condition requires attention." — Wikipedia

## Problem Addressed

Without alerting patterns:
- **Unknown incidents**: Issues go unnoticed
- **Slow response**: Incidents take too long to address
- **No escalation**: Critical issues don't reach the right people
- **User impact**: Users experience issues without notification

## Scope and Boundaries

- Alerting Patterns ≠ Alerting (alerting patterns are patterns, alerting is a feature)
- Alerting Patterns = Monitoring (alerting patterns are patterns, monitoring is a feature)
- Alerting Patterns is a **feature**, not a pattern

## When to Apply

- When building applications
- when production reliability matters
- when incident response is important
- when compliance requires alerting

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Alerting adds infrastructure complexity |
| **Time** — Alert setup takes time |
| **Over-alerting** — Too many alerts cause alert fatigue |

## Common Misuses

- **Alerting on everything**: Alert only on what matters for business and users
- **Alert fatigue**: Too many alerts cause teams to ignore them
- **Confusing alerting with monitoring**: Alerting is a subset of monitoring

## Related Concepts

- [Monitoring](Frontend UI/monitoring-patterns.md) — Monitoring provides data for alerting
- [Logging](Frontend UI/logging-patterns.md) — Logging provides data for alerting
- [Observability](Quality & Delivery/observability.md) — Observability includes alerting

## Project Observations

- The project uses alerting patterns:
  - Sentry provides alerting capabilities
  - OpenTelemetry provides alerting triggers
  - GitHub provides notification integrations
  - No evidence of alerting patterns in existing code (src/ is empty)
- File naming conventions support alerting:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
