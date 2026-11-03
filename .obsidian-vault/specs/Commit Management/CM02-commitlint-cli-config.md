---
slug: commitlint-cli-config
sources:
  - https://commitlint.js.org/
  - https://commitlint.js.org/guides/local-setup.html
  - https://commitlint.js.org/guides/ci-setup.html
  - https://commitlint.js.org/reference/rules.html
  - https://commitlint.js.org/reference/plugins.html
date: 2026-11-02
tags:
  - priority/high
  - maturity/experimental
  - domain/backend
  - type/reference
  - domain/security
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - domain/optimization
  - commitlint
  - conventional-commits
  - commit-validation
  - linting
---

# Commitlint CLI & Configuration

## Overview

commitlint helps teams adhere to commit message conventions by linting commit messages. It validates that commits follow the Conventional Commits specification before they are created.

---

## 1. Installation

```bash
pnpm add -D @commitlint/cli @commitlint/config-conventional
```

---

## 2. Configuration

### `commitlint.config.js`

```javascript
// commitlint.config.js
module.exports = {
  // ─── Extends ────────────────────────────────────────
  extends: ['@commitlint/config-conventional'],

  // ─── Rules ──────────────────────────────────────────
  rules: {
    // Type must be one of these
    'type-enum': [
      2,
      'always',
      [
        'feat',     // A new feature
        'fix',      // A bug fix
        'docs',     // Documentation only changes
        'style',    // Code style changes (whitespace, formatting)
        'refactor', // Code refactoring
        'perf',     // Performance improvements
        'test',     // Adding or updating tests
        'build',    // Build system changes
        'ci',       // CI configuration changes
        'chore',    // Maintenance tasks
        'revert',   // Revert a previous commit
        'wip',      // Work in progress
      ],
    ],

    // Scope must be one of these (optional)
    'scope-enum': [2, 'always', ['app', 'web', 'api', 'ui', 'auth', 'db', 'config', '']],

    // Subject case (never uppercase/pascal)
    'subject-case': [2, 'never', ['upper-case', 'pascal-case', 'sentence-case']],

    // Header max length
    'header-max-length': [2, 'always', 100],

    // Subject min length
    'subject-min-length': [2, 'always', 5],

    // Subject max length
    'subject-max-length': [2, 'always', 72],

    // Body max line length
    'body-max-line-length': [2, 'always', 100],

    // Body max length
    'body-max-length': [2, 'always', 5000],

    // Body must start with blank line
    'body-leading-blank': [2, 'always'],

    // Footer must start with blank line
    'footer-leading-blank': [2, 'always'],

    // Header must not have trailing whitespace
    'header-trim': [2, 'always'],

    // Subject must not end with period
    'subject-full-stop': [2, 'never', '.'],

    // Header must not end with period
    'header-full-stop': [2, 'never', '.'],

    // Type must be lowercase
    'type-case': [2, 'always', 'lower-case'],

    // Scope must be lowercase
    'scope-case': [2, 'always', 'lower-case'],
  },

  // ─── Ignored Rules ──────────────────────────────────
  // Skip certain rules for specific patterns
  ignores: [(commit) => commit.startsWith('Merge')],

  // ─── Prompt Configuration ───────────────────────────
  // Used when running commitlint as a prompt
  prompt: {
    settings: {
      useColor: true,
    },
    messages: {
      skip: '(press enter to skip)',
      max: 'upper %d chars',
      min: '%d chars minimum',
      emptyWarning: 'can not be empty',
      upperLimitWarning: 'over limit',
      lowerLimitWarning: 'below limit',
    },
    questions: {
      type: {
        description: 'Select the type of change that you\'re committing',
        enum: {
          feat: {
            description: 'A new feature',
            title: 'Features',
          },
          fix: {
            description: 'A bug fix',
            title: 'Bug Fixes',
          },
          docs: {
            description: 'Documentation only changes',
            title: 'Documentation',
          },
          style: {
            description: 'Changes that do not affect the meaning of the code',
            title: 'Styles',
          },
          refactor: {
            description: 'A code change that neither fixes a bug nor adds a feature',
            title: 'Code Refactoring',
          },
          perf: {
            description: 'A code change that improves performance',
            title: 'Performance Improvements',
          },
          test: {
            description: 'Adding missing tests or correcting existing tests',
            title: 'Tests',
          },
          build: {
            description: 'Changes that affect the build system or external dependencies',
            title: 'Build Systems',
          },
          ci: {
            description: 'Changes to CI configuration files and scripts',
            title: 'Continuous Integration',
          },
          chore: {
            description: 'Other changes that don\'t modify src or test files',
            title: 'Chores',
          },
          revert: {
            description: 'Reverts a previous commit',
            title: 'Reverts',
          },
        },
      },
      scope: {
        description: 'What is the scope of this change (e.g. file or folder name)',
      },
      subject: {
        description: 'Write a short, imperative tense description of the change',
      },
      body: {
        description: 'Provide a longer description of the change',
      },
      isBreaking: {
        description: 'Are there any breaking changes?',
      },
      breakingBody: {
        description: 'A BREAKING CHANGE commit requires a body',
      },
      breaking: {
        description: 'Describe the breaking changes',
      },
      isIssueAffected: {
        description: 'Does this change affect any open issues?',
      },
      issuesBody: {
        description: 'If issues are closed, the commit requires a body',
      },
      issues: {
        description: 'Add issue references (e.g. "fix #123", "re #123")',
      },
    },
  },
}
```

