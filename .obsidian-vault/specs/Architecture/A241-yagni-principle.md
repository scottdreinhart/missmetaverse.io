---
slug: yagni-principle
sources:
  - https://en.wikipedia.org/wiki/YAGNI
  - https://www.extremeprogramming.org/rules/yagny.html
date: 2026-11-02
tags:
  - yagni
  - principles
  - scope
  - simplicity
  - xp
  - --
# YAGNI (You Aren't Going to Need It)

## Definition

YAGNI states that **you should not add functionality until it is deemed necessary**. Avoid building for hypothetical future requirements.

> "Always implement things when you actually need them, never when you just foresee that you need them." â€” Ron Jeffries (Extreme Programming)

## Problem Addressed

Building for hypothetical needs leads to:
- **Wasted effort**: Features that are never used
- **Increased complexity**: More code to maintain, test, and understand
- **Slower delivery**: Time spent on unused features
- **False confidence**: More code â‰  more value

## Scope and Boundaries

- YAGNI is about **features and functionality**, not about **technical foundations**
- Building a proper architecture is not YAGNI â€” it's good engineering
- YAGNI does **not** mean "don't plan" â€” it means "don't implement what you don't need yet"

## When to Apply

- When a feature is requested but not currently needed
- When adding "just in case" functionality
- When choosing between a simple solution and a flexible one

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Re-work** | Adding features later may require refactoring |
| **Missed opportunities** | Some features may be needed sooner than expected |
| **Technical debt** | Delaying necessary infrastructure can accumulate debt |

## Common Misuses

- **Over-literal interpretation**: Refusing to build any abstraction
- **Ignoring obvious needs**: Some features are needed in every project (logging, error handling)
- **Confusing with planning**: YAGNI â‰  no planning

## Related Concepts

- **KISS** â€” Simplicity over complexity
- **DRY** â€” Centralize knowledge, don't duplicate
- **Evolutionary Architecture** â€” Design for change, not predictability

## Project Observations

- AGENTS.md explicitly prohibits adding unnecessary dependencies ("Do not add a CSS-in-JS library")
- The project uses a minimal tech stack â€” consistent with YAGNI
- No evidence of "just in case" code in existing configuration

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]



