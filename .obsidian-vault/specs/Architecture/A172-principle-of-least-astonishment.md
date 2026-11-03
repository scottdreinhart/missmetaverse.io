---
slug: principle-of-least-astonishment
sources:
  - https://en.wikipedia.org/wiki/Principle_of_least_astonishment
  - https://pragmaticprogrammer.com/books/ppola
date: 2026-11-02
tags:
  - maturity/deprecated
  - least-astonishment
  - principles
  - ux
  - design
# Principle of Least Astonishment (PoLA)

## Definition

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
The Principle of Least Astonishment states that **a module should behave in ways that surprise users the least**. Code should do what users expect, not what is technically clever.

> "The POA states that a module should behave in ways that most developers will expect it to behave." â€” Pragmatic Programmer

## Problem Addressed

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Violating PoLA leads to:
- **Bugs**: Developers misuse APIs they don't understand
- **Onboarding friction**: New team members struggle
- **Maintenance burden**: Unintuitive code is hard to maintain
- **Security risks**: Unintuitive security behavior leads to misconfiguration

## Scope and Boundaries

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- PoLA is about **developer experience**, not just user experience
- It applies to APIs, CLI tools, configuration, and code conventions
- PoLA â‰  User-friendliness (it's about predictability, not ease of use)

## When to Apply

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing APIs
- When choosing naming conventions
- When deciding error handling strategies
- When creating configuration interfaces

## Tradeoffs and When to Avoid

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

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
| **Convention over innovation** â€” Following conventions may limit creative solutions |
| **Domain-specific expectations** â€” What's intuitive varies by domain |
| **Legacy compatibility** â€” Changing to be less surprising may break existing code |

## Common Misuses

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Assuming universal intuition**: What's intuitive varies by experience
- **Over-simplification**: Making things simple at the cost of correctness
- **Ignoring domain experts**: Domain experts may expect different behavior

## Related Concepts

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Explicit over Implicit** â€” PoLA is a specific application
- **Fail Fast** â€” PoLA requires clear, predictable failure modes
- **Type Systems** â€” TypeScript types make behavior predictable

## Project Observations

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project follows PoLA through:
  - TypeScript strict mode (predictable types)
  - Conventional commits (predictable git workflow)
  - Standard file naming (predictable structure)
  - Standard tool choices (Vite, React, Tailwind â€” well-known behavior)
- No evidence of PoLA violations in existing configuration

## Sources

## concept_id
a172-principle-of-least-astonishment

## title
Principle of Least Astonishment (PoLA)

## aliases
- A172-principle-of-least-astonishment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]



