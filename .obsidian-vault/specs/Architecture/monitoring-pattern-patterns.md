---
slug: monitoring-pattern-patterns
sources:
  - https://docs.sentry.io/
  - https://en.wikipedia.org/wiki/Computer_monitoring
date: 2026-11-02
tags:
  - monitoring-pattern
  - observability-patterns
  - patterns
  - design-patterns
---

# Monitoring Pattern Patterns

## Definition

Monitoring Pattern Patterns are **design patterns for working with monitoring architecture**.

> "Monitoring is the process of observing, tracking, and measuring system performance and availability to ensure operational health." — Sentry

## Problem Addressed

Without monitoring pattern patterns:
- **Visibility**: System health is invisible
- **Incidents**: Incidents are detected late
- **Testing**: Hard to test monitoring
- **Maintenance**: Hard to maintain monitoring

## Scope and Boundaries

- Monitoring Pattern Patterns ≠ Monitoring (monitoring pattern patterns are patterns, monitoring is an observability pattern)
- Monitoring Pattern Patterns = Logging (monitoring pattern patterns are patterns, logging is an observability pattern)
- Monitoring Pattern Patterns is a **patterns**, not an observability pattern

## When to Apply

- When building applications
- when monitoring matters
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Monitoring pattern patterns are complex |
| **Time** — Monitoring pattern patterns take time |
| **Over-monitoring** — Don't use monitoring for everything |

## Common Misuses

- **Everything monitoring**: Not everything needs monitoring pattern patterns
- **Confusing with logging**: Monitoring pattern patterns ≠ logging
- **Over-monitoring**: Too much monitoring creates complexity

## Related Concepts

- [Observability Patterns](Architecture/observability-patterns.md) — Monitoring pattern patterns with observability patterns
- [Logging Pattern](Architecture/logging-pattern-patterns.md) — Monitoring pattern patterns with logging pattern
- [Profiling Pattern](Architecture/profiling-pattern-patterns.md) — Monitoring pattern patterns with profiling pattern

## Project Observations

- The project uses monitoring pattern patterns:
  - The project's architecture patterns note covers monitoring pattern patterns (from existing notes)
  - No evidence of monitoring pattern patterns in existing code (src/ is empty)
- File naming conventions support monitoring pattern patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/microsoft-monitoring-pattern-2024|microsoft-monitoring-pattern-2024]]
