---
slug: commitizen-cz-git
sources:
  - https://github.com/commitizen/cz-cli
  - https://github.com/Zhengqbbb/cz-git
  - https://cz-git.qbb.sh/
date: 2026-11-02
tags:
  - priority/low
  - maturity/experimental
  - commitizen
  - cz-git
  - conventional-commits
  - interactive-commit
  - commit-prompt
  - --
# Commitizen & cz-git

## Overview

Commitizen provides interactive commit message prompts that enforce conventional commit format. cz-git is a modern, lightweight, highly customizable Commitizen adapter with AI support, emoji support, and better DX for monorepos.

---

## 1. Commitizen (cz-cli)

### What It Does

Commitizen is a Node.js CLI tool that assists in generating standardized commit messages through an interactive prompt. It acts as a wrapper around `git commit`, guiding developers through a structured Q&A session.

### Installation

```bash
# Local installation (recommended)
pnpm add -D commitizen

# Global installation (optional)
pnpm add -g commitizen
```

### Configuration

#### package.json

```json
{
  "config": {
    "commitizen": {
      "path": "cz-git"
    }
  },
  "scripts": {
    "commit": "cz",
    "commit:retry": "cz --retry"
  }
}
```

#### .czrc (Alternative)

```json
{
  "path": "cz-git"
}
```

### Usage

```bash
# Interactive commit (replaces git commit)
pnpm commit
# or
npx cz

# Retry last commit (after failed pre-commit hook)
npx cz --retry

# With git flags
git cz -m "feat: add new feature"
git cz -a  # stage all
git cz --dry-run
```

### Retrying Failed Commits

```bash
# After tests fail in pre-commit hook, fix and retry:
npx cz --retry
# or
npm run commit:retry
```

### Multi-Repository Setup

```javascript
// my-commit-cli.js
#!/usr/bin/env node
const path = require('path');
const { bootstrap } = require('commitizen/dist/cli/git-cz').bootstrap;

bootstrap({
  cliPath: path.join(__dirname, 'node_modules/commitizen'),
  config: {
    path: 'cz-git'  // or any adapter
  }
});
```

```json
// package.json
{
  "bin": "./my-commit-cli.js",
  "dependencies": {
    "commitizen": "^4.x",
    "cz-git": "^1.x"
  }
}
```

---

## 2. cz-git â€” Modern Adapter

### What It Does

cz-git is a DX-first, lightweight, highly customizable Commitizen adapter that outputs standard Conventional Commits format. Features:

- **Search & selection** on CLI (reduces typos)
- **Emoji support** for commits
- **Monorepo-friendly** scopes
- **AI integration** (OpenAI)
- **Issue linking** with issuePrefix
- **Lightweight** (~1.76 MB)

### Installation

```bash
pnpm add -D cz-git
```

### Full Configuration

```javascript
// cz.config.js
const { defineConfig } = require('cz-git')

const rules = [
  { value: 'feat',     name: 'feat:     A new feature' },
  { value: 'feat(wip)', name: 'feat(wip): A new feature [WIP]' },
  { value: 'fix',      name: 'fix:      A bug fix' },
  { value: 'docs',     name: 'docs:     Documentation only changes' },
  { value: 'style',    name: 'style:    Code style changes (whitespace, etc.)' },
  { value: 'refactor', name: 'refactor: Code refactoring' },
  { value: 'perf',     name: 'perf:     Performance improvements' },
  { value: 'test',     name: 'test:     Adding or updating tests' },
  { value: 'build',    name: 'build:    Build system changes' },
  { value: 'ci',       name: 'ci:       CI configuration changes' },
  { value: 'chore',    name: 'chore:    Maintenance tasks' },
  { value: 'revert',   name: 'revert:   Revert a previous commit' },
]

const emojiRules = [
  { value: 'feat',     emoji: 'âœ¨',   name: 'âœ¨  feat:     A new feature' },
  { value: 'fix',      emoji: 'ðŸ›',   name: 'ðŸ›  fix:      A bug fix' },
  { value: 'docs',     emoji: 'ðŸ“',   name: 'ðŸ“  docs:     Documentation' },
  { value: 'style',    emoji: 'ðŸ’„',   name: 'ðŸ’„  style:    Styling' },
  { value: 'refactor', emoji: 'â™»ï¸',   name: 'â™»ï¸  refactor: Refactoring' },
  { value: 'perf',     emoji: 'âš¡ï¸',  name: 'âš¡ï¸  perf:     Performance' },
  { value: 'test',     emoji: 'âœ…',   name: 'âœ…  test:     Tests' },
  { value: 'build',    emoji: 'ðŸ”¨',   name: 'ðŸ”¨  build:    Build' },
  { value: 'ci',       emoji: 'ðŸ‘·',   name: 'ðŸ‘·  ci:       CI' },
  { value: 'chore',    emoji: 'ðŸ—‚ï¸',   name: 'ðŸ—‚ï¸  chore:    Chores' },
  { value: 'revert',   emoji: 'âª',   name: 'âª  revert:   Revert' },
]

module.exports = defineConfig({
  // â”€â”€â”€ Custom Questions â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  customQuestions: [
    {
      name: 'issue',
      message: 'Reference issue number (leave blank if none):'
    }
  ],

  // â”€â”€â”€ Rules â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  rules: {
    // type-enum
    'type-enum': {
      values: rules.map(r => r.value.replace('(wip)', '')),
      description: 'Select the type of change'
    },
    // scope-enum
    'scope-enum': {
      values: ['app', 'web', 'api', 'ui', 'auth', 'db', 'config'],
      description: 'Select the scope'
    },
    // subject-max-length
    'subject-max-length': 100,
    // header-max-length
    'header-max-length': 100,
    // body-max-line-length
    'body-max-line-length': 100,
    // body-max-length
    'body-max-length': 5000,
  },

  // â”€â”€â”€ Scopes â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  scopes: [
    { name: 'app' },
    { name: 'web' },
    { name: 'api' },
    { name: 'ui' },
    { name: 'auth' },
    { name: 'db' },
    { name: 'config' },
    { name: 'none(/)' },
  ].map(s => ({ ...s, value: s.value === 'none(/)' ? '' : s.value })),

  // â”€â”€â”€ Use Emoji â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  useEmoji: true,

  // â”€â”€â”€ Theme â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  themeColorCode: '#3178c6',

  // â”€â”€â”€ Allow Custom Scope â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  allowCustomScope: true,

  // â”€â”€â”€ Send CI Prefixes â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  allowCustomIssue: true,

  // â”€â”€â”€ Override Messages â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  messages: {
    type: 'Select the type of change:',
    scope: '\nSelect the scope (or leave blank):\n  (Use arrow keys or type)',
    customScope: 'Denote a custom scope:',
    subject: 'Write a short, imperative tense description of the change:\n',
    body: 'Provide a longer description of the change:\n  (Use | for new lines, empty to skip):\n',
    breaking: 'List any BREAKING CHANGES:\n  (empty to skip):\n',
    footer: 'List any issues closed by this change:\n  (e.g., "Closes #123"):\n',
    confirmCommit: 'Are you sure you want to proceed with the commit above?',
  },

  // â”€â”€â”€ Allow Empty Commit â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  allowEmptySubject: false,

  // â”€â”€â”€ Questions Order â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  // type â†’ scope â†’ subject â†’ body â†’ footer â†’ confirm
})
```

