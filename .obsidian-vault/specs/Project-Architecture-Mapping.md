# Project Architecture Mapping

> **Purpose:** Map researched concepts to actual project implementation.
> **Last Updated:** 2026-11-02
> **Project:** React 19 + Vite + TypeScript + Tailwind CSS + pnpm

---

## Project Overview

| Aspect | Value |
|--------|-------|
| **Editor** | Visual Studio Code |
| **AI Assistant** | GitHub Copilot (Qwen 3.6 35B A3B NVFP4) |
| **Frontend Framework** | React 19 |
| **Build Tool** | Vite |
| **Language** | TypeScript (strict mode) |
| **Styling** | Tailwind CSS |
| **Package Manager** | pnpm |
| **Testing** | Vitest (unit), Playwright (E2E) |
| **Documentation** | Obsidian vault (plain Markdown) |
| **Deployment** | Local development (not yet deployed) |

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

## Project-Specific Constraints (from AGENTS.md)

These take precedence over generic recommendations:

1. **TypeScript only** — No `.js` or `.jsx` files
2. **React 19** — Latest React with App Router
3. **Tailwind CSS only** — No CSS-in-JS libraries
4. **pnpm only** — No npm or yarn
5. **Obsidian plain Markdown** — No proprietary plugins
6. **Copilot in VS Code** — Not standalone chat tool

---

## File Structure Conventions

The project uses these file naming conventions (documented in [[file-level-separation-conventions]]):

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

## Unresolved Project Adoption Decisions

| Decision | Options | Recommendation |
|----------|---------|---------------|
| DDD adoption level | Full DDD vs. tactical patterns only | Start with tactical patterns (entities, value objects, repositories) |
| Testing strategy | TDD vs. test-after | Risk-based: TDD for domain logic, test-after for UI |
| State management | React Context vs. Zustand vs. Jotai | React Context for simple, Zustand for complex |
| Monolith vs. services | Monolith now, split later | Modular monolith, split only when needed |
| CQRS adoption | Full CQRS vs. simple CRUD | Simple CRUD for now, CQRS when read/write needs diverge |

---

## Cross-References

- [[00-architecture-index]] — Main index
- [[Research-Status]] — Research progress
- [[Copilot-Consumption-Guide]] — How to use this KB
- AGENTS.md — Project constraints
