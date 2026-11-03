# Project Architecture Mapping

> **Purpose:** Map researched concepts to actual project implementation.
> **Last Updated:** 2026-11-03
> **Project:** React 19 + Vite + TypeScript + Tailwind CSS + pnpm

---

tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
---
## Project Overview

| Aspect | Value |
|--------|-------|
| **Editor** | Visual Studio Code |
| **AI Assistant** | GitHub Copilot (Qwen 3.6 35B A3B NVFP4) |
| **Frontend Framework** | React 19 |
| **Build Tool** | Vite |
| **Type System** | TypeScript strict mode |
| **Testing** | Playwright (E2E), Vitest (unit) |
| **Styling** | Tailwind CSS, ShadCN UI |
| **Linting** | ESLint with TypeScript plugin |
| **Formatting** | Prettier |
| **Package Manager** | pnpm |
| **State Management** | Jotai |
| **Validation** | Zod |
| **Routing** | react-router |
| **i18n** | i18next, react-i18next |
| **Rich Text** | Tiptap |
| **Sanitization** | DOMPurify |
| **Accessibility** | @axe-core/react |
| **Monitoring** | Sentry |
| **Charts** | Recharts |
| **Icons** | Lucide |
| **Dates** | date-fns |

---

## Concept-to-Code Mapping

| Concept | Note | Project Implementation | Status |
|---------|------|------------------------|--------|
| SOLID | [[Architecture/solid-principles]] | TypeScript classes and interfaces | declared |
| Clean Architecture | [[Architecture/clean-architecture]] | Layered folder structure | declared |
| DDD | [[Architecture/domain-driven-design]] | Domain models | declared |
| Atomic Design | [[Architecture/atomic-design]] | UI components | declared |
| REST | [[APIs Distributed Systems/rest]] | API endpoints | declared |
| Security | [[Security/principle-of-least-privilege]] | Auth middleware | declared |
| Testing | [[Quality & Testing/test-driven-development]] | Playwright, Vitest | declared |
| Strict Typing | [[Coding Type Systems/strict-typing]] | TypeScript strict mode | declared |
| DRY | [[Architecture/dry]] | Shared utilities | declared |
| KISS | [[Architecture/kiss]] | Simple implementations | declared |
| YAGNI | [[Architecture/yagni]] | Minimal features | declared |

---

## Command Mapping

| Command | Purpose | Status |
|---------|---------|--------|
| quality:lint:* | Linting commands | declared |
| quality:test:* | Testing commands | declared |
| quality:arch:* | Architecture checks | declared |
| run-gate.mjs | Quality gate orchestration | declared |
| manifest.mjs | Command discovery | declared |

---

## Dependency Mapping

| Dependency | Purpose | Status |
|------------|---------|--------|
| react | UI framework | declared |
| typescript | Type checking | declared |
| vite | Build tool | declared |
| vitest | Unit testing | declared |
| playwright | E2E testing | declared |
| eslint | Linting | declared |
| prettier | Formatting | declared |
| tailwindcss | Styling | declared |
| jotai | State management | declared |
| zod | Schema validation | declared |
| react-router | Routing | declared |
| i18next | Internationalization | declared |
| tiptap | Rich text editing | declared |
| dompurify | HTML sanitization | declared |
| @axe-core/react | Accessibility | declared |
| sentry | Error monitoring | declared |
| recharts | Charts | declared |
| lucide | Icons | declared |
| date-fns | Date handling | declared |

---

## Evidence Model

| Evidence Type | Meaning |
|---------------|---------|
| **Language** | TypeScript (strict mode) |
| **Styling** | Tailwind CSS |
| **Package Manager** | pnpm |
| **Testing** | Vitest (unit), Playwright (E2E) |
| **Documentation** | Obsidian vault (plain Markdown) |
| **Deployment** | Local development (not yet deployed) |

---

tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
---
## Current State Assessment

### ✅ Implemented / Configured

| Concept | Evidence |
|---------|----------|
| TypeScript strict mode | `tsconfig.json` with `strict: true` |
| React 19 | `package.json` dependency |
| Vite build | `vite.config.ts` present |
| Tailwind CSS | `tailwind.config.js` present |
| pnpm | `pnpm-lock.yaml` present |
| ESLint + Prettier | Config files present |
| Husky git hooks | `.husky/` directory present |
| Commitizen + cz-git | Interactive commit workflow configured |
| Commitlint | Commit message validation configured |
| Vitest | Unit test framework configured |
| Playwright | E2E test framework configured |
| Docker | Multi-stage build configuration present |
| GitHub Actions | CI/CD pipeline configured |

### 🟡 Partially Implemented

