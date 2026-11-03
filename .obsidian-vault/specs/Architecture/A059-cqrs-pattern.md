---
slug: a059-cqrs-pattern
sources:
  - https://martinfowler.com/bliki/CQRS.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs
date: 2026-11-02
tags:
  - cqrs
  - architecture
  - command
  - query
  - cqs
# CQRS (Command Query Responsibility Segregation)

## Definition

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
CQRS is an **architectural pattern that separates read and write operations into different models**. Commands modify state, queries read state.

> "CQRS separates the responsibility of reading data from the responsibility of writing data." â€” Martin Fowler

## Problem Addressed

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Combined read/write models lead to:
- **Complex queries**: Read models optimized for queries conflict with write models
- **Performance**: Different read/write patterns require different optimizations
- **Scalability**: Read and write scales differently

## Scope and Boundaries

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- CQS â‰  CQRS (CQS is method-level, CQRS is architectural)
- CQRS does **not** require separate databases
- CQRS does **not** require event sourcing

## When to Apply

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When read and write scales differently
- When read models need different optimization
- When complex queries conflict with write models
- When audit trails are required

## Tradeoffs and When to Avoid

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Two models to maintain |
| **Eventual consistency** â€” Reads may lag writes |
| **Boilerplate** â€” More code to maintain |

## Common Misuses

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Over-applying**: Using CQRS for simple CRUD
- **Confusing with CQS**: CQS is method-level, CQRS is architectural
- **Separate databases**: Not required by CQRS

## Related Concepts

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Command-Query Separation](Architecture/command-query-separation.md) â€” Method-level CQS
- [Event Sourcing](Architecture/data-modeling-principles.md) â€” Often used with CQRS
- [Clean Architecture](Architecture/clean-architecture.md) â€” CQRS fits in use cases layer

## Project Observations

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- No evidence of CQRS in existing code (src/ is empty)
- The project's architecture supports CQRS if needed later
- File naming conventions (`*.use-case.ts`, `*.data.ts`) support CQRS separation

## Sources

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]

---

## Copilot Instructions

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
### When to Read This Note
- Creating a new feature with read/write separation
- Performance issues with mixed read/write operations
- Code review: checking for CQRS violations
- Refactoring a monolithic service into read/write models

### What to Do With This Information
1. **Identify commands**: State-changing operations (create, update, delete, submit)
2. **Identify queries**: Read operations (get, list, search, filter)
3. **Create separate handlers**: Command handlers for writes, query handlers for reads
4. **Use separate DTOs**: Different data shapes for read models vs write models
5. **Validate**: Queries must never modify state

### Tools to Use
- **VS Code Extension**: ESLint with `@typescript-eslint` â€” for type safety
- **npm Package**: `@nestjs/cqrs` â€” for NestJS CQRS implementation (optional)
- **Terminal Command**: `pnpm add @nestjs/cqrs` â€” install CQRS package
- **Terminal Command**: `pnpm tsc --noEmit` â€” verify type safety

### Agents to Invoke
- **Architecture Validation Agent**: Run when creating new CQRS handlers
- **Code Review Agent**: Run when reviewing CQRS-related PRs

### Integration with Other Notes
- Read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for the overall architectural context
- Read [event-driven-architecture](https://en.wikipedia.org/wiki/Event-driven_architecture) for event publishing patterns
- Read [transactional-outbox](https://microservices.io/patterns/data/transactional-outbox.html) for reliable event publishing
- Read [api-versioning](https://restfulapi.net/versioning/) for versioning CQRS endpoints

### Common Pitfalls
- Don't use CQRS for simple CRUD (see [[Application Architecture/modular-monolith-architecture]])
- Don't forget eventual consistency (see [event-driven-architecture](https://en.wikipedia.org/wiki/Event-driven_architecture))
- Don't mix read/write logic in the same handler
- Don't create separate databases without a good reason (CQRS doesn't require it)



