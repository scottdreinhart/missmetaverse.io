# Architecture & Patterns Knowledge Base

> **Purpose:** Source-backed reference for planning, implementation, refactoring, testing, and architectural review.
> **Last Updated:** 2026-11-03
> **Research Status:** Comprehensive — 100+ concepts documented with source citations.

---

tags:
  - status/complete
  - type/reference
  - domain/architecture
---
## How to Use This Knowledge Base

1. Read this index to identify the relevant category.
2. Navigate to the category folder for overview notes.
3. Open individual concept notes for detailed definitions, sources, and guidance.
4. Check source notes for verified citations.
5. Cross-reference related concepts via links.
6. Distinguish between general guidance and verified implementation.

---

## Core Principles

| Concept | Note | Status |
|---------|------|--------|
| SOLID | [[Architecture/solid-principles]] | verified |
| Single Responsibility Principle | [[Architecture/single-responsibility-principle]] | verified |
| Open/Closed Principle | [[Architecture/open-closed-principle]] | verified |
| Liskov Substitution Principle | [[Architecture/liskov-substitution-principle]] | verified |
| Interface Segregation Principle | [[Architecture/interface-segregation-principle]] | verified |
| Dependency Inversion Principle | [[Architecture/dependency-inversion-principle]] | verified |
| DRY | [[Architecture/dry]] | verified |
| KISS | [[Architecture/kiss]] | verified |
| YAGNI | [[Architecture/yagni]] | verified |
| Separation of Concerns | [[Architecture/separation-of-concerns]] | verified |
| High Cohesion | [[Architecture/high-cohesion]] | verified |
| Low Coupling | [[Architecture/low-coupling]] | verified |
| Information Hiding | [[Architecture/information-hiding]] | verified |
| Encapsulation | [[Architecture/encapsulation]] | verified |
| Composition over Inheritance | [[Architecture/composition-over-inheritance]] | verified |
| Law of Demeter | [[Architecture/law-of-demeter]] | verified |
| Tell, Don't Ask | [[Architecture/tell-dont-ask]] | verified |
| Command-Query Separation | [[Architecture/command-query-separation]] | verified |
| Design by Contract | [[Architecture/design-by-contract]] | verified |
| Principle of Least Astonishment | [[Architecture/principle-of-least-astonishment]] | verified |
| Explicit over Implicit | [[Architecture/explicit-over-implicit]] | verified |
| Fail Fast | [[Architecture/fail-fast]] | verified |

---

## Application Architecture

| Concept | Note | Status |
|---------|------|--------|
| Domain-Driven Design | [[Architecture/domain-driven-design]] | verified |
| Hexagonal Architecture | [[Architecture/hexagonal-architecture]] | verified |
| Clean Architecture | [[Architecture/clean-architecture]] | verified |
| Onion Architecture | [[Architecture/onion-architecture]] | verified |
| Layered Architecture | [[Architecture/layered-architecture]] | verified |
| Modular Monolith | [[Architecture/modular-monolith]] | verified |
| Microservices | [[Architecture/microservices]] | verified |
| Service-Oriented Architecture | [[Architecture/service-oriented-architecture]] | verified |
| Event-Driven Architecture | [[Architecture/event-driven-architecture]] | verified |
| CQRS | [[Architecture/cqrs]] | verified |
| Vertical Slice Architecture | [[Architecture/vertical-slice-architecture]] | verified |
| Component-Based Architecture | [[Architecture/component-based-architecture]] | verified |
| Plugin Architecture | [[Architecture/plugin-architecture]] | verified |
| Functional Core, Imperative Shell | [[Architecture/functional-core-imperative-shell]] | verified |
| Dependency Injection | [[Architecture/dependency-injection]] | verified |
| Composition Root | [[Architecture/composition-root]] | verified |

---

## Domain Modeling

| Concept | Note | Status |
|---------|------|--------|
| Ubiquitous Language | [[DDD/ubiquitous-language]] | verified |
| Bounded Context | [[DDD/bounded-context]] | verified |
| Context Map | [[DDD/context-map]] | verified |
| Entity | [[DDD/entity]] | verified |
| Value Object | [[DDD/value-object]] | verified |
| Aggregate | [[DDD/aggregate]] | verified |
| Aggregate Root | [[DDD/aggregate-root]] | verified |
| Domain Invariant | [[DDD/domain-invariant]] | verified |
| Domain Service | [[DDD/domain-service]] | verified |
| Application Service | [[DDD/application-service]] | verified |
| Use Case | [[DDD/use-case]] | verified |
| Repository | [[DDD/repository]] | verified |
| Domain Event | [[DDD/domain-event]] | verified |
| Factory | [[DDD/factory]] | verified |
| Specification | [[DDD/specification]] | verified |
| Anti-Corruption Layer | [[DDD/anti-corruption-layer]] | verified |

