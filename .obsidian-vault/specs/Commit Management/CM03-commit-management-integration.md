---
slug: commit-management-integration
sources:
  - https://github.com/commitizen/cz-cli
  - https://github.com/Zhengqbbb/cz-git
  - https://commitlint.js.org/
  - https://typicode.github.io/husky/
  - https://github.com/conventional-changelog/conventional-changelog
  - https://github.com/release-it/release-it
  - https://www.npmjs.com/package/validate-branch-name
date: 2026-11-02
tags:
  - integration
  - commit-management
  - conventional-commits
  - release-automation
  - git-workflow
# Commit Management â€” Complete Integration

## Overview

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
This note shows how to integrate all commit management tools into a cohesive workflow: cz-git (interactive prompts) â†’ commitlint (validation) â†’ Husky (hooks) â†’ validate-branch-name (branch rules) â†’ conventional-changelog (changelog generation) â†’ release-it (automated releases).

---

## 1. Complete Architecture

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                    DEVELOPER WORKFLOW                            â”‚
â”‚                                                                  â”‚
â”‚  1. Create Branch â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”           â”‚
â”‚     validate-branch-name checks naming              â”‚           â”‚
â”‚     â””â”€ Husky pre-push hook                          â”‚           â”‚
â”‚                                                     â”‚           â”‚
â”‚  2. Make Changes â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”â”‚           â”‚
â”‚     git add .                                       â”‚â”‚           â”‚
â”‚                                                     â”‚â”‚           â”‚
â”‚  3. Commit â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤â”‚           â”‚
â”‚     pnpm commit (cz-git interactive prompt)         â”‚â”‚           â”‚
â”‚     â””â”€ Guides: type, scope, subject, body, footer   â”‚â”‚           â”‚
â”‚     â””â”€ Emoji support, AI generation                 â”‚â”‚           â”‚
â”‚                                                     â”‚â”‚           â”‚
â”‚  4. Git Commit â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤â”‚           â”‚
â”‚     git commit (creates commit)                     â”‚â”‚           â”‚
â”‚     â””â”€ Husky commit-msg hook                        â”‚â”‚           â”‚
â”‚        â””â”€ commitlint validates format               â”‚â”‚           â”‚
â”‚           â””â”€ FAILS if invalid                       â”‚â”‚           â”‚
â”‚           â””â”€ PASSES if valid                        â”‚â”‚           â”‚
â”‚                                                     â”‚â”‚           â”‚
â”‚  5. Push â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¤â”‚           â”‚
â”‚     git push â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜â”‚           â”‚
â”‚     â””â”€ Husky pre-push hook                          â”‚           â”‚
â”‚        â””â”€ Run tests                                 â”‚           â”‚
â”‚        â””â”€ validate-branch-name (safety net)         â”‚           â”‚
â”‚                                                     â”‚           â”‚
â”‚  6. Merge to Main â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”          â”‚
â”‚     PR merged to main                               â”‚          â”‚
â”‚     â””â”€ CI runs full pipeline                        â”‚          â”‚
â”‚        â””â”€ commitlint on all commits                  â”‚          â”‚
â”‚        â””â”€ lint, test, build                         â”‚          â”‚
â”‚                                                     â”‚          â”‚
â”‚  7. Release â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜          â”‚
â”‚     npx release-it (manual or CI)                             â”‚
â”‚     â””â”€ @release-it/conventional-changelog                     â”‚
â”‚        â””â”€ Reads commit history                              â”‚
â”‚        â””â”€ Generates CHANGELOG.md                            â”‚
â”‚        â””â”€ Recommends version bump                           â”‚
â”‚     â””â”€ Bumps version in package.json                        â”‚
â”‚     â””â”€ Git commit, tag, push                                â”‚
â”‚     â””â”€ GitHub Release with notes                            â”‚
â”‚     â””â”€ npm publish                                          â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## 2. Complete Setup

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Step 1: Install All Tools

```bash
# Commitizen + cz-git (interactive prompts)
pnpm add -D commitizen cz-git

# commitlint (commit message validation)
pnpm add -D @commitlint/cli @commitlint/config-conventional

# Husky (git hooks)
pnpm add -D husky

# validate-branch-name (branch naming)
pnpm add -D validate-branch-name

# conventional-changelog (changelog generation)
pnpm add -D conventional-changelog conventional-changelog-conventionalcommits

# release-it (automated releases)
pnpm add -D release-it @release-it/conventional-changelog
```

### Step 2: package.json

