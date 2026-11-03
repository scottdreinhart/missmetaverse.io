---
slug: system-design-101-consistency
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - consistency
  - distributed-systems
  - reference
---

# Consistency Models and Data Distribution

## Overview

Reference: [[system-design-101/guides/how-do-we-design-for-consistency-and-availability]]

This guide covers consistency models, CAP theorem, and data distribution strategies.

## Consistency Models

### 1. Strong Consistency
- All reads see latest write
- Linearizable
- Example: Relational databases with ACID

### 2. Eventual Consistency
- Eventually all reads see latest write
- No guarantees on timing
- Example: DNS, Cassandra

### 3. Strong + Eventual
- Strong for own writes, eventual for others
- Good user experience
- Example: DynamoDB, Couchbase

### 4. Read Your Writes
- Client always sees its own writes
- Session consistency
- Example: Most social networks

### 5. Monotonic Reads
- Never see older data after seeing newer
- Consistent reads per client
- Example: Many NoSQL databases

### 6. Monotonic Writes
- Writes complete in order
- No overwrites of newer data
- Example: Versioned systems

## CAP Theorem

| Property | Description | Trade-off |
|----------|-------------|-----------|
| **Consistency** | All nodes see same data | May sacrifice availability |
| **Availability** | Every request gets response | May sacrifice consistency |
| **Partition Tolerance** | System works despite network partitions | Must choose C or A |

### System Types
- **CP**: Consistency + Partition tolerance (HBase, ZooKeeper)
- **AP**: Availability + Partition tolerance (Cassandra, DynamoDB)
- **No system can be both C and A during partition**

## Implementation Example

### Eventual Consistency with Vector Clocks

```typescript
// consistency/vector-clock.ts
export class VectorClock {
  private clocks: Map<string, number> = new Map()

  increment(nodeId: string): void {
    const current = this.clocks.get(nodeId) || 0
    this.clocks.set(nodeId, current + 1)
  }

  merge(other: VectorClock): void {
    for (const [nodeId, time] of other.clocks) {
      const current = this.clocks.get(nodeId) || 0
      this.clocks.set(nodeId, Math.max(current, time))
    }
  }

  happensBefore(other: VectorClock): boolean {
    let atLeastOneLess = false
    for (const [nodeId, time] of other.clocks) {
      const current = this.clocks.get(nodeId) || 0
      if (current > time) return false
      if (current < time) atLeastOneLess = true
    }
    return atLeastOneLess
  }

  isConcurrent(other: VectorClock): boolean {
    return !this.happensBefore(other) && !other.happensBefore(this)
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[cap-theorem]] — CAP theorem patterns
- [[eventual-consistency]] — Eventual consistency patterns
- [[distributed-consensus]] — Distributed consensus algorithms
- [[two-phase-commit]] — Two-phase commit protocol

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-for-consistency-and-availability|consistency-guide]]
