---
slug: system-design-101-citation-guide
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/security
  - domain/architecture
  - type/concept
  - domain/optimization
  - type/guide
  - domain/frontend
  - domain/devops
  - domain/database
  - system-design
  - citations
  - verification
  - reference
---

# System Design 101 — Citation & Verification Guide

## Overview

This guide explains how to use **System Design 101** citation slugs to verify system design principles throughout the vault.

## Citation Slug Format

All System Design 101 sources follow this naming convention:

```
system-design-101/[category]/[filename]
system-design-101/guides/[filename]
```

### Category Slugs

| Category | Slug Pattern | Example |
|----------|--------------|---------|
| AI & Machine Learning | `system-design-101/categories/ai-machine-learning` | — |
| API & Web Development | `system-design-101/categories/api-web-development` | — |
| Caching & Performance | `system-design-101/categories/caching-performance` | — |
| Cloud & Distributed Systems | `system-design-101/categories/cloud-distributed-systems` | — |
| Computer Fundamentals | `system-design-101/categories/computer-fundamentals` | — |
| Database & Storage | `system-design-101/categories/database-and-storage` | — |
| DevOps & CI/CD | `system-design-101/categories/devops-cicd` | — |
| Security | `system-design-101/categories/security` | — |
| Software Architecture | `system-design-101/categories/software-architecture` | — |
| Software Development | `system-design-101/categories/software-development` | — |

### Guide Slugs

| Guide | Slug |
|-------|------|
| 8 Must-Know Scalability Strategies | `system-design-101/guides/8-must-know-scalability-strategies` |
| 9 Best Practices for Microservices | `system-design-101/guides/9-best-practices-for-building-microservices` |
| System Design Cheat Sheet | `system-design-101/guides/system-design-cheat-sheet` |
| Top 5 Caching Strategies | `system-design-101/guides/top-5-caching-strategies` |
| Netflix Architecture | `system-design-101/guides/netflixs-overall-architecture` |

## How to Verify Principles

### Step 1: Identify the Concept

When reading a vault note about a system design concept, identify the key principle:

```markdown
Example: Reading about database sharding in [[database-scaling]]
```

### Step 2: Find the Citation Slug

Look up the concept in the System Design 101 index:

```markdown
- [Guide: 7-must-know-strategies-to-scale-your-database](https://bytebytego.com/guides/7-must-know-strategies-to-scale-your-database)
- [Guide: a-crash-course-in-database-sharding](https://bytebytego.com/guides/a-crash-course-in-database-sharding)
- [Guide: key-concepts-to-understand-database-sharding](https://bytebytego.com/guides/key-concepts-to-understand-database-sharding)
```

### Step 3: Cross-Reference

Compare the vault note with the System Design 101 guide:

```markdown
Vault Note: [[database-scaling]]
System Design 101: [Guide: a-crash-course-in-database-sharding](https://bytebytego.com/guides/a-crash-course-in-database-sharding)

Check:
- Are the sharding strategies the same?
- Are the trade-offs consistent?
- Are the implementation patterns aligned?
```

### Step 4: Update Citation

Add the System Design 101 citation to the vault note:

```markdown
## Sources

- [[Sources/system-design-101|system-design-101]]
- [database-sharding-guide](https://bytebytego.com/guides/a-crash-course-in-database-sharding)
```

## Common Verification Scenarios

### Scenario 1: Verifying Caching Strategies

```markdown
Vault Note: [caching-strategies](D/caching-strategies.md)

System Design 101 References:
- [Guide: top-5-caching-strategies](https://bytebytego.com/guides/top-5-caching-strategies)
- [Guide: cache-systems-every-developer-should-know](https://bytebytego.com/guides/cache-systems-every-developer-should-know)
- [Guide: things-to-consider-when-using-cache](https://bytebytego.com/guides/things-to-consider-when-using-cache)

Verification Checklist:
- [ ] Are cache eviction strategies aligned?
- [ ] Are cache invalidation patterns consistent?
- [ ] Are performance trade-offs documented?
```

### Scenario 2: Verifying Microservice Patterns

