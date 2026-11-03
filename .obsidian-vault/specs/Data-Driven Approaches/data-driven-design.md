---
slug: data-driven-design
---

# Data-Driven Design

> **Purpose:** Let data drive application structure and behavior.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-design`

## title
Data-Driven Design

## aliases
- Data-Driven Design
- Data-Driven Development
- Data-First Design

## category
data-driven-approaches

## concept_type
design-approach

## research_status
verified

## project_adoption
declared

## applicability
- Configuration-driven systems
- Metadata-driven UI
- Schema-driven development
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
- data-driven-configuration-driven
- data-driven-schema-driven
- data-driven-metadata-driven-ui
- data-driven-contract-first
- data-driven-declarative

## Definition

Data-Driven Design is an approach where application structure and behavior are driven by data (configuration, schemas, metadata) rather than hardcoded logic.

## Problem Addressed

Without data-driven design:
- Logic is hardcoded
- Changes require code changes
- Flexibility is limited
- Maintenance is difficult

## Scope and Boundaries

Data-driven design applies to:
- Configuration-driven systems
- Metadata-driven UI
- Schema-driven development
- Contract-first development

Data-driven design does not apply to:
- Core business logic
- Performance-critical code
- Security-critical code
- Real-time systems

## When to Apply

- Building configuration-driven systems
- Creating metadata-driven UI
- Developing schema-driven applications
- Implementing contract-first APIs

## Tradeoffs and When to Avoid

- **Complexity**: Data-driven design adds complexity
- **Performance**: Data-driven design can be slower
- **Not for core logic**: Core business logic should not be data-driven
- **Not for performance**: Performance-critical code should not be data-driven

## Implementation Guidance

1. **Define data**: Define configuration, schemas, or metadata
2. **Drive behavior**: Let data drive application behavior
3. **Validate data**: Validate data before use
4. **Test data**: Test with different data
5. **Document data**: Document data structure and meaning

## Verification

- [ ] Data is defined
- [ ] Behavior is driven by data
- [ ] Data is validated
- [ ] Data is tested
- [ ] Data is documented

## Common Misuses

- **Over-data-driven**: Making everything data-driven
- **Not validating**: Not validating data
- **Not testing**: Not testing with different data
- **Not documenting**: Not documenting data

## Related Concepts

- [[Data-Driven Approaches/configuration-driven-development]] â€” Configuration-Driven Development
- [[Data-Driven Approaches/schema-driven-development]] â€” Schema-Driven Development
- [[Data-Driven Approaches/metadata-driven-ui]] â€” Metadata-Driven UI
- [[Data-Driven Approaches/contract-first-development]] â€” Contract-First Development

## Project Observations

The project follows data-driven design through:
- Configuration files
- Schema definitions
- Metadata-driven UI
- Contract-first APIs

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Data-Driven Design Note**
