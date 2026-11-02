---
slug: slo
sources:
  - https://sre.google/sre-book/service-level-objectives/
  - https://opentelemetry.io/
date: 2026-11-02
tags:
  - slo
  - observability
  - reliability
  - metrics
---

# Service-Level Objectives

## Definition

Service-Level Objectives (SLOs) are **target values for service reliability that define the acceptable level of service quality**.

> "An SLO is a target value or range of values for how long a service will be available to users." — Google SRE

## Problem Addressed

Without SLOs:
- **Unknown reliability**: Can't measure service reliability
- **No targets**: No targets for reliability
- **Poor UX**: Users experience unreliable service
- **No accountability**: No accountability for reliability

## Scope and Boundaries

- SLO ≠ SLA (SLO is an internal target, SLA is a contractual commitment)
- SLO = Target (SLO defines targets for reliability)
- SLO is a **reliability metric**, not a pattern

## When to Apply

- When building production systems
- when service reliability is important
- when monitoring is in place
- when incident response is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — SLOs add monitoring complexity |
| **Time** — Setting up SLOs takes time |
| **Rigidity** — SLOs must be reviewed regularly |

## Common Misuses

- **Everything an SLO**: Not every metric needs an SLO
- **Ignoring error budgets**: SLOs should have error budgets
- **Confusing with SLA**: SLO is an internal target, SLA is a contractual commitment

## Related Concepts

- [Observability](Quality Delivery/observability.md) — Observability provides data for SLOs
- [Monitoring](Security/monitoring.md) — Monitoring tracks SLO compliance
- [Alerting](Security/alerting.md) — Alerting triggers on SLO violations

## Project Observations

- The project uses SLOs:
  - OpenTelemetry supports SLO tracking
  - Sentry supports SLO tracking
  - The project's architecture patterns note covers observability concepts
  - No evidence of SLOs in existing code (src/ is empty)
- File naming conventions support SLOs:
  - `*.slo.ts` — SLO files
  - `*.metrics.ts` — Metrics files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

