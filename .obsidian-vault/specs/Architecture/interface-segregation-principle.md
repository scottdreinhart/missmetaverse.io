---
slug: interface-segregation-principle
---

# Interface Segregation Principle

> **Purpose:** Many client-specific interfaces are better than one general-purpose interface.
> **Last Updated:** 2026-11-03

## concept_id
`arch-interface-segregation`

## title
Interface Segregation Principle

## aliases
- ISP
- Interface Segregation Principle
- Interface Segregation

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Interface design
- API design
- Service design
- Component design

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
- arch-dependency-inversion
- arch-low-coupling
- arch-high-cohesion
- arch-separation-of-concerns

## Definition

The Interface Segregation Principle states that many client-specific interfaces are better than one general-purpose interface. Clients should not be forced to depend on interfaces they do not use.

## Problem Addressed

Without ISP:
- Interfaces become too large and complex
- Clients are forced to implement unused methods
- Changes to one method affect all clients
- Testing is difficult

## Scope and Boundaries

ISP applies to:
- Interface design
- API design
- Service design
- Component design

ISP does not apply to:
- Class design (not interfaces)
- Implementation details
- Data structures
- Configuration

## When to Apply

- Designing interfaces
- Creating APIs
- Building services
- Refactoring large interfaces

## Tradeoffs and When to Avoid

- **Over-segregation**: Creating too many small interfaces
- **Navigation overhead**: Too many interfaces can be hard to navigate
- **Not for simple cases**: Simple cases don't need ISP
- **Not for prototypes**: Prototypes don't need ISP

## Implementation Guidance

1. **Identify client needs**: List what each client needs
2. **Create specific interfaces**: Create interfaces for each need
3. **Avoid fat interfaces**: Don't create large interfaces
4. **Use composition**: Combine interfaces as needed
5. **Review regularly**: Review interfaces during code reviews

## Verification

- [ ] Interfaces are small and focused
- [ ] Clients only depend on what they use
- [ ] No unused methods in interfaces
- [ ] Interfaces are reviewed regularly

## Common Misuses

- **Over-segregation**: Creating too many small interfaces
- **Fat interfaces**: Creating large interfaces
- **Not reviewing**: Not reviewing interfaces during code reviews
- **Ignoring clients**: Not considering client needs

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/dependency-inversion-principle]] â€” Dependency Inversion Principle
- [[Architecture/low-coupling]] â€” Low Coupling
- [[Architecture/high-cohesion]] â€” High Cohesion

## Project Observations

The project uses TypeScript, which supports ISP through:
- Small, focused interfaces
- Interface composition
- Type aliases
- Partial types

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Interface Segregation Principle Note**
