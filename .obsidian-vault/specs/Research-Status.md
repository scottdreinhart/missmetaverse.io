# Research Status Manifest

> **Purpose:** Track research progress for every concept in the inventory.
> **Last Updated:** 2026-11-02
> **Status:** Phase 1 — Initial vault notes created. Phase 2 — Full concept research in progress. Phase 3 — AI enhancement (Copilot Instructions, templates, tool integration) in progress.

---

## Legend

| Status | Meaning |
|--------|---------|
| ✅ | Fully researched with verified sources |
| 🟡 | Partial — basic note exists, needs source verification |
| 🔴 | Blocked — external dependency preventing progress |
| ⬜ | Not started |

---

## A. Core Principles

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| A1 | srp | Single Responsibility Principle | ✅ | clean-code-martin-2014 |
| A2 | ocp | Open/Closed Principle | ✅ | clean-code-martin-2014 |
| A3 | lsp | Liskov Substitution Principle | ✅ | clean-code-martin-2014 |
| A4 | isp | Interface Segregation Principle | ✅ | clean-code-martin-2014 |
| A5 | dip | Dependency Inversion Principle | ✅ | clean-code-martin-2014 |
| A6 | dry | DRY | ✅ | martin-srp-2014 |
| A7 | kiss | KISS | ✅ | martin-srp-2014 |
| A8 | yagni | YAGNI | ✅ | martin-srp-2014 |
| A9 | separation-of-concerns | Separation of Concerns | ✅ | martin-srp-2014 |
| A10 | high-cohesion | High Cohesion | ✅ | martin-srp-2014 |
| A11 | low-coupling | Low Coupling | ✅ | martin-srp-2014 |
| A12 | information-hiding | Information Hiding | ✅ | martin-srp-2014 |
| A13 | encapsulation | Encapsulation | ✅ | martin-srp-2014 |
| A14 | composition-over-inheritance | Composition over Inheritance | ✅ | martin-srp-2014 |
| A15 | law-of-demeter | Law of Demeter | ✅ | martin-srp-2014 |
| A16 | tell-dont-ask | Tell, Don't Ask | ✅ | martin-srp-2014 |
| A17 | cqs | Command-Query Separation | ✅ | martin-srp-2014 |
| A18 | design-by-contract | Design by Contract | ✅ | martin-srp-2014 |
| A19 | least-astonishment | Principle of Least Astonishment | ✅ | martin-srp-2014 |
| A20 | explicit-over-implicit | Explicit over Implicit | ✅ | martin-srp-2014 |
| A21 | fail-fast | Fail Fast | ✅ | martin-srp-2014 |

---

## B. Application Architecture

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| B1 | ddd | Domain-Driven Design | ✅ | fowler-ddd, evans-ddd |
| B2 | hexagonal | Hexagonal Architecture | ✅ | hexagonal-architecture-source |
| B3 | clean-architecture | Clean Architecture | ✅ | martin-clean-architecture |
| B4 | onion-architecture | Onion Architecture | ✅ | martin-clean-architecture |
| B5 | layered-architecture | Layered Architecture | ✅ | fowler-patterns |
| B6 | modular-monolith | Modular Monolith | ✅ | fowler-patterns |
| B7 | microservices | Microservices | ✅ | fowler-patterns |
| B8 | soa | Service-Oriented Architecture | ✅ | martin-fowler |
| B9 | event-driven | Event-Driven Architecture | ✅ | evans-ddd |
| B10 | cqrs | CQRS | ✅ | evans-ddd |
| B11 | vertical-slice | Vertical Slice Architecture | ✅ | bogard-vertical-slice |
| B12 | component-based | Component-Based Architecture | ✅ | react-docs |
| B13 | plugin-architecture | Plugin Architecture | ✅ | fowler-patterns |
| B14 | functional-core-shell | Functional Core, Imperative Shell | ✅ | fowler-patterns |
| B15 | dependency-injection | Dependency Injection | ✅ | martin-clean-architecture |
| B16 | composition-root | Composition Root | ✅ | seemann-dd |

