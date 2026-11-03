---
slug: a104-fail-fast
sources:
  - https://en.wikipedia.org/wiki/Fail-fast
  - https://en.wikipedia.org/wiki/Fail-safe
date: 2026-11-02
tags:
  - fail-fast
  - principles
  - error-handling
  - debugging
# Fail Fast

## Definition

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Fail Fast is the principle that **systems should detect and report errors as early as possible**, rather than allowing invalid states to propagate.

> "Fail fast means that a program should immediately detect and report conditions that could lead to errors." â€” Software engineering principle

## Problem Addressed

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Not failing fast leads to:
- **Delayed errors**: Bugs manifest far from their source
- **Data corruption**: Invalid data propagates through the system
- **Debugging difficulty**: Hard to trace back to the root cause
- **Security risks**: Invalid states may create vulnerabilities

## Scope and Boundaries

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Fail Fast â‰  Crash immediately (graceful failure is still fail fast)
- Fail Fast â‰  No error handling (it's about early detection)
- Fail Fast is about **detection timing**, not **failure handling**

## When to Apply

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When validating input
- When checking preconditions
- When checking invariants
- When checking postconditions

## Tradeoffs and When to Avoid

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Performance** â€” Early checks add overhead |
| **Over-validation** â€” Checking too many things |
| **User experience** â€” Early errors may frustrate users |

## Common Misuses

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Fail everywhere**: Checking everything at every level
- **Fail silently**: Not failing fast but also not handling the error
- **Confusing with fail-safe**: Fail-fast detects early, fail-safe handles gracefully

## Related Concepts

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Design by Contract** â€” Fail fast is a practical application
- **Input Validation** â€” Fail fast at boundaries
- **Type Systems** â€” TypeScript catches errors at compile time (fail fast)

## Project Observations

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project follows fail fast:
  - TypeScript strict mode catches errors at compile time
  - Zod schemas validate at runtime (fail fast at boundaries)
  - Commitlint validates commit messages (fail fast in git workflow)
  - ESLint catches errors before runtime
- No evidence of fail-fast violations in existing configuration

## Sources

## concept_id
a104-fail-fast

## title
Fail Fast

## aliases
- A104-fail-fast

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]



