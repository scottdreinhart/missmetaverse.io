---
slug: architecture-fitness-functions
tags:
  - core-concepts

  - quality   - testing   - best-practices
---

# Architecture Fitness Functions

> **Purpose:** Automatically verify architectural properties.
> **Last Updated:** 2026-11-03

## concept_id
`testing-architecture-fitness`

## title
Architecture Fitness Functions

## aliases
- AFF
- Architecture Fitness Functions
- Architectural Rules
- Code Quality Rules

## category
quality-delivery

## concept_type
testing-methodology

## research_status
verified

## project_adoption
declared

## applicability
- Architecture validation
- Code quality enforcement
- Team coordination
- Automated review

## tags
- type/methodology
- domain/testing
- domain/architecture
- status/verified
- priority/high

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-ci
- testing-observability
- arch-quality-gate
- testing-incremental-refactoring

## Definition

Architecture Fitness Functions are automated tests that verify architectural properties and rules. They ensure that the codebase conforms to architectural decisions and team conventions.

## Problem Addressed

Without fitness functions:
- Architecture drifts over time
- Rules are not enforced
- Team conventions are ignored
- Technical debt accumulates

## Scope and Boundaries

Fitness functions apply to:
- Architecture validation
- Code quality enforcement
- Team coordination
- Automated review

Fitness functions do not apply to:
- Runtime behavior
- Performance testing
- Security testing
- UI testing

## When to Apply

- Enforcing architecture rules
- Coordinating teams
- Preventing architecture drift
- Automated code review

## Tradeoffs and When to Avoid

- **Over-constraining**: Too many rules restrict flexibility
- **Performance**: Fitness functions can be slow
- **Not for all rules**: Not all rules need automation
- **Not for runtime**: Runtime behavior is different

## Implementation Guidance

1. **Define rules**: Define architectural rules
2. **Automate tests**: Create automated tests for rules
3. **Run in CI**: Run fitness functions in CI
4. **Enforce results**: Fail builds on rule violations
5. **Review regularly**: Review rules regularly

## Verification

- [ ] Rules are defined
- [ ] Tests are automated
- [ ] Tests run in CI
- [ ] Results are enforced
- [ ] Rules are reviewed

## Common Misuses

- **Over-constraining**: Too many rules
- **Not automating**: Not automating rules
- **Not running in CI**: Not running in CI
- **Not reviewing**: Not reviewing rules

## Related Concepts

- [[Quality & Testing/continuous-integration]] â€” Continuous Integration
- [[Quality & Testing/observability]] â€” Observability
- [[Quality & Testing/incremental-refactoring]] â€” Incremental Refactoring

## Project Observations

The project follows architecture fitness functions through:
- ESLint rules
- TypeScript strict mode
- Prettier formatting
- Quality gates

## Sources

- [[Sources/martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Architecture Fitness Functions Note**
