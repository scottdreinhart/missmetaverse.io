---
slug: contract-testing
tags:
  - quality   - testing   - best-practices
---

# Contract Testing

> **Purpose:** Test API contracts between services.
> **Last Updated:** 2026-11-03

## concept_id
`testing-contract`

## title
Contract Testing

## aliases
- Contract Testing
- API Contract Testing
- Provider/Consumer Testing

## category
quality-delivery

## concept_type
testing-methodology

## research_status
verified

## project_adoption
declared

## applicability
- Microservices architecture
- API development
- Service integration
- Version management

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
- testing-property-based
- testing-risk-based-testing

## Definition

Contract Testing is a testing methodology where the contract (API interface) between services is tested to ensure compatibility between provider and consumer.

## Problem Addressed

Without contract testing:
- API changes break consumers
- Integration testing is slow
- Services are tightly coupled
- Version management is difficult

## Scope and Boundaries

Contract testing applies to:
- Microservices architecture
- API development
- Service integration
- Version management

Contract testing does not apply to:
- UI testing
- E2E testing
- Database testing
- Performance testing

## When to Apply

- Microservices architecture
- API development
- Service integration
- Version management

## Tradeoffs and When to Avoid

- **Complexity**: Contract testing adds complexity
- **Not for monoliths**: Monoliths don't need contract testing
- **Not for UI**: UI testing is different
- **Not for E2E**: E2E testing is different

## Implementation Guidance

1. **Define contract**: Define API contract
2. **Test provider**: Test provider against contract
3. **Test consumer**: Test consumer against contract
4. **Share contract**: Share contract between services
5. **Automate**: Automate contract testing

## Verification

- [ ] Contract is defined
- [ ] Provider is tested
- [ ] Consumer is tested
- [ ] Contract is shared
- [ ] Testing is automated

## Common Misuses

- **Not defining contract**: Not defining API contract
- **Not sharing**: Not sharing contract between services
- **Not automating**: Not automating contract testing
- **Over-engineering**: Not needed for monoliths

## Related Concepts

- [[Quality & Testing/test-driven-development]] â€” Test-Driven Development
- [[Quality & Testing/behavior-driven-development]] â€” Behavior-Driven Development
- [[Quality & Testing/mutation-testing]] â€” Mutation Testing
- [[Quality & Testing/property-based-testing]] â€” Property-Based Testing

## Project Observations

The project uses TypeScript, which supports contract testing through:
- OpenAPI/Swagger definitions
- Type definitions
- Mock servers
- Automated testing

## Sources

- [[Sources/martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Contract Testing Note**