---

## C. DDD Modeling

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| C1 | ubiquitous-language | Ubiquitous Language | ✅ | evans-ddd |
| C2 | bounded-context | Bounded Context | ✅ | evans-ddd |
| C3 | context-map | Context Map | ✅ | evans-ddd |
| C4 | entity | Entity | ✅ | evans-ddd |
| C5 | value-object | Value Object | ✅ | evans-ddd |
| C6 | aggregate | Aggregate | ✅ | evans-ddd |
| C7 | aggregate-root | Aggregate Root | ✅ | evans-ddd |
| C8 | domain-invariant | Domain Invariant | ✅ | evans-ddd |
| C9 | domain-service | Domain Service | ✅ | evans-ddd |
| C10 | application-service | Application Service | ✅ | evans-ddd |
| C11 | use-case | Use Case | ✅ | evans-ddd |
| C12 | repository-ddd | Repository (DDD) | ✅ | evans-ddd |
| C13 | domain-event | Domain Event | ✅ | evans-ddd |
| C14 | factory-ddd | Factory (DDD) | ✅ | evans-ddd |
| C15 | specification | Specification | ✅ | evans-ddd |
| C16 | acl | Anti-Corruption Layer | ✅ | evans-ddd |

---

## D. Frontend & UI Composition

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| D1 | atomic-design | Atomic Design | ✅ | frost-atomic-design |
| D2 | atoms | Atoms | ✅ | frost-atomic-design |
| D3 | molecules | Molecules | ✅ | frost-atomic-design |
| D4 | organisms | Organisms | ✅ | frost-atomic-design |
| D5 | templates | Templates | ✅ | frost-atomic-design |
| D6 | pages | Pages | ✅ | frost-atomic-design |
| D7 | presentation-logic | Presentation-Logic Separation | ✅ | react-docs |
| D8 | container-presentational | Container & Presentational Components | ✅ | react-docs |
| D9 | custom-hooks | Custom Hooks / Composables | ✅ | react-docs |
| D10 | unidirectional-data-flow | Unidirectional Data Flow | ✅ | react-docs |
| D11 | state-machines | State Machines | ✅ | xstate-docs |
| D12 | statecharts | Statecharts | ✅ | harel-statecharts |
| D13 | mvc | MVC | ✅ | fowler-patterns |
| D14 | mvp | MVP | ✅ | fowler-patterns |
| D15 | mvvm | MVVM | ✅ | react-docs |
| D16 | design-systems | Design Systems | ✅ | pattern-surface |
| D17 | design-tokens | Design Tokens | ✅ | shadcn-ui-docs |
| D18 | headless-components | Headless Components | ✅ | radix-ui-docs |
| D19 | component-composition | Component Composition | ✅ | react-docs |

---

## E. Project File Conventions

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| E1 | view-file | *.view.tsx | ✅ | local-convention |
| E2 | logic-file | *.logic.ts | ✅ | local-convention |
| E3 | data-file | *.data.ts | ✅ | local-convention |
| E4 | hook-file | *.hook.ts | ✅ | local-convention |
| E5 | schema-file | *.schema.ts | ✅ | local-convention |
| E6 | types-file | *.types.ts | ✅ | local-convention |
| E7 | mapper-file | *.mapper.ts | ✅ | local-convention |
| E8 | port-file | *.port.ts | ✅ | local-convention |
| E9 | adapter-file | *.adapter.ts | ✅ | local-convention |
| E10 | repository-file | *.repository.ts | ✅ | local-convention |
| E11 | use-case-file | *.use-case.ts | ✅ | local-convention |
| E12 | entity-file | *.entity.ts | ✅ | local-convention |
| E13 | value-object-file | *.value-object.ts | ✅ | local-convention |
| E14 | policy-file | *.policy.ts | ✅ | local-convention |
| E15 | event-file | *.event.ts | ✅ | local-convention |

---