### `commitlint.config.mjs` (ESM)

```javascript
// commitlint.config.mjs
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [2, 'always', ['feat', 'fix', 'docs', 'style', 'refactor', 'perf', 'test', 'build', 'ci', 'chore', 'revert']],
    'header-max-length': [2, 'always', 100],
  },
  ignores: [(commit) => commit.startsWith('Merge')],
}
```

---

## 3. All Available Rules

### Header Rules

| Rule | Default | Description |
|------|---------|-------------|
| `header-max-length` | 72 | Maximum characters in header |
| `header-min-length` | 0 | Minimum characters in header |
| `header-case` | `lower-case` | Case of header |
| `header-full-stop` | `.` (never) | Header must not end with period |
| `header-trim` | always | No leading/trailing whitespace |

### Type Rules

| Rule | Default | Description |
|------|---------|-------------|
| `type-enum` | conventional | Type must be in allowed list |
| `type-case` | `lower-case` | Case of type |
| `type-empty` | never | Type must not be empty |
| `type-max-length` | Infinity | Maximum characters in type |
| `type-min-length` | 0 | Minimum characters in type |

### Scope Rules

| Rule | Default | Description |
|------|---------|-------------|
| `scope-enum` | (none) | Scope must be in allowed list |
| `scope-case` | `lower-case` | Case of scope |
| `scope-empty` | never | Scope must not be empty |
| `scope-max-length` | Infinity | Maximum characters in scope |
| `scope-min-length` | 0 | Minimum characters in scope |
| `scope-delimiter-style` | `["/", "\", ","]` | Delimiters in multi-segment scopes |

### Subject Rules

| Rule | Default | Description |
|------|---------|-------------|
| `subject-case` | never `[sentence, start, pascal, upper]` | Subject case |
| `subject-empty` | never | Subject must not be empty |
| `subject-exclamation-mark` | never | Subject must not have `!` before `:` |
| `subject-full-stop` | `.` (never) | Subject must not end with period |
| `subject-max-length` | Infinity | Maximum characters in subject |
| `subject-min-length` | 0 | Minimum characters in subject |

### Body Rules

| Rule | Default | Description |
|------|---------|-------------|
| `body-case` | `lower-case` | Case of body |
| `body-empty` | never | Body must not be empty |
| `body-full-stop` | `.` (never) | Body must not end with period |
| `body-leading-blank` | always | Body must start with blank line |
| `body-max-length` | Infinity | Maximum characters in body |
| `body-max-line-length` | Infinity | Maximum characters per line in body |
| `body-min-length` | 0 | Minimum characters in body |