```json
{
  "name": "my-project",
  "version": "1.0.0",
  "scripts": {
    "commit": "cz",
    "commit:retry": "cz --retry",
    "lint": "eslint . --ext .ts,.tsx",
    "test": "vitest run",
    "test:ci": "vitest run --coverage",
    "build": "vite build",
    "changelog": "conventional-changelog -p conventionalcommits -i CHANGELOG.md -s",
    "release": "release-it",
    "release:ci": "release-it --ci",
    "release:dry-run": "release-it --dry-run",
    "release:bump": "release-it --release-version",
    "prepare": "husky"
  },
  "config": {
    "commitizen": {
      "path": "cz-git"
    }
  },
  "devDependencies": {
    "commitizen": "^4.x",
    "cz-git": "^1.x",
    "@commitlint/cli": "^19.x",
    "@commitlint/config-conventional": "^19.x",
    "husky": "^9.x",
    "validate-branch-name": "^1.x",
    "conventional-changelog": "^6.x",
    "conventional-changelog-conventionalcommits": "^7.x",
    "release-it": "^21.x",
    "@release-it/conventional-changelog": "^9.x"
  }
}
```

### Step 3: cz.config.js

```javascript
// cz.config.js
const { defineConfig } = require('cz-git')

module.exports = defineConfig({
  rules: {
    'type-enum': [
      'feat', 'fix', 'docs', 'style', 'refactor', 'perf',
      'test', 'build', 'ci', 'chore', 'revert'
    ],
    'scope-enum': ['app', 'web', 'api', 'ui', 'auth', 'db', 'config'],
    'subject-max-length': 100,
    'header-max-length': 100,
  },
  useEmoji: true,
  allowCustomScope: true,
  allowCustomIssue: true,
})
```

### Step 4: commitlint.config.js

```javascript
// commitlint.config.js
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2, 'always',
      ['feat', 'fix', 'docs', 'style', 'refactor', 'perf', 'test', 'build', 'ci', 'chore', 'revert']
    ],
    'scope-enum': [2, 'always', ['app', 'web', 'api', 'ui', 'auth', 'db', 'config', '']],
    'subject-case': [2, 'never', ['upper-case', 'pascal-case', 'sentence-case']],
    'header-max-length': [2, 'always', 100],
    'subject-min-length': [2, 'always', 5],
    'subject-max-length': [2, 'always', 72],
    'body-max-line-length': [2, 'always', 100],
    'body-leading-blank': [2, 'always'],
    'footer-leading-blank': [2, 'always'],
    'type-case': [2, 'always', 'lower-case'],
    'scope-case': [2, 'always', 'lower-case'],
  },
  ignores: [(commit) => commit.startsWith('Merge')],
}
```

### Step 5: .release-it.json

```json
{
  "$schema": "https://unpkg.com/release-it@21/schema/release-it.json",
  "git": {
    "commitMessage": "chore: release v${version}",
    "requireBranch": "main",
    "requireCommits": false
  },
  "github": {
    "release": true,
    "releaseName": "v${version}"
  },
  "npm": {
    "publish": false
  },
  "hooks": {
    "before:init": ["pnpm lint", "pnpm test"],
    "after:release": ["echo \"Successfully released v${version}\""]
  },
  "plugins": {
    "@release-it/conventional-changelog": {
      "preset": "conventionalcommits",
      "infile": "CHANGELOG.md",
      "ignoreRecommendedBump": false
    }
  }
}
```

### Step 6: Initialize Husky

```bash
# Initialize Husky
npx husky init

# Add pre-commit hook (lint-staged)
npx husky add .husky/pre-commit 'npx lint-staged'

# Add commit-msg hook (commitlint)
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"'

# Add pre-push hook (tests + branch validation)
npx husky add .husky/pre-push 'npx validate-branch-name && pnpm test:ci'
```

### Step 7: .husky/pre-commit

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx lint-staged
```

### Step 8: .husky/commit-msg

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx --no -- commitlint --edit "$1"
```

### Step 9: .husky/pre-push

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Validate branch name
npx validate-branch-name || exit 1

# Run tests
pnpm test:ci || exit 1
```

---

## 3. Directory Structure

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
```
my-project/
â”œâ”€â”€ .husky/
â”‚   â”œâ”€â”€ pre-commit          # Lint staged files
â”‚   â”œâ”€â”€ commit-msg          # Validate commit message
â”‚   â””â”€â”€ pre-push            # Tests + branch validation
â”œâ”€â”€ .lintstagedrc.json      # lint-staged config
â”œâ”€â”€ cz.config.js            # cz-git configuration
â”œâ”€â”€ commitlint.config.js    # commitlint configuration
â”œâ”€â”€ .release-it.json        # release-it configuration
â”œâ”€â”€ package.json
â”œâ”€â”€ CHANGELOG.md
â””â”€â”€ src/
```

---

## 4. Usage Examples

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Creating a Commit

```bash
# Stage changes
git add .

# Interactive commit with cz-git
pnpm commit

# cz-git prompts:
# ? Select the type of change: (use arrow keys)
#   âœ¦ feat - A new feature
#     fix - A bug fix
#     docs - Documentation
#     ...
#
# ? Select the scope: (use arrow keys)
#   âœ¦ app
#     web
#     api
#     ...
#
# ? Write a short description: Add user authentication
# ? Provide a longer description: Implement OAuth2 login
# ? List any issues closed: Closes #123
# ? Confirm: Yes âœ“

