---
slug: separation-of-conventions
sources:
  - https://en.wikipedia.org/wiki/Convention_over_configuration
  - https://en.wikipedia.org/wiki/Configuration-driven_development
date: 2026-11-02
tags:
  - maturity/deprecated
  - conventions
  - separation-of-conventions
  - configuration
  - patterns
# Separation of Conventions

## Definition

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Separation of Conventions is a **principle where code organization follows consistent naming and location conventions rather than explicit configuration**.

> "Convention over configuration reduces the amount of configuration needed by following consistent conventions." â€” Software engineering principle

## Problem Addressed

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Explicit configuration leads to:
- **Boilerplate**: Configuring everything explicitly
- **Complexity**: Many configuration options
- **Inconsistency**: Different conventions in different places
- **Maintenance**: More config to maintain

## Scope and Boundaries

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- Conventions â‰  Configuration (conventions are about structure, configuration is about behavior)
- Conventions â‰  Standards (conventions are about structure, standards are about quality)
- Conventions is a **principle**, not a specific pattern

## When to Apply

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When building frameworks or libraries
- When consistency matters
- When reducing configuration is important
- When onboarding new developers

## Tradeoffs and When to Avoid

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

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
| **Flexibility** â€” Conventions may not fit all cases |
| **Learning curve** â€” Need to learn conventions |
| **Debugging** â€” Hard to trace convention-based behavior |

## Common Misuses

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything by convention**: Not everything should follow conventions
- **Confusing with standards**: Conventions â‰  standards
- **Over-convention**: Too many conventions create rigidity

## Related Concepts

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Configuration-Driven Development](Architecture/configuration-driven-development.md) â€” Complementary approach
- [Data-Driven Design](Architecture/data-driven-design.md) â€” Complementary approach
- [File Separation Conventions](Architecture/file-level-separation-conventions.md) â€” Project-specific conventions

## Project Observations

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses conventions:
  - File naming conventions (from existing notes)
  - Folder structure conventions (src/ folder)
  - TypeScript conventions (from existing notes)
- No evidence of explicit configuration in existing setup

## Sources

## concept_id
a198-separation-of-conventions

## title
Separation of Conventions

## aliases
- A198-separation-of-conventions

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]



