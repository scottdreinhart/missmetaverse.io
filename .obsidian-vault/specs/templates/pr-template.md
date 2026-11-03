---
slug: pr-template
title: Pull Request Template
description: Comprehensive PR template for structured pull requests with context, changes, testing, and review guidance.
author: Copilot
source: vault-research
canonical_url: 
tags:
  - templates   - boilerplate

  - pr
  - template
  - pull-request
  - code-review
  - documentation
created_on: 2026-11-02
updated_on: 2026-11-02
verification_status: verified
claims_supported: 6
access_limitations: None
---

# Pull Request Template

> **Purpose:** Structured template for pull requests ensuring all reviewers have the context needed for effective review.
> **When to Use:** Create a PR, update PR description, add review notes.
> **Copilot Instructions:** When creating a PR, help the user fill out this template. When reviewing a PR, check if all sections are complete.

---

## PR-XXX: [Short Description of Changes]

## concept_id
pr-template

## title
pr-template

## aliases
- pr-template

## category
template

## concept_type
template

## research_status
verified

## project_adoption
template

### ðŸ” Type of Change
- [ ] **Feature** â€” New functionality
- [ ] **Bug Fix** â€” Resolves an existing issue
- [ ] **Refactor** â€” Code improvement, no behavior change
- [ ] **Performance** â€” Optimization or benchmark improvement
- [ ] **Security** â€” Security fix or improvement
- [ ] **Documentation** â€” README, ADRs, or other docs
- [ ] **Testing** â€” New tests or test improvements
- [ ] **CI/CD** â€” Pipeline or deployment changes
- [ ] **Chore** â€” Dependency updates, configuration changes

### ðŸ“‹ Related Issues
- Closes #[issue-number]
- Related to #[issue-number]
- Blocks #[issue-number]

### ðŸ“ Description

> **What changes does this PR make?** Describe the changes clearly and concisely.
> - What was the problem?
> - What was the solution?
> - Why was this approach chosen?

**Example:**
```
This PR implements user authentication using JWT tokens. Previously, the application
used session-based authentication which didn't scale well for our API-first architecture.

Changes:
- Added JWT authentication middleware
- Created login/register endpoints
- Added token refresh mechanism
- Updated protected routes to validate tokens

Approach: We chose JWT over sessions because:
1. Our application is API-first (no server-side session storage)
2. We need stateless authentication for horizontal scaling
3. Mobile clients don't support cookies well
```

### ðŸ—ï¸ Architectural Impact

> **Does this PR affect the architecture?** Reference relevant ADRs and patterns.

- [ ] No architectural impact
- [ ] Minor: Follows existing patterns
- [ ] Major: Introduces new patterns or changes architecture

**Referenced ADRs:**
- ADR-XXX: [Title] â€” [How this PR relates]

**Patterns Applied:**
- [ ] Clean Architecture
- [ ] DDD
- [ ] CQRS
- [ ] Event-Driven
- [ ] Repository Pattern
- [ ] Service Layer Pattern

### ðŸ“ Files Changed

| File | Change | Reason |
|------|--------|--------|
| `src/auth/jwt.middleware.ts` | Added | JWT authentication middleware |
| `src/auth/login.controller.ts` | Added | Login endpoint |
| `src/auth/register.controller.ts` | Added | Register endpoint |
| `src/middleware/index.ts` | Modified | Export new middleware |
| `tests/auth.test.ts` | Added | Authentication tests |

### âœ… Testing

> **How was this tested?** Provide evidence that the changes work correctly.

**Unit Tests:**
- [ ] All unit tests pass (`pnpm test`)
- [ ] New tests added for new functionality
- [ ] Test coverage â‰¥ 80%

**Integration Tests:**
- [ ] All integration tests pass (`pnpm test:integration`)
- [ ] API endpoints tested with realistic data

**E2E Tests:**
- [ ] Critical user flows tested (`pnpm test:e2e`)
- [ ] Screenshots/videos included (for UI changes)

