---
slug: system-design-101-data-warehousing
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - data-warehouse
  - analytics
  - reference
---

# Data Warehousing and Analytics

## Overview

Reference: [[system-design-101/guides/how-do-we-design-a-data-warehouse]]

This guide covers data warehousing architecture, ETL pipelines, and analytics systems.

## Data Warehouse Architecture

### Components
1. **Data Sources** — Operational databases, logs, APIs
2. **ETL/ELT** — Extract, Transform, Load
3. **Data Lake** — Raw data storage
4. **Data Warehouse** — Structured, queryable data
5. **BI Tools** — Reporting and analytics

### Architecture Patterns

**Traditional ETL**:
- Extract from sources
- Transform in ETL pipeline
- Load to warehouse

**Modern ELT**:
- Extract from sources
- Load to data lake
- Transform in warehouse

## Implementation Example

### ETL Pipeline

```typescript
// etl/pipeline.ts
export class ETLPipeline {
  async extract(source: DataSource): Promise<DataRecord[]> {
    // Extract data from source
    return source.query('SELECT * FROM events WHERE created_at > ?', [this.lastRun])
  }

  async transform(records: DataRecord[]): Promise<AnalyzedRecord[]> {
    // Transform and enrich data
    return records.map((record) => ({
      ...record,
      processedAt: new Date(),
      category: this.categorize(record),
    }))
  }

  async load(records: AnalyzedRecord[]): Promise<void> {
    // Load to warehouse
    await this.warehouse.bulkInsert(records)
  }

  async run(): Promise<void> {
    const records = await this.extract(this.source)
    const transformed = await this.transform(records)
    await this.load(transformed)
    this.lastRun = new Date()
  }
}

interface DataSource {
  query(sql: string, params: any[]): Promise<DataRecord[]>
}

interface DataRecord {
  [key: string]: any
}

interface AnalyzedRecord extends DataRecord {
  processedAt: Date
  category: string
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[data-warehousing]] — Data warehouse patterns
- [[etl-patterns]] — ETL patterns
- [[analytics-systems]] — Analytics system design

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-a-data-warehouse|data-warehouse-guide]]