---

## Frontend and UI Composition

| Concept | Note | Status |
|---------|------|--------|
| Atomic Design | [[Architecture/atomic-design]] | verified |
| Atoms | [[Architecture/atoms]] | verified |
| Molecules | [[Architecture/molecules]] | verified |
| Organisms | [[Architecture/organisms]] | verified |
| Templates | [[Architecture/templates]] | verified |
| Pages | [[Architecture/pages]] | verified |
| Presentation-Logic Separation | [[Architecture/presentation-logic-separation]] | verified |
| Container and Presentational Components | [[Architecture/container-presentational-components]] | verified |
| Custom Hooks / Composables | [[Architecture/custom-hooks-composables]] | verified |
| Unidirectional Data Flow | [[Architecture/unidirectional-data-flow]] | verified |
| State Machines | [[Architecture/state-machines]] | verified |
| Statecharts | [[Architecture/statecharts]] | verified |
| MVC | [[Architecture/mvc]] | verified |
| MVP | [[Architecture/mvp]] | verified |
| MVVM | [[Architecture/mvvm]] | verified |
| Design Systems | [[Architecture/design-systems]] | verified |
| Design Tokens | [[Architecture/design-tokens]] | verified |
| Headless Components | [[Architecture/headless-components]] | verified |
| Component Composition | [[Architecture/component-composition]] | verified |

---

## Design Patterns

### Creational

| Pattern | Note | Status |
|---------|------|--------|
| Factory Method | [[Architecture/factory-method]] | verified |
| Abstract Factory | [[Architecture/abstract-factory]] | verified |
| Builder | [[Architecture/builder]] | verified |
| Prototype | [[Architecture/prototype]] | verified |
| Singleton | [[Architecture/singleton]] | verified |

### Structural

| Pattern | Note | Status |
|---------|------|--------|
| Adapter | [[Architecture/adapter]] | verified |
| Facade | [[Architecture/facade]] | verified |
| Decorator | [[Architecture/decorator]] | verified |
| Composite | [[Architecture/composite]] | verified |
| Proxy | [[Architecture/proxy]] | verified |
| Bridge | [[Architecture/bridge]] | verified |
| Flyweight | [[Architecture/flyweight]] | verified |

### Behavioral

| Pattern | Note | Status |
|---------|------|--------|
| Strategy | [[Architecture/strategy]] | verified |
| Observer | [[Architecture/observer]] | verified |
| Command | [[Architecture/command]] | verified |
| State | [[Architecture/state]] | verified |
| Chain of Responsibility | [[Architecture/chain-of-responsibility]] | verified |
| Mediator | [[Architecture/mediator]] | verified |
| Iterator | [[Architecture/iterator]] | verified |
| Template Method | [[Architecture/template-method]] | verified |
| Visitor | [[Architecture/visitor]] | verified |
| Memento | [[Architecture/memento]] | verified |
| Interpreter | [[Architecture/interpreter]] | verified |

### Enterprise

| Pattern | Note | Status |
|---------|------|--------|
| Service Layer | [[Architecture/service-layer]] | verified |
| Data Mapper | [[Architecture/data-mapper]] | verified |
| Unit of Work | [[Architecture/unit-of-work]] | verified |
| Identity Map | [[Architecture/identity-map]] | verified |
| Transaction Script | [[Architecture/transaction-script]] | verified |
| Active Record | [[Architecture/active-record]] | verified |
| Repository | [[DDD/repository]] | verified |

---

## Data and Databases

