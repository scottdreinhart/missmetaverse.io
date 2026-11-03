# Enterprise Integration Patterns

> **Purpose:** Solve enterprise integration challenges with EIP.
> **Last Updated:** 2026-11-03

---

## concept_id
`enterprise-integration-patterns`

## title
Enterprise Integration Patterns

## aliases
- EIP
- Enterprise Integration
- Integration Patterns
- Hohpe-Woolf Patterns

## category
design-patterns

## concept_type
pattern-category

## research_status
verified

## project_adoption
declared

## applicability
- System integration
- Message patterns
- Channel patterns
- Routing patterns

## tags
- type/pattern
- domain/enterprise
- status/verified
- priority/high

## source_ids
- eip-hohpe-woolf
- martinfowler-patterns

## related_concept_ids
- message-channel
- message-router
- content-based-router
- message-queue

---

## Definition

Enterprise Integration Patterns provide solutions for enterprise integration challenges, including message channels, routers, transformers, and adapters.

## Problem Addressed

Without EIP:
- Integration is ad-hoc
- Messages are inconsistent
- Routing is complex
- Systems are tightly coupled

## Scope of Boundaries

EIP apply to:
- System integration
- Message patterns
- Channel patterns
- Routing patterns

EIP do not apply to:
- Object creation
- Object behavior
- UI design
- Database design

## When to Apply

- Integrating systems
- Needing message patterns
- Wanting flexible routing
- Needing system decoupling

## Tradeoffs and When to Avoid

- **Complexity**: EIP add complexity
- **Not for simple apps**: Simple apps don't need EIP
- **Not for monoliths**: Monoliths don't need EIP
- **Not for performance**: EIP may add overhead

## Implementation Guidance

1. **Identify integration**: Identify integration needs
2. **Choose patterns**: Choose appropriate patterns
3. **Implement channels**: Implement message channels
4. **Add routers**: Add message routers
5. **Test integration**: Test system integration

## Verification

- [ ] Integration needs identified
- [ ] Patterns chosen
- [ ] Channels implemented
- [ ] Routers added
- [ ] Integration tested

## Common Misuses

- **Over-engineering**: Using EIP where not needed
- **Wrong patterns**: Using wrong patterns for situation
- **Not testing**: Not testing integration
- **Not documenting**: Not documenting integration

## Related Concepts

- [[Design Patterns/message-channel]] — Message Channel
- [[Design Patterns/message-router]] — Message Router
- [[Design Patterns/content-based-router]] — Content-Based Router
- [[Design Patterns/message-queue]] — Message Queue

## Project Observations

The project uses EIP through:
- Message channels for system communication
- Message routers for routing logic
- Content-based routers for conditional routing
- Message queues for async processing

## Sources

- [[Sources/eip-hohpe-woolf|Enterprise Integration Patterns — Hohpe & Woolf]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Enterprise Integration Patterns Note**