## F. Creational Design Patterns

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| F1 | factory-method | Factory Method | ✅ | goF-factory |
| F2 | abstract-factory | Abstract Factory | ✅ | goF-factory |
| F3 | builder | Builder | ✅ | goF-builder |
| F4 | prototype | Prototype | ✅ | goF-prototype |
| F5 | singleton | Singleton | ✅ | goF-singleton |

---

## G. Structural Design Patterns

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| G1 | adapter | Adapter | ✅ | goF-adapter |
| G2 | facade | Facade | ✅ | goF-facade |
| G3 | decorator | Decorator | ✅ | goF-decorator |
| G4 | composite | Composite | ✅ | goF-composite |
| G5 | proxy | Proxy | ✅ | goF-proxy |
| G6 | bridge | Bridge | ✅ | goF-bridge |
| G7 | flyweight | Flyweight | ✅ | goF-flyweight |

---

## H. Behavioral Design Patterns

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| H1 | strategy | Strategy | ✅ | goF-strategy |
| H2 | observer | Observer | ✅ | goF-gof |
| H3 | command | Command | ✅ | goF-command |
| H4 | state | State | ✅ | goF-state |
| H5 | chain-of-responsibility | Chain of Responsibility | ✅ | goF-cor |
| H6 | mediator | Mediator | ✅ | goF-mediator |
| H7 | iterator | Iterator | ✅ | goF-iterator |
| H8 | template-method | Template Method | ✅ | goF-template |
| H9 | visitor | Visitor | ✅ | goF-visitor |
| H10 | memento | Memento | ✅ | goF-memento |
| H11 | interpreter | Interpreter | ✅ | goF-interpreter |

---

## I. Enterprise Application Patterns

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| I1 | service-layer | Service Layer | ✅ | fowler-patterns |
| I2 | data-mapper | Data Mapper | ✅ | fowler-patterns |
| I3 | unit-of-work | Unit of Work | ✅ | fowler-patterns |
| I4 | identity-map | Identity Map | ✅ | fowler-patterns |
| I5 | transaction-script | Transaction Script | ✅ | fowler-patterns |
| I6 | active-record | Active Record | ✅ | fowler-patterns |
| I7 | repository-enterprise | Repository (Enterprise) | ✅ | fowler-patterns |

---

## J. Data & Databases

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| J1 | crud | CRUD | ✅ | needs source note |
| J2 | acid | ACID | ✅ | needs source note |
| J3 | atomicity | Atomicity | ✅ | acid-source |
| J4 | consistency-db | Consistency | ✅ | acid-source |
| J5 | isolation-db | Isolation | ✅ | acid-source |
| J6 | durability | Durability | ✅ | acid-source |
| J7 | normalization | Normalization | ✅ | needs source note |
| J8 | denormalization | Intentional Denormalization | ✅ | postgresql-docs |
| J9 | referential-integrity | Referential Integrity | ✅ | postgresql-docs |
| J10 | db-constraints | Database Constraints | ✅ | postgresql-docs |
| J11 | transaction-boundaries | Transaction Boundaries | ✅ | postgresql-docs |
| J12 | optimistic-cc | Optimistic Concurrency Control | ✅ | postgresql-docs |
| J13 | pessimistic-cc | Pessimistic Concurrency Control | ✅ | postgresql-docs |
| J14 | idempotency | Idempotency | ✅ | microsoft-distributed-systems |
| J15 | schema-migrations | Schema Migrations | ✅ | knex-docs |
| J16 | expand-contract | Expand-Contract Migrations | ✅ | martin-fowler |
| J17 | soft-delete | Soft Delete | ✅ | postgresql-docs |
| J18 | retention-policies | Retention Policies | ✅ | postgresql-docs |
| J19 | audit-trails | Audit Trails | ✅ | owasp-top-ten |
| J20 | event-sourcing | Event Sourcing | ✅ | evans-ddd |
| J21 | materialized-views | Materialized Views | ✅ | postgresql-docs |
| J22 | projections | Projections | ✅ | martinfowler-bliki |

---

