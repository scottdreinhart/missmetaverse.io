---
slug: kiss-principle
sources:
  - https://en.wikipedia.org/wiki/KISS_principle
  - https://www.merriam-webster.com/dictionary/KISS
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - domain/frontend
  - type/guide
  - type/concept
  - status/complete
  - type/reference
  - domain/architecture
  - kiss
  - principles
  - simplicity
  - design
---

# KISS (Keep It Simple, Stupid)

## Definition

The KISS principle states that **systems work best when they are simple rather than complex**. Simplicity should be a key goal in design, and unnecessary complexity should be avoided.

> "Most systems work best if they are kept simple rather than made complicated." — John G. D. Ward (U.S. Navy, 1960)

## Problem Addressed

Complexity leads to:
- **Unpredictability**: More paths to failure
- **Maintenance burden**: Harder to understand and modify
- **Onboarding friction**: New team members struggle to understand
- **Hidden bugs**: Complex code hides edge cases

## Scope and Boundaries

- KISS does **not** mean "use the simplest possible solution regardless of requirements"
- KISS does **not** mean "avoid abstractions" — well-designed abstractions reduce complexity
- KISS is about **avoiding unnecessary complexity**, not avoiding necessary complexity

## When to Apply

- When choosing between multiple valid approaches
- When reviewing code for complexity
- When designing APIs or interfaces
- When evaluating third-party libraries

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Under-engineering** | Oversimplifying can lead to technical debt |
| **False simplicity** | Hiding complexity behind a poor abstraction |
| **Premature simplification** | Not building for known future requirements |

## Common Misuses

- **Over-simplification**: Removing necessary structure or error handling
- **Simplicity bias**: Dismissing valid complex solutions
- **Confusing simple with easy**: Simple design ≠ easy to implement

## Related Concepts

- **YAGNI** — Don't add complexity for hypothetical needs
- **DRY** — Simplify by centralizing knowledge
- **Separation of Concerns** — Simplify by dividing responsibilities

## Project Observations

- The project's tech stack (React 19 + Vite + TypeScript + Tailwind) follows KISS by using well-understood, focused tools
- No monolithic frameworks (Angular, Next.js) — each tool does one thing well
- pnpm over npm/yarn: simpler dependency resolution

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]



