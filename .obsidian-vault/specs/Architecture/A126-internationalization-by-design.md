---
slug: a126-internationalization-by-design
sources:
  - https://www.w3.org/International/
  - https://formatjs.io/docs/getting-started/
date: 2026-11-02
tags:
  - i18n
  - internationalization
  - design
  - l10n
## Sources

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/w3c-i18n|w3c-i18n]]

# Internationalization by Design

## Definition

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Internationalization by Design is the principle that **software should be designed to support multiple languages and regions from the start, not added later**.

> "Internationalization is the design and development of software so that it can be adapted to various languages and regions. Localization is the adaptation for a specific region." â€” W3C

## Problem Addressed

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
i18n as an afterthought leads to:
- **Hardcoded strings**: Text embedded in code
- **Layout issues**: Text expansion breaks layouts
- **Date/number formats**: Wrong formats for regions
- **RTL support**: Right-to-left languages need special handling

## Scope and Boundaries

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- i18n â‰  l10n (i18n is design, l10n is adaptation)
- i18n is a **design principle**, not a library choice
- i18n includes more than translation (dates, numbers, currencies, RTL)

## When to Apply

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When designing UI strings
- When handling dates and numbers
- When building forms
- When creating error messages

## Tradeoffs and When to Avoid

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

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
| **Complexity** â€” i18n adds complexity |
| **Performance** â€” Loading multiple languages |
| **Maintenance** â€” Keeping translations updated |

## Common Misuses

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Hardcoded strings**: Text in code instead of translation files
- **String concatenation**: Building strings with concatenation (breaks with translation)
- **Ignoring RTL**: Not supporting right-to-left languages

## Related Concepts

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [HTML Semantic Patterns](../Hypertext%20HTML/html-semantic-patterns.md) â€” HTML supports i18n via `lang` attribute
- [Tailwind CSS](../TailwindsCSS/tailwind-css-patterns.md) â€” Tailwind supports RTL
- [React Patterns](../React/Architecture/react-patterns) â€” React i18n libraries

## Project Observations

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses English as the primary language
- No i18n library is configured yet
- File naming conventions support i18n:
  - `*.schema.ts` â€” Error messages can be externalized
  - `*.logic.ts` â€” Business logic can be language-agnostic

## Sources

## concept_id
a126-internationalization-by-design

## title
Internationalization by Design

## aliases
- A126-internationalization-by-design

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/mdn-html-2024|mdn-html-2024]]




