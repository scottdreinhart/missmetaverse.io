---
slug: quality-delivery-maintainability
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/framework/
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - quality
  - delivery
  - maintainability
  - tdd
  - bdd
  - risk-based-testing
  - property-based-testing
  - mutation-testing
  - contract-testing
  - architecture-fitness-functions
  - ci
  - reproducible-builds
  - observability
  - slo
  - adr
  - incremental-refactoring
  - evolutionary-architecture
  - performance-budgets
---

# Quality, Delivery & Maintainability Practices

## Overview

Quality, delivery, and maintainability practices ensure software is reliable, deliverable, and sustainable over time.

---

## 1. Testing Practices

### TDD (Test-Driven Development)

**Write tests before implementation. Red → Green → Refactor.**

```typescript
// 1. RED — Write a failing test
describe('Calculator', () => {
  it('should add two numbers', () => {
    const calc = new Calculator()
    expect(calc.add(2, 3)).toBe(5)  // Fails — Calculator doesn't exist yet
  })
})

// 2. GREEN — Write minimal code to pass
class Calculator {
  add(a: number, b: number): number {
    return a + b
  }
}

// 3. REFACTOR — Improve code while keeping tests green
// (Add more tests, improve implementation, remove duplication)

// Next cycle — subtract
describe('Calculator', () => {
  it('should subtract two numbers', () => {
    const calc = new Calculator()
    expect(calc.subtract(5, 3)).toBe(2)  // Fails
  })
})

class Calculator {
  add(a: number, b: number): number { return a + b }
  subtract(a: number, b: number): number { return a - b }  // Passes
}
```

### BDD (Behavior-Driven Development)

**Describe behavior in natural language, then implement.**

```typescript
// Gherkin-style behavior description
// Feature: User Login
//   As a registered user
//   I want to log in with my email and password
//   So that I can access my account

describe('User Login', () => {
  it('should login with valid credentials', () => {
    // Given
    const user = new User('john@example.com', 'hashedPassword')
    this.userService.register(user)

    // When
    const result = this.authService.login('john@example.com', 'password')

    // Then
    expect(result.success).toBe(true)
    expect(result.token).toBeDefined()
  })

  it('should reject invalid credentials', () => {
    // Given
    const user = new User('john@example.com', 'hashedPassword')
    this.userService.register(user)

    // When
    const result = this.authService.login('john@example.com', 'wrongpassword')

    // Then
    expect(result.success).toBe(false)
    expect(result.error).toBe('Invalid credentials')
  })
})
```

### Risk-Based Testing

**Focus testing effort on the highest-risk areas.**

```typescript
// Risk assessment matrix
interface Risk {
  area: string
  likelihood: 'high' | 'medium' | 'low'
  impact: 'high' | 'medium' | 'low'
  tests: string[]
}

const risks: Risk[] = [
  {
    area: 'Payment Processing',
    likelihood: 'high',
    impact: 'high',
    tests: [
      'payment-integration.test.ts',
      'payment-retry.test.ts',
      'payment-refund.test.ts',
      'payment-security.test.ts',
    ],
  },
  {
    area: 'User Profile',
    likelihood: 'medium',
    impact: 'low',
    tests: [
      'profile-update.test.ts',
    ],
  },
]

// Focus testing effort on high-risk areas
const highRiskTests = risks
  .filter(r => r.likelihood === 'high' && r.impact === 'high')
  .flatMap(r => r.tests)

console.log('Priority tests:', highRiskTests)
```

### Property-Based Testing

**Test properties that should hold for all inputs, not just specific cases.**

```typescript
import { property, int, string } from 'fast-check'

// Property: Adding zero should not change the value
property(
  int(),
  (n) => {
    const calc = new Calculator()
    return calc.add(n, 0) === n
  }
)

// Property: Reversing a list twice should give the original list
property(
  array(int()),
  (arr) => {
    const reversed = [...arr].reverse()
    const reversedAgain = [...reversed].reverse()
    return JSON.stringify(arr) === JSON.stringify(reversedAgain)
  }
)

// Property: Parsing and stringifying should be consistent
property(
  string(),
  (email) => {
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return true  // Skip invalid
    const parsed = Email.create(email)
    return parsed.value === email
  }
)
```

### Mutation Testing

**Verify tests by checking if they catch injected faults.**

