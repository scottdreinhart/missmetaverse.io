---
slug: contract-first-development
tags:
  - core-concepts

  - data-driven   - declarative   - architecture
---

# Contract-First Development

> **Purpose:** Define API contracts before implementation.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-contract-first`

## title
Contract-First Development

## aliases
- Contract-First Development
- API-First Development
- Contract-Driven

## category
data-driven-approaches

## concept_type
development-approach

## research_status
verified

## project_adoption
declared

## applicability
- API development
- Microservices architecture
- Team coordination
- Client-server development

## tags
- type/approach
- domain/api
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- data-driven-design
- data-driven-configuration-driven
- data-driven-schema-driven
- data-driven-metadata-driven-ui
- data-driven-declarative

## Definition

Contract-First Development is an approach where API contracts (OpenAPI, GraphQL schema, etc.) are defined before implementation. This enables parallel development and clear expectations.

## Problem Addressed

Without contract-first development:
- Contracts are unclear
- Teams work at cross-purposes
- Integration issues are discovered late
- Documentation is incomplete

## Scope and Boundaries

Contract-first development applies to:
- API development
- Microservices architecture
- Team coordination
- Client-server development

Contract-first development does not apply to:
- Internal APIs
- One-off APIs
- Rapid prototyping
- Exploration code

## When to Apply

- Developing public APIs
- Building microservices
- Coordinating teams
- Developing client-server applications

## Tradeoffs and When to Avoid

- **Slower start**: Defining contracts takes time
- **Not for internal APIs**: Internal APIs may not need contracts
- **Not for one-off**: One-off APIs don't need contracts
- **Not for prototyping**: Prototyping doesn't need contracts

## Implementation Guidance

1. **Define contract**: Define API contract (OpenAPI, GraphQL, etc.)
2. **Review contract**: Review contract with stakeholders
3. **Generate code**: Generate code from contract
4. **Implement**: Implement against contract
5. **Test**: Test against contract

## Verification

- [ ] Contract is defined
- [ ] Contract is reviewed
- [ ] Code is generated
- [ ] Implementation follows contract
- [ ] Testing is done against contract

## Common Misuses

- **Not defining contract**: Not defining API contracts
- **Not reviewing**: Not reviewing contracts with stakeholders
- **Not generating**: Not generating code from contract
- **Not testing**: Not testing against contract

## Related Concepts

- [[Data-Driven Approaches/data-driven-design]] â€” Data-Driven Design
- [[Data-Driven Approaches/configuration-driven-development]] â€” Configuration-Driven Development
- [[Data-Driven Approaches/schema-driven-development]] â€” Schema-Driven Development
- [[Data-Driven Approaches/metadata-driven-ui]] â€” Metadata-Driven UI

## Project Observations

The project follows contract-first development through:
- OpenAPI definitions
- Schema definitions
- Code generation
- Contract testing

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Contract-First Development Note**
