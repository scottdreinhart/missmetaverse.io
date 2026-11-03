---
slug: monitoring-patterns
sources:
  - https://sentry.io/
  - https://opentelemetry.io/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/security
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - domain/optimization
  - monitoring
  - observability
  - production
  - metrics
---

# Monitoring Patterns

## Definition

Monitoring Patterns are **design patterns for tracking application health, performance, and errors in production to ensure reliability and enable rapid incident response**.

> "Monitoring is the process of observing, measuring, and recording aspects of a system to ensure it operates correctly." — Wikipedia

## Problem Addressed

Without monitoring patterns:
- **Unknown health**: Can't detect production issues
- **Slow response**: Incidents take too long to detect
- **No metrics**: Can't measure reliability
- **Poor UX**: Users experience issues without notification

## Scope and Boundaries

- Monitoring Patterns ≠ Monitoring (monitoring patterns are patterns, monitoring is a feature)
- Monitoring Patterns = Logging (monitoring patterns are patterns, logging is a technique)
- Monitoring Patterns is a **feature**, not a pattern

## When to Apply

- When building applications
- when production reliability matters
- when incident response is important
- when compliance requires monitoring

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Monitoring adds infrastructure complexity |
| **Time** — Monitoring setup takes time |
| **Over-monitoring** — Too many alerts cause alert fatigue |

## Common Misuses

- **Monitoring everything**: Monitor what matters for business and users
- **Alert fatigue**: Too many alerts cause teams to ignore them
- **Confusing monitoring with logging**: Monitoring uses logging data but adds alerting and dashboards

## Related Concepts

- [Logging](Frontend UI/logging-patterns.md) — Logging provides data for monitoring
- [Observability](Quality & Delivery/observability.md) — Observability includes monitoring
- [Alerting](Security/alerting.md) — Alerting is a form of monitoring

## Project Observations

- The project uses monitoring patterns:
  - Sentry provides error monitoring and performance tracking
  - OpenTelemetry provides distributed tracing
  - Vite provides build metrics
  - No evidence of monitoring patterns in existing code (src/ is empty)
- File naming conventions support monitoring:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]



