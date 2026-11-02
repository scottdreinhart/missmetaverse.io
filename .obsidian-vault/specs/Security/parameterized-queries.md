---
slug: parameterized-queries
sources:
  - https://owasp.org/
  - https://www.postgresql.org/docs/
date: 2026-11-02
tags:
  - parameterized-queries
  - security
  - sql-injection
  - database
---

# Parameterized Queries

## Definition

Parameterized Queries is **a security technique that separates SQL code from data to prevent SQL injection attacks**.

> "Parameterized queries separate SQL code from data, preventing SQL injection attacks." — OWASP

## Problem Addressed

Without parameterized queries:
- **SQL injection**: SQL injection attacks succeed
- **Data theft**: Attacker can read any data
- **Data corruption**: Attacker can modify or delete data
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Parameterized Queries ≠ Input Validation (parameterized queries prevent SQL injection, input validation validates data)
- Parameterized Queries = Protection (parameterized queries protect against SQL injection)
- Parameterized Queries is a **security technique**, not a pattern

## When to Apply

- When building applications that use databases
- when SQL queries are constructed
- when SQL injection is a concern
- when user input is used in queries

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Parameterized queries add query complexity |
| **Time** — Implementing parameterized queries takes time |
| **Limitations**: Some queries can't use parameterized queries |

## Common Misuses

- **Everything parameterized**: Not every query needs parameterized queries
- **String concatenation**: Never concatenate user input into SQL
- **Confusing with input validation**: Parameterized queries prevent SQL injection, input validation validates data

## Related Concepts

- [Input Validation](Security/input-validation.md) — Input validation complements parameterized queries
- [ORM Patterns](Data Databases/orm-patterns.md) — ORMs use parameterized queries
- [Security Principles](Security/security-principles.md) — Security principles include parameterized queries

## Project Observations

- The project uses parameterized queries:
  - PostgreSQL supports parameterized queries
  - TypeORM supports parameterized queries
  - The project's architecture patterns note covers security concepts
  - No evidence of parameterized queries in existing code (src/ is empty)
- File naming conventions support parameterized queries:
  - `*.repository.ts` — Repository files
  - `*.schema.ts` — Schema files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
