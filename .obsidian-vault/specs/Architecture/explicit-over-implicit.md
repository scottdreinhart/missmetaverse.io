# Explicit over Implicit

> **Purpose:** Make behavior and dependencies obvious.
> **Last Updated:** 2026-11-03

---

## concept_id
`arch-explicit-over-implicit`

## title
Explicit over Implicit

## aliases
- Explicit over Implicit
- Explicit is Better than Implicit
- Clarity over Cleverness

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- Code design
- API design
- Configuration
- Documentation

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/high

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-fail-fast
- arch-design-by-contract
- arch-yagni
- arch-kiss
- arch-solid-principles

---

## Definition

Explicit over Implicit is a principle that behavior, dependencies, and configuration should be obvious and visible rather than hidden or automatic.

## Problem Addressed

Without explicit over implicit:
- Behavior is hard to understand
- Dependencies are hidden
- Configuration is mysterious
- Debugging is difficult

## Scope and Boundaries

Explicit applies to:
- Code behavior
- Dependencies
- Configuration
- Documentation

Explicit does not apply to:
- Implementation details (can be hidden)
- Internal algorithms (can be complex)
- Performance optimizations (can be hidden)

## When to Apply

- Designing APIs
- Creating configuration
- Writing documentation
- Building libraries

## Tradeoffs and When to Avoid

- **Verbosity**: Explicit code can be verbose
- **Repetition**: Explicit code can be repetitive
- **Not for implementation**: Implementation details can be hidden
- **Not for performance**: Performance optimizations can be hidden

## Implementation Guidance

1. **Be explicit**: Make behavior obvious
2. **Document clearly**: Document behavior clearly
3. **Avoid magic**: Avoid magic numbers and strings
4. **Use clear names**: Use clear, descriptive names
5. **Show dependencies**: Show dependencies explicitly

## Verification

- [ ] Behavior is obvious
- [ ] Dependencies are visible
- [ ] Configuration is clear
- [ ] Documentation is complete

## Common Misuses

- **Over-explicit**: Being explicit about everything
- **Ignoring implementation**: Implementation details can be hidden
- **Not documenting**: Not documenting behavior
- **Using magic**: Using magic numbers and strings

## Related Concepts

- [[Architecture/fail-fast]] — Fail Fast
- [[Architecture/design-by-contract]] — Design by Contract
- [[Architecture/yagni]] — YAGNI
- [[Architecture/kiss]] — KISS

## Project Observations

The project follows explicit over implicit through:
- Clear function signatures
- Explicit imports
- Clear configuration
- Comprehensive documentation

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Explicit over Implicit Note**
