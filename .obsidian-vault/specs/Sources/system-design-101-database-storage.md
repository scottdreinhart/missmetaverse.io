---
slug: system-design-101-database-storage
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/architecture
  - type/concept
  - domain/optimization
  - type/guide
  - domain/frontend
  - type/reference
  - domain/database
  - system-design
  - database
  - storage
  - reference
---

# Database & Storage — Complete ByteByteGo Guide Index

## Overview

Reference: [Guide: database-and-storage](https://bytebytego.com/guides/database-and-storage)

This category covers all database and storage guides from ByteByteGo System Design 101.

## Database Guides

### Database Selection & Types
| Guide | Slug | Description |
|-------|------|-------------|
| [Decide Which Database to Use](https://bytebytego.com/guides/how-do-you-decide-which-type-of-database-to-use) | `system-design-101-db-selection` | Database selection guide |
| [Choose the Right Database](https://bytebytego.com/guides/how-to-choose-the-right-database) | `system-design-101-right-database` | Database selection |
| [Types of Databases](https://bytebytego.com/guides/types-of-databases) | `system-design-101-db-types` | Relational, OLAP, NoSQL |
| [Top 6 Database Models](https://bytebytego.com/guides/top-6-database-models) | `system-design-101-db-models` | Database model types |
| [Understanding Database Types](https://bytebytego.com/guides/understanding-database-types) | `system-design-101-understanding-db` | Database types explained |
| [PostgreSQL Impact](https://bytebytego.com/guides/is-postgresql-eating-the-database-world) | `system-design-101-postgresql` | PostgreSQL versatility |
| [PostgreSQL Most Loved](https://bytebytego.com/guides/why-is-postgresql-voted-as-the-most-loved-database-by-stackoverflow-2022-developer-survey) | `system-design-101-postgres-loved` | PostgreSQL popularity |
| [Top 10 Open-Source Databases](https://bytebytego.com/guides/top-10-most-popular-open-source-databases) | `system-design-101-opensource-db` | Popular open-source DBs |
| [What is Serverless DB?](https://bytebytego.com/guides/what-is-serverless-db) | `system-design-101-serverless-db` | Serverless databases |

### SQL & Query Execution
| Guide | Slug | Description |
|-------|------|-------------|
| [How SQL Joins Work](https://bytebytego.com/guides/how-do-sql-joins-work) | `system-design-101-sql-joins` | SQL join types |
| [SQL Statement Execution](https://bytebytego.com/guides/how-is-a-sql-statement-executed-in-the-database) | `system-design-101-sql-execution` | SQL execution steps |
| [Visualizing a SQL Query](https://bytebytego.com/guides/visualizing-a-sql-query) | `system-design-101-sql-query` | SQL query order |
| [Best Way to Learn SQL](https://bytebytego.com/guides/what-is-the-best-way-to-learn-sql) | `system-design-101-learn-sql` | SQL learning guide |
| [Database Isolation Levels](https://bytebytego.com/guides/what-are-database-isolation-levels) | `system-design-101-isolation` | ACID isolation levels |
| [What does ACID mean?](https://bytebytego.com/guides/what-does-acid-mean) | `system-design-101-acid` | ACID properties |
| [Database Locks Explained](https://bytebytego.com/guides/what-are-the-differences-among-database-locks) | `system-design-101-db-locks` | Lock types |
| [Pessimistic vs Optimistic Locking](https://bytebytego.com/guides/pessimistic-vs-optimistic-locking) | `system-design-101-locking` | Locking strategies |
| [What is a Deadlock?](https://bytebytego.com/guides/what-is-a-deadlock) | `system-design-101-deadlock` | Deadlock prevention |

### Database Scaling & Sharding
| Guide | Slug | Description |
|-------|------|-------------|
| [Database Sharding Concepts](https://bytebytego.com/guides/key-concepts-to-understand-database-sharding) | `system-design-101-sharding` | Sharding strategies |
| [Top 4 Sharding Algorithms](https://bytebytego.com/guides/top-4-data-sharding-algorithms-explained) | `system-design-101-sharding-algorithms` | Sharding algorithms |
| [Vertical vs Horizontal Partitioning](https://bytebytego.com/guides/vertical-partitioning-vs-horizontal-partitioning) | `system-design-101-partitioning` | Partitioning strategies |
| [7 Strategies to Scale Database](https://bytebytego.com/guides/7-must-know-strategies-to-scale-your-database) | `system-design-101-scale-db` | Database scaling |
| [Read Replica Pattern](https://bytebytego.com/guides/read-replica-pattern) | `system-design-101-read-replica` | Read replicas |
| [Implement Read Replica Pattern](https://bytebytego.com/guides/how-to-implement-read-replica-pattern) | `system-design-101-implement-read-replica` | Read replica middleware |

### Storage Systems
| Guide | Slug | Description |
|-------|------|-------------|
| [Storage Systems Overview](https://bytebytego.com/guides/storage-systems-overview) | `system-design-101-storage` | Block, file, object storage |
| [Types of Memory](https://bytebytego.com/guides/types-of-memory) | `system-design-101-memory` | Memory hierarchy |
| [Types of Memory and Storage](https://bytebytego.com/guides/types-of-memory-and-storage) | `system-design-101-memory-storage` | RAM, ROM, HDD, SSD |
| [Upload Large File to S3](https://bytebytego.com/guides/how-to-upload-a-large-file-to-s3) | `system-design-101-s3-upload` | Multipart upload |
| [Upload to Amazon S3](https://bytebytego.com/guides/what-happens-when-you-upload-a-file-to-amazon-s3) | `system-design-101-s3-process` | S3 upload process |

### Message Queues & Streaming
| Guide | Slug | Description |
|-------|------|-------------|
| [Types of Message Queues](https://bytebytego.com/guides/types-of-message-queue) | `system-design-101-message-queue-types` | Queue types |
| [Kafka 101](https://bytebytego.com/guides/the-ultimate-kafka-101-you-cannot-miss) | `system-design-101-kafka-101` | Kafka fundamentals |
| [Top 5 Kafka Use Cases](https://bytebytego.com/guides/top-5-kafka-use-cases) | `system-design-101-kafka-use-cases` | Kafka applications |
| [Why is Kafka Fast?](https://bytebytego.com/guides/why-is-kafka-fast) | `system-design-101-kafka-fast` | Kafka performance |
| [Smooth Data Migration with Avro](https://bytebytego.com/guides/smooth-data-migration-with-avro) | `system-design-101-avro` | Schema evolution |
| [Time Series DB in 20 Lines](https://bytebytego.com/guides/time-series-db-tsdb-in-20-lines) | `system-design-101-tsdb` | Time series databases |

### Data Management
| Guide | Slug | Description |
|-------|------|-------------|
| [Top 6 Data Management Patterns](https://bytebytego.com/guides/how-do-we-manage-data) | `system-design-101-data-management` | Data patterns |

## Integration with Vault

Read these vault notes for deeper understanding:

- [[databases]] — Database selection guide
- [[sql-vs-nosql]] — SQL vs NoSQL comparison
- [[database-sharding]] — Sharding strategies
- [[database-replication]] — Replication patterns
- [data-modeling](D/data-modeling.md) — Data modeling patterns
- [[database-indexing]] — Indexing strategies
- [[cap-theorem]] — CAP theorem patterns
- [eventual-consistency](D/eventual-consistency.md) — Eventual consistency patterns

## Citation Format

All guides use the citation format:
- `system-design-101/database-and-storage/<guide-name>` — Citation slug for verification
- Original source: https://bytebytego.com/


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