| Concept | Note | Status |
|---------|------|--------|
| CRUD | [[Data Databases/crud]] | verified |
| ACID | [[Data Databases/acid]] | verified |
| Atomicity | [[Data Databases/atomicity]] | verified |
| Consistency | [[Data Databases/consistency]] | verified |
| Isolation | [[Data Databases/isolation]] | verified |
| Durability | [[Data Databases/durability]] | verified |
| Normalization | [[Data Databases/normalization]] | verified |
| Intentional Denormalization | [[Data Databases/intentional-denormalization]] | verified |
| Referential Integrity | [[Data Databases/referential-integrity]] | verified |
| Database Constraints | [[Data Databases/database-constraints]] | verified |
| Transaction Boundaries | [[Data Databases/transaction-boundaries]] | verified |
| Optimistic Concurrency Control | [[Data Databases/optimistic-concurrency-control]] | verified |
| Pessimistic Concurrency Control | [[Data Databases/pessimistic-concurrency-control]] | verified |
| Idempotency | [[Data Databases/idempotency]] | verified |
| Schema Migrations | [[Data Databases/schema-migrations]] | verified |
| Expand-Contract Migrations | [[Data Databases/expand-contract-migrations]] | verified |
| Soft Delete | [[Data Databases/soft-delete]] | verified |
| Retention Policies | [[Data Databases/retention-policies]] | verified |
| Audit Trails | [[Data Databases/audit-trails]] | verified |
| Event Sourcing | [[Data Databases/event-sourcing]] | verified |
| Materialized Views | [[Data Databases/materialized-views]] | verified |
| Projections | [[Data Databases/projections]] | verified |

---

## APIs and Distributed Systems

| Concept | Note | Status |
|---------|------|--------|
| REST | [[APIs Distributed Systems/rest]] | verified |
| API Versioning | [[APIs Distributed Systems/api-versioning]] | verified |
| Backward Compatibility | [[APIs Distributed Systems/backward-compatibility]] | verified |
| Data Transfer Objects | [[APIs Distributed Systems/data-transfer-objects]] | verified |
| Backend for Frontend | [[APIs Distributed Systems/backend-for-frontend]] | verified |
| API Gateway | [[APIs Distributed Systems/api-gateway]] | verified |
| Transactional Outbox | [[APIs Distributed Systems/transactional-outbox]] | verified |
| Inbox | [[APIs Distributed Systems/inbox]] | verified |
| Message Deduplication | [[APIs Distributed Systems/message-deduplication]] | verified |
| Saga | [[APIs Distributed Systems/saga]] | verified |
| Circuit Breaker | [[APIs Distributed Systems/circuit-breaker]] | verified |
| Timeouts | [[APIs Distributed Systems/timeouts]] | verified |
| Cancellation | [[APIs Distributed Systems/cancellation]] | verified |
| Retry with Backoff and Jitter | [[APIs Distributed Systems/retry-with-backoff]] | verified |
| Bulkheads | [[APIs Distributed Systems/bulkheads]] | verified |
| Rate Limiting | [[APIs Distributed Systems/rate-limiting]] | verified |
| Backpressure | [[APIs Distributed Systems/backpressure]] | verified |
| Cache-Aside | [[APIs Distributed Systems/cache-aside]] | verified |
| Read-Through Cache | [[APIs Distributed Systems/read-through-cache]] | verified |
| Write-Through Cache | [[APIs Distributed Systems/write-through-cache]] | verified |
| Eventual Consistency | [[APIs Distributed Systems/eventual-consistency]] | verified |
| Dead-Letter Queues | [[APIs Distributed Systems/dead-letter-queues]] | verified |

---

## Security

| Concept | Note | Status |
|---------|------|--------|
| Principle of Least Privilege | [[Security/principle-of-least-privilege]] | verified |
| Deny by Default | [[Security/deny-by-default]] | verified |
| Complete Mediation | [[Security/complete-mediation]] | verified |
| Defense in Depth | [[Security/defense-in-depth]] | verified |
| Zero Trust | [[Security/zero-trust]] | verified |
| Separation of Duties | [[Security/separation-of-duties]] | verified |
| Secure by Design | [[Security/secure-by-design]] | verified |
| Secure Defaults | [[Security/secure-defaults]] | verified |
| Trust Boundaries | [[Security/trust-boundaries]] | verified |
| Input Validation | [[Security/input-validation]] | verified |
| Contextual Output Encoding | [[Security/contextual-output-encoding]] | verified |
| Parameterized Queries | [[Security/parameterized-queries]] | verified |
| RBAC | [[Security/rbac]] | verified |
| ABAC | [[Security/abac]] | verified |
| Data Minimization | [[Security/data-minimization]] | verified |
| Secrets Management | [[Security/secrets-management]] | verified |
| Threat Modeling | [[Security/threat-modeling]] | verified |

---

## Coding and Type Systems

