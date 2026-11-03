---
slug: schema-driven-development
tags:
  - core-concepts

  - data-driven   - declarative   - architecture
---

# Schema-Driven Development

> **Purpose:** Let schemas drive code generation and validation.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-schema-driven`

## title
Schema-Driven Development

## aliases
- Schema-Driven Development
- Schema-First
- Schema-Based

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
- Data validation
- Code generation
- Contract-first development

## tags
- type/approach
- domain/architecture
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- data-driven-design
- data-driven-configuration-driven
- data-driven-metadata-driven-ui
- data-driven-contract-first
- data-driven-declarative

## Definition

Schema-Driven Development is an approach where schemas (JSON Schema, OpenAPI, Zod, etc.) drive code generation, validation, and documentation.

## Problem Addressed

Without schema-driven development:
- Validation is scattered
- Code generation is manual
- Documentation is incomplete
- Contracts are unclear

## Scope and Boundaries

Schema-driven development applies to:
- API development
- Data validation
- Code generation
- Contract-first development

Schema-driven development does not apply to:
- Core business logic
- UI implementation
- Infrastructure code
- Build tools

## When to Apply

- Developing APIs
- Validating data
- Generating code
- Implementing contract-first

## Tradeoffs and When to Avoid

- **Complexity**: Schema management adds complexity
- **Not for core logic**: Core business logic should not be schema-driven
- **Not for UI**: UI implementation is different
- **Not for infrastructure**: Infrastructure code is different

## Implementation Guidance

1. **Define schema**: Define schema for data
2. **Generate code**: Generate code from schema
3. **Validate data**: Validate data against schema
4. **Document**: Generate documentation from schema
5. **Maintain**: Keep schema and code in sync

## Verification

- [ ] Schema is defined
- [ ] Code is generated
- [ ] Data is validated
- [ ] Documentation is generated
- [ ] Schema and code are in sync

## Common Misuses

- **Not defining schema**: Not defining schemas
- **Not generating code**: Not generating code from schema
- **Not validating**: Not validating data
- **Not maintaining**: Not keeping schema and code in sync

## Related Concepts

- [[Data-Driven Approaches/data-driven-design]] â€” Data-Driven Design
- [[Data-Driven Approaches/configuration-driven-development]] â€” Configuration-Driven Development
- [[Data-Driven Approaches/metadata-driven-ui]] â€” Metadata-Driven UI
- [[Data-Driven Approaches/contract-first-development]] â€” Contract-First Development

## Project Observations

The project follows schema-driven development through:
- Zod schemas
- OpenAPI definitions
- Code generation
- Data validation

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Schema-Driven Development Note**
