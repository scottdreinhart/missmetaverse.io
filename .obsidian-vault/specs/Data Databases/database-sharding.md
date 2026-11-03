---
slug: database-sharding
tags:
  - core-concepts

  - database   - data   - backend
---

# Database Sharding

> **Purpose:** Scale with Database Sharding.
> **Last Updated:** 2026-11-03

## concept_id
`database-sharding`

## title
Database Sharding

## aliases
- Sharding
- Database Partitioning
- Horizontal Partitioning
- Shard Architecture

## category
data-databases

## concept_type
database-concept

## research_status
verified

## project_adoption
declared

## applicability
- Horizontal scaling
- Data distribution
- Performance optimization
- Large datasets

## tags
- type/concept
- domain/database
- status/verified
- priority/high

## source_ids
- database-design-hoffer
- martinfowler-patterns

## related_concept_ids
- database-sharding
- horizontal-scaling
- data-distribution
- distributed-databases

## Definition

Database Sharding is a horizontal partitioning technique that distributes data across multiple database instances to improve scalability and performance.

## Problem Addressed

Without Sharding:
- Single database becomes bottleneck
- Performance degrades with data growth
- Scaling is vertical only
- Costs increase significantly

## Scope of Boundaries

Sharding applies to:
- Horizontal scaling
- Data distribution
- Performance optimization
- Large datasets

Sharding does not apply to:
- Simple applications
- Small datasets
- Read-only workloads
- Single-region deployments

## When to Apply

- Needing horizontal scaling
- Handling large datasets
- Optimizing performance
- Distributing data across regions

## Tradeoffs and When to Avoid

- **Complexity**: Sharding adds significant complexity
- **Not for simple apps**: Simple apps don't need sharding
- **Not for small datasets**: Small datasets don't need sharding
- **Not for joins**: Cross-shard joins are difficult

## Implementation Guidance

1. **Choose shard key**: Choose appropriate shard key
2. **Design schema**: Design schema for sharding
3. **Implement routing**: Implement shard routing
4. **Handle rebalancing**: Handle shard rebalancing
5. **Monitor shards**: Monitor shard performance

## Verification

- [ ] Shard key chosen
- [ ] Schema designed
- [ ] Routing implemented
- [ ] Rebalancing handled
- [ ] Shards monitored

## Common Misuses

- **Wrong shard key**: Choosing poor shard key
- **Not planning rebalancing**: Not planning for rebalancing
- **Not monitoring**: Not monitoring shard health
- **Over-sharding**: Creating too many shards

## Related Concepts

- [[Data Databases/database-sharding]] â€” Database Sharding
- [[Data Databases/database-sharding]] â€” Horizontal Scaling
- [[Data Databases/database-sharding]] â€” Data Distribution
- [[Data Databases/database-sharding]] â€” Distributed Databases

## Project Observations

The project uses Database Sharding through:
- Horizontal partitioning strategy
- Shard key selection
- Data distribution across instances
- Performance optimization at scale

## Sources

- [[Sources/database-design-hoffer|Database Design â€” Hoffer]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Database Sharding Note**
