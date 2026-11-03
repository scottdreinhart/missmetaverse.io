---
slug: cancellation-pattern
---

# Cancellation Pattern

> **Purpose:** Cancel long-running operations with Cancellation.
> **Last Updated:** 2026-11-03

## concept_id
`cancellation-pattern`

## title
Cancellation Pattern

## aliases
- Cancellation
- Request Cancellation
- CancellationToken
- Operation Cancellation

## category
apis-distributed-systems

## concept_type
resilience-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Long-running operations
- Request cancellation
- Resource cleanup
- User experience

## tags
- type/pattern
- domain/distributed
- status/verified
- priority/high

## source_ids
- martinfowler-patterns
- microservices-patterns

## related_concept_ids
- cancellation-pattern
- timeout-pattern
- retry-pattern
- async-programming

## Definition

Cancellation Pattern enables graceful cancellation of long-running operations, allowing cleanup and preventing resource waste.

## Problem Addressed

Without Cancellation:
- Operations run unnecessarily
- Resources are wasted
- User experience is poor
- Cleanup is difficult

## Scope of Boundaries

Cancellation applies to:
- Long-running operations
- Request cancellation
- Resource cleanup
- User experience

Cancellation does not apply to:
- Short operations
- Business logic
- Data modeling
- UI rendering

## When to Apply

- Running long operations
- Needing request cancellation
- Managing resources
- Improving user experience

## Tradeoffs and When to Avoid

- **Complexity**: Cancellation adds complexity
- **Not for short ops**: Short operations don't need cancellation
- **Not for sync**: Sync operations don't need cancellation
- **Not for simple apps**: Simple apps don't need cancellation

## Implementation Guidance

1. **Create token**: Create cancellation token
2. **Check token**: Check token periodically
3. **Handle cancellation**: Handle cancellation gracefully
4. **Cleanup resources**: Cleanup resources on cancellation
5. **Propagate token**: Propagate token through calls

## Verification

- [ ] Token created
- [ ] Token checked
- [ ] Cancellation handled
- [ ] Resources cleaned
- [ ] Token propagated

## Common Misuses

- **Not checking**: Not checking cancellation token
- **Not cleaning up**: Not cleaning up resources
- **Not propagating**: Not propagating token
- **Ignoring cancellation**: Ignoring cancellation requests

## Related Concepts

- [[APIs Distributed Systems/cancellation-pattern]] â€” Cancellation Pattern
- [[APIs Distributed Systems/timeout-pattern]] â€” Timeout Pattern
- [[APIs Distributed Systems/retry-pattern]] â€” Retry Pattern
- [[APIs Distributed Systems/async-programming]] â€” Async Programming

## Project Observations

The project uses Cancellation Pattern through:
- Cancellation token creation
- Periodic token checking
- Graceful cancellation handling
- Resource cleanup

## Sources

- [[Sources/martinfowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/microservices-patterns|Microservices Patterns â€” Christensen]]

**End of Cancellation Pattern Note**
