---
slug: declarative-programming
---

# Declarative Programming

> **Purpose:** Describe what rather than how.
> **Last Updated:** 2026-11-03

## concept_id
`data-driven-declarative`

## title
Declarative Programming

## aliases
- Declarative Programming
- Declarative Style
- What not How

## category
data-driven-approaches

## concept_type
programming-paradigm

## research_status
verified

## project_adoption
declared

## applicability
- UI frameworks
- Query languages
- Configuration
- Build systems

## tags
- type/paradigm
- domain/architecture
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
- data-driven-contract-first

## Definition

Declarative Programming is a paradigm where you describe what you want to achieve rather than how to achieve it. The implementation details are handled by the framework or language.

## Problem Addressed

Without declarative programming:
- Code is imperative and verbose
- Implementation details are exposed
- Code is hard to maintain
- Frameworks cannot optimize

## Scope and Boundaries

Declarative programming applies to:
- UI frameworks (React, Vue, Angular)
- Query languages (SQL, GraphQL)
- Configuration (YAML, JSON)
- Build systems (Make, Gradle)

Declarative programming does not apply to:
- Algorithms
- Complex business logic
- Performance-critical code
- Real-time systems

## When to Apply

- Building UIs with frameworks
- Writing queries
- Configuring systems
- Defining build processes

## Tradeoffs and When to Avoid

- **Limited control**: Declarative programming limits control
- **Learning curve**: Declarative paradigms have learning curves
- **Not for algorithms**: Algorithms need imperative programming
- **Not for performance**: Performance-critical code may need imperative programming

## Implementation Guidance

1. **Describe what**: Describe what you want to achieve
2. **Let framework handle how**: Let framework handle implementation
3. **Use declarative syntax**: Use declarative syntax (XML, JSX, etc.)
4. **Avoid imperative**: Avoid imperative code where possible
5. **Test declarative code**: Test declarative code differently

## Verification

- [ ] What is described, not how
- [ ] Framework handles implementation
- [ ] Declarative syntax is used
- [ ] Imperative code is minimized
- [ ] Code is tested

## Common Misuses

- **Imperative code**: Using imperative code in declarative context
- **Not using framework**: Not leveraging framework capabilities
- **Not testing**: Not testing declarative code
- **Over-declarative**: Not all code should be declarative

## Related Concepts

- [[Data-Driven Approaches/data-driven-design]] â€” Data-Driven Design
- [[Data-Driven Approaches/configuration-driven-development]] â€” Configuration-Driven Development
- [[Data-Driven Approaches/schema-driven-development]] â€” Schema-Driven Development
- [[Data-Driven Approaches/metadata-driven-ui]] â€” Metadata-Driven UI

## Project Observations

The project follows declarative programming through:
- React JSX
- SQL queries
- Configuration files
- Build configuration

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Declarative Programming Note**
