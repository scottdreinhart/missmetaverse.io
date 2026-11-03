---
slug: principle-of-least-astonishment
---

# Principle of Least Astonishment

> **Purpose:** Design systems that behave as users expect.
> **Last Updated:** 2026-11-03

## concept_id
`arch-principle-of-least-astonishment`

## title
Principle of Least Astonishment

## aliases
- PLA
- Principle of Least Astonishment
- Principle of Least Surprise
- Least Surprise Principle

## category
core-principles

## concept_type
design-principle

## research_status
verified

## project_adoption
declared

## applicability
- UI design
- API design
- Configuration
- User experience

## tags
- type/principle
- domain/architecture
- domain/coding
- status/verified
- priority/medium

## source_ids
- martin-fowler-patterns
- goF-1994

## related_concept_ids
- arch-explicit-over-implicit
- arch-kiss
- arch-yagni
- arch-fail-fast
- arch-design-by-contract

## Definition

The Principle of Least Astonishment states that a system should behave in a way that surprises users the least. Behavior should be predictable and intuitive.

## Problem Addressed

Without PLA:
- Users are confused by unexpected behavior
- Errors are more likely
- Training is required
- User experience suffers

## Scope and Boundaries

PLA applies to:
- UI design
- API design
- Configuration
- User experience

PLA does not apply to:
- Internal implementation
- Performance optimizations
- Security measures
- Technical constraints

## When to Apply

- Designing user interfaces
- Creating APIs
- Defining configuration
- Building libraries

## Tradeoffs and When to Avoid

- **Limiting functionality**: Following PLA may limit functionality
- **Technical constraints**: Technical constraints may require surprising behavior
- **Security**: Security measures may be surprising but necessary
- **Performance**: Performance optimizations may be surprising

## Implementation Guidance

1. **Follow conventions**: Follow language and platform conventions
2. **Be predictable**: Make behavior predictable
3. **Document clearly**: Document behavior clearly
4. **Test with users**: Test with real users
5. **Iterate**: Improve based on feedback

## Verification

- [ ] Behavior follows conventions
- [ ] Behavior is predictable
- [ ] Behavior is documented
- [ ] Users are not surprised

## Common Misuses

- **Ignoring conventions**: Not following language/platform conventions
- **Not documenting**: Not documenting behavior
- **Not testing**: Not testing with real users
- **Limiting functionality**: Following PLA may limit functionality

## Related Concepts

- [[Architecture/explicit-over-implicit]] â€” Explicit over Implicit
- [[Architecture/kiss]] â€” KISS
- [[Architecture/yagni]] â€” YAGNI
- [[Architecture/fail-fast]] â€” Fail Fast

## Project Observations

The project follows PLA through:
- React conventions
- TypeScript conventions
- Clear API design
- Intuitive configuration

## Sources

- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]
- [[Sources/goF-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Principle of Least Astonishment Note**
