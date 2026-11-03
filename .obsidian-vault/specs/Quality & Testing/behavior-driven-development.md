---
slug: behavior-driven-development
tags:
  - core-concepts

  - quality   - testing   - best-practices
---

# Behavior-Driven Development

> **Purpose:** Define behavior through examples to align teams.
> **Last Updated:** 2026-11-03

## concept_id
`testing-bdd`

## title
Behavior-Driven Development

## aliases
- BDD
- Behavior-Driven Development
- Example-Driven Development

## category
quality-delivery

## concept_type
development-methodology

## research_status
verified

## project_adoption
declared

## applicability
- Complex business workflows
- Cross-team collaboration
- Acceptance testing
- Requirements specification

## tags
- type/methodology
- domain/testing
- status/verified
- priority/high

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-tdd
- testing-risk-based-testing
- testing-contract-testing
- arch-incremental-refactoring

## Definition

Behavior-Driven Development (BDD) extends TDD by focusing on behavior rather than implementation. It uses examples and natural language to define expected behavior, aligning technical and business teams.

## Problem Addressed

Without BDD:
- Requirements are ambiguous
- Technical and business teams speak different languages
- Tests don't reflect business value
- Acceptance criteria are unclear

## Scope and Boundaries

BDD applies to:
- Business workflows
- Acceptance criteria
- Cross-team collaboration
- Requirements specification

BDD does not apply to:
- Low-level unit tests
- Infrastructure testing
- Visual testing

## When to Apply

- Complex business workflows
- Cross-team collaboration
- Acceptance testing
- Requirements specification

## Tradeoffs and When to Avoid

- **Learning curve**: Gherkin syntax requires practice
- **Not for unit tests**: BDD is for high-level behavior
- **Not for infrastructure**: BDD is for business behavior

## Implementation Guidance

1. **Write examples**: Define behavior through examples
2. **Use Gherkin**: Given/When/Then format
3. **Collaborate**: Work with business stakeholders
4. **Automate**: Turn examples into automated tests
5. **Keep examples simple**: One behavior per example

## Verification

- [ ] Behavior is defined through examples
- [ ] Examples use Given/When/Then format
- [ ] Business stakeholders collaborate
- [ ] Examples are automated
- [ ] Examples are simple and clear

## Common Misuses

- **Testing implementation**: Testing how, not what
- **Too many examples**: Over-specifying behavior
- **Ignoring automation**: Not turning examples into tests
- **Not collaborating**: Developers writing examples alone

## Related Concepts

- [[Quality & Testing/test-driven-development]] â€” Test-Driven Development
- [[Quality & Testing/risk-based-testing]] â€” Risk-Based Testing
- [[Quality & Testing/contract-testing]] â€” Contract Testing

## Project Observations

The project uses Playwright for E2E testing, which supports BDD through:
- Test scenarios
- Page objects
- Custom fixtures
- Reporting

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Behavior-Driven Development Note**
