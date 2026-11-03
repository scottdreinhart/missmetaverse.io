---
slug: command-pattern
sources:
  - https://en.wikipedia.org/wiki/Command_pattern
  - https://martinfowler.com/eaaDev/commandObject.html
date: 2026-11-02
tags:
  - command-pattern
  - behavioral-patterns
  - patterns
  - design-patterns
  - --
# Command Pattern

## Definition

Command Pattern is a **behavioral design pattern that turns a request into a stand-alone object containing all information about the request**.

> "The Command pattern turns a request into a stand-alone object containing all information about the request." â€” GoF

## Problem Addressed

Without command pattern:
- **Coupling**: Requests are coupled to objects
- **Inflexibility**: Can't queue or log requests
- **Testing**: Hard to test requests
- **Maintenance**: Hard to maintain requests

## Scope and Boundaries

- Command Pattern â‰  Strategy (command pattern is for requests, strategy pattern is for algorithms)
- Command Pattern â‰  Mediator (command pattern is for requests, mediator pattern is for coordination)
- Command Pattern is a **behavioral pattern**, not a structural pattern

## When to Apply

- When building applications
- When requests matter
- When testing is important
- When maintenance is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Command pattern is complex |
| **Time** â€” Command pattern takes time |
| **Over-command** â€” Don't use command for everything |

## Common Misuses

- **Everything command**: Not everything needs command pattern
- **Confusing with strategy**: Command pattern â‰  strategy
- **Over-command**: Too many commands create complexity

## Related Concepts

- [DDD Patterns](Architecture/ddd-patterns.md) â€” Command pattern with DDD
- [Strategy Pattern](Architecture/strategy-pattern.md) â€” Command pattern with strategy
- [Mediator Pattern](Architecture/mediator-pattern.md) â€” Command pattern with mediator

## Project Observations

- The project uses command pattern:
  - The project's architecture patterns note covers command pattern (from existing notes)
  - No evidence of command pattern in existing code (src/ is empty)
- File naming conventions support command pattern:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