```markdown
Vault Note: [[microservices-architecture]]

System Design 101 References:
- [Guide: 9-best-practices-for-building-microservices](https://bytebytego.com/guides/9-best-practices-for-building-microservices)
- [Guide: what-does-a-typical-microservice-architecture-look-like](https://bytebytego.com/guides/what-does-a-typical-microservice-architecture-look-like)
- [Guide: orchestration-vs-choreography-microservices](https://bytebytego.com/guides/orchestration-vs-choreography-microservices)

Verification Checklist:
- [ ] Are service boundaries defined consistently?
- [ ] Are communication patterns aligned?
- [ ] Are deployment strategies compatible?
```

### Scenario 3: Verifying Security Patterns

```markdown
Vault Note: [security-principles](D/security-principles.md)

System Design 101 References:
- [Guide: top-12-tips-for-api-security](https://bytebytego.com/guides/top-12-tips-for-api-security)
- [Guide: a-cheatsheet-to-build-secure-apis](https://bytebytego.com/guides/a-cheatsheet-to-build-secure-apis)
- [Guide: cybersecurity-101-in-one-picture](https://bytebytego.com/guides/cybersecurity-101-in-one-picture)

Verification Checklist:
- [ ] Are authentication methods aligned?
- [ ] Are encryption standards consistent?
- [ ] Are security best practices documented?
```

## Quick Reference Table

| Concept | Primary Citation | Secondary Citations |
|---------|-----------------|---------------------|
| **Scalability** | `system-design-101/guides/8-must-know-scalability-strategies` | `system-design-101/guides/7-must-know-strategies-to-scale-your-database` |
| **Caching** | `system-design-101/guides/top-5-caching-strategies` | `system-design-101/guides/cache-systems-every-developer-should-know` |
| **Microservices** | `system-design-101/guides/9-best-practices-for-building-microservices` | `system-design-101/guides/what-does-a-typical-microservice-architecture-look-like` |
| **Database** | `system-design-101/guides/7-must-know-strategies-to-scale-your-database` | `system-design-101/guides/a-crash-course-in-database-sharding` |
| **Security** | `system-design-101/guides/top-12-tips-for-api-security` | `system-design-101/guides/cybersecurity-101-in-one-picture` |
| **API Design** | `system-design-101/guides/8-tips-for-efficient-api-design` | `system-design-101/guides/a-cheat-sheet-for-api-designs` |
| **DevOps** | `system-design-101/guides/9-docker-best-practices-you-must-know` | `system-design-101/guides/cicd-pipeline-explained-in-simple-terms` |

## Adding Citations to Notes

### Template for Adding Citations

```markdown
## Sources

- [[Sources/system-design-101|system-design-101]]
- [[system-design-101/guides/[guide-name]|[alias]]]
```

### Example: Adding to Database Scaling Note

```markdown
## Sources

- [[Sources/system-design-101|system-design-101]]
- [database-scaling-guide](https://bytebytego.com/guides/7-must-know-strategies-to-scale-your-database)
- [sharding-guide](https://bytebytego.com/guides/a-crash-course-in-database-sharding)
```

## Benefits of Using Citations

1. **Verification** — Cross-reference principles with established sources
2. **Credibility** — Show that recommendations are based on industry best practices
3. **Learning** — Provide additional reading for deeper understanding
4. **Consistency** — Ensure vault notes align with industry standards
5. **Updates** — Track when source material changes

## Maintenance

### Regular Verification

1. **Monthly**: Check that citation slugs are valid
2. **Quarterly**: Verify that principles still align with sources
3. **Annually**: Review and update citation guide

### Updating Citations

If a System Design 101 guide changes:

1. Update the source note
2. Update vault notes that cite it
3. Document the changes in the note's history

## Related Vault Notes

- [[copilot-consumption-guide]] — How to use citations with Copilot
- [architecture-patterns](D/architecture-patterns.md) — Architectural pattern verification
- [security-principles](D/security-principles.md) — Security principle verification
- [[scalability-strategies]] — Scalability pattern verification

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[Sources/system-design-101|system-design-101]]
- GitHub: https://github.com/donnemartin/system-design-primer



