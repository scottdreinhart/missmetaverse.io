---
slug: a034-circuit-breaker-pattern
sources:
  - https://martinfowler.com/bliki/CircuitBreaker.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/circuit-breaker
date: 2026-11-02
tags:
  - maturity/deprecated
  - circuit-breaker
  - distributed-systems
  - resilience
  - patterns
# Circuit Breaker

## Definition

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
A Circuit Breaker is a **resilience pattern that temporarily stops calls to a failing service to prevent cascading failures**. It has three states: Closed (normal), Open (failing), and Half-Open (testing recovery).

> "The circuit breaker pattern is a design pattern used to detect failures and encapsulate logic to prevent a failure from happening repeatedly." â€” Martin Fowler

## Problem Addressed

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without circuit breakers:
- **Cascading failures**: One failure causes many
- **Resource exhaustion**: Wasting resources on failing calls
- **Slow responses**: Timeouts on failing services
- **User experience**: Users see errors from multiple failures

## Scope and Boundaries

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Circuit Breaker â‰  Retry (they are complementary patterns)
- Circuit Breaker â‰  Timeout (timeouts are faster, circuit breakers are longer-term)
- Circuit Breaker is a **resilience pattern**, not a fault prevention pattern

## When to Apply

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When calling external services
- When failures can cascade
- When recovery is possible
- When user experience matters

## Tradeoffs and When to Avoid

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

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
| **False positives** â€” Circuit may open on temporary issues |
| **Latency** â€” Half-open state adds latency |
| **Complexity** â€” More patterns to manage |

## Common Misuses

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Every call**: Not every call needs a circuit breaker
- **Wrong thresholds**: Too sensitive or too insensitive
- **Confusing with retry**: Circuit breaker â‰  retry

## Related Concepts

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Retry with Backoff](Architecture/architecture-patterns.md) â€” Complementary pattern
- [Bulkheads](Architecture/architecture-patterns.md) â€” Complementary pattern
- [Timeouts](Architecture/architecture-patterns.md) â€” Complementary pattern

## Project Observations

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- No evidence of circuit breaker in existing code (src/ is empty)
- The project's architecture patterns note covers circuit breakers
- Docker deployment note covers external service dependencies

## Sources

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




