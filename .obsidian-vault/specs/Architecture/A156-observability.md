---
slug: observability
sources:
  - https://opentelemetry.io/docs/specs/otel/overview/
  - https://docs.sentry.io/
date: 2026-11-02
tags:
  - observability
  - monitoring
  - logging
  - debugging
  - --
# Observability

## Definition

Observability is a **system property that measures how well internal states can be inferred from external outputs**.

> "Observability is the ability to measure system behavior by examining its outputs." â€” OpenTelemetry

## Problem Addressed

Without observability:
- **Debugging difficulty**: Hard to find bugs in production
- **Monitoring gaps**: Can't detect issues early
- **Performance**: Hard to identify performance bottlenecks
- **User experience**: Can't track user experience

## Scope and Boundaries

- Observability â‰  Monitoring (observability is broader, monitoring is specific)
- Observability â‰  Logging (observability includes logging, but is broader)
- Observability is a **system property**, not a tool

## When to Apply

- When building production systems
- When debugging is important
- When performance matters
- When user experience matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Observability adds complexity |
| **Storage** â€” Logs and metrics use storage |
| **Performance** â€” Observability has overhead |

## Common Misuses

- **Everything observable**: Not everything needs observability
- **Confusing with monitoring**: Observability â‰  monitoring
- **Over-observability**: Too much observability creates noise

## Related Concepts

- [Continuous Integration](Architecture/continuous-integration.md) â€” Observability with CI
- [Automated Testing](Architecture/quality-delivery-maintainability.md) â€” Observability with testing
- [Error Handling](Architecture/quality-delivery-maintainability.md) â€” Observability with error handling

## Project Observations

- The project uses observability:
  - Sentry is configured for error tracking (from existing notes)
  - The project's quality and delivery note covers observability
  - No evidence of observability in existing code (src/ is empty)
- File naming conventions support observability:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



