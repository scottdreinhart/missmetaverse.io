---
slug: information-hiding
tags:
  - architecture-design-patterns

  - architecture-design-patterns-core-concepts
---

# Information Hiding

> **Purpose:** Hide implementation details to reduce coupling.
> **Last Updated:** 2026-11-03

## concept_id
`arch-information-hiding`

## title
Information Hiding

## aliases
- Information Hiding
- Data Hiding
- Encapsulation (related)

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Module design
- API design
- Component design
- Library design

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
- arch-encapsulation
- arch-low-coupling
- arch-high-cohesion
- arch-separation-of-concerns
- arch-explicit-over-implicit

## Definition

Information Hiding is a design principle where implementation details are hidden from other modules, exposing only what is necessary for interaction.

## Problem Addressed

Without information hiding:
- Modules are tightly coupled
- Changes propagate through the system
- Reuse is difficult
- Maintenance is error-prone

## Scope and Boundaries

Information hiding applies to:
- Module design
- API design
- Component design
- Library design

Information hiding does not apply to:
- Documentation (should be explicit)
- Testing (needs visibility)
- Debugging (needs visibility)

## When to Apply

- Designing modules
- Creating APIs
- Building libraries
- Refactoring exposed details

## Tradeoffs and When to Avoid

- **Over-hiding**: Hiding too much makes code hard to use
- **Testing**: Testing needs visibility
- **Debugging**: Debugging needs visibility
- **Documentation**: Documentation should be explicit

## Implementation Guidance

1. **Hide details**: Hide implementation details
2. **Expose interfaces**: Expose only necessary interfaces
3. **Document interfaces**: Document what is exposed
4. **Enforce boundaries**: Prevent access to hidden details
5. **Review regularly**: Review what is exposed

## Verification

- [ ] Implementation details are hidden
- [ ] Only necessary interfaces are exposed
- [ ] Interfaces are documented
- [ ] Boundaries are enforced

## Common Misuses

- **Over-hiding**: Hiding too much makes code hard to use
- **Not documenting**: Not documenting what is exposed
- **Violating boundaries**: Allowing access to hidden details
- **Not reviewing**: Not reviewing what is exposed

## Related Concepts

- [[Architecture/encapsulation]] â€” Encapsulation
- [[Architecture/low-coupling]] â€” Low Coupling
- [[Architecture/high-cohesion]] â€” High Cohesion
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns

## Project Observations

The project follows information hiding through:
- Private fields in TypeScript
- Interface-based APIs
- Module scoping
- Export controls

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Information Hiding Note**
