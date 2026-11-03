---
slug: liskov-substitution-principle
---

# Liskov Substitution Principle

> **Purpose:** Subtypes must be substitutable for their base types.
> **Last Updated:** 2026-11-03

## concept_id
`arch-liskov-substitution`

## title
Liskov Substitution Principle

## aliases
- LSP
- Liskov Substitution Principle
- Subtype Substitutability

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Class hierarchy design
- Interface design
- Polymorphism
- Extension design

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-solid-principles
- arch-open-closed
- arch-composition-over-inheritance
- arch-dependency-inversion
- arch-interface-segregation

## Definition

The Liskov Substitution Principle states that objects of a superclass shall be replaceable with objects of its subclasses without breaking the application. Subtypes must behave in ways that satisfy the contract of their base types.

## Problem Addressed

Without LSP:
- Subclasses break parent class contracts
- Polymorphism becomes unreliable
- Code becomes fragile
- Testing is difficult

## Scope and Boundaries

LSP applies to:
- Class hierarchy design
- Interface design
- Polymorphism
- Extension design

LSP does not apply to:
- Composition
- Delegation
- Aggregation
- Association

## When to Apply

- Designing class hierarchies
- Creating interfaces
- Implementing polymorphism
- Extending existing classes

## Tradeoffs and When to Avoid

- **Over-constraining**: Too many constraints limit flexibility
- **Not for composition**: LSP applies to inheritance, not composition
- **Not for simple cases**: Simple cases don't need LSP
- **Not for prototypes**: Prototypes don't need LSP

## Implementation Guidance

1. **Preserve preconditions**: Subclasses should not strengthen preconditions
2. **Preserve postconditions**: Subclasses should not weaken postconditions
3. **Preserve invariants**: Subclasses should maintain invariants
4. **No surprising exceptions**: Subclasses should not throw unexpected exceptions
5. **Test substitution**: Test that subclasses can replace parents

## Verification

- [ ] Subclasses can replace parents
- [ ] Preconditions are not strengthened
- [ ] Postconditions are not weakened
- [ ] Invariants are maintained
- [ ] No surprising exceptions

## Common Misuses

- **Breaking contracts**: Subclasses that break parent contracts
- **Strengthening preconditions**: Requiring more from subclasses
- **Weakening postconditions**: Guaranteeing less in subclasses
- **Surprising exceptions**: Throwing unexpected exceptions

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/open-closed-principle]] â€” Open/Closed Principle
- [[Architecture/composition-over-inheritance]] â€” Composition over Inheritance
- [[Architecture/dependency-inversion-principle]] â€” Dependency Inversion Principle

## Project Observations

The project uses TypeScript, which supports LSP through:
- Type system enforcement
- Interface contracts
- Strict typing
- Type guards

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Liskov Substitution Principle Note**
