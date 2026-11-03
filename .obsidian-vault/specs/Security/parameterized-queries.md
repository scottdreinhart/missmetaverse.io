---
slug: parameterized-queries
tags:
  - security   - authentication   - authorization

  - security   - authentication   - best-practices
---

# Parameterized Queries

> **Purpose:** Prevent SQL injection with Parameterized Queries.
> **Last Updated:** 2026-11-03

## concept_id
`parameterized-queries`

## title
Parameterized Queries

## aliases
- Parameterized Queries
- Prepared Statements
- SQL Parameters
- Query Parameters

## category
security

## concept_type
security-practice

## research_status
verified

## project_adoption
declared

## applicability
- SQL injection prevention
- Database security
- Query parameters
- Input sanitization

## tags
- type/practice
- domain/security
- status/verified
- priority/high

## source_ids
- owasp-top-10
- martinfowler-patterns

## related_concept_ids
- parameterized-queries
- prepared-statements
- sql-parameters
- query-parameters

## Definition

Parameterized Queries are a security practice where SQL queries use parameters instead of string concatenation to prevent SQL injection attacks.

## Problem Addressed

Without Parameterized Queries:
- SQL injection is possible
- Data is exposed
- Database is at risk
- Users are affected

## Scope of Boundaries

Parameterized Queries applies to:
- SQL injection prevention
- Database security
- Query parameters
- Input sanitization

Parameterized Queries does not apply to:
- Backend code
- Infrastructure
- Testing
- Deployment

## When to Apply

- Building apps with databases
- Needing SQL security
- Writing queries
- Handling user input

## Tradeoffs and When to Avoid

- **Complexity**: Parameterized Queries add complexity
- **Not for simple apps**: Simple apps may not need Parameterized Queries
- **Not for internal**: Internal apps may not need Parameterized Queries
- **Not for all**: Not all apps need Parameterized Queries

## Implementation Guidance

1. **Use parameters**: Use query parameters
2. **Avoid concatenation**: Avoid string concatenation
3. **Validate input**: Validate input
4. **Test**: Test queries
5. **Audit**: Audit queries

## Verification

- [ ] Parameters used
- [ ] Concatenation avoided
- [ ] Input validated
- [ ] Queries tested
- [ ] Queries audited

## Common Misuses

- **Not using**: Not using parameters
- **Not avoiding**: Not avoiding concatenation
- **Not validating**: Not validating input
- **Not testing**: Not testing queries

## Related Concepts

- [[Security/parameterized-queries]] â€” Parameterized Queries
- [[Security/parameterized-queries]] â€” Prepared Statements
- [[Security/parameterized-queries]] â€” SQL Parameters
- [[Security/parameterized-queries]] â€” Query Parameters

## Project Observations

The project uses Parameterized Queries through:
- Parameter usage
- Concatenation avoidance
- Input validation
- Query testing

## Sources

- [[Sources/owasp-top-10|OWASP Top 10]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Parameterized Queries Note**
