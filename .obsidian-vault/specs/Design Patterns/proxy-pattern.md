---
slug: proxy-pattern
tags:
  - core-concepts

  - design-patterns   - patterns   - reusable-solutions
---

# Proxy Pattern

> **Purpose:** Control access with Proxy Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`proxy-pattern`

## title
Proxy Pattern

## aliases
- Proxy
- Surrogate Pattern
- Proxy Design Pattern
- Placeholder

## category
design-patterns

## concept_type
structural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Lazy initialization
- Access control
- Caching
- Logging

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- proxy-pattern
- decorator-pattern
- adapter-pattern
- facade-pattern

## Definition

Proxy Pattern provides a surrogate or placeholder for another object to control access to it, including lazy initialization, access control, caching, and logging.

## Problem Addressed

Without Proxy:
- Direct access is uncontrolled
- Initialization is eager
- Access cannot be restricted
- Caching is manual

## Scope of Boundaries

Proxy applies to:
- Lazy initialization
- Access control
- Caching
- Logging

Proxy does not apply to:
- Object creation
- Object behavior
- Data access
- Event handling

## When to Apply

- Needing controlled access
- Wanting lazy initialization
- Needing access control
- Wanting caching

## Tradeoffs and When to Avoid

- **Complexity**: Proxy adds complexity
- **Not for simple apps**: Simple apps don't need Proxy
- **Not for direct access**: Direct access doesn't need Proxy
- **Not for performance**: Proxy may add overhead

## Implementation Guidance

1. **Define interface**: Define subject interface
2. **Implement real subject**: Implement real subject
3. **Create proxy**: Create proxy class
4. **Control access**: Control access through proxy
5. **Add features**: Add caching/logging

## Verification

- [ ] Interface defined
- [ ] Real subject implemented
- [ ] Proxy created
- [ ] Access controlled
- [ ] Features added

## Common Misuses

- **Over-engineering**: Using Proxy for simple cases
- **Not testing**: Not testing proxy behavior
- **Not documenting**: Not documenting proxy purpose
- **Too many proxies**: Creating too many proxy classes

## Related Concepts

- [[Design Patterns/proxy-pattern]] â€” Proxy Pattern
- [[Design Patterns/decorator-pattern]] â€” Decorator Pattern
- [[Design Patterns/adapter-pattern]] â€” Adapter Pattern
- [[Design Patterns/facade-pattern]] â€” Facade Pattern

## Project Observations

The project uses Proxy Pattern through:
- Lazy initialization proxies
- Access control proxies
- Caching proxies
- Logging proxies

## Sources

- [[Sources/goF-1994.md|GoF Design Patterns]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Proxy Pattern Note**
