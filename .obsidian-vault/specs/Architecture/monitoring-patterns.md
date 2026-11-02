---
slug: monitoring-patterns
sources:
  - https://en.wikipedia.org/wiki/Computer_monitoring
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - monitoring
  - observability
  - debugging
  - patterns
---

# Monitoring Patterns

## Definition

Monitoring Patterns are **design patterns for monitoring software systems**.

> "Monitoring is the process of observing a system to detect issues, track performance, and ensure reliability." — Wikipedia

## Problem Addressed

Without monitoring patterns:
- **Issues**: Can't detect issues early
- **Performance**: Can't track performance
- **Reliability**: Can't ensure reliability
- **User experience**: Can't track user experience

## Scope and Boundaries

- Monitoring Patterns ≠ Monitoring (monitoring patterns are patterns, monitoring is a practice)
- Monitoring Patterns ≠ Logging (monitoring patterns are patterns, logging is a practice)
- Monitoring Patterns is a **patterns**, not a practice

## When to Apply

- When building software
- when reliability matters
- when performance is important
- when user experience is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Monitoring patterns are complex |
| **Time** — Monitoring patterns take time |
| **Over-monitoring** — Don't monitor everything |

## Common Misuses

- **Everything monitored**: Not everything needs monitoring patterns
- **Confusing with logging**: Monitoring patterns ≠ logging
- **Over-monitoring**: Too much monitoring creates complexity

## Related Concepts

- [Observability](Architecture/observability.md) — Monitoring patterns with observability
- [Logging](Architecture/logging-patterns.md) — Monitoring patterns with logging
- [Alerting](Architecture/alerting.md) — Monitoring patterns with alerting

## Project Observations

- The project uses monitoring patterns:
  - The project's quality and delivery note covers monitoring patterns (from existing notes)
  - No evidence of monitoring patterns in existing code (src/ is empty)
- File naming conventions support monitoring patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

