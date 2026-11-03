---
slug: architecture-decision-records
sources:
  - https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions
  - https://github.com/18F/adr-template
date: 2026-11-02
tags:
  - priority/medium
  - maturity/deprecated
  - type/concept
  - status/complete
  - type/reference
  - domain/architecture
  - adr
  - architecture
  - documentation
  - decision-making
---

# Architecture Decision Records (ADRs)

## Definition

ADRs are **concise documents that capture important architectural decisions, their context, consequences, and status**. They provide a lightweight way to document architectural decisions.

> "An ADR is a document that captures an important architectural decision made along with its context and consequences." — Michael Nygard

## Problem Addressed

Without ADRs:
- **Lost knowledge**: Decisions are forgotten or undocumented
- **Repeating mistakes**: Same mistakes are made in different projects
- **Onboarding friction**: New team members don't understand past decisions
- **Decision churn**: Decisions are revisited without understanding why

## Scope and Boundaries

- ADRs ≠ Technical documentation (ADRs capture decisions, not implementation)
- ADRs ≠ Standards (ADRs can document non-standard choices)
- ADRs are **living documents** — they can be superseded

## When to Apply

- When making significant architectural decisions
- When choosing between alternatives
- When deviating from standards
- When onboarding new team members

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Documentation overhead** — Writing ADRs takes time |
| **Maintenance** — ADRs need to be kept up to date |
| **Over-documentation** — Not every decision needs an ADR |

## Common Misuses

- **Every decision**: Not every decision needs an ADR
- **Implementation details**: ADRs should capture decisions, not code
- **Never updating**: ADRs should reflect current state

## Related Concepts

- [Project Architecture Mapping](Project-Architecture-Mapping.md) — Maps decisions to implementation
- [Research Status](Research-Status.md) — Tracks research decisions
- [Clean Architecture](Architecture/clean-architecture.md) — ADRs can document architecture choices

## Project Observations

- The project has an ADR system in place (`.obsidian-vault/decisions/` folder)
- No ADRs have been created yet (project is in initial setup)
- AGENTS.md contains settled decisions that could be formalized as ADRs

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]



