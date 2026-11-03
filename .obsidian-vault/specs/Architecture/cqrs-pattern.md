---
slug: cqrs-pattern
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
---

# CQRS (Command Query Responsibility Segregation)

## Definition

CQRS is an **architectural pattern that separates read and write operations into different models**. Commands modify state, queries read state.

> "CQRS separates the responsibility of reading data from the responsibility of writing data." — Martin Fowler

## Problem Addressed

Combined read/write models lead to:
- **Complex queries**: Read models optimized for queries conflict with write models
- **Performance**: Different read/write patterns require different optimizations
- **Scalability**: Read and write scales differently

## Scope and Boundaries

- CQS ≠ CQRS (CQS is method-level, CQRS is architectural)
- CQRS does **not** require separate databases
- CQRS does **not** require event sourcing

## When to Apply

- When read and write scales differently
- When read models need different optimization
- When complex queries conflict with write models
- When audit trails are required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Two models to maintain |
| **Eventual consistency** — Reads may lag writes |
| **Boilerplate** — More code to maintain |

## Common Misuses

- **Over-applying**: Using CQRS for simple CRUD
- **Confusing with CQS**: CQS is method-level, CQRS is architectural
- **Separate databases**: Not required by CQRS

## Related Concepts

- [Command-Query Separation](Architecture/command-query-separation.md) — Method-level CQS
- [Event Sourcing](Architecture/data-modeling-principles.md) — Often used with CQRS
- [Clean Architecture](Architecture/clean-architecture.md) — CQRS fits in use cases layer

## Project Observations

- No evidence of CQRS in existing code (src/ is empty)
- The project's architecture supports CQRS if needed later
- File naming conventions (`*.use-case.ts`, `*.data.ts`) support CQRS separation

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Copilot Instructions

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
- **VS Code Extension**: ESLint with `@typescript-eslint` — for type safety
- **npm Package**: `@nestjs/cqrs` — for NestJS CQRS implementation (optional)
- **Terminal Command**: `pnpm add @nestjs/cqrs` — install CQRS package
- **Terminal Command**: `pnpm tsc --noEmit` — verify type safety

### Agents to Invoke
- **Architecture Validation Agent**: Run when creating new CQRS handlers
- **Code Review Agent**: Run when reviewing CQRS-related PRs

### Integration with Other Notes
- Read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for the overall architectural context
- Read [event-driven-architecture](https://en.wikipedia.org/wiki/Event-driven_architecture) for event publishing patterns
- Read [transactional-outbox](https://microservices.io/patterns/data/transactional-outbox.html) for reliable event publishing
- Read [api-versioning](https://restfulapi.net/versioning/) for versioning CQRS endpoints

### Common Pitfalls
- Don't use CQRS for simple CRUD (see [[modular-monolith]])
- Don't forget eventual consistency (see [event-driven-architecture](https://en.wikipedia.org/wiki/Event-driven_architecture))
- Don't mix read/write logic in the same handler
- Don't create separate databases without a good reason (CQRS doesn't require it)
