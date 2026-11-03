---
slug: acid
tags:
  - core-concepts

  - database   - data   - backend
---

# ACID

> **Purpose:** Transaction properties ensuring database reliability.
> **Last Updated:** 2026-11-03

## concept_id
`data-acid`

## title
ACID

## aliases
- ACID
- ACID Properties
- Transaction Properties

## category
data-databases

## concept_type
property

## research_status
verified

## project_adoption
declared

## applicability
- Database transactions
- Financial systems
- Any system requiring data consistency

## tags
- type/property
- domain/database
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- evans-ddd-2003

## related_concept_ids
- data-atomicity
- data-consistency
- data-isolation
- data-durability
- data-optimistic-concurrency-control
- data-eventual-consistency

## Definition

ACID is an acronym for four properties that guarantee reliable processing of database transactions:

1. **Atomicity**: Transactions are all-or-nothing
2. **Consistency**: Transactions bring the database from one valid state to another
3. **Isolation**: Concurrent transactions don't interfere with each other
4. **Durability**: Committed transactions survive system failures

## Problem Addressed

Without ACID:
- Data can become corrupted
- Transactions can leave data in inconsistent states
- System failures can lose committed data
- Concurrent access can cause anomalies

## Scope and Boundaries

ACID applies to:
- Database transactions
- Financial systems
- Any system requiring strong consistency

ACID does not apply to:
- Distributed systems (eventual consistency)
- NoSQL databases (often sacrifice consistency)
- High-throughput systems (may prefer availability)

## When to Apply

- Financial transactions
- Inventory management
- Any operation where data integrity is critical
- Systems requiring strong consistency

## Tradeoffs and When to Avoid

- **Performance**: ACID transactions can be slow
- **Scalability**: Strong consistency limits horizontal scaling
- **Not for distributed systems**: Eventual consistency may be preferred
- **Not for high-throughput**: Availability may be more important

## Implementation Guidance

1. **Use transactions**: Wrap related operations in transactions
2. **Handle failures**: Implement rollback on errors
3. **Manage isolation**: Choose appropriate isolation level
4. **Ensure durability**: Use write-ahead logging
5. **Test concurrency**: Verify isolation under load

## Verification

- [ ] Transactions are atomic
- [ ] Data is consistent after transactions
- [ ] Concurrent transactions don't interfere
- [ ] Committed data survives failures

## Common Misuses

- **Confusing with ACID atomicity**: ACID atomicity is different from Atomic Design
- **Ignoring isolation levels**: Not choosing appropriate isolation
- **Overusing transactions**: Not all operations need transactions
- **Ignoring distributed systems**: ACID doesn't scale to distributed systems

## Related Concepts

- [[Data Databases/acid]] â€” Atomicity
- [[Data Databases/acid]] â€” Consistency
- [[Data Databases/acid]] â€” Isolation
- [[Data Databases/acid]] â€” Durability
- [[APIs Distributed Systems/eventual-consistency]] â€” Eventual Consistency

## Project Observations

The project uses TypeScript with database integrations, which supports ACID through:
- Database transaction APIs
- ORM transaction support
- Connection pooling
- Write-ahead logging

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/S002-evans-ddd-2003|Eric Evans â€” Domain-Driven Design: Tackling Complexity in the Heart of Software]]

**End of ACID Note**