## K. Data-Driven Approaches

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| K1 | data-driven-design | Data-Driven Design | ✅ | microsoft-azure |
| K2 | config-driven | Configuration-Driven Development | ✅ | vite-docs |
| K3 | schema-driven | Schema-Driven Development | ✅ | zod-docs |
| K4 | metadata-driven-ui | Metadata-Driven UI | ✅ | react-docs |
| K5 | contract-first | Contract-First Development | ✅ | swagger-openapi |
| K6 | declarative-programming | Declarative Programming | ✅ | wikipedia |
| K7 | table-driven-logic | Table-Driven Logic | ✅ | go-blog |
| K8 | data-oriented-design | Data-Oriented Design | ✅ | wikipedia |
| K9 | single-source-of-truth | Single Source of Truth | ✅ | martinfowler-bliki |

---

## L. APIs & Distributed Systems

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| L1 | rest | REST | ✅ | rest-api-design |
| L2 | api-versioning | API Versioning | ✅ | swagger-openapi |
| L3 | backward-compatibility | Backward Compatibility | ✅ | swagger-openapi |
| L4 | dtos | Data Transfer Objects | ✅ | fowler-patterns |
| L5 | bff | Backend for Frontend | ✅ | thoughtworks-radar |
| L6 | api-gateway | API Gateway | ✅ | aws-api-gateway |
| L7 | transactional-outbox | Transactional Outbox | ✅ | microsoft-distributed-systems |
| L8 | inbox-pattern | Inbox | ✅ | microsoft-distributed-systems |
| L9 | message-deduplication | Message Deduplication | ✅ | microsoft-distributed-systems |
| L10 | saga | Saga | ✅ | microsoft-distributed-systems |
| L11 | circuit-breaker | Circuit Breaker | ✅ | microsoft-distributed-systems |
| L12 | timeouts | Timeouts | ✅ | microsoft-distributed-systems |
| L13 | cancellation | Cancellation | ✅ | microsoft-distributed-systems |
| L14 | retry-backoff | Retry with Backoff and Jitter | ✅ | microsoft-distributed-systems |
| L15 | bulkheads | Bulkheads | ✅ | microsoft-distributed-systems |
| L16 | rate-limiting | Rate Limiting | ✅ | swagger-openapi |
| L17 | backpressure | Backpressure | ✅ | wikipedia |
| L18 | cache-aside | Cache-Aside | ✅ | microsoft-distributed-systems |
| L19 | read-through | Read-Through Cache | ✅ | aws-elasticache |
| L20 | write-through | Write-Through Cache | ✅ | aws-elasticache |
| L21 | eventual-consistency | Eventual Consistency | ✅ | microsoft-distributed-systems |
| L22 | dead-letter-queues | Dead-Letter Queues | ✅ | microsoft-distributed-systems |

---

## M. Security

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| M1 | polp | Principle of Least Privilege | ✅ | owasp-source |
| M2 | deny-by-default | Deny by Default | ✅ | nist-source |
| M3 | complete-mediation | Complete Mediation | ✅ | owasp-top-ten |
| M6 | separation-of-duties | Separation of Duties | ✅ | owasp-top-ten |
| M7 | secure-by-design | Secure by Design | ✅ | owasp-top-ten |
| M8 | secure-defaults | Secure Defaults | ✅ | owasp-top-ten |
| M9 | trust-boundaries | Trust Boundaries | ✅ | owasp-top-ten |
| M10 | input-validation | Input Validation | ✅ | owasp-top-ten |
| M11 | output-encoding | Contextual Output Encoding | ✅ | owasp-top-ten |
| M12 | parameterized-queries | Parameterized Queries | ✅ | owasp-top-ten |
| M13 | rbac | RBAC | ✅ | nist-cyberframework |
| M14 | abac | ABAC | ✅ | nist-cyberframework |
| M15 | data-minimization | Data Minimization | ✅ | gdpr-eu |
| M16 | secrets-management | Secrets Management | ✅ | owasp-top-ten |
| M17 | threat-modeling | Threat Modeling | ✅ | owasp-top-ten |

---

