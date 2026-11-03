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
  - --
# Service-Level Objectives

## Definition

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Service-Level Objectives (SLOs) are **target values for service reliability that define the acceptable level of service quality**.

> "An SLO is a target value or range of values for how long a service will be available to users." â€” Google SRE

## Problem Addressed

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without SLOs:
- **Unknown reliability**: Can't measure service reliability
- **No targets**: No targets for reliability
- **Poor UX**: Users experience unreliable service
- **No accountability**: No accountability for reliability

## Scope and Boundaries

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- SLO â‰  SLA (SLO is an internal target, SLA is a contractual commitment)
- SLO = Target (SLO defines targets for reliability)
- SLO is a **reliability metric**, not a pattern

## When to Apply

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building production systems
- when service reliability is important
- when monitoring is in place
- when incident response is needed

## Tradeoffs and When to Avoid

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

| Cost | Description |
|------|-------------|
| **Complexity** â€” SLOs add monitoring complexity |
| **Time** â€” Setting up SLOs takes time |
| **Rigidity** â€” SLOs must be reviewed regularly |

## Common Misuses

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **Everything an SLO**: Not every metric needs an SLO
- **Ignoring error budgets**: SLOs should have error budgets
- **Confusing with SLA**: SLO is an internal target, SLA is a contractual commitment

## Related Concepts

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Observability](Quality Delivery/observability.md) â€” Observability provides data for SLOs
- [Monitoring](Security/monitoring.md) â€” Monitoring tracks SLO compliance
- [Alerting](Security/alerting.md) â€” Alerting triggers on SLO violations

## Project Observations

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses SLOs:
  - OpenTelemetry supports SLO tracking
  - Sentry supports SLO tracking
  - The project's architecture patterns note covers observability concepts
  - No evidence of SLOs in existing code (src/ is empty)
- File naming conventions support SLOs:
  - `*.slo.ts` â€” SLO files
  - `*.metrics.ts` â€” Metrics files

## Sources

## concept_id
o11-service-level-objectives

## title
O11-Service-Level-Objectives

## aliases
- O11-Service-Level-Objectives

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




