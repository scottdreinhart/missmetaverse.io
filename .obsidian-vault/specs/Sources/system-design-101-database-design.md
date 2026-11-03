---
slug: system-design-101-database-design
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - database
  - storage
  - reference
---

# How to Design a Database

## Overview

Reference: [[system-design-101/guides/how-do-we-design-a-database]]

This guide covers database design patterns, SQL vs NoSQL, and data modeling strategies.

## Database Types

### 1. Relational (SQL)
- Structured data with schemas
- ACID transactions
- Example: PostgreSQL, MySQL, Oracle

### 2. NoSQL - Document
- Flexible schema, JSON-like documents
- Example: MongoDB, Couchbase

### 3. NoSQL - Key-Value
- Simple key-value pairs
- Example: Redis, DynamoDB

### 4. NoSQL - Column-Family
- Column-oriented storage
- Example: Cassandra, HBase

### 5. NoSQL - Graph
- Node and relationship data
- Example: Neo4j, Amazon Neptune

### 6. Time-Series
- Time-stamped data
- Example: InfluxDB, TimescaleDB

### 7. Search Engines
- Full-text search
- Example: Elasticsearch, Solr

## SQL vs NoSQL Comparison

| Feature | SQL | NoSQL |
|---------|-----|-------|
| **Schema** | Fixed, rigid | Flexible, dynamic |
| **Transactions** | ACID | BASE (eventual consistency) |
| **Scaling** | Vertical | Horizontal |
| **Query Language** | SQL | API-specific |
| **Joins** | Supported | Limited or none |
| **Use Case** | Complex queries, transactions | High scale, flexible schema |
| **Examples** | PostgreSQL, MySQL | MongoDB, Cassandra, Redis |

## Data Modeling Patterns

### 1. Normalization
- Reduce data redundancy
- Improve data integrity
- Example: 3NF for e-commerce

### 2. Denormalization
- Improve read performance
- Accept data redundancy
- Example: Read-optimized analytics

### 3. Sharding
- Partition data across servers
- Horizontal scaling
- Example: Shard by user ID

### 4. Replication
- Copy data to multiple nodes
- High availability
- Example: Primary/Secondary

### 5. Indexing
- Speed up queries
- Trade-off with write performance
- Example: B-tree, Hash indexes

## Implementation Example

### SQL Schema Design

```sql
-- users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT NOW()
);

-- order_items table
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER,
    quantity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Indexes for performance
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
```

### NoSQL Document Design (MongoDB)

```javascript
// Embedded document pattern
{
  _id: ObjectId("..."),
  email: "user@example.com",
  name: "John Doe",
  orders: [
    {
      _id: ObjectId("..."),
      total: 99.99,
      status: "completed",
      items: [
        { productId: "prod1", quantity: 2, price: 49.99 }
      ],
      createdAt: ISODate("2024-01-01")
    }
  ]
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[databases]] — Database selection guide
- [[sql-vs-nosql]] — SQL vs NoSQL comparison
- [[database-sharding]] — Sharding strategies
- [[database-replication]] — Replication patterns
- [[data-modeling]] — Data modeling patterns
- [[database-indexing]] — Indexing strategies

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-a-database|database-design-guide]]
