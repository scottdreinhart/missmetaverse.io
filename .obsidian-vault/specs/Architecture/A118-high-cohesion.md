---
slug: a118-high-cohesion
sources:
  - https://en.wikipedia.org/wiki/Cohesion_(computer_science)
  - https://blog.cleancoder.com/uncle-bob/2014/05/08/SingleReponsibilityPrinciple.html
date: 2026-11-02
tags:
  - cohesion
  - principles
  - design
  - modularity
# High Cohesion

## Definition

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
High Cohesion is the principle that **a module or class should have a narrow, well-focused purpose**. All responsibilities of a module should be closely related and support the same overall goal.

> "Cohesion refers to the strength of the relationship between modules. High cohesion is desirable." â€” Robert C. Martin

## Problem Addressed

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Low cohesion leads to:
- **Unpredictable behavior**: A module with unrelated responsibilities is hard to understand
- **Testing difficulty**: Tests must cover unrelated scenarios
- **Change amplification**: One change affects many unrelated features
- **Team confusion**: Developers don't know what a module is for

## Scope and Boundaries

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Cohesion is about **relatedness of responsibilities**, not about size
- A small module can have low cohesion (unrelated responsibilities)
- A large module can have high cohesion (many related responsibilities)

## When to Apply

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When evaluating module boundaries
- When refactoring a module with multiple responsibilities
- When naming modules or classes
- When reviewing code for SRP violations

## Tradeoffs and When to Avoid

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

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
| **Fragmentation** | Too many small, highly-cohesive modules increase navigation overhead |
| **Forced cohesion** | Grouping unrelated code just to appear cohesive |

## Common Misuses

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Size obsession**: Assuming small = cohesive
- **False grouping**: Putting unrelated code in the same file because "it's small"
- **Ignoring context**: A module's cohesion depends on the system's overall design

## Related Concepts

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Single Responsibility Principle** â€” SRP is the practical application of high cohesion
- **Separation of Concerns** â€” SoC enables high cohesion
- **Low Coupling** â€” High cohesion + low coupling = good design

## Project Observations

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- File naming conventions support high cohesion:
  - `*.logic.ts` â€” business logic only
  - `*.data.ts` â€” data access only
  - `*.hook.ts` â€” React hooks only
- No evidence of low-cohesion modules in existing code (src/ is empty)

## Sources

## concept_id
a118-high-cohesion

## title
High Cohesion

## aliases
- A118-high-cohesion

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-oop-2000|martin-oop-2000]]
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




