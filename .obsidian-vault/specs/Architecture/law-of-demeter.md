---
slug: law-of-demeter
sources:
  - https://en.wikipedia.org/wiki/Law_of_Demeter
  - https://www.slideshare.net/bill_lacoste/law-of-demeter
date: 2026-11-02
tags:
  - demeter
  - principles
  - coupling
  - oop
---

# Law of Demeter (Principle of Least Knowledge)

## Definition

The Law of Demeter states that **a method should only call methods on**:
1. Itself
2. Its parameters
3. Objects it creates
4. Its direct component objects

> "Each unit should have only limited knowledge about other units: only units 'closely' related to the current unit." — Ian Holland (coined the term)

## Problem Addressed

Violating LoD leads to:
- **Tight coupling**: Changes in distant objects break the chain
- **Fragile code**: Method chains break when intermediate objects change
- **Hidden dependencies**: It's unclear what a method actually needs
- **Testing difficulty**: Hard to mock deep chains

## Scope and Boundaries

- LoD applies to **method calls**, not just object creation
- It's about **knowledge of structure**, not just coupling
- LoD ≠ Encapsulation (LoD is about what you call, encapsulation is about what you expose)

## When to Apply

- When writing methods that access nested objects
- When designing APIs
- When reviewing code for method chains
- When refactoring complex object interactions

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Telescoping methods** | Many small methods to traverse structure |
| **Data transfer objects** | Extra DTOs to pass data through layers |
| **Over-restriction** | Sometimes deep access is necessary |

## Common Misuses

- **Literal interpretation**: "Never call a method that returns an object" — too strict
- **Ignoring context**: LoD is a guideline, not an absolute rule
- **Confusing with encapsulation**: LoD is about calling, encapsulation is about exposing

## Related Concepts

- **Tell, Don't Ask** — Tell objects what to do, don't ask for their data
- **Low Coupling** — LoD reduces coupling
- **Information Hiding** — LoD respects information hiding

## Project Observations

- TypeScript's type system helps enforce LoD through explicit interfaces
- File naming conventions support LoD:
  - `*.port.ts` — Define what you need, not how to get it
  - `*.adapter.ts` — Hide how data is retrieved
- No evidence of LoD violations in existing code (src/ is empty)

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]
