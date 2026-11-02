---
slug: event-file-convention
sources:
  - https://www.typescriptlang.org/
  - https://vitejs.dev/
date: 2026-11-02
tags:
  - file-conventions
  - react
  - typescript
  - project-structure
---

# *.event.ts

## Definition

`*.event.ts` is **a file naming convention for TypeScript files that contain domain event definitions**.

> "The *.event.ts convention identifies TypeScript files that contain domain event definitions." — TypeScript Docs

## Problem Addressed

Without `*.event.ts` convention:
- **Confusion**: Don't know which files contain event definitions
- **Mixing concerns**: Events are mixed with business logic
- **Testing**: Hard to test events separately
- **Maintenance**: Hard to maintain events

## Scope and Boundaries

- `*.event.ts` ≠ `*.logic.ts` (`*.event.ts` is for events, `*.logic.ts` is for business logic)
- `*.event.ts` = Events (`*.event.ts` is for event definitions)
- `*.event.ts` is a **file naming convention**, not a pattern

## When to Apply

- When building event-driven applications
- when domain events are used
- when testing is important
- when maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — File conventions add naming complexity |
| **Time** — Following conventions takes time |
| **Over-convention**: Not every event needs a separate file |

## Common Misuses

- **Everything an event**: Not every notification needs an event file
- **Mixing concerns**: Event files should not contain business logic
- **Confusing with logic**: Event files contain events, logic files contain business logic

## Related Concepts

- [Domain Event](DDD/domain-event.md) — Domain event pattern is the pattern behind `*.event.ts`
- [Event-Driven Architecture](Architecture/event-driven-architecture.md) — Event-driven architecture uses `*.event.ts`
- [Logic File Convention](Project File Conventions/logic-file-convention.md) — Logic file convention separates business logic

## Project Observations

- The project uses `*.event.ts`:
  - TypeScript supports `*.event.ts` through module system
  - React supports `*.event.ts` through event definitions
  - The project's architecture patterns note covers file conventions
  - No evidence of `*.event.ts` in existing code (src/ is empty)
- File naming conventions support `*.event.ts`:
  - `*.event.ts` — Event files
  - `*.logic.ts` — Logic files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

