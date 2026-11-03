# Architecture & Patterns Knowledge Base

> **Purpose:** Source-backed reference for planning, implementation, refactoring, testing, and architectural review.
> **Last Updated:** 2026-11-02
> **Research Status:** Active — 32 initial notes created, expanding to full concept inventory.

---

## How to Use This Knowledge Base

1. Read this index to identify the relevant category.
2. Navigate to the category folder for overview notes.
3. Open individual concept notes for detailed definitions, sources, and guidance.
4. Check source notes for verified citations.
5. Cross-reference related concepts via links.

---

## Categories

### [Templates](templates/)
Reusable templates for documentation, code review, and architectural decisions.

- [ADR Template](templates/adr-template.md) — Record architectural decisions
- [Code Review Checklist](templates/code-review-checklist.md) — Systematic code reviews
- [PR Template](templates/pr-template.md) — Structured pull requests
- [Commit Message Template](templates/commit-message-template.md) — Conventional Commits

### [Architecture](Architecture/)
High-level architectural styles and patterns.

- [SOLID Principles](Architecture/solid-principles.md) — Five OOP principles
- [Clean Architecture](Architecture/clean-architecture.md) — Dependency rule, 4 circles
- [DDD Patterns](Architecture/ddd-patterns.md) — Tactical DDD patterns
- [Architecture Patterns](Architecture/architecture-patterns.md) — Monolith, microservices, CQRS, etc.
- [Atomic Design](Architecture/atomic-design.md) — UI composition methodology
- [Classic Design Patterns](Architecture/classic-design-patterns.md) — 23 GoF patterns
- [Data Modeling Principles](Architecture/data-modeling-principles.md) — CRUD, ACID, normalization
- [Security Principles](Architecture/security-principles.md) — POLP, Zero Trust, defense in depth
- [Coding Practices](Architecture/coding-practices.md) — Strict typing, immutability, etc.
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

## Source Notes

See [[Sources/README|Sources Index]] for all verified source citations.

---

## Research Status

See [[Research-Status]] for the full concept inventory with research status per concept.

---

## Project Architecture Mapping

See [[Project-Architecture-Mapping]] for how concepts map to the actual project.

---

## Copilot Consumption Guide

See [[Copilot-Consumption-Guide]] for instructions on how Copilot should use this knowledge base.
