---
slug: circuit-breaker-pattern
tags:
  - core-concepts

  - api   - distributed-systems   - backend
---

# Circuit Breaker Pattern

> **Purpose:** Prevent cascading failures with Circuit Breaker.
> **Last Updated:** 2026-11-03

## concept_id
`circuit-breaker-pattern`

## title
Circuit Breaker Pattern

## aliases
- Circuit Breaker
- Circuit Pattern
- Failure Protection
- Fault Tolerance

## category
apis-distributed-systems

## concept_type
resilience-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Fault tolerance
- Failure prevention
- Service isolation
- Recovery management

## tags
- type/pattern
- domain/distributed
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- microservices-patterns

## related_concept_ids
- circuit-breaker-pattern
- retry-pattern
- timeout-pattern
- bulkhead-pattern

## Definition

Circuit Breaker Pattern prevents cascading failures by stopping requests to failing services, allowing them time to recover, and providing fallback behavior.

## Problem Addressed

Without Circuit Breaker:
- Cascading failures occur
- Resources are wasted on failing calls
- Recovery is blocked
- System availability is reduced

## Scope of Boundaries

Circuit Breaker applies to:
- Fault tolerance
- Failure prevention
- Service isolation
- Recovery management

Circuit Breaker does not apply to:
- Business logic
- Data modeling
- UI rendering
- Database design

## When to Apply

- Calling external services
- Needing fault tolerance
- Preventing cascading failures
- Managing service recovery

## Tradeoffs and When to Avoid

- **False positives**: Circuit may open on false positives
- **Not for simple apps**: Simple apps don't need circuit breaker
- **Not for internal**: Internal calls may not need circuit breaker
- **Not for fast failures**: Fast failures don't need circuit breaker

## Implementation Guidance

1. **Implement breaker**: Implement circuit breaker logic
2. **Set thresholds**: Set failure thresholds
3. **Add fallback**: Add fallback behavior
4. **Monitor state**: Monitor circuit state
5. **Test failure**: Test failure scenarios

## Verification

- [ ] Breaker implemented
- [ ] Thresholds set
- [ ] Fallback added
- [ ] State monitored
- [ ] Failure tested

## Common Misuses

- **Wrong thresholds**: Setting wrong failure thresholds
- **Not adding fallback**: Not adding fallback behavior
- **Not monitoring**: Not monitoring circuit state
- **Not testing**: Not testing failure scenarios

## Related Concepts

- [[APIs Distributed Systems/circuit-breaker-pattern]] â€” Circuit Breaker Pattern
- [[APIs Distributed Systems/retry-backoff-jitter]] â€” Retry Pattern
- [[APIs Distributed Systems/timeout-pattern]] â€” Timeout Pattern
- [[APIs Distributed Systems/bulkhead-pattern]] â€” Bulkhead Pattern

## Project Observations

The project uses Circuit Breaker Pattern through:
- Failure threshold configuration
- Fallback behavior implementation
- Circuit state monitoring
- Failure scenario testing

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S010-microsoft-distributed-systems|Microservices Patterns â€” Christensen]]

**End of Circuit Breaker Pattern Note**
