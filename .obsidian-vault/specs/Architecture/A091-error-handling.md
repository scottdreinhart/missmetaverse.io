---
slug: error-handling
sources:
  - https://en.wikipedia.org/wiki/Error_handling
  - https://www.typescriptlang.org/docs/
date: 2026-11-02
tags:
  - error-handling
  - typescript
  - exceptions
  - patterns
  - --
# Error Handling

## Definition

Error Handling is a **programming practice for dealing with unexpected or erroneous conditions**.

> "Error handling is the process of responding to and recovering from error conditions in software." â€” Wikipedia

## Problem Addressed

Without error handling:
- **Crashes**: Software crashes on errors
- **Data loss**: Data is lost on errors
- **User experience**: Poor user experience on errors
- **Security**: Errors can expose sensitive information

## Scope and Boundaries

- Error Handling â‰  Exception Handling (error handling is broader, exception handling is specific)
- Error Handling â‰  Logging (error handling is response, logging is recording)
- Error Handling is a **practice**, not a specific technique

## When to Apply

- When building software
- When reliability matters
- When user experience is important
- When security is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** â€” Error handling is complex |
| **Time** â€” Error handling takes time |
| **Over-handling** â€” Don't handle everything |

## Common Misuses

- **Everything handled**: Not everything needs error handling
- **Confusing with exception handling**: Error handling â‰  exception handling
- **Over-handling**: Too much error handling creates complexity

## Related Concepts

- [Explicit Error Modeling](Architecture/explicit-error-modeling.md) â€” Error handling with TypeScript
- [Fail Fast](Architecture/fail-fast.md) â€” Error handling with fail fast
- [Observability](Architecture/observability.md) â€” Error handling with observability

## Project Observations

- The project uses error handling:
  - The project's quality and delivery note covers error handling (from existing notes)
  - No evidence of error handling in existing code (src/ is empty)
- File naming conventions support error handling:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]