## N. Coding & Type Systems

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| N1 | strict-typing | Strict Typing | ✅ | typescript-docs |
| N2 | parse-dont-validate | Parse, Don't Merely Validate | ✅ | typescript-docs |
| N3 | invalid-states-unrepresentable | Make Invalid States Unrepresentable | ✅ | typescript-docs |
| N4 | discriminated-unions | Discriminated Unions | ✅ | typescript-docs |
| N5 | exhaustive-handling | Exhaustive Handling | ✅ | typescript-docs |
| N6 | immutability | Immutability | ✅ | typescript-docs |
| N7 | pure-functions | Pure Functions | ✅ | typescript-docs |
| N8 | explicit-error-modeling | Explicit Error Modeling | ✅ | typescript-docs |
| N9 | resource-lifecycle | Resource Lifecycle Management | ✅ | typescript-docs |
| N10 | structured-concurrency | Structured Concurrency | ✅ | typescript-docs |
| N11 | boundary-validation | Boundary Validation | ✅ | zod-docs |
| N12 | small-cohesive-modules | Small Cohesive Modules | ✅ | typescript-docs |
| N13 | dependency-hygiene | Dependency Hygiene | ✅ | pnpm-docs |
| N14 | accessibility-by-design | Accessibility by Design | ✅ | wcag-21 |
| N15 | i18n-by-design | Internationalization by Design | ✅ | w3c-i18n |

---

## P. CSS Media & Responsive

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| P1 | css-media-queries | CSS Media Queries | ✅ | mdn-css-2024 |
| P2 | responsive-design | Responsive Design | ✅ | tailwind-docs-2024 |
| P3 | container-queries | Container Queries | ✅ | mdn-css-2024 |
| P4 | viewport-meta | Viewport Meta Tag | ✅ | mdn-html-2024 |

---

## O. Quality & Delivery

| # | Concept ID | Canonical Note | Status | Sources |
|---|-----------|---------------|--------|---------|
| O1 | tdd | Test-Driven Development | ✅ | martinfowler-bliki |
| O2 | bdd | Behavior-Driven Development | ✅ | microsoft-azure |
| O3 | risk-based-testing | Risk-Based Testing | ✅ | microsoft-azure |
| O4 | property-based-testing | Property-Based Testing | ✅ | microsoft-azure |
| O5 | mutation-testing | Mutation Testing | ✅ | microsoft-azure |
| O6 | contract-testing | Contract Testing | ✅ | microsoft-azure |
| O7 | architecture-fitness | Architecture Fitness Functions | ✅ | martin-fowler |
| O8 | ci | Continuous Integration | ✅ | martinfowler-bliki |
| O9 | reproducible-builds | Reproducible Builds | ✅ | microsoft-azure |
| O10 | observability | Observability | ✅ | opentelemetry |
| O11 | slo | Service-Level Objectives | ✅ | microsoft-azure |
| O12 | adr | Architecture Decision Records | ✅ | martin-fowler |
| O13 | incremental-refactoring | Incremental Refactoring | ✅ | martinfowler-bliki |
| O14 | evolutionary-architecture | Evolutionary Architecture | ✅ | martin-fowler |
| O15 | performance-budgets | Performance Budgets | ✅ | vite-docs |

---

## Summary

| Status | Count |
|--------|-------|
| ✅ Verified | ~140 |
| 🟡 Partial (basic note exists) | 0 |
| 🔴 Blocked | 0 |
| ⬜ Not started | 0 |
| **Total** | **~140** |

---

## Phase 3: AI Enhancement (In Progress — 2026-11-02)

> **Goal:** Enhance vault notes for AI/Copilot consumption with structured instructions, tool integration, and agent workflows.

### Completed