| Concept | Note | Status |
|---------|------|--------|
| Strict Typing | [[Coding Type Systems/strict-typing]] | verified |
| Parse, Don't Merely Validate | [[Coding Type Systems/parse-dont-validate]] | verified |
| Make Invalid States Unrepresentable | [[Coding Type Systems/make-invalid-states-unrepresentable]] | verified |
| Discriminated Unions | [[Coding Type Systems/discriminated-unions]] | verified |
| Exhaustive Handling | [[Coding Type Systems/exhaustive-handling]] | verified |
| Immutability | [[Coding Type Systems/immutability]] | verified |
| Pure Functions | [[Coding Type Systems/pure-functions]] | verified |
| Explicit Error Modeling | [[Coding Type Systems/explicit-error-modeling]] | verified |
| Resource Lifecycle Management | [[Coding Type Systems/resource-lifecycle]] | verified |
| Structured Concurrency | [[Coding Type Systems/structured-concurrency]] | verified |
| Boundary Validation | [[Coding Type Systems/boundary-validation]] | verified |
| Small Cohesive Modules | [[Coding Type Systems/small-cohesive-modules]] | verified |
| Dependency Hygiene | [[Coding Type Systems/dependency-hygiene]] | verified |
| Accessibility by Design | [[Coding Type Systems/accessibility-by-design]] | verified |
| Internationalization by Design | [[Coding Type Systems/internationalization-by-design]] | verified |

---

## Quality and Delivery

| Concept | Note | Status |
|---------|------|--------|
| Test-Driven Development | [[Quality & Testing/test-driven-development]] | verified |
| Behavior-Driven Development | [[Quality & Testing/behavior-driven-development]] | verified |
| Risk-Based Testing | [[Quality & Testing/risk-based-testing]] | verified |
| Property-Based Testing | [[Quality & Testing/property-based-testing]] | verified |
| Mutation Testing | [[Quality & Testing/mutation-testing]] | verified |
| Contract Testing | [[Quality & Testing/contract-testing]] | verified |
| Architecture Fitness Functions | [[Quality & Testing/architecture-fitness-functions]] | verified |
| Continuous Integration | [[Quality & Testing/continuous-integration]] | verified |
| Reproducible Builds | [[Quality & Testing/reproducible-builds]] | verified |
| Observability | [[Quality & Testing/observability]] | verified |
| Service-Level Objectives | [[Quality & Testing/service-level-objectives]] | verified |
| Architecture Decision Records | [[Quality & Testing/architecture-decision-records]] | verified |
| Incremental Refactoring | [[Quality & Testing/incremental-refactoring]] | verified |
| Evolutionary Architecture | [[Quality & Testing/evolutionary-architecture]] | verified |
| Performance Budgets | [[Quality & Testing/performance-budgets]] | verified |

---

## Data-Driven Approaches

| Concept | Note | Status |
|---------|------|--------|
| Data-Driven Design | [[Data-Driven Approaches/data-driven-design]] | verified |
| Configuration-Driven Development | [[Data-Driven Approaches/configuration-driven-development]] | verified |
| Schema-Driven Development | [[Data-Driven Approaches/schema-driven-development]] | verified |
| Metadata-Driven UI | [[Data-Driven Approaches/metadata-driven-ui]] | verified |
| Contract-First Development | [[Data-Driven Approaches/contract-first-development]] | verified |
| Declarative Programming | [[Data-Driven Approaches/declarative-programming]] | verified |
| Table-Driven Logic | [[Data-Driven Approaches/table-driven-logic]] | verified |
| Data-Oriented Design | [[Data-Driven Approaches/data-oriented-design]] | verified |
| Single Source of Truth | [[Data-Driven Approaches/single-source-of-truth]] | verified |

---

## Project File Conventions

| Convention | Note | Status |
|------------|------|--------|
| *.view.tsx | [[Project File Conventions/view-file-convention]] | verified |
| *.logic.ts | [[Project File Conventions/logic-file-convention]] | verified |
| *.data.ts | [[Project File Conventions/data-file-convention]] | verified |
| *.hook.ts | [[Project File Conventions/hook-file-convention]] | verified |
| *.schema.ts | [[Project File Conventions/schema-file-convention]] | verified |
| *.types.ts | [[Project File Conventions/types-file-convention]] | verified |
| *.mapper.ts | [[Project File Conventions/mapper-file-convention]] | verified |
| *.port.ts | [[Project File Conventions/port-file-convention]] | verified |
| *.adapter.ts | [[Project File Conventions/adapter-file-convention]] | verified |
| *.repository.ts | [[Project File Conventions/repository-file-convention]] | verified |
| *.use-case.ts | [[Project File Conventions/use-case-file-convention]] | verified |
| *.entity.ts | [[Project File Conventions/entity-file-convention]] | verified |
| *.value-object.ts | [[Project File Conventions/value-object-file-convention]] | verified |
| *.policy.ts | [[Project File Conventions/policy-file-convention]] | verified |
| *.event.ts | [[Project File Conventions/event-file-convention]] | verified |

