# Circuit Breaker

> **Purpose:** Prevent cascading failures in distributed systems.
> **Last Updated:** 2026-11-03

---

## concept_id
`api-circuit-breaker`

## title
Circuit Breaker

## aliases
- Circuit Breaker
- Circuit Breaker Pattern
- Fallback Pattern

## category
apis-distributed-systems

## concept_type
resilience-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Distributed systems
- Microservices architecture
- External API calls
- Database connections

## tags
- type/pattern
- domain/api
- domain/distributed-systems
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- api-timeouts
- api-cancellation
- api-retry-with-backoff
- api-bulkheads
- api-saga

---

## Definition

The Circuit Breaker pattern prevents cascading failures by stopping calls to a failing service temporarily. It has three states: Closed (normal), Open (failing), and Half-Open (testing recovery).

## Problem Addressed

Without circuit breakers:
- Cascading failures spread through the system
- Resources are wasted on failing calls
- Users experience long timeouts
- System recovery is slower

## Scope and Boundaries

Circuit breakers apply to:
- External API calls
- Database connections
- Microservice calls
- Any unreliable dependency

Circuit breakers do not apply to:
- Internal function calls
- Synchronous operations
- Local caching

## When to Apply

- Calling external services
- Microservices architecture
- Unreliable dependencies
- Systems requiring high availability

## Tradeoffs and When to Avoid

- **False positives**: Temporary failures may trip the circuit
- **Latency**: Fallback responses may be stale
- **Not for internal calls**: Internal calls don't need circuit breakers
- **Complexity**: Adding circuit breakers increases complexity

## Implementation Guidance

1. **Define thresholds**: Set failure rate and timeout thresholds
2. **Implement states**: Closed, Open, Half-Open
3. **Provide fallbacks**: Define fallback behavior
4. **Monitor**: Track circuit state and failures
5. **Tune**: Adjust thresholds based on metrics

## Verification

- [ ] Circuit breaker has three states
- [ ] Failure thresholds are defined
- [ ] Fallback behavior is defined
- [ ] Circuit state is monitored
- [ ] Thresholds are tuned based on metrics

## Common Misuses

- **Too sensitive**: Circuit trips on temporary failures
- **No fallback**: No fallback behavior defined
- **Not monitoring**: Not tracking circuit state
- **Applying everywhere**: Not needed for internal calls

## Related Concepts

- [[APIs Distributed Systems/timeouts]] — Timeouts
- [[APIs Distributed Systems/cancellation]] — Cancellation
- [[APIs Distributed Systems/retry-with-backoff]] — Retry with Backoff and Jitter
- [[APIs Distributed Systems/bulkheads]] — Bulkheads

## Project Observations

The project uses TypeScript with HTTP clients, which supports circuit breakers through:
- Custom middleware
- Retry logic
- Fallback handlers
- Monitoring integration

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Circuit Breaker Note**
