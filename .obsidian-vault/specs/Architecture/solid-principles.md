# SOLID Principles

> **Purpose:** Foundational OOP design principles for maintainable code.
> **Last Updated:** 2026-11-03

---

## concept_id
`arch-solid-principles`

## title
SOLID Principles

## aliases
- SOLID
- Five OOP Principles
- Robert C. Martin Principles

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Object-oriented programming
- TypeScript
- JavaScript
- Any OOP language

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
- arch-single-responsibility
- arch-open-closed
- arch-liskov-substitution
- arch-interface-segregation
- arch-dependency-inversion
- arch-dry
- arch-separation-of-concerns

---

## Definition

SOLID is an acronym for five design principles that, when combined, make it easier to create maintainable, extensible, and understandable object-oriented software systems.

1. **Single Responsibility Principle (SRP)** — A class should have one, and only one, reason to change.
2. **Open/Closed Principle (OCP)** — Software entities should be open for extension but closed for modification.
3. **Liskov Substitution Principle (LSP)** — Objects of a superclass shall be replaceable with objects of its subclasses without breaking the application.
4. **Interface Segregation Principle (ISP)** — Many client-specific interfaces are better than one general-purpose interface.
5. **Dependency Inversion Principle (DIP)** — Depend upon abstractions, not concretions.

## Problem Addressed

Without these principles, code tends to become:
- Tightly coupled and difficult to test
- Rigid and resistant to change
- Fragile — changes in one place break unrelated code
- Difficult to understand and maintain
- Prone to duplication

## Scope and Boundaries

SOLID applies to object-oriented design and class-level architecture. It does not directly address:
- Functional programming patterns
- Database schema design
- Infrastructure concerns
- UI layout or styling

## When to Apply

- During domain model design
- When designing interfaces and abstractions
- When refactoring tightly coupled code
- When introducing new features that require extension

## Tradeoffs and When to Avoid

- **Over-engineering risk**: Applying SOLID to simple scripts or one-off code can create unnecessary complexity
- **Abstraction creep**: Creating too many interfaces and abstractions can make code harder to follow
- **Performance overhead**: Indirection through abstractions can have minor performance costs

## Implementation Guidance

### Single Responsibility Principle
- Each class should have one job
- If a class has multiple responsibilities, extract them into separate classes
- Look for multiple reasons to change a class

### Open/Closed Principle
- Use abstraction to allow extension
- Prefer composition over inheritance for extension
- Use interfaces and abstract classes

### Liskov Substitution Principle
- Subclasses should not strengthen preconditions
- Subclasses should not weaken postconditions
- Subclasses should not throw unexpected exceptions

### Interface Segregation Principle
- Create small, focused interfaces
- Avoid fat interfaces that force implementation of unused methods
- Create client-specific interfaces

### Dependency Inversion Principle
- High-level modules should not depend on low-level modules
- Both should depend on abstractions
- Abstractions should not depend on details

## Verification

- [ ] Confirmed in project codebase
- [ ] Applied in domain models
- [ ] Used in interface design
- [ ] Enforced in code reviews

## Common Misuses

- **SRP confusion**: SRP is about responsibilities, not just "small classes"
- **OCP overuse**: Not everything needs to be extensible
- **LSP violation**: Subclasses that throw `NotImplementedException` violate LSP
- **ISP violation**: Large interfaces with many unused methods
- **DIP confusion**: DIP is about depending on abstractions, not just using dependency injection

## Related Concepts

- [[Architecture/dry]] — DRY principle
- [[Architecture/separation-of-concerns]] — Separation of Concerns
- [[Architecture/encapsulation]] — Encapsulation
- [[Architecture/dependency-injection]] — Dependency Injection
- [[Architecture/composition-over-inheritance]] — Composition over Inheritance

## Project Observations

The project uses TypeScript, which supports all SOLID principles through:
- Classes and interfaces for OOP
- Generics for abstraction
- Dependency injection patterns
- Strict typing for type safety

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of SOLID Principles Note**
