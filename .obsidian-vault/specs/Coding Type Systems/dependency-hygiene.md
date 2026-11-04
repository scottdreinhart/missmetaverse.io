---
slug: dependency-hygiene
tags:
  - core-concepts

  - coding-type-system-best-practices
---

# Dependency Hygiene

> **Purpose:** Manage imports and dependencies carefully.
> **Last Updated:** 2026-11-03

## concept_id
`coding-dependency-hygiene`

## title
Dependency Hygiene

## aliases
- Dependency Hygiene
- Import Hygiene
- Dependency Management

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- Import management
- Package dependencies
- Module design
- Bundle optimization

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
- arch-low-coupling
- arch-high-cohesion
- arch-separation-of-concerns
- arch-dry
- coding-small-cohesive-modules

## Definition

Dependency Hygiene is a practice where imports and dependencies are managed carefully to minimize coupling, reduce bundle size, and improve maintainability.

## Problem Addressed

Without dependency hygiene:
- Bundle size is large
- Coupling is high
- Maintenance is difficult
- Performance suffers

## Scope and Boundaries

Dependency hygiene applies to:
- Import management
- Package dependencies
- Module design
- Bundle optimization

Dependency hygiene does not apply to:
- Runtime dependencies
- External services
- Database connections
- Network connections

## When to Apply

- Managing imports
- Adding dependencies
- Designing modules
- Optimizing bundles

## Tradeoffs and When to Avoid

- **Over-optimization**: Optimizing too early
- **Complexity**: Dynamic imports add complexity
- **Not for simple code**: Simple code doesn't need dependency hygiene
- **Not for prototypes**: Prototypes don't need dependency hygiene

## Implementation Guidance

1. **Import selectively**: Import only what is needed
2. **Avoid deep imports**: Import from package root
3. **Use tree-shaking**: Write code that can be tree-shaken
4. **Review dependencies**: Review dependencies regularly
5. **Minimize dependencies**: Remove unused dependencies

## Verification

- [ ] Imports are selective
- [ ] Deep imports are avoided
- [ ] Code can be tree-shaken
- [ ] Dependencies are reviewed
- [ ] Unused dependencies are removed

## Common Misuses

- **Importing everything**: Importing entire packages
- **Deep imports**: Importing from deep paths
- **Not reviewing**: Not reviewing dependencies
- **Not removing**: Not removing unused dependencies

## Related Concepts

- [[Architecture/low-coupling]] â€” Low Coupling
- [[Architecture/high-cohesion]] â€” High Cohesion
- [[Architecture/separation-of-concerns]] â€” Separation of Concerns
- [[Architecture/dry]] â€” DRY Principle

## Project Observations

The project follows dependency hygiene through:
- Selective imports
- Package root imports
- Tree-shaking support
- Dependency reviews

## Sources

- [[Sources/S011-microsoft-typescript-handbook|Microsoft â€” TypeScript Documentation]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Dependency Hygiene Note**