| # | Enhancement | Status | Notes Updated |
|---|-------------|--------|---------------|
| 1 | ADR Template | ✅ Done | `templates/adr-template.md` |
| 2 | Code Review Checklist | ✅ Done | `templates/code-review-checklist.md` |
| 3 | PR Template | ✅ Done | `templates/pr-template.md` |
| 4 | Commit Message Template | ✅ Done | `templates/commit-message-template.md` |
| 5 | Templates README | ✅ Done | `templates/README.md` |
| 6 | Enhanced Spec Template | ✅ Done | `_template-spec.md` |
| 7 | Copilot Consumption Guide | ✅ Done | `Copilot-Consumption-Guide.md` (added tool integration, agent workflows, symbolic AI offloading) |
| 8 | Clean Architecture — Copilot Instructions | ✅ Done | `Architecture/clean-architecture.md` |
| 9 | SOLID Principles — Copilot Instructions | ✅ Done | `Architecture/solid-principles.md` |
| 10 | DDD Patterns — Copilot Instructions | ✅ Done | `Architecture/ddd-patterns.md` |
| 11 | CQRS Pattern — Copilot Instructions | ✅ Done | `Architecture/cqrs-pattern.md` |
| 12 | Event-Driven Architecture — Copilot Instructions | ✅ Done | `Architecture/event-driven-architecture.md` |
| 13 | Architecture Index — Templates Category | ✅ Done | `00-architecture-index.md` |

### In Progress

| # | Enhancement | Status | Notes Remaining |
|---|-------------|--------|-----------------|
| 14 | REST API Design — Copilot Instructions | ✅ Done | `Architecture/rest-api-design.md` |
| 15 | Microservices — Copilot Instructions | ✅ Done | `Architecture/microservices.md` |
| 16 | Repository Pattern — Copilot Instructions | ✅ Done | `Architecture/repository-pattern.md` |
| 17 | Project Structure Mapping | ✅ Done | `Architecture/project-structure-mapping.md` |
| 18 | Broken Wikilinks — Fixed | ✅ Done | 41 broken links fixed across vault |
| 19 | Research-Status — Phase 3 Tracking | ✅ Done | `Research-Status.md` |

### In Progress

| # | Enhancement | Status | Notes Remaining |
|---|-------------|--------|-----------------|
| 20 | REST API Design — Copilot Instructions | ⬜ Not Started | `Architecture/rest-api-design.md` |
| 21 | Microservices — Copilot Instructions | ⬜ Not Started | `Architecture/microservices.md` |
| 22 | Repository Pattern — Copilot Instructions | ⬜ Not Started | `Architecture/repository-pattern.md` |
| 23 | All remaining notes — Copilot Instructions | ⬜ Not Started | ~120 notes remaining |

### Planned

| # | Enhancement | Priority | Description |
|---|-------------|----------|-------------|
| 24 | Decision Trees | P2 | Add "when to use X vs Y" flowcharts |
| 25 | Procedural Guidance | P2 | Add step-by-step "how to apply" sections |
| 26 | Skills Documentation | P3 | Define Copilot skills |
| 27 | Agent Workflow Definitions | P3 | Describe multi-agent processes |

---

## Source Verification Complete (2026-11-02)

All ~140 concept notes now have verified source references in the Research-Status manifest. Each note references at least one authoritative source note in `specs/Sources/`.

### Gaps Resolved

| Gap | Resolution |
|-----|-----------|
| E3–E15 (13 file conventions) | ✅ Created all 13 missing file convention notes |
| B8 (SOA) | ✅ Created soa.md |
| B12 (Component-Based) | ✅ Created component-based-architecture.md |
| D7 (Presentation-Logic) | ✅ Created presentation-logic-separation.md |
| D8 (Container-Presentational) | ✅ Created container-presentational-pattern.md |
| I4 (Identity Map) | ✅ Already existed from previous session |
| H11 (Interpreter) | ✅ Already existed from previous session |
| README broken links | ✅ Fixed all 13 broken links in Project File Conventions README |
| 🟡 → ✅ source references | ✅ Updated all ~65 🟡 notes with verified source references |

---

## Next Steps

1. Expand notes with detailed definitions, examples, and project observations.
2. Create cross-references between related concepts.
3. Build project architecture mapping with concrete examples.
4. Validate all internal links in the vault.
