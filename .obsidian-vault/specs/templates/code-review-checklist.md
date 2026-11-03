---
slug: code-review-checklist
title: Code Review Checklist
description: Comprehensive checklist for systematic code reviews covering architecture, security, testing, performance, and maintainability.
author: Copilot
source: vault-research
canonical_url: 
tags:














  - code-review
  - checklist
  - quality
  - architecture
  - security
  - testing
  - template
created_on: 2026-11-02
updated_on: 2026-11-02
verification_status: verified
claims_supported: 8
access_limitations: None
---

# Code Review Checklist

> **Purpose:** Systematic checklist for code reviews ensuring consistency, quality, and adherence to architectural patterns.
> **When to Use:** Before approving any pull request, before merging changes, during peer reviews.
> **Copilot Instructions:** When reviewing code, run through this checklist systematically. Flag any failed items. Do not approve PRs with critical failures.

---

## 1. Architecture & Design

- [ ] **Follows Clean Architecture**: Domain logic is independent of frameworks, databases, and UI
- [ ] **Respects Bounded Contexts**: No cross-context dependencies without proper boundaries
- [ ] **Uses Appropriate Patterns**: CQRS for read/write separation, DDD for complex domains
- [ ] **Single Responsibility**: Each class/module has one reason to change
- [ ] **Dependency Inversion**: Dependencies point inward (inner layers don't know about outer layers)
- [ ] **No Tight Coupling**: Uses interfaces/abstractions, not concrete implementations
- [ ] **Respects ADRs**: No violations of accepted Architecture Decision Records
- [ ] **Modular Design**: Changes in one module don't require changes in unrelated modules

### Copilot Actions
```
1. Read [clean-architecture](D/clean-architecture.md) if unsure about dependency rules
2. Read [ddd-patterns](D/ddd-patterns.md) if checking bounded context boundaries
3. Read [solid-principles](D/solid-principles.md) if checking SRP/OCP/LSP
4. Check for existing ADRs in .obsidian-vault/specs/Architecture/
5. Flag any violations with specific line numbers and suggestions
```

---

## 2. TypeScript & Type Safety

- [ ] **No `any` types**: All types are explicitly defined
- [ ] **No `as` casts**: Type assertions are avoided; use type guards instead
- [ ] **Strict null checks**: No `!` non-null assertions without justification
- [ ] **Generic types used appropriately**: Not over-engineered, not too generic
- [ ] **Type exports are intentional**: Only public API types are exported
- [ ] **Discriminated unions used**: For state management, error handling
- [ ] **Satisfies operator used**: Where appropriate (`expr satisfies Type`)
- [ ] **No implicit `any`**: `noImplicitAny` is enforced in tsconfig

### Copilot Actions
```
1. Run: grep -r ": any" src/ — should return 0 results
2. Run: grep -r "as " src/ — flag any that aren't type guards
3. Run: grep -r "!" src/ — flag non-null assertions
4. Check tsconfig.json for strict mode enabled
5. Read [ts-best-practices](D/ts-best-practices.md) for detailed guidance
```

---

## 3. Security

- [ ] **No hardcoded secrets**: API keys, passwords, tokens are in environment variables
- [ ] **Input validation**: All user inputs are validated (Zod, Joi, or custom validators)
- [ ] **SQL injection prevented**: Parameterized queries or ORM used (no string concatenation)
- [ ] **XSS prevented**: User content is sanitized/escaped before rendering
- [ ] **CSRF protection**: State-changing operations include CSRF tokens
- [ ] **Rate limiting**: API endpoints have rate limiting configured
- [ ] **Authentication/Authorization**: Protected routes check permissions
- [ ] **CORS configured**: Cross-origin requests are explicitly allowed/denied
- [ ] **Dependencies audited**: `pnpm audit` shows no critical vulnerabilities
- [ ] **Error messages sanitized**: No stack traces or internal details exposed to clients

### Copilot Actions
```
1. Run: pnpm audit — flag any critical/high vulnerabilities
2. Run: grep -r "process.env\." src/ — flag hardcoded secrets
3. Check for input validation on all API endpoints
4. Check for sanitization on all user-generated content
5. Read [security-principles](D/security-principles.md) for detailed security guidance
6. Read [owasp-top-ten-2021](D/owasp-top-ten-2021.md) for OWASP Top 10 compliance
```

---

## 4. Testing

- [ ] **Unit tests exist**: For all business logic, utilities, and domain functions
- [ ] **Test coverage ≥ 80%**: For new code (check with `pnpm test -- --coverage`)
- [ ] **Integration tests exist**: For API endpoints, database operations, external services
- [ ] **E2E tests exist**: For critical user flows (login, checkout, etc.)
- [ ] **Tests are deterministic**: No randomness, no time-dependent assertions
- [ ] **Tests are isolated**: No test depends on another test's side effects
- [ ] **Test names are descriptive**: `test('should return 404 when user not found')` not `test('test1')`
- [ ] **Edge cases covered**: Empty inputs, null values, boundary conditions
- [ ] **Error paths tested**: Failure scenarios are explicitly tested
- [ ] **Mock external services**: Database, email, payment gateways are mocked

### Copilot Actions
```
1. Run: pnpm test -- --coverage — check coverage ≥ 80%
2. Check test file naming: *.test.ts or *.spec.ts
3. Verify test descriptions are meaningful
4. Check for mock implementations of external services
5. Read [vitest-testing](D/vitest-testing.md) for testing patterns
6. Read [vitest-docs-2024](D/vitest-docs-2024.md) for Vitest best practices
```

---

## 5. Performance

- [ ] **No N+1 queries**: Database queries are optimized (use joins, batching, or DataLoader)
- [ ] **Pagination implemented**: List endpoints use cursor-based pagination
- [ ] **Caching strategy defined**: Hot data is cached (Redis, in-memory)
- [ ] **No unnecessary re-renders**: React components use memo, useMemo, useCallback appropriately
- [ ] **Bundle size monitored**: No single bundle exceeds 250KB (gzipped)
- [ ] **Lazy loading used**: Routes and heavy components are lazy-loaded
- [ ] **Database indexes**: Frequently queried columns have indexes
- [ ] **No memory leaks**: No event listeners, timers, or subscriptions left dangling
- [ ] **Async operations handled**: Promises are awaited, errors are caught

### Copilot Actions
```
1. Check for pagination on all list endpoints
2. Check for caching headers on API responses
3. Check React components for unnecessary re-renders (React DevTools)
4. Run: pnpm build — check bundle size
5. Check database queries for N+1 patterns
6. Read [[Bundler/vite-configuration]] for bundle optimization
7. Read [react-performance-security](D/react-performance-security.md) for React optimization
```

---

## 6. Code Quality & Maintainability

- [ ] **No code duplication**: DRY principle followed, shared logic extracted
- [ ] **Meaningful variable/function names**: `calculateTotalPrice()` not `calc()`
- [ ] **Functions are small**: < 20 lines preferred, < 50 lines maximum
- [ ] **No deep nesting**: Max 3 levels of indentation (use early returns, guard clauses)
- [ ] **Comments explain why, not what**: Code should be self-documenting
- [ ] **TODOs are tracked**: No `// TODO` without a ticket number or deadline
- [ ] **Dead code removed**: Unused imports, functions, and variables are removed
- [ ] **Consistent formatting**: Prettier/ESLint rules enforced
- [ ] **File size reasonable**: < 300 lines per file (split if larger)
- [ ] **Import order consistent**: Node builtins, external packages, internal modules

### Copilot Actions
```
1. Run: pnpm lint — should have 0 errors
2. Run: pnpm format — check formatting consistency
3. Check for unused imports: grep -r "^import.*from.*$" src/ | wc -l
4. Check function lengths: awk '/^function|^const.*=.*=>/' src/**/*.ts | wc -l
5. Check for TODOs: grep -r "TODO" src/ — should have ticket numbers
6. Read [coding-practices](D/coding-practices.md) for detailed guidance
```

---

## 7. API Design

- [ ] **RESTful conventions**: Correct HTTP methods (GET, POST, PUT, PATCH, DELETE)
- [ ] **Consistent response format**: All endpoints return `{ data, error, pagination }`
- [ ] **Proper status codes**: 200, 201, 202, 400, 401, 403, 404, 409, 429, 500
- [ ] **Error responses are structured**: `{ error: { code, message, details, requestId } }`
- [ ] **Pagination is cursor-based**: Not offset-based
- [ ] **Versioning strategy**: URL path versioning (`/api/v1/`)
- [ ] **Rate limiting**: Applied to all public endpoints
- [ ] **Documentation**: OpenAPI/Swagger docs updated
- [ ] **Backward compatibility**: No breaking changes without version bump

### Copilot Actions
```
1. Check HTTP methods match REST conventions
2. Check response format consistency across endpoints
3. Check error response structure matches standard
4. Verify pagination is cursor-based
5. Check OpenAPI docs are updated
6. Read [[APIs Distributed Systems/rest-api-design]] for detailed API guidance
7. Read [api-versioning](D/api-versioning.md) for versioning strategies
```

---

## 8. Git & Commits

- [ ] **Commit messages follow Conventional Commits**: `type(scope): description`
- [ ] **Commits are atomic**: Each commit does one thing
- [ ] **No merge commits from main**: Rebase instead of merge
- [ ] **Branch names follow convention**: `feature/`, `fix/`, `chore/`, `refactor/`
- [ ] **PR description is complete**: Includes context, changes, testing notes
- [ ] **PR links related issues**: `Closes #123`, `Related to #456`
- [ ] **Screenshots included**: For UI changes
- [ ] **Changelog updated**: If applicable

### Copilot Actions
```
1. Check commit message format: git log --oneline | grep -vE "^(feat|fix|chore|refactor|docs|style|test|ci|perf|build|revert)"
2. Check branch naming: git branch --list
3. Check PR description completeness
4. Read [conventional-commits](D/conventional-commits.md) for commit guidance
5. Read [conventional-commits-patterns](D/conventional-commits-patterns.md) for commit format
```

---

## 9. Documentation

- [ ] **README updated**: If new features, dependencies, or configurations were added
- [ ] **JSDoc comments**: For public functions, classes, and interfaces
- [ ] **API documentation**: OpenAPI/Swagger docs updated
- [ ] **Architecture diagrams**: Updated if structure changed
- [ ] **ADR updated**: If architectural decision was made or changed
- [ ] **Inline comments**: Explain complex logic, not obvious code
- [ ] **Link validation**: No broken links in documentation

### Copilot Actions
```
1. Check README.md for recent changes
2. Check for JSDoc on public APIs
3. Check OpenAPI spec if API changed
4. Check for broken links: markdown-link-check docs/**/*.md
5. Read [quality-delivery-maintainability](D/quality-delivery-maintainability.md) for documentation standards
```

---

## 10. Deployment & Operations

- [ ] **Environment variables documented**: All required env vars are listed
- [ ] **Docker configuration**: Dockerfile/Docker-compose updated if changed
- [ ] **CI/CD pipeline**: GitHub Actions workflows updated if needed
- [ ] **Health checks**: `/health`, `/ready`, `/live` endpoints working
- [ ] **Logging**: Structured logging (JSON format) with appropriate levels
- [ ] **Monitoring**: Metrics, tracing, alerting configured
- [ ] **Rollback plan**: Documented and tested
- [ ] **Database migrations**: Reversible, zero-downtime

### Copilot Actions
```
1. Check .env.example for completeness
2. Check Dockerfile for multi-stage builds
3. Check GitHub Actions workflows
4. Check health check endpoints
5. Check logging format (structured JSON)
6. Read [docker-deployment](D/docker-deployment.md) for deployment guidance
7. Read [cicd-github-actions](D/cicd-github-actions.md) for CI/CD guidance
```

---

## Review Summary

### Critical Failures (Must Fix Before Merge)
- [ ] Security vulnerabilities
- [ ] Broken tests
- [ ] Type errors (TypeScript compilation fails)
- [ ] Performance regressions (N+1 queries, bundle size > 500KB)
- [ ] ADR violations

### Warnings (Should Fix)
- [ ] Test coverage < 80%
- [ ] ESLint warnings
- [ ] Missing JSDoc on public APIs
- [ ] Inconsistent formatting

### Suggestions (Nice to Have)
- [ ] Better error messages
- [ ] Additional edge case tests
- [ ] Performance optimizations
- [ ] Documentation improvements

### Approval Decision
- [ ] **Approved** — All critical and warning items addressed
- [ ] **Approved with comments** — Minor suggestions, no blocking issues
- [ ] **Changes requested** — Critical or warning items need fixing
- [ ] **Rejected** — Major architectural or security issues

---

## Copilot Integration

### Automated Checks (Run Before Manual Review)
```bash
# 1. Type checking
pnpm run type-check

# 2. Linting
pnpm run lint

# 3. Unit tests
pnpm run test

# 4. Integration tests
pnpm run test:integration

# 5. E2E tests
pnpm run test:e2e

# 6. Build
pnpm run build

# 7. Security audit
pnpm audit

# 8. Bundle analysis
pnpm run analyze
```

### When to Invoke Agents
- **Architecture Validation Agent**: When reviewing architectural changes
- **Security Review Agent**: When reviewing authentication, authorization, or data handling
- **Performance Review Agent**: When reviewing database queries, bundle size, or caching
- **Testing Agent**: When reviewing test coverage or test quality

### When to Offload to Tools
- **Linting/Formatting**: ESLint + Prettier (automated)
- **Type Checking**: TypeScript compiler (automated)
- **Testing**: Vitest + Playwright (automated)
- **Security Scanning**: `pnpm audit` + Snyk (automated)
- **Bundle Analysis**: Webpack Bundle Analyzer (automated)
- **Code Review**: Copilot + human (semi-automated)

---

*Template Version: 1.0*
*Last Updated: 2026-11-02*
*Based on: Industry best practices for code review*

## See Also
- [[adr-template]]
- [[commit-message-template]]
- [[pr-template]]


