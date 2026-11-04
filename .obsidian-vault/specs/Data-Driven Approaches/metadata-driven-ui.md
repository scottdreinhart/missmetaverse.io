---
slug: metadata-driven-ui
tags:
  - core-concepts

  - data-driven-declarative-architecture
---

# Metadata-Driven UI

> **Purpose:** Build UI from metadata rather than hardcoded components.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-metadata-driven-ui`

## title
Metadata-Driven UI

## aliases
- Metadata-Driven UI
- Form-Driven UI
- Schema-Driven UI

## category
data-driven-approaches

## concept_type
development-approach

## research_status
verified

## project_adoption
declared

## applicability
- Form generation
- Dynamic UI
- Admin interfaces
- Low-code platforms

## tags
- type/approach
- domain/frontend
- status/verified
- priority/medium

## source_ids
- martinfowler-patterns
- goF-1994

## related_concept_ids
- data-driven-design
- data-driven-configuration-driven
- data-driven-schema-driven
- data-driven-contract-first
- data-driven-declarative

## Definition

Metadata-Driven UI is an approach where UI components are generated from metadata (schema, configuration) rather than being hardcoded. This enables dynamic, flexible interfaces.

## Problem Addressed

Without metadata-driven UI:
- UI is hardcoded
- Changes require code changes
- Flexibility is limited
- Maintenance is difficult

## Scope and Boundaries

Metadata-driven UI applies to:
- Form generation
- Dynamic UI
- Admin interfaces
- Low-code platforms

Metadata-driven UI does not apply to:
- Complex interactive UI
- Custom animations
- Performance-critical UI
- Brand-specific UI

## When to Apply

- Building forms
- Creating admin interfaces
- Developing low-code platforms
- Generating dynamic UI

## Tradeoffs and When to Avoid

- **Limited customization**: Metadata-driven UI may limit customization
- **Performance**: Metadata-driven UI can be slower
- **Not for complex UI**: Complex UI may not benefit
- **Not for performance**: Performance-critical UI should not be metadata-driven

## Implementation Guidance

1. **Define metadata**: Define UI metadata (schema, configuration)
2. **Generate UI**: Generate UI from metadata
3. **Validate input**: Validate user input
4. **Customize**: Allow customization where needed
5. **Test**: Test with different metadata

## Verification

- [ ] Metadata is defined
- [ ] UI is generated
- [ ] Input is validated
- [ ] Customization is allowed
- [ ] UI is tested

## Common Misuses

- **Not defining metadata**: Not defining UI metadata
- **Not generating**: Not generating UI from metadata
- **Not validating**: Not validating input
- **Not testing**: Not testing with different metadata

## Related Concepts

- [[Data-Driven Approaches/data-driven-design]] â€” Data-Driven Design
- [[Data-Driven Approaches/configuration-driven-development]] â€” Configuration-Driven Development
- [[Data-Driven Approaches/schema-driven-development]] â€” Schema-Driven Development
- [[Data-Driven Approaches/contract-first-development]] â€” Contract-First Development

## Project Observations

The project follows metadata-driven UI through:
- Form generation from schemas
- Dynamic component rendering
- Configuration-driven UI
- Low-code platforms

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Metadata-Driven UI Note**
