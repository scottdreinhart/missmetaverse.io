---
slug: adapter-pattern
tags:
  - core-concepts

  - design-patterns-patterns-reusable-solutions
---

# Adapter Pattern

> **Purpose:** Make incompatible interfaces work with Adapter Pattern.
> **Last Updated:** 2026-11-03

## concept_id
`adapter-pattern`

## title
Adapter Pattern

## aliases
- Adapter
- Wrapper Pattern
- Adapter Design Pattern
- Interface Adapter

## category
design-patterns

## concept_type
structural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Interface compatibility
- Third-party integration
- Legacy code wrapping
- Port/Port implementation

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- adapter-pattern
- port-pattern
- facade-pattern
- proxy-pattern

## Definition

Adapter Pattern converts the interface of a class into another interface clients expect, allowing incompatible interfaces to work together.

## Problem Addressed

Without Adapter:
- Interfaces are incompatible
- Third-party code is hard to use
- Legacy code is difficult to integrate
- Systems are rigid

## Scope of Boundaries

Adapter applies to:
- Interface compatibility
- Third-party integration
- Legacy code wrapping
- Port implementation

Adapter does not apply to:
- Object creation
- Object behavior
- Data access
- Event handling

## When to Apply

- Needing interface compatibility
- Integrating third-party code
- Wrapping legacy code
- Implementing ports

## Tradeoffs and When to Avoid

- **Complexity**: Adapter adds complexity
- **Not for simple apps**: Simple apps don't need Adapter
- **Not for compatible interfaces**: Compatible interfaces don't need Adapter
- **Not for performance**: Adapter may add overhead

## Implementation Guidance

1. **Define target interface**: Define target interface
2. **Adaptee exists**: Identify adaptee
3. **Create adapter**: Create adapter class
4. **Implement adaptation**: Implement adaptation logic
5. **Use adapter**: Use adapter instead of adaptee

## Verification

- [ ] Target interface defined
- [ ] Adaptee identified
- [ ] Adapter created
- [ ] Adaptation implemented
- [ ] Adapter used

## Common Misuses

- **Over-engineering**: Using Adapter for compatible interfaces
- **Not documenting**: Not documenting adaptation logic
- **Not testing**: Not testing adapted behavior
- **Too many adapters**: Creating too many adapter classes

## Related Concepts

- [[Design Patterns/adapter-pattern]] â€” Adapter Pattern
- [[Project File Conventions/port-file-convention]] â€” Port File Convention
- [[Design Patterns/facade-pattern]] â€” Facade Pattern
- [[Design Patterns/proxy-pattern]] â€” Proxy Pattern

## Project Observations

The project uses Adapter Pattern through:
- Port/Adapter architecture
- Third-party library integration
- Legacy system wrapping
- Interface compatibility layers

## Sources

- [[Sources/S005-gof-1994|GoF Design Patterns]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Adapter Pattern Note**
