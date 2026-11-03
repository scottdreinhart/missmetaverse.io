---
slug: structural-design-patterns
---

# Structural Design Patterns

> **Purpose:** Compose objects and classes with Structural Patterns.
> **Last Updated:** 2026-11-03

---

## concept_id
`structural-design-patterns`

## title
Structural Design Patterns

## aliases
- Structural Patterns
- GoF Structural
- Object Composition Patterns

## category
design-patterns

## concept_type
pattern-category

## research_status
verified

## project_adoption
declared

## applicability
- Object composition
- Adapter patterns
- Decorator patterns
- Facade patterns

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
- decorator-pattern
- facade-pattern
- proxy-pattern

---

## Definition

Structural Design Patterns provide ways to create larger structures out of objects and classes, including Adapter, Decorator, Facade, and Proxy patterns.

## Problem Addressed

Without Structural Patterns:
- Object composition is difficult
- Interfaces are incompatible
- Functionality is duplicated
- Systems are rigid

## Scope of Boundaries

Structural Patterns apply to:
- Object composition
- Adapter patterns
- Decorator patterns
- Facade patterns

Structural Patterns do not apply to:
- Object creation
- Object behavior
- Architecture
- Data access

## When to Apply

- Needing object composition
- Wanting to adapt interfaces
- Needing to add functionality
- Wanting to simplify interfaces

## Tradeoffs and When to Avoid

- **Complexity**: Patterns add complexity
- **Not for simple apps**: Simple apps don't need patterns
- **Not for performance**: Patterns may add overhead
- **Not for clarity**: Patterns may obscure simple logic

## Implementation Guidance

1. **Identify composition**: Identify composition needs
2. **Choose pattern**: Choose appropriate pattern
3. **Implement structure**: Implement structural pattern
4. **Add interfaces**: Add interface abstractions
5. **Test composition**: Test object composition

## Verification

- [ ] Composition needs identified
- [ ] Pattern chosen
- [ ] Structure implemented
- [ ] Interfaces added
- [ ] Composition tested

## Common Misuses

- **Over-engineering**: Using patterns where not needed
- **Wrong pattern**: Using wrong pattern for situation
- **Not testing**: Not testing composition
- **Not documenting**: Not documenting structure

## Related Concepts

- [[Design Patterns/adapter-pattern]] — Adapter Pattern
- [[Design Patterns/decorator-pattern]] — Decorator Pattern
- [[Design Patterns/facade-pattern]] — Facade Pattern
- [[Design Patterns/proxy-pattern]] — Proxy Pattern

## Project Observations

The project uses Structural Patterns through:
- Adapter patterns for interface compatibility
- Decorator patterns for adding functionality
- Facade patterns for simplifying interfaces
- Proxy patterns for controlling access

## Sources

- [[Sources/gof-design-patterns|GoF Design Patterns]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Structural Design Patterns Note**