---

## Related Indexes

- [[Sources/00-index]] — Source citations
- [[Copilot-Knowledge-Entry]] — Copilot consumption guide
- [[Research-Status]] — Research status manifest
- [[Project-Architecture-Mapping]] — Project architecture mapping

---

**End of Architecture & Patterns Index**
- [Quality, Delivery & Maintainability](Architecture/quality-delivery-maintainability.md) — TDD, CI, SLOs
- [Core Principles](Architecture/core-principles.md) — DRY, KISS, YAGNI, etc.
- [File-Level Separation Conventions](Architecture/file-level-separation-conventions.md) — Naming conventions
- [Project Structure Mapping](Architecture/project-structure-mapping.md) — Pattern-to-folder mapping

### [Integration](Integration/)
Tool integration and pipeline configuration.

- [Integration Master Config](Integration/integration-master-config.md) — Vite, TS, pnpm master config
- [Linting & Husky Pipeline](Integration/linting-husky-pipeline.md) — ESLint, Prettier, git hooks
- [TS Path Resolution](Integration/ts-path-resolution.md) — Path aliases across tools
- [Docker & Nginx Deployment](Integration/docker-nginx-deployment.md) — Multi-stage builds, Nginx
- [CI/CD GitHub Actions](Integration/cicd-github-actions.md) — Validate, test, build, deploy

### [Commit Management](Commit%20Management/)
Commit workflow and release tooling.

- [Commit Management Integration](Commit%20Management/commit-management-integration.md) — End-to-end workflow
- [Commitizen & cz-git](Commit%20Management/commitizen-cz-git.md) — Interactive commits
- [Commitlint CLI](Commit%20Management/commitlint-cli-config.md) — Commit message linting
- [Husk y Git Hooks](Commit%20Management/husky-git-hooks.md) — Client-side hooks
- [Validate Branch Name](Commit%20Management/validate-branch-name.md) — Branch naming
- [Conventional Changelog](Commit%20Management/conventional-changelog.md) — Changelog generation
- [Release-it](Commit%20Management/release-it.md) — Automated releases

### [TypeScript](TypeScript/)
TypeScript language features and best practices.

- [TypeScript Fundamentals](TypeScript/ts-fundamentals.md)
- [TypeScript Advanced Types](TypeScript/ts-advanced-types.md)
- [TypeScript Best Practices](TypeScript/ts-best-practices.md)
- [TypeScript Decorators](TypeScript/ts-decorators.md)
- [TypeScript Narrowing](TypeScript/ts-narrowing.md)
- [TypeScript Optimization & Performance](TypeScript/ts-optimization-performance.md)
- [TypeScript Release Notes](TypeScript/ts-release-notes.md)
- [TypeScript Security Best Practices](TypeScript/ts-security-best-practices.md)
- [TypeScript tsconfig](TypeScript/ts-tsconfig.md)
- [TypeScript Strict Mode](TypeScript/typescript-strict-mode.md)

### [React](React/)
React 19 patterns and practices.

- [React Patterns](React/react-patterns.md) — Hooks, state, performance
- [React Performance & Security](React/react-performance-security.md)

### [Bundler](Bundler/)
Vite configuration and optimization.

- [Vite Configuration](Bundler/vite-configuration.md)
- [Vite Optimization & Security](Bundler/vite-optimization-security.md)

### [Testing](Testing/)
Unit, integration, and E2E testing.

- [Testing Patterns](Testing/testing-patterns.md) — Vitest, Playwright
- [Vitest Testing](Testing/vitest-testing.md)
- [Playwright E2E](playwright-e2e.md)

### [Package Manager](Package%20Manager/)
pnpm workspace and dependency management.

- [pnpm Workspace](Package%20Manager/pnpm-workspace.md)
- [pnpm Best Practices](Package%20Manager/pnpm-best-practices.md)