# Output: feat(app): add user authentication

# Husky commit-msg hook runs automatically
# commitlint validates the message
```

### Creating a Branch

```bash
# Valid branch names
git checkout -b feature/JIRA-123/user-auth
git checkout -b fix/web/login-error
git checkout -b hotfix/api-critical-bug

# Invalid branch name (rejected by validate-branch-name)
git checkout -b my-feature
# Error: Branch name must match pattern...
```

### Pushing

```bash
# Husky pre-push hook runs:
# 1. validate-branch-name checks branch name
# 2. pnpm test:ci runs tests
# If both pass, push proceeds
git push origin feature/JIRA-123/user-auth
```

### Releasing

```bash
# Dry run (see what would happen)
pnpm release:dry-run

# Interactive release
pnpm release

# CI mode (non-interactive)
pnpm release:ci

# release-it will:
# 1. Run hooks (lint, test)
# 2. Read commit history
# 3. Generate CHANGELOG.md
# 4. Recommend version bump
# 5. Bump version in package.json
# 6. Git commit, tag, push
# 7. Create GitHub Release
```

---

## 5. CI/CD Pipeline

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### GitHub Actions

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  validate:
    name: Validate
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: pnpm/action-setup@v4
        with:
          version: 9

      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: 'pnpm'

      - run: pnpm install --frozen-lockfile

      - name: Run commitlint
        run: npx commitlint --from ${{ github.event.pull_request.base.sha }} --to ${{ github.event.pull_request.head.sha }} --verbose

      - name: Run ESLint
        run: pnpm lint

      - name: Run tests
        run: pnpm test:ci

  release:
    name: Release
    runs-on: ubuntu-latest
    needs: [validate]
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    permissions:
      contents: write
      packages: write
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - uses: pnpm/action-setup@v4
        with:
          version: 9

      - uses: actions/setup-node@v4
        with:
          node-version: 22
          registry-url: 'https://registry.npmjs.org'

      - run: pnpm install --frozen-lockfile

      - run: npx release-it --ci
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NODE_AUTH_TOKEN: ${{ secrets.NODE_AUTH_TOKEN }}
```

---

## 6. Troubleshooting

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Common Issues

| Problem | Solution |
|---------|----------|
| cz-git not prompting | Ensure `config.commitizen.path` is set in package.json |
| commitlint fails on valid commits | Check `commitlint.config.js` rules match your format |
| Husky hooks not running | Run `chmod +x .husky/*.sh` and verify `prepare` script exists |
| validate-branch-name blocks main | Add `ignore` pattern for protected branches |
| release-it fails in CI | Use `--ci` flag and ensure `GITHUB_TOKEN` is set |
| Changelog not generating | Ensure `@release-it/conventional-changelog` is configured |

### Debug Commands

```bash
# Test commit message
echo "feat: test" | npx commitlint

# Test branch name
npx validate-branch-name -t feature/test/description

# Dry run release
npx release-it --dry-run

# Verbose release
npx release-it --verbose

# Debug Husky
HUSKY=1 git commit -m "test"
```

---

## 7. Best Practices

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Do's

- âœ… Use cz-git for interactive commits with emoji
- âœ… Always have commitlint as safety net (even with cz-git)
- âœ… Use Husky commit-msg hook for validation
- âœ… Use validate-branch-name on pre-push (not pre-commit)
- âœ… Configure release-it hooks for pre-release validation
- âœ… Use `--ci` mode in CI/CD pipelines
- âœ… Sign commits and tags for security
- âœ… Document commit conventions in CONTRIBUTING.md

### Don'ts

- âŒ Don't rely solely on cz-git â€” always have commitlint
- âŒ Don't make commitlint rules too strict
- âŒ Don't skip pre-release validation hooks
- âŒ Don't run release-it on feature branches
- âŒ Don't forget to configure `requireBranch` in release-it

---

## Cross-References

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
- [Commitizen & cz-git](./commitizen-cz-git.md)
- [Commitlint CLI & Config](./commitlint-cli-config.md)
- [Husky Git Hooks](./husky-git-hooks.md)
- [validate-branch-name](./validate-branch-name.md)
- [Conventional Changelog](./conventional-changelog.md)
- [release-it](./release-it.md)
- [CI/CD GitHub Actions](./Integration/cicd-github-actions.md)
- [Linting & Husky Pipeline](./Integration/linting-husky-pipeline.md)

## See Also

## concept_id
cm03-commit-management-integration

## title
Commit Management â€” Complete Integration

## aliases
- CM03-commit-management-integration

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required- [[CM01-commitizen-cz-git]]
- [[CM02-commitlint-cli-config]]
- [[CM04-conventional-changelog]]
- [[CM05-husky-git-hooks]]
- [[CM06-release-it]]