| Concept | Status |
|---------|--------|
| File naming conventions | Suffixes defined in notes, not yet enforced in code |
| DDD patterns | Repository pattern noted, full DDD not yet applied |
| Clean Architecture | Dependency rule noted, layers not yet separated |
| Testing coverage | Frameworks configured, coverage not yet measured |
| Security hardening | Principles documented, implementation TBD |

### ⬜ Not Yet Implemented

| Concept | Notes |
|---------|-------|
| Microservices | Monolith only at this stage |
| Event sourcing | Not yet required |
| CQRS | Not yet required |
| Docker deployment | Configuration exists, not yet tested |
| Performance budgets | Not yet defined |
| SLOs | Not yet defined |
| ADRs | ADR system exists in vault, first ADRs TBD |

---

tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
---
## Project-Specific Constraints (from AGENTS.md)

These take precedence over generic recommendations:

1. **TypeScript only** — No `.js` or `.jsx` files
2. **React 19** — Latest React with App Router
3. **Tailwind CSS only** — No CSS-in-JS libraries
4. **pnpm only** — No npm or yarn
5. **Obsidian plain Markdown** — No proprietary plugins
6. **Copilot in VS Code** — Not standalone chat tool

---

tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
---
## File Structure Conventions

The project uses these file naming conventions (documented in [file-level-separation-conventions](D/file-level-separation-conventions.md)):

| Suffix | Purpose | Example |
|--------|---------|---------|
| `*.view.tsx` | UI/Presentation | `OrderList.view.tsx` |
| `*.logic.ts` | Business Logic | `order.logic.ts` |
| `*.data.ts` | Data Access | `order.data.ts` |
| `*.hook.ts` | React Hooks | `useAuth.hook.ts` |
| `*.schema.ts` | Validation Schemas | `order.schema.ts` |
| `*.types.ts` | Type Definitions | `order.types.ts` |
| `*.mapper.ts` | Data Transformation | `order.mapper.ts` |
| `*.port.ts` | Interface Abstraction | `email.port.ts` |
| `*.adapter.ts` | Implementation | `sendgrid.adapter.ts` |
| `*.repository.ts` | Data Access Abstraction | `order.repository.ts` |
| `*.use-case.ts` | Application Use Case | `create-order.usecase.ts` |
| `*.entity.ts` | Domain Entity | `order.entity.ts` |
| `*.value-object.ts` | Value Object | `money.value-object.ts` |
| `*.policy.ts` | Business Rules | `order-policy.policy.ts` |
| `*.event.ts` | Domain Event | `order-created.event.ts` |

> **Note:** These are local conventions, not industry standards. They are grounded in broader architectural principles (Separation of Concerns, Dependency Inversion, etc.).

---

tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
---
## Key Architectural Decisions

| Decision | Rationale | Status |
|----------|-----------|--------|
| TypeScript strict mode | Type safety, tooling, documentation | ✅ Implemented |
| React 19 | Latest features, performance | ✅ Implemented |
| Vite | Fast HMR, native ESM | ✅ Implemented |
| Tailwind CSS | Utility-first, no CSS-in-JS | ✅ Implemented |
| pnpm | Disk efficiency, performance | ✅ Implemented |
| Vitest + Playwright | Fast unit tests, reliable E2E | ✅ Implemented |
| Commitizen + commitlint | Conventional commits, message validation | ✅ Implemented |
| Husky | Git hook automation | ✅ Implemented |
| Docker + Nginx | Production deployment | 🟡 Configured |
| GitHub Actions | CI/CD pipeline | ✅ Implemented |

---

tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
---
## Unresolved Project Adoption Decisions

| Decision | Options | Recommendation |
|----------|---------|---------------|
| DDD adoption level | Full DDD vs. tactical patterns only | Start with tactical patterns (entities, value objects, repositories) |
| Testing strategy | TDD vs. test-after | Risk-based: TDD for domain logic, test-after for UI |
| State management | React Context vs. Zustand vs. Jotai | React Context for simple, Zustand for complex |
| Monolith vs. services | Monolith now, split later | Modular monolith, split only when needed |
| CQRS adoption | Full CQRS vs. simple CRUD | Simple CRUD for now, CQRS when read/write needs diverge |

---

tags:
  - priority/high
  - maturity/stable
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
---
## Cross-References

- [[Architecture/00-architecture-index]] — Main index
- [[Research-Status]] — Research progress
- [[Copilot-Consumption-Guide]] — How to use this KB
- AGENTS.md — Project constraints


## See Also
- [[Copilot-Consumption-Guide]]
- [[playwright-e2e]]
- [[Research-Status]]
- [[vault-integration-map]]
- [[_template-spec]]


