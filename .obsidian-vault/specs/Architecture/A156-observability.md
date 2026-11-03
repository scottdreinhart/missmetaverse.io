---
slug: observability
sources:
  - https://opentelemetry.io/docs/specs/otel/overview/
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - type/concept
  - domain/testing
  - type/guide
  - domain/optimization
  - status/complete
  - type/reference
  - domain/architecture
  - observability
  - monitoring
  - logging
  - debugging
---

# Observability

## Definition

Observability is a **system property that measures how well internal states can be inferred from external outputs**.

> "Observability is the ability to measure system behavior by examining its outputs." — OpenTelemetry

## Problem Addressed

Without observability:
- **Debugging difficulty**: Hard to find bugs in production
- **Monitoring gaps**: Can't detect issues early
- **Performance**: Hard to identify performance bottlenecks
- **User experience**: Can't track user experience

## Scope and Boundaries

- Observability ≠ Monitoring (observability is broader, monitoring is specific)
- Observability ≠ Logging (observability includes logging, but is broader)
- Observability is a **system property**, not a tool

## When to Apply

- When building production systems
- When debugging is important
- When performance matters
- When user experience matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Observability adds complexity |
| **Storage** — Logs and metrics use storage |
| **Performance** — Observability has overhead |

## Common Misuses

- **Everything observable**: Not everything needs observability
- **Confusing with monitoring**: Observability ≠ monitoring
- **Over-observability**: Too much observability creates noise

## Related Concepts

- [Continuous Integration](Architecture/continuous-integration.md) — Observability with CI
- [Automated Testing](Architecture/quality-delivery-maintainability.md) — Observability with testing
- [Error Handling](Architecture/quality-delivery-maintainability.md) — Observability with error handling

## Project Observations

- The project uses observability:
  - Sentry is configured for error tracking (from existing notes)
  - The project's quality and delivery note covers observability
  - No evidence of observability in existing code (src/ is empty)
- File naming conventions support observability:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]



