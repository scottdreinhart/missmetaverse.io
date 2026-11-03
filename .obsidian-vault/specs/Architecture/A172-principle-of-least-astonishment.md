---
slug: principle-of-least-astonishment
sources:
  - https://en.wikipedia.org/wiki/Principle_of_least_astonishment
  - https://pragmaticprogrammer.com/books/ppola
date: 2026-11-02
tags:
  - priority/medium
  - maturity/deprecated
  - domain/backend
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - status/complete
  - type/reference
  - domain/architecture
  - least-astonishment
  - principles
  - ux
  - design
---

# Principle of Least Astonishment (PoLA)

## Definition

The Principle of Least Astonishment states that **a module should behave in ways that surprise users the least**. Code should do what users expect, not what is technically clever.

> "The POA states that a module should behave in ways that most developers will expect it to behave." — Pragmatic Programmer

## Problem Addressed

Violating PoLA leads to:
- **Bugs**: Developers misuse APIs they don't understand
- **Onboarding friction**: New team members struggle
- **Maintenance burden**: Unintuitive code is hard to maintain
- **Security risks**: Unintuitive security behavior leads to misconfiguration

## Scope and Boundaries

- PoLA is about **developer experience**, not just user experience
- It applies to APIs, CLI tools, configuration, and code conventions
- PoLA ≠ User-friendliness (it's about predictability, not ease of use)

## When to Apply

- When designing APIs
- When choosing naming conventions
- When deciding error handling strategies
- When creating configuration interfaces

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Convention over innovation** — Following conventions may limit creative solutions |
| **Domain-specific expectations** — What's intuitive varies by domain |
| **Legacy compatibility** — Changing to be less surprising may break existing code |

## Common Misuses

- **Assuming universal intuition**: What's intuitive varies by experience
- **Over-simplification**: Making things simple at the cost of correctness
- **Ignoring domain experts**: Domain experts may expect different behavior

## Related Concepts

- **Explicit over Implicit** — PoLA is a specific application
- **Fail Fast** — PoLA requires clear, predictable failure modes
- **Type Systems** — TypeScript types make behavior predictable

## Project Observations

- The project follows PoLA through:
  - TypeScript strict mode (predictable types)
  - Conventional commits (predictable git workflow)
  - Standard file naming (predictable structure)
  - Standard tool choices (Vite, React, Tailwind — well-known behavior)
- No evidence of PoLA violations in existing configuration

## Sources

- [[Sources/martin-oop-2000|martin-oop-2000]]



