---
slug: Coding Type Systems/pure-functions
sources:
  - https://www.typescriptlang.org/
  - https://react.dev/
date: 2026-11-02
tags:
  - maturity/deprecated
  - pure-functions
  - typescript
  - type-system
  - patterns
# Pure Functions

## Definition

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
Pure Functions are **functions that always produce the same output for the same input and have no side effects**.

> "A pure function is a function that always produces the same output for the same input and has no side effects." â€” TypeScript Docs

## Problem Addressed

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
Without pure functions:
- **Side effects**: Functions have unexpected side effects
- **Testing**: Hard to test functions with side effects
- **Reasoning**: Hard to reason about code with side effects
- **Concurrency**: Concurrency issues with side effects

## Scope and Boundaries

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- Pure Functions â‰  Immutability (pure functions have no side effects, immutability prevents mutation)
- Pure Functions = Determinism (pure functions are deterministic)
- Pure Functions is a **programming principle**, not a pattern

## When to Apply

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- When building React applications
- when testing is important
- when concurrency is a concern
- when code reasoning is important

## Tradeoffs and When to Avoid

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
| Cost | Description |
|------|-------------|
| **Complexity** â€” Pure functions add abstraction |
| **Time** â€” Writing pure functions takes time |
| **Over-pure**: Not every function needs to be pure |

## Common Misuses

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- **Everything pure**: Not every function can be pure
- **Ignoring side effects**: Side effects are necessary, they should be isolated
- **Confusing with pure functions and callbacks**: Pure functions have no side effects, callbacks may have side effects

## Related Concepts

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- [Immutability](Coding Type Systems/Coding Type Systems/immutability.md) â€” Immutability supports pure functions
- [TDD Pattern](Architecture/tdd-pattern.md) â€” TDD benefits from pure functions
- [Command-Query Separation](Architecture/command-query-separation.md) â€” Command-query separation supports pure functions

## Project Observations

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- The project uses pure functions:
  - TypeScript supports pure functions through type system
  - React benefits from pure functions through components
  - The project's architecture patterns note covers TypeScript concepts
  - No evidence of pure functions in existing code (src/ is empty)
- File naming conventions support pure functions:
  - `*.logic.ts` â€” Logic files
  - `*.data.ts` â€” Data files

