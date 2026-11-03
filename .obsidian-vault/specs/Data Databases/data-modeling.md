---
slug: data-modeling
tags:
  - database   - data   - backend
---

# Data Modeling

> **Purpose:** Model data with Data Modeling.
> **Last Updated:** 2026-11-03

## concept_id
`data-modeling`

## title
Data Modeling

## aliases
- Data Modeling
- Entity Modeling
- Schema Design
- Data Architecture

## category
data-databases

## concept_type
data-concept

## research_status
verified

## project_adoption
declared

## applicability
- Entity modeling
- Schema design
- Data architecture
- Database design

## tags
- type/concept
- domain/data
- status/verified
- priority/high

## source_ids
- data-modeling-guide
- martinfowler-patterns

## related_concept_ids
- data-modeling
- entity-modeling
- schema-design
- data-architecture

## Definition

Data Modeling is the practice of defining data structures, relationships, and constraints to support application requirements and ensure data integrity.

## Problem Addressed

Without Data Modeling:
- Data is inconsistent
- Relationships are unclear
- Integrity is at risk
- Maintenance is difficult

## Scope of Boundaries

Data Modeling applies to:
- Entity modeling
- Schema design
- Data architecture
- Database design

Data Modeling does not apply to:
- Backend code
- Infrastructure
- Testing
- Deployment

## When to Apply

- Designing databases
- Needing data structure
- Wanting integrity
- Planning architecture

## Tradeoffs and When to Avoid

- **Complexity**: Data Modeling adds complexity
- **Not for simple apps**: Simple apps may not need Data Modeling
- **Not for internal**: Internal apps may not need Data Modeling
- **Not for all**: Not all apps need Data Modeling

## Implementation Guidance

1. **Define entities**: Define entity types
2. **Define relationships**: Define relationships
3. **Define constraints**: Define constraints
4. **Normalize**: Normalize data
5. **Test**: Test model

## Verification

- [ ] Entities defined
- [ ] Relationships defined
- [ ] Constraints defined
- [ ] Data normalized
- [ ] Model tested

## Common Misuses

- **Not defining**: Not defining entities
- **Not defining**: Not defining relationships
- **Not defining**: Not defining constraints
- **Not normalizing**: Not normalizing data

## Related Concepts

- [[Data Databases/data-modeling]] â€” Data Modeling
- [[Data Databases/data-modeling]] â€” Entity Modeling
- [[Data Databases/data-modeling]] â€” Schema Design
- [[Data Databases/data-modeling]] â€” Data Architecture

## Project Observations

The project uses Data Modeling through:
- Entity type definition
- Relationship definition
- Constraint definition
- Data normalization

## Sources

- [[Sources/data-modeling-guide|Data Modeling Guide]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Data Modeling Note**
