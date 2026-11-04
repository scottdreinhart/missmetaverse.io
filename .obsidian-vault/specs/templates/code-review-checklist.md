---
slug: code-review-checklist
title: Code Review Checklist
description: Comprehensive checklist for systematic code reviews covering architecture, security, testing, performance, and maintainability.
author: Copilot
source: vault-research
canonical_url: 
tags:
  - templates-boilerplate

  - code-review
  - checklist
  - quality
  - architecture
  - security
  - testing
  - template
created_on: 2026-11-02
updated_on: 2026-11-02
verification_status: verified
claims_supported: 8
access_limitations: None
---

# Code Review Checklist

> **Purpose:** Systematic checklist for code reviews ensuring consistency, quality, and adherence to architectural patterns.
> **When to Use:** Before approving any pull request, before merging changes, during peer reviews.
> **Copilot Instructions:** When reviewing code, run through this checklist systematically. Flag any failed items. Do not approve PRs with critical failures.

---

## 1. Architecture & Design

## concept_id
code-review-checklist

## title
code-review-checklist

## aliases
- code-review-checklist

## category
template

## concept_type
template

## research_status
verified

## project_adoption
template

- [ ] **Follows Clean Architecture**: Domain logic is independent of frameworks, databases, and UI
- [ ] **Respects Bounded Contexts**: No cross-context dependencies without proper boundaries
- [ ] **Uses Appropriate Patterns**: CQRS for read/write separation, DDD for complex domains
- [ ] **Single Responsibility**: Each class/module has one reason to change
- [ ] **Dependency Inversion**: Dependencies point inward (inner layers don't know about outer layers)
- [ ] **No Tight Coupling**: Uses interfaces/abstractions, not concrete implementations
- [ ] **Respects ADRs**: No violations of accepted Architecture Decision Records
- [ ] **Modular Design**: Changes in one module don't require changes in unrelated modules

### Copilot Actions
```
1. Read [clean-architecture](D/clean-architecture.md) if unsure about dependency rules
2. Read [Application Architecture/domain-driven-design](D/Application Architecture/domain-driven-design.md) if checking bounded context boundaries
3. Read [solid-principles](D/solid-principles.md) if checking SRP/OCP/LSP
4. Check for existing ADRs in .obsidian-vault/specs/Architecture/
5. Flag any violations with specific line numbers and suggestions
```

---

## 2. TypeScript & Type Safety
