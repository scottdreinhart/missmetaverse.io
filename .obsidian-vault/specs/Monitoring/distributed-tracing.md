---
slug: distributed-tracing
---

# Distributed Tracing

> **Purpose:** Trace requests with Distributed Tracing.
> **Last Updated:** 2026-11-03

## concept_id
`distributed-tracing`

## title
Distributed Tracing

## aliases
- Distributed Tracing
- Request Tracing
- Trace IDs
- Span IDs

## category
monitoring

## concept_type
monitoring-concept

## research_status
verified

## project_adoption
declared

## applicability
- Request tracing
- Trace IDs
- Span IDs
- Distributed systems

## tags
- type/concept
- domain/monitoring
- status/verified
- priority/high

## source_ids
- distributed-tracing-guide
- martinfowler-patterns

## related_concept_ids
- distributed-tracing
- request-tracing
- trace-ids
- span-ids

## Definition

Distributed Tracing is the practice of tracking requests across distributed systems using trace IDs and span IDs to understand request flow and identify performance bottlenecks.

## Problem Addressed

Without Distributed Tracing:
- Request flow is unknown
- Bottlenecks are hidden
- Debugging is difficult
- Performance is unclear

## Scope of Boundaries

Distributed Tracing applies to:
- Request tracing
- Trace IDs
- Span IDs
- Distributed systems

Distributed Tracing does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building distributed systems
- Needing request tracing
- Wanting performance visibility
- Debugging issues

## Tradeoffs and When to Avoid

- **Complexity**: Distributed Tracing adds complexity
- **Not for simple apps**: Simple apps may not need Distributed Tracing
- **Not for internal**: Internal apps may not need Distributed Tracing
- **Not for all**: Not all apps need Distributed Tracing

## Implementation Guidance

1. **Choose tracer**: Choose tracing library
2. **Add trace IDs**: Add trace IDs to requests
3. **Add span IDs**: Add span IDs to operations
4. **Aggregate**: Aggregate traces
5. **Test**: Test tracing

## Verification

- [ ] Tracer chosen
- [ ] Trace IDs added
- [ ] Span IDs added
- [ ] Traces aggregated
- [ ] Tracing tested

## Common Misuses

- **Not choosing**: Not choosing a tracer
- **Not adding**: Not adding trace IDs
- **Not aggregating**: Not aggregating traces
- **Not testing**: Not testing tracing

## Related Concepts

- [[Monitoring/distributed-tracing]] â€” Distributed Tracing
- [[Monitoring/request-tracing]] â€” Request Tracing
- [[Monitoring/trace-ids]] â€” Trace IDs
- [[Monitoring/span-ids]] â€” Span IDs

## Project Observations

The project uses Distributed Tracing through:
- Tracing library implementation
- Trace ID usage
- Span ID usage
- Trace aggregation

## Sources

- [[Sources/distributed-tracing-guide|Distributed Tracing Guide]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Distributed Tracing Note**
