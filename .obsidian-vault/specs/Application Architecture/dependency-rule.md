# Dependency Rule

> **Purpose:** Enforce dependency direction in Clean Architecture.
> **Last Updated:** 2026-11-03

---

## concept_id
`dependency-rule`

## title
Dependency Rule

## aliases
- Dependency Rule Clean Architecture
- Source Code Dependencies
- Dependency Inversion
- Inner Outer Rules

## category
application-architecture

## concept_type
architectural-concept

## research_status
verified

## project_adoption
declared

## applicability
- Clean Architecture
- Dependency direction
- Framework independence
- Business rule protection

## tags
- type/concept
- domain/architecture
- status/verified
- priority/high

## source_ids
- clean-architecture-martin
- martinfowler-patterns

## related_concept_ids
- dependency-rule
- clean-architecture-layers
- dependency-inversion
- dependency-hygiene

---

## Definition

Dependency Rule states that source code dependencies can only point inward, toward higher-level policies, preventing outer layers from depending on inner layers.

## Problem Addressed

Without Dependency Rule:
- Frameworks control architecture
- Business rules depend on UI
- Testing is difficult
- Changes are risky

## Scope of Boundaries

Dependency Rule applies to:
- Clean Architecture
- Dependency direction
- Framework independence
- Business rule protection

Dependency Rule does not apply to:
- Runtime dependencies
- Database design
- Infrastructure
- Deployment

## When to Apply

- Implementing Clean Architecture
- Enforcing dependency direction
- Protecting business rules
- Achieving framework independence

## Tradeoffs and When to Avoid

- **Complexity**: Dependency Rule adds complexity
- **Not for simple apps**: Simple apps don't need Dependency Rule
- **Not for quick projects**: Quick projects don't need Dependency Rule
- **Not for small teams**: Small teams may not need Dependency Rule

## Implementation Guidance

1. **Define layers**: Define Clean Architecture layers
2. **Enforce direction**: Enforce inward dependencies
3. **Use interfaces**: Use interfaces in inner layers
4. **Implement outer**: Implement outer layers
5. **Verify dependencies**: Verify dependency direction

## Verification

- [ ] Layers defined
- [ ] Direction enforced
- [ ] Interfaces used
- [ ] Outer implemented
- [ ] Dependencies verified

## Common Misuses

- **Breaking rule**: Allowing outward dependencies
- **Not using interfaces**: Not using interfaces in inner layers
- **Not verifying**: Not verifying dependency direction
- **Tight coupling**: Creating tightly coupled layers

## Related Concepts

- [[Application Architecture/dependency-rule]] — Dependency Rule
- [[Application Architecture/clean-architecture-layers]] — Clean Architecture Layers
- [[Architecture/dependency-inversion]] — Dependency Inversion
- [[Coding Type Systems/dependency-hygiene]] — Dependency Hygiene

## Project Observations

The project enforces Dependency Rule through:
- Inward-only source dependencies
- Interface definitions in inner layers
- Outer layer implementations
- Dependency verification

## Sources

- [[Sources/clean-architecture-martin|Clean Architecture — Robert Martin]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Dependency Rule Note**
