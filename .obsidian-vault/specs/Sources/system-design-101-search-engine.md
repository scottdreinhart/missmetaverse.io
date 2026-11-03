---
slug: system-design-101-search-engine
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - type/reference
  - system-design
  - search
  - information-retrieval
  - reference
---

# Search Engine Design

## Overview

Reference: [Guide: how-do-we-design-a-search-engine](https://bytebytego.com/guides/how-do-we-design-a-search-engine)

This guide covers search engine architecture, indexing, and ranking algorithms.

## Search Engine Components

### 1. Crawling
- Discover web pages
- Fetch content
- Update index

### 2. Indexing
- Parse content
- Build inverted index
- Store documents

### 3. Ranking
- Relevance scoring
- PageRank algorithm
- Machine learning ranking

### 4. Query Processing
- Tokenization
- Normalization
- Spell correction

## Inverted Index

### Data Structure

```
Term        | Document IDs
------------|-------------
"system"    | [1, 3, 5, 7]
"design"    | [1, 3, 5]
"search"    | [1, 7]
"engine"    | [1, 7]
```

### Implementation

```typescript
// search/inverted-index.ts
export class InvertedIndex {
  private index: Map<string, Set<number>> = new Map()
  private documents: Map<number, string> = new Map()

  addDocument(id: number, content: string): void {
    this.documents.set(id, content)

    const terms = this.tokenize(content)
    for (const term of terms) {
      if (!this.index.has(term)) {
        this.index.set(term, new Set())
      }
      this.index.get(term)!.add(id)
    }
  }

  search(query: string): number[] {
    const terms = this.tokenize(query)
    let results: Set<number> = new Set()

    for (const term of terms) {
      const docIds = this.index.get(term)
      if (docIds) {
        for (const id of docIds) {
          results.add(id)
        }
      }
    }

    return Array.from(results)
  }

  private tokenize(text: string): string[] {
    return text
      .toLowerCase()
      .split(/\s+/)
      .filter((t) => t.length > 0)
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[search-engine-design]] — Search engine patterns
- [[elasticsearch-patterns]] — Elasticsearch usage
- [[information-retrieval]] — Information retrieval patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [search-engine-guide](https://bytebytego.com/guides/how-do-we-design-a-search-engine)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