```typescript
// Original code
function calculateDiscount(price: number, age: number): number {
  if (age < 18) return price * 0.9  // 10% discount
  if (age > 65) return price * 0.85  // 15% discount
  return price
}

// Mutations (injected faults):
// 1. Change 0.9 to 0.95
// 2. Change 0.85 to 0.95
// 3. Change < to >
// 4. Remove the if statement

// Good tests should kill these mutations:
describe('calculateDiscount', () => {
  it('should give 10% discount to minors', () => {
    expect(calculateDiscount(100, 16)).toBe(90)  // Kills mutation 1
  })

  it('should give 15% discount to seniors', () => {
    expect(calculateDiscount(100, 70)).toBe(85)  // Kills mutation 2
  })

  it('should not give discount to adults', () => {
    expect(calculateDiscount(100, 30)).toBe(100)  // Kills mutation 3
  })
})
```

### Contract Testing

**Verify that services conform to their API contracts.**

```typescript
// Consumer contract
describe('OrderService API Contract', () => {
  it('should return order with required fields', () => {
    const schema = z.object({
      id: z.string(),
      status: z.enum(['pending', 'confirmed', 'shipped', 'cancelled']),
      total: z.number(),
      items: z.array(z.object({
        id: z.string(),
        name: z.string(),
        price: z.number(),
        quantity: z.number(),
      })),
    })

    const order = await orderService.getOrder('123')
    schema.parse(order)  // Validates against contract
  })
})

// Provider contract verification
describe('OrderService Provider', () => {
  it('should satisfy consumer contract', async () => {
    const order = await orderService.createOrder({
      items: [{ id: '1', name: 'Book', price: 10, quantity: 1 }],
    })

    const schema = z.object({ /* ... */ })
    schema.parse(order)  // Provider must satisfy contract
  })
})
```

---

## 2. Delivery Practices

### Architecture Fitness Functions

**Automated checks to verify architectural properties.**

```typescript
// Fitness function: No circular dependencies
function checkNoCircularDependencies(): boolean {
  const dependencies = getModuleDependencies()
  const hasCycle = detectCycle(dependencies)
  return !hasCycle
}

// Fitness function: Test coverage threshold
function checkTestCoverage(): boolean {
  const coverage = getCoverageReport()
  return coverage.lines >= 80 && coverage.functions >= 85
}

// Fitness function: Bundle size limit
function checkBundleSize(): boolean {
  const bundle = getBundleAnalysis()
  return bundle.totalSize <= 250 * 1024  // 250KB
}

// Fitness function: No direct DOM access in domain layer
function checkLayerBoundaries(): boolean {
  const violations = scanForViolations({
    from: 'domain',
    to: ['@testing-library/dom', 'jsdom'],
  })
  return violations.length === 0
}

// Run all fitness functions
const results = [
  checkNoCircularDependencies(),
  checkTestCoverage(),
  checkBundleSize(),
  checkLayerBoundaries(),
]

if (!results.every(r => r)) {
  throw new Error('Architecture fitness checks failed')
}
```

### CI (Continuous Integration)

**Automate build, test, and validation on every change.**

```yaml
# .github/workflows/ci.yml
name: CI

on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v3
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'

      - run: pnpm install --frozen-lockfile
      - run: pnpm lint
      - run: pnpm type-check
      - run: pnpm test
      - run: pnpm build
```

### Reproducible Builds

**Ensure builds are deterministic and reproducible.**

```dockerfile
# Use specific base image versions
FROM node:20-alpine AS builder

# Pin dependency versions
RUN corepack enable && corepack prepare pnpm@8.15.0 --activate

# Copy lockfile first (cache layer)
COPY pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy source and build
COPY . .
RUN pnpm build

# Verify build output
RUN sha256sum dist/index.html > build-checksum.txt
```

---

## 3. Observability

### SLOs (Service Level Objectives)

**Define measurable reliability targets.**

```typescript
interface SLO {
  metric: string
  target: number  // 0.999 = 99.9%
  window: string  // '30d'
  errorBudget: number
}

const slos: SLO[] = [
  { metric: 'api_latency_p99', target: 0.999, window: '30d', errorBudget: 0.001 },
  { metric: 'api_error_rate', target: 0.999, window: '30d', errorBudget: 0.001 },
  { metric: 'deployment_success_rate', target: 0.95, window: '30d', errorBudget: 0.05 },
]

class SLOMonitor {
  checkSLO(slo: SLO): boolean {
    const actual = this.getMetric(slo.metric)
    return actual >= slo.target
  }

  getErrorBudget(slo: SLO): number {
    return slo.target - this.getMetric(slo.metric)
  }
}
```

### Observability

**Logs, metrics, and traces for understanding system behavior.**

