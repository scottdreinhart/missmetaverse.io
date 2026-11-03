---
slug: retention-policies
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - maturity/deprecated
  - database
  - retention
  - data-modeling
  - compliance
  - --
# Retention Policies

## Definition

Retention Policies are **rules that define how long data should be kept before it is archived or deleted, based on regulatory, business, or technical requirements**.

> "Data retention is the management of data creation and storage and data deletion. Organizations develop data retention policies to satisfy legal and business requirements for storing records." â€” Wikipedia

## Problem Addressed

Without retention policies:
- **Compliance issues**: Regulations require keeping data for specific periods
- **Storage costs**: Old data consumes storage
- **Legal issues**: Data may need to be preserved for litigation
- **Privacy issues**: Data kept longer than necessary violates privacy

## Scope and Boundaries

- Retention Policies â‰  Soft Delete (retention policies define how long to keep data, soft delete is a technique)
- Retention Policies = Compliance (retention policies ensure compliance)
- Retention Policies is a **governance practice**, not a pattern

## When to Apply

- When building systems that handle regulated data
- when legal requirements dictate data retention
- when storage costs are a concern
- when privacy regulations apply

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Retention policies add complexity |
| **Storage** â€” Data must be stored for the retention period |
| **Time** â€” Implementing retention policies takes time |

## Common Misuses

- **Everything retained forever**: Don't retain data longer than necessary
- **Ignoring privacy**: Retention policies must comply with privacy regulations
- **Confusing with backup**: Retention policies are for operational data, backups are for recovery

## Related Concepts

- [Soft Delete](Data Databases/soft-delete.md) â€” Soft delete is a retention technique
- [Audit Trails](Data Databases/audit-trails.md) â€” Audit trails have retention requirements
- [Data Minimization](Security/data-minimization.md) â€” Data minimization limits retention

## Project Observations

- The project uses retention policies:
  - PostgreSQL supports retention policies
  - MySQL supports retention policies
  - The project's architecture patterns note covers database concepts
  - No evidence of retention policies in existing code (src/ is empty)
- File naming conventions support retention policies:
  - `*.policy.ts` â€” Policy files
  - `*.migration.ts` â€” Migration files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]