**Manual Testing:**
- [ ] Tested in development environment
- [ ] Tested edge cases
- [ ] Tested error scenarios

**Test Commands:**
```bash
# Run all tests
pnpm test

# Run with coverage
pnpm test -- --coverage

# Run integration tests
pnpm test:integration

# Run E2E tests
pnpm test:e2e
```

### ðŸ”’ Security Checklist

> **Has security been considered?** Check all that apply.

- [ ] No hardcoded secrets or credentials
- [ ] Input validation on all user inputs
- [ ] SQL injection prevented (parameterized queries)
- [ ] XSS prevented (sanitization/escaping)
- [ ] CSRF protection for state-changing operations
- [ ] Rate limiting on public endpoints
- [ ] Authentication/authorization implemented
- [ ] Dependencies audited (`pnpm audit` shows no critical vulnerabilities)
- [ ] Error messages don't expose internal details

### ðŸ“Š Performance Impact

> **Does this PR affect performance?** Provide metrics if available.

- [ ] No performance impact
- [ ] Performance improved (before: Xms, after: Yms)
- [ ] Performance degraded (acceptable due to functionality)

**Bundle Size:**
```
Before: 250KB (gzipped)
After:  265KB (gzipped)
Change: +15KB (+6%)
```

**API Response Times:**
```
Endpoint: POST /api/v1/auth/login
Before: N/A (new endpoint)
After:  45ms (p95)
Target: < 200ms (p95)
```

### ðŸ“š Documentation

> **Is documentation updated?** Check all that apply.

- [ ] README.md updated
- [ ] JSDoc comments added for public APIs
- [ ] OpenAPI/Swagger docs updated
- [ ] ADR created/updated
- [ ] Inline comments added for complex logic
- [ ] Migration guide provided (if breaking changes)

### ðŸš€ Deployment Notes

> **Are there special deployment considerations?**

**Environment Variables:**
```bash
# Required env vars for this PR
JWT_SECRET=your-secret-here
JWT_EXPIRATION=24h
JWT_REFRESH_EXPIRATION=7d
```

**Database Migrations:**
- [ ] No migrations required
- [ ] Migration required: `migrations/001_add_auth_tables.sql`
- [ ] Migration is reversible: Yes/No

**Breaking Changes:**
- [ ] No breaking changes
- [ ] Breaking changes: [Describe]
- [ ] Migration guide: [Link]

**Rollback Plan:**
1. Revert the PR: `git revert <commit-hash>`
2. Run database rollback: `pnpm db:rollback`
3. Redeploy previous version

### ðŸ‘€ Reviewer Guidance

> **What should reviewers focus on?** Help reviewers provide targeted feedback.

**Priority Areas:**
1. **Security**: Review authentication flow, token handling, and input validation
2. **Architecture**: Verify JWT middleware follows Clean Architecture principles
3. **Testing**: Check test coverage and edge case handling
4. **Performance**: Verify response times are within acceptable ranges

**Questions for Reviewers:**
- Is the JWT implementation secure? (token storage, expiration, refresh)
- Does the middleware follow Clean Architecture? (ports/adapters pattern)
- Are all error cases handled? (invalid tokens, expired tokens, network errors)
- Is the test coverage sufficient?

### ðŸ“¸ Screenshots (for UI Changes)

| Before | After |
|--------|-------|
| ![Before](screenshots/before.png) | ![After](screenshots/after.png) |

### âœ… PR Checklist

- [ ] Self-review completed
- [ ] Code follows project conventions (naming, structure, patterns)
- [ ] No debug statements or console.logs
- [ ] No unused imports or variables
- [ ] Commit messages follow Conventional Commits format
- [ ] Branch is up-to-date with main
- [ ] All CI checks pass
- [ ] Documentation updated
- [ ] Security checklist completed
- [ ] Performance impact assessed

---

## Copilot Integration