# Bulkhead Pattern

> **Purpose:** Isolate failures with Bulkhead Pattern.
> **Last Updated:** 2026-11-03

---

## concept_id
`bulkhead-pattern`

## title
Bulkhead Pattern

## aliases
- Bulkhead
- Bulkhead Isolation
- Circuit Breaker Alternative
- Resource Isolation

## category
apis-distributed-systems

## concept_type
resilience-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Resource isolation
- Failure containment
- Thread pools
- Connection pools

## tags
- type/pattern
- domain/distributed
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- microservices-patterns

## related_concept_ids
- bulkhead-pattern
- circuit-breaker-pattern
- thread-pool-pattern
- connection-pool

---

## Definition

Bulkhead Pattern isolates resources to prevent failures in one component from affecting others, similar to ship bulkheads that contain flooding.

## Problem Addressed

Without Bulkhead:
- Failures spread across components
- Resources are exhausted
- System availability is reduced
- Cascading failures occur

## Scope of Boundaries

Bulkhead applies to:
- Resource isolation
- Failure containment
- Thread pools
- Connection pools

Bulkhead does not apply to:
- Business logic
- Data modeling
- UI rendering
- Database design

## When to Apply

- Isolating resources
- Containing failures
- Managing thread pools
- Managing connection pools

## Tradeoffs and When to Avoid

- **Complexity**: Bulkhead adds complexity
- **Not for simple apps**: Simple apps don't need Bulkhead
- **Not for single component**: Single component doesn't need Bulkhead
- **Not for sync**: Sync systems don't need Bulkhead

## Implementation Guidance

1. **Identify resources**: Identify shared resources
2. **Create bulkheads**: Create bulkhead boundaries
3. **Configure limits**: Configure resource limits
4. **Monitor**: Monitor bulkhead health
5. **Handle overflow**: Handle resource overflow

## Verification

- [ ] Resources identified
- [ ] Bulkheads created
- [ ] Limits configured
- [ ] Health monitored
- [ ] Overflow handled

## Common Misuses

- **Not isolating**: Not isolating resources properly
- **Not configuring limits**: Not configuring resource limits
- **Not monitoring**: Not monitoring bulkhead health
- **Not handling overflow**: Not handling resource overflow

## Related Concepts

- [[APIs Distributed Systems/bulkhead-pattern]] — Bulkhead Pattern
- [[APIs Distributed Systems/circuit-breaker-pattern]] — Circuit Breaker Pattern
- [[APIs Distributed Systems/thread-pool-pattern]] — Thread Pool Pattern
- [[APIs Distributed Systems/connection-pool]] — Connection Pool

## Project Observations

The project uses Bulkhead Pattern through:
- Resource isolation boundaries
- Thread pool separation
- Connection pool separation
- Failure containment

## Sources

- [[Sources/martinfowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/microservices-patterns|Microservices Patterns — Christensen]]

---

**End of Bulkhead Pattern Note**
