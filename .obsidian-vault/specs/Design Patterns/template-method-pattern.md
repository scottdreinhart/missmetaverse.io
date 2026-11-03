---
slug: template-method-pattern
tags:
  - core-concepts

  - design-patterns   - patterns   - reusable-solutions
---

# Template Method Pattern

> **Purpose:** Define algorithm skeleton with Template Method.
> **Last Updated:** 2026-11-03

## concept_id
`template-method-pattern`

## title
Template Method Pattern

## aliases
- Template Method
- Template Pattern
- Template Method Design Pattern
- Algorithm Skeleton

## category
design-patterns

## concept_type
behavioral-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Algorithm definition
- Step customization
- Code reuse
- Framework extension

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- template-method-pattern
- strategy-pattern
- hook-method
- inheritance-pattern

## Definition

Template Method Pattern defines the skeleton of an algorithm in a method, deferring some steps to subclasses, allowing subclasses to redefine certain steps without changing the algorithm structure.

## Problem Addressed

Without Template Method:
- Algorithms are duplicated
- Steps are inconsistent
- Code reuse is limited
- Framework extension is difficult

## Scope of Boundaries

Template Method applies to:
- Algorithm definition
- Step customization
- Code reuse
- Framework extension

Template Method does not apply to:
- Object creation
- Object structure
- Data access
- Event handling

## When to Apply

- Needing algorithm definition
- Wanting step customization
- Needing code reuse
- Extending frameworks

## Tradeoffs and When to Avoid

- **Inheritance coupling**: Template Method couples to inheritance
- **Not for simple apps**: Simple apps don't need Template Method
- **Not for flexibility**: Template Method limits flexibility
- **Not for performance**: Template Method may add overhead

## Implementation Guidance

1. **Define abstract class**: Define abstract class with template method
2. **Implement steps**: Implement abstract steps
3. **Provide defaults**: Provide default step implementations
4. **Override steps**: Override steps in subclasses
5. **Call template**: Call template method

## Verification

- [ ] Abstract class defined
- [ ] Steps implemented
- [ ] Defaults provided
- [ ] Steps overridden
- [ ] Template called

## Common Misuses

- **Overusing inheritance**: Overusing inheritance with Template Method
- **Not providing defaults**: Not providing default implementations
- **Not testing**: Not testing template behavior
- **Too many steps**: Having too many steps in template

## Related Concepts

- [[Design Patterns/template-method-pattern]] â€” Template Method Pattern
- [[Design Patterns/strategy-pattern]] â€” Strategy Pattern
- [[Design Patterns/hook-method]] â€” Hook Method
- [[Design Patterns/inheritance-pattern]] â€” Inheritance Pattern

## Project Observations

The project uses Template Method Pattern through:
- Algorithm skeleton definitions
- Customizable step implementations
- Code reuse through inheritance
- Framework extension points

## Sources

- [[Sources/goF-1994.md|GoF Design Patterns]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Template Method Pattern Note**
