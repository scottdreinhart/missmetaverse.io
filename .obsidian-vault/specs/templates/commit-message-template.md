---
slug: commit-message-template
title: Commit Message Template
description: Template for Conventional Commits with scope, type, and body structure for consistent commit history.
author: Copilot
source: vault-research
canonical_url: https://www.conventionalcommits.org/en/v1.0.0/
tags:
  - commits
  - conventional-commits
  - template
  - git
  - documentation
created_on: 2026-11-02
updated_on: 2026-11-02
verification_status: verified
claims_supported: 4
access_limitations: None
---

# Commit Message Template

> **Purpose:** Consistent commit messages following Conventional Commits specification for automated changelog generation and semantic versioning.
> **When to Use:** Every git commit. Each commit should have a clear, descriptive message.
> **Copilot Instructions:** When suggesting code changes, also suggest the commit message. Validate commit messages follow the format.

---

## Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Rules
- **Type** is required and must be one of the allowed types
- **Scope** is optional but recommended (describes the module/file)
- **Description** is a short summary (max 72 characters)
- **Body** is optional (detailed explanation, wrap at 72 characters)
- **Footer** is optional (breaking changes, issue references)

---

## Allowed Types

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat(auth): add JWT login endpoint` |
| `fix` | Bug fix | `fix(auth): handle expired token refresh` |
| `docs` | Documentation only | `docs(readme): update installation steps` |
| `style` | Code style (formatting, semicolons, etc.) | `style(auth): fix indentation` |
| `refactor` | Code refactoring | `refactor(auth): extract token validation` |
| `perf` | Performance improvement | `perf(query): add database index` |
| `test` | Adding or updating tests | `test(auth): add token refresh tests` |
| `chore` | Maintenance tasks | `chore(deps): update eslint to v8` |
| `ci` | CI/CD changes | `ci(github): add deployment workflow` |
| `build` | Build system changes | `build(vite): optimize bundle size` |
| `revert` | Revert a previous commit | `revert(auth): undo token changes` |
| `merge` | Merge branch | `merge(feature/login): into main` |

---

## Templates by Type

### Feature (`feat`)

```
feat(<scope>): add <feature-name>

<description of the feature>
- What it does
- How it works
- Why it was needed

Closes #<issue-number>
```

**Example:**
```
feat(auth): add JWT token refresh mechanism

Implement automatic token refresh for authenticated sessions.
When access token expires, refresh token is used to obtain
a new access token without requiring re-login.

- Added /auth/refresh endpoint
- Implemented token rotation for security
- Added refresh token rotation on each use

Closes #123
```

### Bug Fix (`fix`)

```
fix(<scope>): fix <bug-description>

<description of the bug>
- What was wrong
- How it was fixed
- How to verify the fix

Fixes #<issue-number>
```

**Example:**
```
fix(auth): handle expired refresh token gracefully

Previously, expired refresh tokens caused a 500 error.
Now returns 401 with clear error message and redirect
to login page.

- Added expiration check before token validation
- Returns 401 with 'token_expired' error code
- Frontend redirects to login on 401

Fixes #124
```

### Refactor (`refactor`)

```
refactor(<scope>): <what was refactored>

<description of the change>
- What changed
- Why it was refactored
- No behavior change

Related to #<issue-number>
```

**Example:**
```
refactor(auth): extract token validation into middleware

Moved token validation logic from individual route handlers
into a reusable middleware function. This reduces code
duplication and makes testing easier.

- Created validateToken middleware
- Updated login, register, and profile handlers
- Added unit tests for middleware

Related to #125
```

### Performance (`perf`)

```
perf(<scope>): improve <what was optimized>

<description of the optimization>
- Before: <metric>
- After: <metric>
- How it was optimized

Closes #<issue-number>
```

**Example:**
```
perf(query): add database index on user email

Added unique index on users.email to speed up login queries.
Previously, login required a full table scan.

Before: 250ms (p95)
After:  15ms (p95)

Closes #126
```

### Test (`test`)

```
test(<scope>): add <test-description>

<description of the tests>
- What is being tested
- Edge cases covered
- Test coverage percentage

Closes #<issue-number>
```

**Example:**
```
test(auth): add token refresh tests

Added comprehensive tests for token refresh mechanism:
- Valid refresh token returns new access token
- Expired refresh token returns 401
- Invalid refresh token returns 401
- Refresh token rotation prevents reuse

Coverage: 95% (auth/refresh.controller.ts)

Closes #127
```

### Chore (`chore`)

```
chore(<scope>): <maintenance-task>

<brief description>
```

**Example:**
```
chore(deps): update eslint to v8

Updated ESLint from v7 to v8 for improved performance
and new rules. Updated configuration to match v8 schema.
```

---

## Breaking Changes

When a commit introduces a breaking change, add `!` after the type/scope and include a BREAKING CHANGE footer:

```
feat(auth)!: change JWT token format

Changed JWT token format from HS256 to RS256 for improved security.

BREAKING CHANGE: JWT tokens are now signed with RS256 instead of HS256.
All clients must update their token validation to use RS256.

Migration:
1. Update JWT_SECRET to RSA private key
2. Update client-side token validation
3. Redeploy all services

Closes #128
```

---

## Copilot Integration

### When Suggesting Code Changes
```
1. Analyze the change type (feat, fix, refactor, etc.)
2. Identify the scope (auth, query, ui, etc.)
3. Write a clear, concise description
4. Add body if the change is complex
5. Reference related issues
6. Flag breaking changes
```

### When Validating Commit Messages
```
1. Check format: <type>(<scope>): <description>
2. Verify type is allowed
3. Check description length (< 72 chars)
4. Check body wrapping (< 72 chars per line)
5. Verify issue references
6. Flag breaking changes with proper footer
```

### Common Scope Values

| Scope | Description |
|-------|-------------|
| `auth` | Authentication, authorization, tokens |
| `api` | API endpoints, routes, controllers |
| `db` | Database, migrations, queries |
| `ui` | Frontend components, styling |
| `test` | Tests, test utilities |
| `deps` | Dependencies, package.json |
| `ci` | CI/CD, GitHub Actions |
| `config` | Configuration files |
| `docs` | Documentation |
| `utils` | Utility functions, helpers |
| `middleware` | Express/Fastify middleware |
| `hooks` | React hooks, custom hooks |
| `stores` | State management (Zustand, Redux) |

---

## Quick Reference

| Command | Description |
|---------|-------------|
| `git commit -m "feat(auth): add login"` | Simple commit |
| `git commit -m "feat(auth): add login\n\nBody here"` | Commit with body |
| `git commit -m "feat!: breaking change"` | Breaking change (short) |
| `git commit -m "feat(auth)!: change token format\n\nBREAKING CHANGE: ..."` | Breaking change (detailed) |
| `git commit -m "fix(auth): fix bug\n\nCloses #123"` | Close issue |
| `git commit -m "refactor(auth): extract middleware\n\nRelated to #125"` | Related issue |

---

*Template Version: 1.0*
*Last Updated: 2026-11-02*
*Based on: [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)*
