---
slug: yagni
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# YAGNI

> **Purpose:** Don't build anything until it's necessary.
> **Last Updated:** 2026-11-03

## concept_id
`arch-yagni`

## title
YAGNI

## aliases
- YAGNI
- You Aren't Gonna Need It
- Don't Build Hypothetical Features

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Feature planning
- Code refactoring
- Architecture decisions
- Product development

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
- arch-kiss
- arch-dry
- arch-explicit-over-implicit
- arch-fail-fast

## Definition

YAGNI (You Aren't Gonna Need It) is a principle from Extreme Programming that states you should not add functionality until it is deemed necessary. Avoid building hypothetical features or abstractions.

## Problem Addressed

Without YAGNI:
- Wasted effort on unused features
- Code complexity increases
- Maintenance burden grows
- Delivery slows down

## Scope and Boundaries

YAGNI applies to:
- Feature development
- Abstraction design
- Architecture decisions
- Code refactoring

YAGNI does not apply to:
- Security (always implement security)
- Testing (always write tests)
- Documentation (always document)
- Performance (always consider performance)

## When to Apply

- Planning features
- Designing abstractions
- Making architecture decisions
- Refactoring code

## Tradeoffs and When to Avoid

- **Under-engineering**: Not planning for future needs
- **Refactoring later**: May need to refactor when feature is needed
- **Not for security**: Security should never be deferred
- **Not for testing**: Tests should always be written

## Implementation Guidance

1. **Build what's needed**: Only implement current requirements
2. **Avoid abstractions**: Don't abstract until you see the need
3. **Defer decisions**: Postpone architecture decisions until necessary
4. **Review regularly**: Remove unused code and features
5. **Stay focused**: Focus on delivering value

## Verification

- [ ] Only necessary features are built
- [ ] Abstractions are based on real needs
- [ ] Unused code is removed
- [ ] Architecture decisions are deferred until needed

## Common Misuses

- **Under-engineering**: Not planning for reasonable future needs
- **Ignoring security**: Security should never be deferred
- **Ignoring testing**: Tests should always be written
- **Refactoring later**: May need to refactor when feature is needed

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/kiss]] â€” KISS Principle
- [[Architecture/dry]] â€” DRY Principle
- [[Architecture/explicit-over-implicit]] â€” Explicit over Implicit

## Project Observations

The project follows YAGNI through:
- Minimal feature set
- Simple abstractions
- Focused implementation
- Regular refactoring

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of YAGNI Note**
