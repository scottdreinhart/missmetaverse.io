---
slug: mutation-testing
---

# Mutation Testing

> **Purpose:** Test test quality by mutating code.
> **Last Updated:** 2026-11-03

## concept_id
`testing-mutation`

## title
Mutation Testing

## aliases
- Mutation Testing
- Mutant Testing
- Code Mutation

## category
quality-delivery

## concept_type
testing-methodology

## research_status
verified

## project_adoption
declared

## applicability
- Test quality assessment
- Critical code
- High-risk code
- Test improvement

## tags
- type/methodology
- domain/testing
- status/verified
- priority/medium

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-tdd
- testing-bdd
- testing-property-based
- testing-contract-testing
- testing-risk-based-testing

## Definition

Mutation Testing is a testing methodology where small changes (mutations) are made to code, and tests are run to see if they detect the changes. This measures test quality, not code coverage.

## Problem Addressed

Without mutation testing:
- Tests may not detect real bugs
- Coverage percentages are misleading
- Test quality is unknown
- Critical bugs may slip through

## Scope and Boundaries

Mutation testing applies to:
- Test quality assessment
- Critical code
- High-risk code
- Test improvement

Mutation testing does not apply to:
- Code quality assessment
- Performance testing
- Security testing
- UI testing

## When to Apply

- Assessing test quality
- Testing critical code
- Testing high-risk code
- Improving tests

## Tradeoffs and When to Avoid

- **Performance**: Mutation testing is slow
- **Not for all code**: Not all code needs mutation testing
- **Not for UI**: UI testing is different
- **Not for performance**: Performance testing is different

## Implementation Guidance

1. **Generate mutants**: Create small changes to code
2. **Run tests**: Run tests against mutants
3. **Kill mutants**: Tests should detect changes
4. **Analyze survivors**: Mutants that survive indicate weak tests
5. **Improve tests**: Improve tests to kill mutants

## Verification

- [ ] Mutants are generated
- [ ] Tests are run against mutants
- [ ] Mutants are killed
- [ ] Survivors are analyzed
- [ ] Tests are improved

## Common Misuses

- **Testing everything**: Not all code needs mutation testing
- **Ignoring survivors**: Not analyzing surviving mutants
- **Not improving**: Not improving tests
- **Performance**: Mutation testing is slow

## Related Concepts

- [[Quality & Testing/test-driven-development]] â€” Test-Driven Development
- [[Quality & Testing/behavior-driven-development]] â€” Behavior-Driven Development
- [[Quality & Testing/property-based-testing]] â€” Property-Based Testing
- [[Quality & Testing/contract-testing]] â€” Contract Testing

## Project Observations

The project uses Vitest, which supports mutation testing through:
- Mutation testing tools
- Test quality assessment
- Critical code testing
- Test improvement

## Sources

- [[Sources/martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Mutation Testing Note**
