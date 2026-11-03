# Strategy Pattern

> **Purpose:** Encapsulate algorithms with Strategy Pattern.
> **Last Updated:** 2026-11-03

---

## concept_id
`strategy-pattern`

## title
Strategy Pattern

## aliases
- Strategy
- Policy Pattern
- Algorithm Pattern
- Behavior Encapsulation

## category
design-patterns

## concept_type
behavioral-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Algorithm selection
- Behavior encapsulation
- Runtime switching
- Testing isolation

## tags
- type/pattern
- domain/design
- status/verified
- priority/high

## source_ids
- gof-design-patterns
- martinfowler-patterns

## related_concept_ids
- strategy-pattern
- state-pattern
- command-pattern
- dependency-injection

---

## Definition

Strategy Pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable, allowing the algorithm to vary independently from clients that use it.

## Problem Addressed

Without Strategy:
- Algorithms are hardcoded
- Behavior is rigid
- Code duplication is high
- Testing is difficult

## Scope of Boundaries

Strategy applies to:
- Algorithm selection
- Behavior encapsulation
- Runtime switching
- Testing isolation

Strategy does not apply to:
- Object creation
- Object structure
- Data access
- Event handling

## When to Apply

- Needing multiple algorithms
- Wanting runtime switching
- Needing to isolate behavior
- Wanting testability

## Tradeoffs and When to Avoid

- **Complexity**: Strategy adds complexity
- **Not for simple apps**: Simple apps don't need Strategy
- **Not for fixed behavior**: Fixed behavior doesn't need Strategy
- **Not for performance**: Strategy may add overhead

## Implementation Guidance

1. **Define interface**: Define strategy interface
2. **Implement strategies**: Implement concrete strategies
3. **Context class**: Create context class
4. **Inject strategy**: Inject strategy into context
5. **Switch strategies**: Switch strategies at runtime

## Verification

- [ ] Interface defined
- [ ] Strategies implemented
- [ ] Context created
- [ ] Strategy injected
- [ ] Strategies switchable

## Common Misuses

- **Over-engineering**: Using Strategy for simple cases
- **Too many strategies**: Creating too many strategy classes
- **Not using DI**: Not using dependency injection
- **Not testing**: Not testing each strategy

## Related Concepts

- [[Design Patterns/strategy-pattern]] — Strategy Pattern
- [[Design Patterns/state-pattern]] — State Pattern
- [[Design Patterns/command-pattern]] — Command Pattern
- [[Architecture/dependency-injection]] — Dependency Injection

## Project Observations

The project uses Strategy Pattern through:
- Algorithm interfaces
- Concrete strategy implementations
- Context classes with injected strategies
- Runtime strategy switching

## Sources

- [[Sources/gof-design-patterns|GoF Design Patterns]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Strategy Pattern Note**
