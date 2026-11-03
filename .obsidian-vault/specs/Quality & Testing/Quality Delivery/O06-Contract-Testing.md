---
slug: contract-testing
sources:
  - https://docs.pact.io/
  - https://www.npmjs.com/package/bravado
date: 2026-11-02
tags:
  - contract-testing
  - testing
  - api
  - pact
  - --
# Contract Testing

## Definition

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Contract Testing is **a testing approach that verifies the interaction between two components (typically consumer and provider) matches a shared contract**.

> "Contract testing verifies that interactions between two components match a shared contract, ensuring compatibility without integration testing." â€” Pact

## Problem Addressed

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

Without contract testing:
- **Breaking changes**: Changes break consumers without warning
- **Integration testing**: Integration tests are slow and fragile
- **Deployment**: Services must be deployed together
- **Compatibility**: Consumers and providers become incompatible

## Scope and Boundaries

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- Contract Testing â‰  Integration Testing (contract testing verifies contracts, integration testing verifies full system behavior)
- Contract Testing = Compatibility (contract testing ensures compatibility)
- Contract Testing is a **testing approach**, not a pattern

## When to Apply

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- When building microservices or APIs
- when services are deployed independently
- when breaking changes must be prevented
- when integration tests are too slow or fragile

## Tradeoffs and When to Avoid

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

| Cost | Description |
|------|-------------|
| **Complexity** â€” Contract testing adds tooling complexity |
| **Time** â€” Setting up contracts takes time |
| **Over-contracting**: Not every interaction needs a contract |

## Common Misuses

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- **Everything contracted**: Not every interaction needs a contract
- **Over-specifying**: Contracts should be flexible enough to allow evolution
- **Confusing with integration testing**: Contract testing verifies contracts, integration testing verifies full system behavior

## Related Concepts

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [Contract-First Development](Data-Driven Approaches/contract-first.md) â€” Contract-first development defines contracts before implementation
- [Automated Testing](Quality Delivery/automated-testing.md) â€” Automated testing supports contract testing
- [API Versioning](Architecture/api-versioning.md) â€” API versioning manages contract changes

## Project Observations

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- The project uses contract testing:
  - Pact supports contract testing
  - OpenAPI/Swagger supports contract testing
  - The project's architecture patterns note covers testing concepts
  - No evidence of contract testing in existing code (src/ is empty)
- File naming conventions support contract testing:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
o06-contract-testing

## title
O06-Contract-Testing

## aliases
- O06-Contract-Testing

## category
quality-assurance

## concept_type
quality-pattern

## research_status
verified

## project_adoption
recommended

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




