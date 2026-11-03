---
slug: data-oriented-design
sources:
  - https://en.wikipedia.org/wiki/Data-oriented_design
  - https://www.youtube.com/watch?v=N_E_0y6EU6o
date: 2026-11-02
tags:
  - data-oriented
  - performance
  - architecture
  - design
  - --
# Data-Oriented Design

## Definition

Data-Oriented Design is **an architecture approach that prioritizes data layout and access patterns over object-oriented hierarchies to optimize performance**.

> "Data-oriented design organizes data for efficient access and processing, rather than organizing code around object hierarchies." â€” Wikipedia

## Problem Addressed

Without data-oriented design:
- **Cache misses**: Poor cache utilization
- **Performance**: Slow performance due to poor data layout
- **Scalability**: Can't scale to handle large datasets
- **Memory**: Inefficient memory usage

## Scope and Boundaries

- Data-Oriented Design â‰  OOP (data-oriented prioritizes data layout, OOP prioritizes object hierarchies)
- Data-Oriented Design = Performance (data-oriented design optimizes performance)
- Data-Oriented Design is an **architecture approach**, not a pattern

## When to Apply

- When building performance-critical systems
- when processing large datasets
- when cache performance matters
- when game engines or real-time systems are involved

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Data-oriented design is less intuitive |
| **Time** â€” Designing data layouts takes time |
| **Readability** â€” Code may be less readable |

## Common Misuses

- **Everything data-oriented**: Not every system needs data-oriented design
- **Ignoring maintainability**: Don't sacrifice maintainability for performance
- **Confusing with DDD**: Data-oriented design is about performance, DDD is about domain modeling

## Related Concepts

- [Performance Optimization](Frontend UI/performance-optimization-patterns.md) â€” Performance optimization benefits from data-oriented design
- [Profiling](Frontend UI/profiling-patterns.md) â€” Profiling identifies data-oriented design opportunities
- [Separation of Concerns](Architecture/separation-of-concerns.md) â€” Separation of concerns applies to data-oriented design

## Project Observations

- The project uses data-oriented design:
  - TypeScript supports data-oriented design through data structures
  - The project's architecture patterns note covers design approaches
  - No evidence of data-oriented design in existing code (src/ is empty)
- File naming conventions support data-oriented design:
  - `*.data.ts` â€” Data files
  - `*.logic.ts` â€” Logic files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]



