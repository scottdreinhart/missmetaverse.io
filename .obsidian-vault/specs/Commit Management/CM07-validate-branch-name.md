---
slug: validate-branch-name
sources:
  - https://www.npmjs.com/package/validate-branch-name
  - https://github.com/JsonMa/validate-branch-name
date: 2026-11-02
tags:










  - validate-branch-name
  - branch-naming
  - git
  - conventions
  - husky
---

# validate-branch-name

## Overview

validate-branch-name is a Git branch name validator that enforces naming conventions through Husky hooks. It prevents invalid branch names from being pushed to remote repositories.

---

## 1. Installation

```bash
pnpm add -D validate-branch-name
```

---

## 2. Configuration

### package.json

```json
{
  "validate-branch-name": {
    "pattern": "^(master|main|develop){1}$|^(feature|fix|hotfix|release)/.+$",
    "errorMsg": "Branch name must match pattern: ^(master|main|develop){1}$|^(feature|fix|hotfix|release)/.+$"
  }
}
```

### `.validate-branch-namerc` (YAML)

```yaml
pattern: "^(master|main|develop){1}$|^(feature|fix|hotfix|release)/.+$"
errorMsg: "Branch name must follow convention: feature/JIRA-123/description"
```

### `.validate-branch-namerc.json`

```json
{
  "pattern": "^(feature|fix|hotfix|release)/(JIRA-\\d+)?[a-z-]+$",
  "errorMsg": "Branch name must be: feature/JIRA-123/my-feature or feature/my-feature"
}
```

### `validate-branch-name.config.js`

```javascript
// validate-branch-name.config.js
module.exports = {
  pattern: '^(feature|fix|hotfix|release)/(JIRA-\\d+)?[a-z-]+$',
  errorMsg: 'Branch name must follow: feature/JIRA-123/description or feature/description',
  // Ignore patterns (branches to skip validation)
  ignore: ['^main$', '^master$', '^develop$'],
}
```

---

## 3. Usage

### CLI

```bash
# Validate current branch
npx validate-branch-name

# Test a specific branch name
npx validate-branch-name -t feature/test/branch

# Define custom regex
npx validate-branch-name -r "^(feature|fix)/.+$" -t feature/my-feature

# Help
npx validate-branch-name -h
```

### With Husky

#### Method 1: package.json

```json
{
  "husky": {
    "hooks": {
      "pre-push": "npx validate-branch-name"
    }
  }
}
```

#### Method 2: .husky/pre-push

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Validate branch name before push
npx validate-branch-name
```

---

## 4. Available Patterns

### Standard Pattern (Default)

```regex
^(master|main|develop){1}$|^(feature|fix|hotfix|release)/.+$
```

Allows: `main`, `master`, `develop`, `feature/*`, `fix/*`, `hotfix/*`, `release/*`

### JIRA Pattern

```regex
(feature|release|hotfix)/(JIRA-\d+)
```

Requires: `feature/JIRA-123`, `release/JIRA-456`

### JIRA with Description

```regex
(feature|release|hotfix)/(JIRA-\d+/)?[a-z-]+
```

Allows: `feature/JIRA-123/description`, `feature/description`

### Strict Pattern

```regex
^(feature|fix|hotfix|release|docs|chore|test)/(JIRA-\d+)?[a-z-]+$
```

Allows more types with optional JIRA reference

### Monorepo Pattern

```regex
^(feature|fix|hotfix|release)/(packages|apps)/[a-z-]+(/[a-z-]+)?$
```

Allows: `feature/packages/ui/button`, `fix/apps/web/auth`

---

## 5. Integration with Husky

### Complete Setup

```bash
# Install dependencies
pnpm add -D husky validate-branch-name

# Initialize Husky
npx husky init

# Add pre-push hook
npx husky add .husky/pre-push 'npx validate-branch-name'
```

### `.husky/pre-push`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Validate branch name
npx validate-branch-name
```

### With Other Hooks

```bash
# .husky/pre-push — Full validation pipeline
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# 1. Validate branch name
npx validate-branch-name || exit 1

# 2. Run tests
pnpm test:run || exit 1

# 3. Run linting
pnpm lint || exit 1
```

---

## 6. Best Practices

### Branch Naming Convention

```
<type>/<optional-scope>/<description>

Types:
  feature   — New features
  fix       — Bug fixes
  hotfix    — Urgent production fixes
  release   — Release preparation
  docs      — Documentation changes
  chore     — Maintenance tasks
  test      — Test changes

Examples:
  feature/JIRA-123/user-authentication
  fix/web/login-error
  hotfix/api-critical-bug
  release/v2.0.0
  docs/api-endpoints
  chore/update-dependencies
  test/unit-tests-auth
```

### Pattern Selection

| Scenario | Pattern |
|----------|---------|
| Simple projects | `^(feature|fix|hotfix|release)/.+$` |
| JIRA-tracked | `^(feature|fix)/(JIRA-\d+)?[a-z-]+$` |
| Monorepo | `^(feature|fix)/(packages|apps)/[a-z-]+$` |
| Strict | `^(feature|fix|hotfix|release|docs|chore)/(JIRA-\d+)?[a-z-]+$` |

### Tips

- ✅ Use `ignore` option to skip validation for protected branches
- ✅ Keep patterns simple but enforceable
- ✅ Document the convention in CONTRIBUTING.md
- ✅ Use Husky pre-push hook (not pre-commit) for branch validation
- ❌ Don't make patterns too complex (hard to remember)
- ❌ Don't validate on every commit (validate on push only)

---

## Cross-References

- [Husky Git Hooks](./husky-git-hooks.md)
- [Commitizen & cz-git](./commitizen-cz-git.md)
- [Commitlint CLI & Config](./commitlint-cli-config.md)
- [Conventional Changelog](./conventional-changelog.md)
- [release-it](./release-it.md)

## See Also
- [[CM01-commitizen-cz-git]]
- [[CM02-commitlint-cli-config]]
- [[CM03-commit-management-integration]]
- [[CM04-conventional-changelog]]
- [[CM05-husky-git-hooks]]