### [Tailwind CSS](TailwindsCSS/)
Tailwind CSS patterns and optimization.

- [Tailwind CSS Patterns](TailwindsCSS/tailwind-css-patterns.md)
- [Tailwind CSS Optimization & Performance](TailwindsCSS/tw-optimization-performance.md)

### [ShadCN](ShadCN/)
shadcn/ui component library patterns.

- [ShadCN UI Patterns](ShadCN/shadcn-ui-patterns.md)
- [ShadCN Best Practices](ShadCN/shadcn-best-practices.md)

### [Cascading Stylesheets](Cascading%20Stylesheets/)
CSS fundamentals and performance.

- [CSS Fundamentals](Cascading Stylesheets/css-fundamentals.md)
- [CSS3 Performance & Security](Cascading Stylesheets/css3-performance-security.md)

### [Hypertext HTML](Hypertext%20HTML/)
HTML semantic markup and accessibility.

- [HTML Semantic Patterns](Hypertext HTML/html-semantic-patterns.md)
### [DDD](DDD/)
Domain-Driven Design modeling concepts and patterns.

- [DDD Overview](DDD/README.md) — 16 DDD concepts

### [Data Databases](Data%20Databases/)
Database design, data modeling, and data management.

- [Data & Databases Overview](Data%20Databases/README.md) — 22 database concepts

### [Data-Driven Approaches](Data-Driven%20Approaches/)
Data-driven design, configuration-driven development, and schema-driven development.

- [Data-Driven Overview](Data-Driven%20Approaches/README.md) — 9 data-driven concepts

### [APIs Distributed Systems](APIs%20Distributed%20Systems/)
API design, distributed systems patterns, and reliability.

- [APIs & Distributed Systems Overview](APIs%20Distributed%20Systems/README.md) — 22 distributed systems concepts

### [Security](Security/)
Security principles, patterns, and best practices.

- [Security Overview](Security/README.md) — 17 security concepts

### [Coding Type Systems](Coding%20Type%20Systems/)
TypeScript type system patterns and coding best practices.

- [Coding & Type Systems Overview](Coding%20Type%20Systems/README.md) — 15 coding concepts

### [Quality Delivery](Quality%20Delivery/)
Testing, quality assurance, and delivery concepts.

- [Quality & Delivery Overview](Quality%20Delivery/README.md) — 15 quality concepts

### [Project File Conventions](Project%20File%20Conventions/)
File naming conventions for React + TypeScript projects.

- [Project File Conventions Overview](Project%20File%20Conventions/README.md) — 15 file conventions (all complete)

### [Frontend UI](Frontend%20UI/)
Frontend and UI patterns including accessibility, performance, and DevOps.

- [Accessibility & a11y](Frontend%20UI/accessibility-a11y-patterns.md)
- [Performance Optimization](Frontend%20UI/performance-optimization-patterns.md)
- [Profiling](Frontend%20UI/profiling-patterns.md)
- [Logging](Frontend%20UI/logging-patterns.md)
- [Monitoring](Frontend%20UI/monitoring-patterns.md)
- [Alerting](Frontend%20UI/alerting-patterns.md)
- [Docker Deployment](Frontend%20UI/docker-deployment-patterns.md)
- [Nginx](Frontend%20UI/nginx-patterns.md)
- [Deployment](Frontend%20UI/deployment-patterns.md)
- [Version Control](Frontend%20UI/version-control-patterns.md)
- [Git](Frontend%20UI/git-patterns.md)
- [GitHub Actions](Frontend%20UI/github-actions-patterns.md)
- [CI/CD](Frontend%20UI/ci-cd-patterns.md)
---

tags:
  - status/complete
  - type/reference
  - domain/architecture
---
## Source Notes

See [[Sources/README|Sources Index]] for all verified source citations.

---

tags:
  - status/complete
  - type/reference
  - domain/architecture
---
## Research Status

See [[Research-Status]] for the full concept inventory with research status per concept.

---

tags:
  - status/complete
  - type/reference
  - domain/architecture
---
## Project Architecture Mapping

See [[Project-Architecture-Mapping]] for how concepts map to the actual project.

---

tags:
  - status/complete
  - type/reference
  - domain/architecture
---
## Copilot Consumption Guide

See [[Copilot-Consumption-Guide]] for instructions on how Copilot should use this knowledge base.

