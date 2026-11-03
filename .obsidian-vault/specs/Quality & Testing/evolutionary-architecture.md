---
slug: evolutionary-architecture
tags:
  - quality   - testing   - best-practices
---

# Evolutionary Architecture

> **Purpose:** Design architecture that evolves with changing requirements.
> **Last Updated:** 2026-11-03

## concept_id
`testing-evolutionary-architecture`

## title
Evolutionary Architecture

## aliases
- Evolutionary Architecture
- Evolvable Architecture
- Adaptive Architecture

## category
quality-delivery

## concept_type
architectural-practice

## research_status
verified

## project_adoption
declared

## applicability
- Long-lived systems
- Changing requirements
- Agile development
- Continuous delivery

## tags
- type/practice
- domain/architecture
- status/verified
- priority/high

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-incremental-refactoring
- testing-adr
- arch-quality-gate
- testing-continuous-integration

## Definition

Evolutionary Architecture is an approach where architecture is designed to evolve with changing requirements. It emphasizes adaptability, continuous improvement, and responsiveness to change.

## Problem Addressed

Without evolutionary architecture:
- Architecture becomes rigid
- Change is difficult
- Technical debt accumulates
- System becomes obsolete

## Scope and Boundaries

Evolutionary architecture applies to:
- Long-lived systems
- Changing requirements
- Agile development
- Continuous delivery

Evolutionary architecture does not apply to:
- One-off projects
- Fixed requirements
- Waterfall development
- Fixed scope projects

## When to Apply

- Building long-lived systems
- Requirements are changing
- Agile development is used
- Continuous delivery is practiced

## Tradeoffs and When to Avoid

- **Complexity**: Evolutionary architecture adds complexity
- **Not for one-off**: One-off projects don't need evolutionary architecture
- **Not for fixed requirements**: Fixed requirements don't need evolutionary architecture
- **Not for waterfall**: Waterfall development doesn't need evolutionary architecture

## Implementation Guidance

1. **Design for change**: Design architecture to accommodate change
2. **Continuous improvement**: Continuously improve architecture
3. **Fitness functions**: Use fitness functions to validate architecture
4. **Incremental change**: Make changes incrementally
5. **Feedback loops**: Use feedback loops to guide evolution

## Verification

- [ ] Architecture is designed for change
- [ ] Architecture is continuously improved
- [ ] Fitness functions are used
- [ ] Changes are incremental
- [ ] Feedback loops are used

## Common Misuses

- **Rigid architecture**: Architecture that doesn't accommodate change
- **Not improving**: Not continuously improving architecture
- **Not using fitness functions**: Not using fitness functions
- **Large changes**: Making large, risky changes

## Related Concepts

- [[Quality & Testing/incremental-refactoring]] â€” Incremental Refactoring
- [[Quality & Testing/architecture-decision-records]] â€” Architecture Decision Records
- [[Quality & Testing/continuous-integration]] â€” Continuous Integration

## Project Observations

The project follows evolutionary architecture through:
- Modular design
- Continuous improvement
- Fitness functions
- Incremental change

## Sources

- [[Sources/martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Evolutionary Architecture Note**
