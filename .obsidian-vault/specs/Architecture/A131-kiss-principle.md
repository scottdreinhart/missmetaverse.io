---
slug: kiss-principle
sources:
  - https://en.wikipedia.org/wiki/KISS_principle
  - https://www.merriam-webster.com/dictionary/KISS
date: 2026-11-02
tags:
  - kiss
  - principles
  - simplicity
  - design
# KISS (Keep It Simple, Stupid)

## Definition

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
The KISS principle states that **systems work best when they are simple rather than complex**. Simplicity should be a key goal in design, and unnecessary complexity should be avoided.

> "Most systems work best if they are kept simple rather than made complicated." â€” John G. D. Ward (U.S. Navy, 1960)

## Problem Addressed

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Complexity leads to:
- **Unpredictability**: More paths to failure
- **Maintenance burden**: Harder to understand and modify
- **Onboarding friction**: New team members struggle to understand
- **Hidden bugs**: Complex code hides edge cases

## Scope and Boundaries

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- KISS does **not** mean "use the simplest possible solution regardless of requirements"
- KISS does **not** mean "avoid abstractions" â€” well-designed abstractions reduce complexity
- KISS is about **avoiding unnecessary complexity**, not avoiding necessary complexity

## When to Apply

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When choosing between multiple valid approaches
- When reviewing code for complexity
- When designing APIs or interfaces
- When evaluating third-party libraries

## Tradeoffs and When to Avoid

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

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
| **Under-engineering** | Oversimplifying can lead to technical debt |
| **False simplicity** | Hiding complexity behind a poor abstraction |
| **Premature simplification** | Not building for known future requirements |

## Common Misuses

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Over-simplification**: Removing necessary structure or error handling
- **Simplicity bias**: Dismissing valid complex solutions
- **Confusing simple with easy**: Simple design â‰  easy to implement

## Related Concepts

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **YAGNI** â€” Don't add complexity for hypothetical needs
- **DRY** â€” Simplify by centralizing knowledge
- **Separation of Concerns** â€” Simplify by dividing responsibilities

## Project Observations

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project's tech stack (React 19 + Vite + TypeScript + Tailwind) follows KISS by using well-understood, focused tools
- No monolithic frameworks (Angular, Next.js) â€” each tool does one thing well
- pnpm over npm/yarn: simpler dependency resolution

## Sources

## concept_id
a131-kiss-principle

## title
KISS (Keep It Simple, Stupid)

## aliases
- A131-kiss-principle

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]