## Sources

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
- [[Sources/microsoft-typescript-handbook|microsoft-typescript-handbook]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Pure Function Design

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
```mermaid
graph TD
    A[Writing function?]\n    A --> B{Same input = Same output?}\n    B -->|Yes| C{No side effects?}\n    B -->|No| D[Not pure - isolate side effects]\n    C -->|Yes| E[Pure function]\n    C -->|No| F[Extract side effects]\n    E --> G{Reusable?}\n    G -->|Yes| H[Export as utility]\n    G -->|No| I[Keep local]\n```\n\n### Pure Function Checklist\n\n| Criterion | Check | Example |\n|-----------|-------|---------|\n| **Deterministic** | Same input â†’ Same output | `add(2, 3) === 5` always |\n| **No side effects** | No mutation, no I/O | No console.log, no fetch |\n| **No external state** | Only uses parameters | Doesn't read global vars |\n| **Referential transparency** | Can replace with value | `double(x)` â†’ `x * 2` |\n\n---

## Procedural Guidance: Pure Function Implementation

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
### Step 1: Write Basic Pure Functions

```typescript
// functions/pure-functions.ts

// âœ… Pure function â€” deterministic, no side effects
export function add(a: number, b: number): number {
  return a + b
}

// âœ… Pure function â€” same input always returns same output
export function capitalize(str: string): string {
  return str.charAt(0).toUpperCase() + str.slice(1)
}

// âœ… Pure function â€” no mutation
export function createUser(name: string, email: string) {
  return {
    id: crypto.randomUUID(),
    name,
    email,
    createdAt: new Date().toISOString(),
  }
}

// âŒ Impure function â€” uses external state
let counter = 0
export function increment(): number {
  counter++
  return counter
}

// âŒ Impure function â€” has side effect
export function logAndReturn(value: string): string {
  console.log(value) // Side effect!
  return value
}
```

### Step 2: Use Pure Functions in React

```typescript
// components/PureComponent.tsx
import { memo } from 'react'

// Pure component â€” memoized for performance
export const PureComponent = memo(({ name, age }: { name: string; age: number }) => {
  // Pure rendering â€” no side effects in render
  const formattedAge = formatAge(age) // Pure function
  const greeting = createGreeting(name) // Pure function

  return (
    <div>
      <h1>{greeting}</h1>
      <p>Age: {formattedAge}</p>
    </div>
  )
})

// Pure utility functions
function formatAge(age: number): string {
  return `${age} years old`
}

function createGreeting(name: string): string {
  return `Hello, ${name}!`
}
```

### Step 3: Create Pure Data Transformers

```typescript
// functions/data-transformers.ts

// Pure transformer â€” no mutation
export function transformUser(user: {
  firstName: string
  lastName: string
  email: string
}): {
  name: string
  email: string
  initials: string
} {
  return {
    name: `${user.firstName} ${user.lastName}`,
    email: user.email.toLowerCase(),
    initials: `${user.firstName[0]}${user.lastName[0]}`.toUpperCase(),
  }
}

// Pure array transformer
export function filterActiveUsers(users: Array<{ active: boolean; name: string }>) {
  return users.filter((user) => user.active)
}

// Pure reducer
export function reduceUserScores(scores: number[]) {
  return scores.reduce((sum, score) => sum + score, 0)
}
```

### Step 4: Compose Pure Functions

```typescript
// functions/composition.ts

// Function composition utility
export function compose<T, U, V>(
  f1: (arg: T) => U,
  f2: (arg: U) => V,
): (arg: T) => V {
  return (arg: T) => f2(f1(arg))
}

// Pure functions
const double = (x: number) => x * 2
const addTen = (x: number) => x + 10
const format = (x: number) => `$${x.toFixed(2)}`

// Compose functions
const calculatePrice = compose(compose(double, addTen), format)

console.log(calculatePrice(5)) // '$20.00'
// double(5) = 10
// addTen(10) = 20
// format(20) = '$20.00'

// Multiple composition
const processUser = compose(
  (name: string) => name.trim(),
  (name: string) => name.toLowerCase(),
  (name: string) => capitalize(name),
)

console.log(processUser('  JOHN DOE ')) // 'John Doe'
```

### Step 5: Test Pure Functions

```typescript
// tests/pure-functions.test.ts
import { describe, it, expect } from 'vitest'
import { add, capitalize, createUser } from '../functions/pure-functions'

describe('Pure Functions', () => {
  it('add should be deterministic', () => {
    expect(add(2, 3)).toBe(5)
    expect(add(2, 3)).toBe(5) // Same result every time
  })

  it('capitalize should be pure', () => {
    expect(capitalize('hello')).toBe('Hello')
    expect(capitalize('world')).toBe('World')
  })

  it('createUser should return new object', () => {
    const user1 = createUser('John', 'john@example.com')
    const user2 = createUser('John', 'john@example.com')

    // Same input, different objects
    expect(user1).toEqual(user2)
    expect(user1).not.toBe(user2) // Different references
  })

  it('should be referentially transparent', () => {
    const result = add(2, 3)
    // Can replace add(2, 3) with 5 everywhere
    expect(5).toBe(5)
  })
})
```

---

## Copilot Instructions

## concept_id
n07-pure-functions

## title
Pure Functions

## aliases
- N07-Pure-Functions

## category
coding-standards

## concept_type
best-practice

## research_status
verified

## project_adoption
required
### When to Read This Note
- Writing pure functions
- Creating React components
- Building data transformers
- Composing functions
- Testing pure functions

### What to Do With This Information
1. **Write pure functions**: Deterministic, no side effects
2. **Use in React**: For pure components and hooks
3. **Transform data**: Pure data transformers
4. **Compose functions**: Build complex logic from simple parts
5. **Test easily**: Pure functions are easy to test

### Tools to Use
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `ramda` â€” for functional programming utilities
- **npm Package**: `lodash` â€” for utility functions
- **Terminal Command**: `pnpm test` â€” run tests
- **Terminal Command**: `pnpm lint` â€” check code quality

### Agents to Invoke
- **Code Review Agent**: Run when reviewing function purity
- **Testing Agent**: Run when writing tests for pure functions

### Integration with Other Notes
- read [[Coding Type Systems/immutability]] for immutable data patterns
- read [[exhaustive-handling]] for exhaustive pattern matching
- read [[Coding Type Systems/pure-functions]] for pure function patterns

### Common Pitfalls
- Don't mutate input parameters (create new objects)
- Don't use external state (pass as parameters)
- Don't ignore side effects (isolate them)
- Don't over-complicate (keep functions simple)
- Don't forget to memoize (use React.memo for components)

### Quick Validation Checklist
- [ ] Are functions deterministic?
- [ ] Are there no side effects?
- [ ] Is input not mutated?
- [ ] Are functions testable?
- [ ] Are side effects isolated?
- [ ] Is composition used where appropriate?


