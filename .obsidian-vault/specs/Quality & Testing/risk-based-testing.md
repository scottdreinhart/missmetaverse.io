---
slug: risk-based-testing
tags:
  - quality   - testing   - best-practices
---

# Risk-Based Testing

> **Purpose:** Prioritize testing based on risk.
> **Last Updated:** 2026-11-03

## concept_id
`testing-risk-based`

## title
Risk-Based Testing

## aliases
- RBT
- Risk-Based Testing
- Risk-Based Test Prioritization

## category
quality-delivery

## concept_type
testing-methodology

## research_status
verified

## project_adoption
declared

## applicability
- Test planning
- Resource allocation
- Release decisions
- Quality assurance

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
- testing-bdd
- testing-mutation
- testing-contract-testing
- testing-property-based

## Definition

Risk-Based Testing is a testing methodology where testing effort is prioritized based on the risk of failure. Higher risk areas receive more testing attention.

## Problem Addressed

Without risk-based testing:
- Testing effort is wasted on low-risk areas
- High-risk areas are under-tested
- Releases are risky
- Resources are misallocated

## Scope and Boundaries

Risk-based testing applies to:
- Test planning
- Resource allocation
- Release decisions
- Quality assurance

Risk-based testing does not apply to:
- Test execution
- Test design
- Test automation
- Test reporting

## When to Apply

- Planning test strategy
- Allocating testing resources
- Making release decisions
- Prioritizing test cases

## Tradeoffs and When to Avoid

- **Subjectivity**: Risk assessment is subjective
- **Not for all areas**: Not all areas need risk assessment
- **Not for compliance**: Compliance testing is different
- **Not for performance**: Performance testing is different

## Implementation Guidance

1. **Identify risks**: List all potential risks
2. **Assess risks**: Rate risks by likelihood and impact
3. **Prioritize testing**: Prioritize high-risk areas
4. **Allocate resources**: Allocate more resources to high-risk areas
5. **Review regularly**: Review risks regularly

## Verification

- [ ] Risks are identified
- [ ] Risks are assessed
- [ ] Testing is prioritized
- [ ] Resources are allocated
- [ ] Risks are reviewed

## Common Misuses

- **Ignoring risks**: Not identifying risks
- **Not assessing**: Not rating risks
- **Not prioritizing**: Not prioritizing testing
- **Not reviewing**: Not reviewing risks

## Related Concepts

- [[Quality & Testing/test-driven-development]] â€” Test-Driven Development
- [[Quality & Testing/behavior-driven-development]] â€” Behavior-Driven Development
- [[Quality & Testing/mutation-testing]] â€” Mutation Testing
- [[Quality & Testing/contract-testing]] â€” Contract Testing

## Project Observations

The project follows risk-based testing through:
- Test prioritization
- Resource allocation
- Release decisions
- Quality assurance

## Sources

- [[Sources/martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Risk-Based Testing Note**