### Simplified Configuration

```javascript
// cz.config.js â€” Minimal setup
const { defineConfig } = require('cz-git')

module.exports = defineConfig({
  rules: {
    'type-enum': [
      'feat', 'fix', 'docs', 'style', 'refactor', 'perf', 'test',
      'build', 'ci', 'chore', 'revert'
    ],
    'scope-enum': ['app', 'web', 'api', 'ui', 'auth', 'db'],
    'subject-max-length': 100,
    'header-max-length': 100,
  },
  useEmoji: true,
  allowCustomScope: true,
})
```

### Environment Variables

```bash
# Disable emoji
export CZ_GIT_EMOJI=false

# Custom theme color
export CZ_GIT_THEME_COLOR='#ff0000'

# Allow empty subject
export CZ_GIT_ALLOW_EMPTY_SUBJECT=true
```

---

## 3. czg â€” Standalone CLI

### What It Does

czg is a standalone git commit CLI built by the same author as cz-git. It doesn't require Commitizen â€” it's a complete replacement for `git commit`.

### Installation

```bash
# Global (recommended for czg)
pnpm add -g czg

# Or local
pnpm add -D czg
```

### Usage

```bash
# Replace git commit entirely
czg

# With message
czg -m "feat: add new feature"

# All git commit flags work
czg -a
czg --verbose
```

### package.json

```json
{
  "scripts": {
    "commit": "czg"
  }
}
```

---

## 4. Integration with commitlint

### Using @commitlint/cz-commitlint

```bash
pnpm add -D @commitlint/cz-commitlint
```

```json
// package.json
{
  "config": {
    "commitizen": {
      "path": "@commitlint/cz-commitlint"
    }
  }
}
```

### Full Integration Pattern

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚              COMMIT WORKFLOW                         â”‚
â”‚                                                      â”‚
â”‚  Developer runs:                                     â”‚
â”‚  pnpm commit  (or npx cz)                            â”‚
â”‚         â”‚                                            â”‚
â”‚         â–¼                                            â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                               â”‚
â”‚  â”‚  cz-git / czg    â”‚  Interactive prompt           â”‚
â”‚  â”‚  (Commitizen)    â”‚  guides message format        â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                               â”‚
â”‚           â”‚                                          â”‚
â”‚           â–¼                                          â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                               â”‚
â”‚  â”‚  git commit      â”‚  Creates commit               â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                               â”‚
â”‚           â”‚                                          â”‚
â”‚           â–¼                                          â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                               â”‚
â”‚  â”‚  Husky commit-msgâ”‚                               â”‚
â”‚  â”‚  commitlint      â”‚  Validates format             â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                               â”‚
â”‚           â”‚                                          â”‚
â”‚           â–¼                                          â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                               â”‚
â”‚  â”‚  commit accepted â”‚  or rejected with error       â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                               â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## 5. Best Practices

### Do's

- âœ… Use cz-git for modern DX with emoji and AI
- âœ… Configure commitlint to validate what cz-git produces
- âœ… Use Husky commit-msg hook as safety net
- âœ… Allow custom scopes for flexibility
- âœ… Use `--retry` flag after failed pre-commit hooks
- âœ… Configure `rules` to match your team's conventions

### Don'ts

- âŒ Don't rely solely on cz-git â€” always have commitlint validation
- âŒ Don't make rules too restrictive (blocks productivity)
- âŒ Don't use both cz-git and cz-conventional-changelog together
- âŒ Don't forget to add Husky commit-msg hook

---

## Cross-References

- [Commitlint CLI & Config](./commitlint-cli-config.md)
- [Husky Git Hooks](./husky-git-hooks.md)
- [validate-branch-name](./validate-branch-name.md)
- [Conventional Changelog](./conventional-changelog.md)
- [release-it](./release-it.md)
- [Linting & Husky Pipeline](./linting-husky-pipeline.md)

## See Also
- [[CM02-commitlint-cli-config]]
- [[CM03-commit-management-integration]]
- [[CM04-conventional-changelog]]
- [[CM05-husky-git-hooks]]
- [[CM06-release-it]]


