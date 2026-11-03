---
slug: a096-explicit-over-implicit
sources:
  - https://pragmaticprogrammer.com/books/pp
  - https://pragmaticprogrammer.com/titles/tpphr/
date: 2026-11-02
tags:
  - explicit
  - principles
  - design
  - pragmatie-programmer
# Explicit over Implicit

## Definition

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Explicit over Implicit is the principle that **code should make its intentions, dependencies, and behavior clear and visible rather than hidden or automatic**.

> "Explicit is better than implicit." â€” From The Zen of Python (Tim Peters)

## Problem Addressed

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Implicit behavior leads to:
- **Hidden dependencies**: Hard to understand what a module needs
- **Surprising behavior**: Automatic behavior that developers don't expect
- **Testing difficulty**: Hard to test without understanding implicit behavior
- **Debugging difficulty**: Hard to trace implicit data flow

## Scope and Boundaries

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Explicit â‰  Verbose (clarity â‰  length)
- Implicit has its place (conventions, defaults, inference)
- The goal is **predictable implicit behavior**, not eliminating all implicit behavior

## When to Apply

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When choosing between explicit and implicit approaches
- When designing APIs
- When configuring tools
- When reviewing code for hidden behavior

## Tradeoffs and When to Avoid

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

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
| **Verbosity** â€” Explicit code is longer |
| **Repetition** â€” Explicit code may repeat information |
| **Developer experience** â€” Too much explicit code is tiring |

## Common Misuses

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Explicit everywhere**: No conventions, no defaults, no inference
- **Implicit everywhere**: Magic behavior, hidden dependencies
- **Confusing with verbosity**: Explicit â‰  verbose (you can be explicit and concise)

## Related Concepts

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Principle of Least Astonishment** â€” Explicit code is less surprising
- **Fail Fast** â€” Explicit errors are clearer than implicit failures
- **Type Systems** â€” TypeScript types make types explicit

## Project Observations

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project follows explicit over implicit:
  - TypeScript explicit types (not inferred `any`)
  - Explicit imports (not global variables)
  - Explicit configuration (not magic values)
  - Explicit error handling (not silent failures)
- AGENTS.md explicitly prohibits implicit behavior ("Do not add a CSS-in-JS library")

## Sources

## concept_id
a096-explicit-over-implicit

## title
Explicit over Implicit

## aliases
- A096-explicit-over-implicit

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]



