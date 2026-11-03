# Exhaustive Handling

> **Purpose:** Ensure all cases are handled in type-safe way.
> **Last Updated:** 2026-11-03

---

## concept_id
`coding-exhaustive-handling`

## title
Exhaustive Handling

## aliases
- Exhaustive Handling
- Exhaustive Switch
- Exhaustive Pattern Matching

## category
coding-type-systems

## concept_type
coding-practice

## research_status
verified

## project_adoption
declared

## applicability
- Switch statements
- Pattern matching
- State machines
- Event handling

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
- coding-discriminated-unions
- coding-make-invalid-states-unrepresentable
- coding-strict-typing
- coding-immutability
- coding-pure-functions

---

## Definition

Exhaustive Handling is a practice where all possible cases in a type are handled, ensuring no case is accidentally missed. This is enforced by the TypeScript type system.

## Problem Addressed

Without exhaustive handling:
- Cases are accidentally missed
- New variants break existing code
- Runtime errors occur
- Testing is incomplete

## Scope and Boundaries

Exhaustive handling applies to:
- Switch statements
- Pattern matching
- State machines
- Event handling

Exhaustive handling does not apply to:
- Simple if-else chains
- Optional handling
- Fallback cases
- Default cases

## When to Apply

- Handling discriminated unions
- Implementing state machines
- Processing events
- Handling API responses

## Tradeoffs and When to Avoid

- **Over-engineering**: Not all cases need exhaustive handling
- **Fallback cases**: Fallback cases may be acceptable
- **Optional handling**: Optional handling may be acceptable
- **Default cases**: Default cases may be acceptable

## Implementation Guidance

1. **Use discriminated unions**: For type-safe variants
2. **Use switch statements**: For exhaustive handling
3. **Use never type**: For compile-time errors on missing cases
4. **Test all cases**: Test all variants
5. **Review changes**: Review changes to variants

## Verification

- [ ] All cases are handled
- [ ] Switch statements are exhaustive
- [ ] Never type is used for missing cases
- [ ] All variants are tested
- [ ] Changes are reviewed

## Common Misuses

- **Ignoring cases**: Not handling all cases
- **Using default**: Using default case instead of handling all
- **Not testing**: Not testing all cases
- **Over-engineering**: Not all cases need exhaustive handling

## Related Concepts

- [[Coding Type Systems/discriminated-unions]] — Discriminated Unions
- [[Coding Type Systems/make-invalid-states-unrepresentable]] — Make Invalid States Unrepresentable
- [[Coding Type Systems/strict-typing]] — Strict Typing
- [[Coding Type Systems/immutability]] — Immutability

## Project Observations

The project uses TypeScript, which supports exhaustive handling through:
- Discriminated unions
- Switch statements
- Never type
- Type guards

## Sources

- [[Sources/typescript-documentation|Microsoft — TypeScript Documentation]]
- [[Sources/goF-1994|GoF — Design Patterns: Elements of Reusable Object-Oriented Software]]

---

**End of Exhaustive Handling Note**
