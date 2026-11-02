---
slug: monitoring
sources:
  - https://en.wikipedia.org/wiki/Computer_monitoring
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - monitoring
  - observability
  - debugging
  - alerting
---

# Monitoring

## Definition

Monitoring is a **practice of observing software systems to detect issues, track performance, and ensure reliability**.

> "Monitoring is the process of observing a system to detect issues, track performance, and ensure reliability." — Wikipedia

## Problem Addressed

Without monitoring:
- **Issues**: Can't detect issues early
- **Performance**: Can't track performance
- **Reliability**: Can't ensure reliability
- **User experience**: Can't track user experience

## Scope and Boundaries

- Monitoring ≠ Logging (monitoring is observing, logging is recording)
- Monitoring ≠ Alerting (monitoring is observing, alerting is notifying)
- Monitoring is an **observing practice**, not a recording practice

## When to Apply

- When building software
- When reliability matters
- When performance is important
- When user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Monitoring is complex |
| **Time** — Monitoring takes time |
| **Over-monitoring** — Don't monitor everything |

## Common Misuses

- **Everything monitored**: Not everything needs monitoring
- **Confusing with logging**: Monitoring ≠ logging
- **Over-monitoring**: Too much monitoring creates noise

## Related Concepts

- [Observability](Architecture/observability.md) — Monitoring with observability
- [Logging](Architecture/logging.md) — Monitoring with logging
- [Alerting](Architecture/alerting.md) — Monitoring with alerting

## Project Observations

- The project uses monitoring:
  - The project's quality and delivery note covers monitoring (from existing notes)
  - No evidence of monitoring in existing code (src/ is empty)
- File naming conventions support monitoring:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
