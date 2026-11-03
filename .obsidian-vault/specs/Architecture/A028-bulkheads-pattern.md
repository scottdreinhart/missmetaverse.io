---
slug: bulkheads-pattern
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/bulkhead
  - https://en.wikipedia.org/wiki/Bulkhead_pattern
date: 2026-11-02
tags:
  - bulkhead
  - resilience
  - distributed-systems
  - patterns
# Bulkheads Pattern

## Definition

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
The Bulkheads pattern is a **resilience pattern that isolates resources so that a failure in one component doesn't exhaust resources in another**.

> "The bulkhead pattern isolates elements of functionality so that a failure in one doesn't take down all functionality." â€” Microsoft Azure Architecture

## Problem Addressed

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without bulkheads:
- **Resource exhaustion**: One component uses all resources
- **Cascading failures**: One failure takes down everything
- **No isolation**: Components share resources indiscriminately
- **Difficult debugging**: Hard to identify the failing component

## Scope and Boundaries

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Bulkheads â‰  Circuit Breaker (bulkheads isolate resources, circuit breakers stop calls)
- Bulkheads â‰  Rate Limiting (bulkheads isolate, rate limiting controls)
- Bulkheads is a **resource isolation pattern**

## When to Apply

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When multiple components share resources
- When failures should be contained
- When different components have different SLAs
- When building microservices

## Tradeoffs and When to Avoid

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” More isolation layers |
| **Resource waste** â€” Reserved resources may be unused |
| **Configuration** â€” Need to tune isolation |

## Common Misuses

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Every component**: Not every component needs bulkheads
- **Over-isolation**: Too many isolated resources
- **Confusing with circuit breaker**: Bulkheads â‰  circuit breaker

## Related Concepts

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Circuit Breaker](Architecture/circuit-breaker-pattern.md) â€” Complementary pattern
- [Rate Limiting](Architecture/rate-limiting.md) â€” Complementary pattern
- [Resilience](Architecture/circuit-breaker-pattern.md) â€” Resilience patterns

## Project Observations

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- No bulkheads are implemented yet
- The project's architecture patterns note covers bulkheads
- Docker deployment note covers container isolation

## Sources

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



