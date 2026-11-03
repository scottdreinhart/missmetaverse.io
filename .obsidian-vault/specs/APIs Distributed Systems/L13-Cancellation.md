---
slug: cancellation
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
  - https://microservices.io/patterns/reliability/cancellation.html
date: 2026-11-02
tags:
  - cancellation
  - distributed-systems
  - reliability
  - resilience
# Cancellation

## Definition

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Cancellation is **a distributed systems pattern that allows an operation to be aborted before it completes, freeing resources and preventing unnecessary work**.

> "Cancellation allows an operation to be aborted before it completes, freeing resources and preventing unnecessary work." â€” Microsoft

## Problem Addressed

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Without cancellation:
- **Wasted resources**: Operations continue after they're no longer needed
- **Resource exhaustion**: Resources are held indefinitely
- **Cascading failures**: One slow operation causes all operations to block
- **Poor UX**: Users wait for operations they've abandoned

## Scope and Boundaries

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- Cancellation â‰  Timeout (cancellation is explicit, timeout is automatic)
- Cancellation = Resource Management (cancellation frees resources)
- Cancellation is a **reliability pattern**, not a design pattern

## When to Apply

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- When building distributed systems
- when user-initiated operations need to be abortable
- when resource exhaustion is a concern
- when user experience is important

## Tradeoffs and When to Avoid

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Cancellation requires coordination |
| **Time** â€” Implementing cancellation takes time |
| **Partial work** â€” Operations may complete partially |

## Common Misuses

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- **Everything cancellable**: Not every operation needs to be cancellable
- **Ignoring cleanup**: Cancellation requires cleanup
- **Confusing with timeout**: Cancellation is explicit, timeout is automatic

## Related Concepts

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [Timeouts](APIs Distributed Systems/timeout-pattern.md) â€” Timeouts complement cancellation
- [Retry with Backoff](Architecture/retry-with-backoff.md) â€” Retry with backoff works with cancellation
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” Circuit breaker works with cancellation

## Project Observations

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- The project uses cancellation:
  - Node.js supports cancellation through AbortController
  - TypeScript can enforce cancellation through type system
  - The project's architecture patterns note covers distributed systems concepts
  - No evidence of cancellation in existing code (src/ is empty)
- File naming conventions support cancellation:
  - `*.service.ts` â€” Service files
  - `*.repository.ts` â€” Repository files

## Sources

## concept_id
l13-cancellation

## title
Cancellation

## aliases
- L13-Cancellation

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [[]
- [[Sources/react-docs-2026|react-docs-2026]]




