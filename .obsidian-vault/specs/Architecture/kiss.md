---
slug: kiss
tags:
  - architecture   - design-patterns

  - architecture   - design-patterns   - core-concepts
---

# KISS

> **Purpose:** Keep it simple, stupid.
> **Last Updated:** 2026-11-03

## concept_id
`arch-kiss`

## title
KISS Principle

## aliases
- KISS
- Keep It Simple, Stupid
- Keep It Simple, Software

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Code design
- Architecture decisions
- UI design
- Configuration

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
- arch-yagni
- arch-explicit-over-implicit
- arch-dry
- arch-fail-fast

## Definition

The KISS principle states that most systems work best if they are kept simple rather than made complicated. Avoid unnecessary complexity in design and implementation.

## Problem Addressed

Without KISS:
- Systems become overly complex
- Maintenance becomes difficult
- Bugs are more likely
- Onboarding new developers is harder

## Scope and Boundaries

KISS applies to:
- Code design
- Architecture decisions
- UI design
- Configuration
- API design

KISS does not apply to:
- Security (security can be complex)
- Testing (testing can be complex)
- Domain modeling (domains can be complex)

## When to Apply

- Designing systems
- Making architecture decisions
- Writing code
- Creating UIs

## Tradeoffs and When to Avoid

- **Over-simplification**: Not solving the actual problem
- **Ignoring complexity**: Some problems are inherently complex
- **Not for security**: Security may require complexity
- **Not for domain**: Complex domains may need complex models

## Implementation Guidance

1. **Keep it simple**: Choose the simplest solution that works
2. **Avoid over-engineering**: Don't add complexity without need
3. **Prefer clarity**: Clear code is better than clever code
4. **Remove complexity**: Remove unnecessary complexity
5. **Stay focused**: Focus on solving the actual problem

## Verification

- [ ] Solution is as simple as possible
- [ ] No unnecessary complexity
- [ ] Code is clear and understandable
- [ ] Complexity is justified

## Common Misuses

- **Over-simplification**: Not solving the actual problem
- **Ignoring complexity**: Some problems are inherently complex
- **Clever code**: Writing clever code instead of clear code
- **Ignoring domain**: Complex domains may need complex models

## Related Concepts

- [[Architecture/solid-principles]] â€” SOLID Principles
- [[Architecture/yagni]] â€” YAGNI
- [[Architecture/explicit-over-implicit]] â€” Explicit over Implicit
- [[Architecture/dry]] â€” DRY Principle

## Project Observations

The project follows KISS through:
- Simple abstractions
- Clear code structure
- Minimal configuration
- Focused implementation

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of KISS Note**
