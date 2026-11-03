---
slug: small-cohesive-modules
---

# Small Cohesive Modules

> **Purpose:** Keep modules small and focused.
> **Last Updated:** 2026-11-03

## concept_id
`coding-small-cohesive-modules`

## title
Small Cohesive Modules

## aliases
- Small Cohesive Modules
- Module Cohesion
- Focused Modules

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- Module design
- Package design
- File organization
- Code organization

## tags
- type/practice
- domain/coding
- domain/typescript
- status/verified
- priority/high

## source_ids
- typescript-documentation
- goF-1994

## related_concept_ids
- arch-high-cohesion
- arch-low-coupling
- arch-single-responsibility
- arch-separation-of-concerns
- arch-dry

## Definition

Small Cohesive Modules is a practice where modules are kept small and focused on a single responsibility. Related code is grouped together, and unrelated code is separated.

## Problem Addressed

Without small cohesive modules:
- Modules are too large and complex
- Changes affect unrelated code
- Testing is difficult
- Code is hard to understand

## Scope and Boundaries

Small cohesive modules apply to:
- Module design
- Package design
- File organization
- Code organization

Small cohesive modules do not apply to:
- Simple scripts
- One-off code
- Prototypes
- Temporary code

## When to Apply

- Designing modules
- Organizing code
- Refactoring large modules
- Creating packages

## Tradeoffs and When to Avoid

- **Over-splitting**: Creating too many small modules
- **Navigation overhead**: Too many files can be hard to navigate
- **Not for simple code**: Simple code doesn't need small modules
- **Not for prototypes**: Prototypes don't need small modules

## Implementation Guidance

1. **Keep modules small**: Limit module size
2. **Focus on one responsibility**: Each module should have one purpose
3. **Group related code**: Put related code together
4. **Separate unrelated code**: Move unrelated code out
5. **Review regularly**: Review module structure during code reviews

## Verification

- [ ] Modules are small
- [ ] Modules have one purpose
- [ ] Related code is grouped
- [ ] Unrelated code is separated
- [ ] Module structure is reviewed

## Common Misuses

- **Over-splitting**: Creating too many small modules
- **Ignoring cohesion**: Not grouping related code
- **Not reviewing**: Not reviewing module structure
- **Not separating**: Not separating unrelated code

## Related Concepts

- [[Architecture/high-cohesion]] â€” High Cohesion
- [[Architecture/low-coupling]] â€” Low Coupling
- [[Architecture/single-responsibility-principle]] â€” Single Responsibility Principle
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns

## Project Observations

The project follows small cohesive modules through:
- Focused files
- Clear naming conventions
- Separate files for concerns
- Type definitions in dedicated files

## Sources

- [[Sources/typescript-documentation|Microsoft â€” TypeScript Documentation]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Small Cohesive Modules Note**
