---
slug: headless-components
sources:
  - https://www.radix-ui.com/primitives/docs/overview/introduction
  - https://headlessui.dev/
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/frontend
  - type/guide
  - type/concept
  - domain/accessibility
  - status/complete
  - type/reference
  - domain/architecture
  - headless
  - radix-ui
  - accessibility
  - components
---

# Headless Components

## Definition

Headless Components are **UI components that provide behavior and accessibility without styling**. They give full control over appearance while handling complex interactions.

> "Headless UI components are unstyled, fully accessible interactive components." — Headless UI

## Problem Addressed

Styled components lead to:
- **Limited customization**: Hard to match design systems
- **Accessibility gaps**: Custom styles may break accessibility
- **Bundle size**: Full component libraries add weight

## Scope and Boundaries

- Headless ≠ No UI (headless components have UI, just no styles)
- Headless ≠ Lightweight (behavior can be complex)
- Headless is a **component pattern**, not a framework

## When to Apply

- When building custom design systems
- When existing component libraries don't match design
- When accessibility is critical
- When bundle size matters

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Styling responsibility** — You must style everything |
| **Accessibility responsibility** — You must ensure accessibility |
| **Learning curve** — Headless patterns are complex |

## Common Misuses

- **Headless everywhere**: Simple components don't need headless
- **Ignoring accessibility**: Headless doesn't mean no accessibility
- **Reinventing wheels**: Simple components may not need headless

## Related Concepts

- [ShadCN UI](../ShadCN/shadcn-ui-patterns.md) — Built on Radix UI (headless)
- [Radix UI](Sources/radix-ui-docs-2024.md) — Headless primitives
- [Accessibility by Design](Architecture/accessibility-by-design.md) — Headless ensures accessibility

## Project Observations

- The project uses shadcn/ui which is built on Radix UI (headless)
- Headless components provide maximum customization
- Accessibility is handled by Radix UI primitives

## Sources

- [[Sources/radix-ui-docs-2024|radix-ui-docs-2024]]