### Footer Rules

| Rule | Default | Description |
|------|---------|-------------|
| `footer-empty` | never | Footer must not be empty |
| `footer-leading-blank` | always | Footer must start with blank line |
| `footer-max-length` | Infinity | Maximum characters in footer |
| `footer-max-line-length` | Infinity | Maximum characters per line in footer |
| `footer-min-length` | 0 | Minimum characters in footer |

### Trailer Rules

| Rule | Default | Description |
|------|---------|-------------|
| `signed-off-by` | `Signed-off-by:` | Must contain trailer |
| `trailer-exists` | (none) | Must contain specific trailer |
| `references-empty` | never | Must have at least one reference |

### Breaking Change Rules

| Rule | Default | Description |
|------|---------|-------------|
| `breaking-change-exclamation-mark` | always | Breaking changes must have `!` and `BREAKING CHANGE` |

---

## 4. Local Setup with Husky

### Husky v9

```bash
# Initialize Husky
pnpm add -D husky
npx husky init

# Add commit-msg hook
echo "npx --no -- commitlint --edit \$1" > .husky/commit-msg
```

### `.husky/commit-msg`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx --no -- commitlint --edit "$1"
```

### Testing

```bash
# Test last commit
npx commitlint --from HEAD~1 --to HEAD --verbose

# Test a message via pipe
echo "feat: add new feature" | npx commitlint --default-config

# Test a file
npx commitlint --config commitlint.config.js -f COMMIT_EDIT_MSG
```

---

## 5. CI Setup

### GitHub Actions

```yaml
# .github/workflows/commitlint.yml
name: Commit Lint

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  commitlint:
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
```

### GitLab CI

```yaml
# .gitlab-ci.yml
commitlint:
  stage: test
  image: node:22-alpine
  before_script:
    - corepack enable
    - corepack prepare pnpm@latest --activate
    - pnpm install --frozen-lockfile
  script:
    - npx commitlint --from $CI_COMMIT_BEFORE_SHA --to $CI_COMMIT_SHA --verbose
```

---

## 6. Plugins

### Creating a Custom Plugin

```javascript
// commitlint-plugin-myplugin/index.js
export default {
  rules: {
    'dollar-sign': function (parsed, when, value) {
      return [
        parsed.subject.includes('$'),
        'Subject should contain a dollar sign',
      ]
    },
  },
}
```

### Using a Plugin

```javascript
// commitlint.config.js
module.exports = {
  extends: ['@commitlint/config-conventional'],
  plugins: ['commitlint-plugin-myplugin'],
  rules: {
    'myplugin/dollar-sign': [2, 'always'],
  },
}
```

### Peer Dependency

```json
{
  "peerDependencies": {
    "@commitlint/lint": ">=7.6.0"
  }
}
```

---

## 7. CLI Options

```bash
# Basic usage
npx commitlint --edit COMMIT_EDIT_MSG
npx commitlint -f COMMIT_EDIT_MSG

# From/to range
npx commitlint --from HEAD~5 --to HEAD

# Verbose output
npx commitlint --verbose

# Custom config path
npx commitlint --config commitlint.config.js

# Default config (no file needed)
echo "feat: test" | npx commitlint --default-config

# Legacy output format (v20 and earlier)
npx commitlint --legacy-output

# Help
npx commitlint --help
```

---

## Cross-References

- [Commitizen & cz-git](./commitizen-cz-git.md)
- [Husky Git Hooks](./husky-git-hooks.md)
- [Conventional Changelog](./conventional-changelog.md)
- [release-it](./release-it.md)
- [validate-branch-name](./validate-branch-name.md)
- [Linting & Husky Pipeline](./Integration/linting-husky-pipeline.md)

## See Also
- [[CM01-commitizen-cz-git]]
- [[CM03-commit-management-integration]]
- [[CM04-conventional-changelog]]
- [[CM05-husky-git-hooks]]
- [[CM06-release-it]]