```typescript
class ObservabilityService {
  // Metrics
  private metrics = new Map<string, number>()

  increment(metric: string, value: number = 1): void {
    this.metrics.set(metric, (this.metrics.get(metric) || 0) + value)
  }

  // Logging
  log(level: 'info' | 'warn' | 'error', message: string, context?: Record<string, unknown>): void {
    console.log({
      timestamp: new Date().toISOString(),
      level,
      message,
      ...context,
    })
  }

  // Tracing
  private traces: Trace[] = []

  startTrace(name: string): Trace {
    const trace: Trace = { name, start: Date.now(), spans: [] }
    this.traces.push(trace)
    return trace
  }
}

// Usage
const obs = new ObservabilityService()
obs.increment('api_requests')
obs.increment('api_errors', 1)
obs.log('error', 'Database connection failed', { host: 'db.example.com' })

const trace = obs.startTrace('createOrder')
// ... perform operations
trace.spans.push({ name: 'validate', duration: 5 })
trace.spans.push({ name: 'save', duration: 10 })
```

---

## 4. Maintainability Practices

### ADRs (Architecture Decision Records)

**Document architectural decisions and their context.**

```markdown
# ADR-001: Use TypeScript for All Code

**Status**: Accepted
**Date**: 2026-01-15
**Context**: We are building a large-scale React application with multiple teams.
**Decision**: Use TypeScript for all new code. Existing JavaScript can be migrated incrementally.
**Consequences**:
- ✅ Better tooling, autocomplete, and compile-time errors
- ✅ Easier refactoring across teams
- ✅ Learning curve for team members
- ✅ Additional build step for compilation
```

### Incremental Refactoring

**Make small, safe changes with tests as a safety net.**

```typescript
// Before: Large function with multiple responsibilities
async function handleRequest(req: Request): Promise<Response> {
  // 1. Validate
  if (!req.body.name) throw new Error('Name required')
  if (!req.body.email) throw new Error('Email required')

  // 2. Process
  const user = await this.createUser(req.body)

  // 3. Send email
  await this.sendWelcomeEmail(user.email, user.name)

  // 4. Log
  console.log(`User created: ${user.id}`)

  // 5. Return
  return { id: user.id, name: user.name }
}

// After: Small, focused functions
async function handleRequest(req: Request): Promise<Response> {
  this.validateRequest(req.body)
  const user = await this.createUser(req.body)
  await this.sendWelcomeEmail(user.email, user.name)
  this.logUserCreation(user)
  return this.formatResponse(user)
}

private validateRequest(body: unknown): void {
  if (!body?.name) throw new Error('Name required')
  if (!body?.email) throw new Error('Email required')
}

private formatResponse(user: User): Response {
  return { id: user.id, name: user.name }
}
```

### Evolutionary Architecture

**Design for change, not for predictability.**

```typescript
// Start simple
class UserService {
  async create(data: CreateUserDto): Promise<User> {
    // Simple implementation
  }
}

// Evolve as requirements grow
class UserService {
  private cache: Map<string, User> = new Map()

  async create(data: CreateUserDto): Promise<User> {
    // Add caching
    const cached = this.cache.get(data.email)
    if (cached) throw new DuplicateEmailError()

    const user = await this.repository.create(data)
    this.cache.set(user.id, user)
    return user
  }

  async findById(id: string): Promise<User | null> {
    // Check cache first
    const cached = this.cache.get(id)
    if (cached) return cached

    // Fall back to database
    const user = await this.repository.findById(id)
    if (user) this.cache.set(user.id, user)
    return user
  }
}
```

### Performance Budgets

**Set and enforce performance limits.**

```typescript
interface PerformanceBudget {
  bundleSize: number  // bytes
  loadTime: number    // ms
  domElements: number
  requests: number
}

const budget: PerformanceBudget = {
  bundleSize: 250 * 1024,  // 250KB
  loadTime: 3000,          // 3 seconds
  domElements: 1500,       // Max DOM nodes
  requests: 30,            // Max HTTP requests
}

class PerformanceMonitor {
  checkBudget(): void {
    const metrics = this.getMetrics()

    if (metrics.bundleSize > budget.bundleSize) {
      throw new Error(`Bundle size ${metrics.bundleSize} exceeds budget ${budget.bundleSize}`)
    }
    if (metrics.loadTime > budget.loadTime) {
      throw new Error(`Load time ${metrics.loadTime}ms exceeds budget ${budget.loadTime}ms`)
    }
  }
}
```

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./ddd-patterns.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./coding-practices.md)
