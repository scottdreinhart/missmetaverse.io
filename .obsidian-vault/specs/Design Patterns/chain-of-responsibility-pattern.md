---
slug: chain-of-responsibility-pattern
tags:
  - core-concepts

  - design-patterns-patterns-reusable-solutions
---

# Chain of Responsibility Pattern

> **Purpose:** Process requests through chain with Chain of Responsibility.
> **Last Updated:** 2026-11-03

## concept_id
`chain-of-responsibility-pattern`

## title
Chain of Responsibility Pattern

## aliases
- Chain of Responsibility
- CoR Pattern
- Chain Pattern
- Request Handler Chain

## category
design-patterns

## concept_type
behavioral-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Request processing
- Middleware pipelines
- Event handling
- Validation chains

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- chain-of-responsibility-pattern
- middleware-pattern
- pipeline-pattern
- handler-pattern

## Definition

Chain of Responsibility Pattern avoids coupling the sender of a request to its receiver by giving multiple objects a chance to handle the request, chaining them together.

## Problem Addressed

Without Chain of Responsibility:
- Request handling is coupled
- Processing is rigid
- Extensions require modification
- Systems are inflexible

## Scope of Boundaries

Chain of Responsibility applies to:
- Request processing
- Middleware pipelines
- Event handling
- Validation chains

Chain of Responsibility does not apply to:
- Object creation
- Object structure
- Data access
- Algorithm selection

## When to Apply

- Needing request processing
- Wanting middleware pipelines
- Needing event handling
- Building validation chains

## Tradeoffs and When to Avoid

- **Unclear handling**: Request may not be handled
- **Not for simple apps**: Simple apps don't need Chain of Responsibility
- **Not for performance**: Chain may add overhead
- **Not for single handler**: Single handler doesn't need chain

## Implementation Guidance

1. **Define handler**: Define handler interface
2. **Implement handlers**: Implement concrete handlers
3. **Chain handlers**: Chain handlers together
4. **Dispatch request**: Dispatch request through chain
5. **Handle or pass**: Handle request or pass to next

## Verification

- [ ] Handler interface defined
- [ ] Handlers implemented
- [ ] Handlers chained
- [ ] Request dispatched
- [ ] Request handled or passed

## Common Misuses

- **No handler**: Request not handled by anyone
- **Too many handlers**: Creating too many handlers
- **Not testing**: Not testing chain behavior
- **Circular chains**: Creating circular chains

## Related Concepts

- [[Design Patterns/chain-of-responsibility-pattern]] â€” Chain of Responsibility Pattern
- [[Design Patterns/chain-of-responsibility-pattern]] â€” Middleware Pattern
- [[Design Patterns/chain-of-responsibility-pattern]] â€” Pipeline Pattern
- [[Application Architecture/cqrs-pattern]] â€” Handler Pattern

## Project Observations

The project uses Chain of Responsibility Pattern through:
- Request processing chains
- Middleware pipelines
- Event handling chains
- Validation chains

## Sources

- [[Sources/S005-gof-1994|GoF Design Patterns]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Chain of Responsibility Pattern Note**
