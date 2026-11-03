---
slug: observability
---

# Observability

> **Purpose:** Make system behavior visible through logs, metrics, and traces.
> **Last Updated:** 2026-11-03

## concept_id
`testing-observability`

## title
Observability

## aliases
- Observability
- System Observability
- Three Pillars of Observability

## category
quality-delivery

## concept_type
development-practice

## research_status
verified

## project_adoption
declared

## applicability
- Production systems
- Distributed systems
- Microservices architecture
- SRE practices

## tags
- type/practice
- domain/devops
- status/verified
- priority/high

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-ci
- testing-slo
- testing-architecture-fitness
- arch-quality-gate

## Definition

Observability is the ability to understand system internal state from external outputs (logs, metrics, traces). It enables debugging, monitoring, and understanding system behavior.

## Problem Addressed

Without observability:
- System behavior is hidden
- Debugging is difficult
- Issues are discovered late
- Understanding system is hard

## Scope and Boundaries

Observability applies to:
- Production systems
- Distributed systems
- Microservices architecture
- SRE practices

Observability does not apply to:
- Development environment
- Local testing
- Unit testing
- Build systems

## When to Apply

- Deploying to production
- Building distributed systems
- Implementing SRE practices
- Monitoring systems

## Tradeoffs and When to Avoid

- **Cost**: Observability infrastructure costs money
- **Complexity**: Observability adds complexity
- **Not for development**: Development environment doesn't need observability
- **Not for testing**: Testing environment doesn't need observability

## Implementation Guidance

1. **Add logging**: Add structured logging
2. **Add metrics**: Add system metrics
3. **Add tracing**: Add distributed tracing
4. **Centralize**: Centralize logs, metrics, and traces
5. **Alert**: Set up alerts for anomalies

## Verification

- [ ] Logging is added
- [ ] Metrics are added
- [ ] Tracing is added
- [ ] Data is centralized
- [ ] Alerts are set up

## Common Misuses

- **Not logging**: Not adding logging
- **Not measuring**: Not adding metrics
- **Not tracing**: Not adding tracing
- **Not centralizing**: Not centralizing data

## Related Concepts

- [[Quality & Testing/continuous-integration]] â€” Continuous Integration
- [[Quality & Testing/service-level-objectives]] â€” Service-Level Objectives
- [[Quality & Testing/architecture-fitness-functions]] â€” Architecture Fitness Functions

## Project Observations

The project follows observability through:
- Sentry for error tracking
- Structured logging
- Metrics collection
- Distributed tracing

## Sources

- [[Sources/martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Observability Note**
