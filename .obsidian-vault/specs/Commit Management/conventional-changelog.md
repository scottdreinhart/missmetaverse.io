---
slug: conventional-changelog
sources:
  - https://github.com/conventional-changelog/conventional-changelog
  - https://conventional-changelog.js.org/
date: 2026-11-02
tags:
  - conventional-changelog
  - changelog
  - conventionalcommits
  - changelog-generation
  - git-metadata
---

# Conventional Changelog

## Overview

conventional-changelog generates CHANGELOG files from git commit metadata following the Conventional Commits specification. It's a comprehensive ecosystem of packages for automated changelog generation and version management.

---

## 1. Ecosystem Packages

### Core Packages

| Package | Purpose |
|---------|---------|
| `conventional-changelog` | Full-featured CLI for changelog generation |
| `conventional-changelog-angular` | Angular commit format preset |
| `conventional-changelog-conventionalcommits` | Conventional Commits preset |
| `conventional-changelog-preset-loader` | Load custom presets |
| `conventional-changelog-writer` | Write CHANGELOG from parsed commits |
| `conventional-commits-parser` | Parse commit messages |
| `conventional-commits-filter` | Filter commits by type |
| `conventional-recommended-bump` | Get recommended version bump |
| `@conventional-changelog/git-client` | Git operations wrapper |
| `@conventional-changelog/template` | CHANGELOG template engine |
| `standard-changelog` | CLI for Angular format |

### Recommended Automation Tools

- **[commit-and-tag-version](https://github.com/absolute-version/commit-and-tag-version)** — Drop-in replacement for `npm version`, handles version bumping, tagging, and CHANGELOG generation
- **[semantic-release](https://github.com/semantic-release/semantic-release)** — Fully automates releases from CI/CD
- **[simple-release-action](https://simple-release.js.org/github-action/)** — Simple GitHub Action for version bumps and changelogs

---

## 2. Installation

```bash
# Core package
pnpm add -D conventional-changelog conventional-changelog-conventionalcommits

# Or Angular preset
pnpm add -D conventional-changelog conventional-changelog-angular

# Or commit-and-tag-version (recommended for most projects)
pnpm add -D commit-and-tag-version
```

---

## 3. Usage

### CLI — conventional-changelog

```bash
# Generate changelog (conventionalcommits preset)
npx conventional-changelog -p conventionalcommits -i CHANGELOG.md -s

# Generate changelog (angular preset)
npx conventional-changelog -p angular -i CHANGELOG.md -s

# Generate changelog (conventionalcommits preset)
npx standard-changelog -i CHANGELOG.md -s

# With options
npx conventional-changelog \
  -p conventionalcommits \
  -i CHANGELOG.md \
  -s \
  --release-count 10 \
  --tag-prefix "v"
```

### Programmatic API

```javascript
// Using conventional-changelog-conventionalcommits
import createPreset from 'conventional-changelog-conventionalcommits'
import { changelog } from 'conventional-changelog'

const config = createPreset({
  issuePrefixes: ['TEST-'],
  skip: {
    bump: false,
    commit: false,
    tag: false,
  },
})

// Generate changelog
changelog(config, (err) => {
  if (err) console.error(err)
})
```

### commit-and-tag-version (Recommended)

```bash
# Bump version, generate changelog, tag
npx commit-and-tag-version

# With type
npx commit-and-tag-version --type feat

# Dry run
npx commit-and-tag-version --dry-run

# Skip changelog
npx commit-and-tag-version --skip.changelog

# Custom message
npx commit-and-tag-version --message "chore(release): %s"
```

---

## 4. Configuration

### `.conventional-changelog.json`

```json
{
  "preset": "conventionalcommits",
  "releaseType": "semver",
  "bump": true,
  "commit": true,
  "tag": true,
  "skip": {
    "bump": false,
    "commit": false,
    "tag": false,
    "changelog": false
  }
}
```

### package.json

```json
{
  "scripts": {
    "changelog": "conventional-changelog -p conventionalcommits -i CHANGELOG.md -s",
    "version:bump": "commit-and-tag-version",
    "version:bump:minor": "commit-and-tag-version --release-type minor",
    "version:bump:major": "commit-and-tag-version --release-type major",
    "version:bump:patch": "commit-and-tag-version --release-type patch",
    "version:bump:preminor": "commit-and-tag-version --release-type preminor",
    "version:bump:prerelease": "commit-and-tag-version --release-type prerelease"
  }
}
```

### commit-and-tag-version Configuration

```json
{
  "scriptVersion": "@commitlint/config-conventional",
  "header": "# Changelog\n",
  "commitUrlFormat": "https://github.com/OWNER/REPO/commits/{{hash}}",
  "compareUrlFormat": "https://github.com/OWNER/REPO/compare/{{previousTag}}...{{currentTag}}",
  "issuesUrl": "https://github.com/OWNER/REPO/issues/{{id}}",
  "releaseCommitMessageFormat": "chore(release): {{currentTag}}",
  "skip": {
    "bump": false,
    "commit": false,
    "tag": false,
    "changelog": false
  }
}
```

---

## 5. Preset Options

### conventionalcommits Preset

```javascript
import createPreset from 'conventional-changelog-conventionalcommits'

const config = createPreset({
  // Issue prefixes (for linking issues)
  issuePrefixes: ['-', '#', 'TEST-'],

  // Bump preset
  bump: 'conventionalcommits',

  // Skip sections
  skip: {
    bump: false,
    commit: false,
    tag: false,
  },

  // Commit message rules
  parserOpts: {
    headerPattern: /^(\w*)(?:\(([\w\.\-\s]*)\))?:\s(.*)$/,
    headerCorrespondence: ['type', 'scope', 'subject'],
  },

  // Writer options
  writerOpts: {
    // Transform each commit
    transform: (commit, context) => {
      return commit
    },

    // Main title
    mainTitle: 'CHANGELOG',

    // Commit section titles
    commitTypes: [
      { type: 'feat', section: '✨ Features' },
      { type: 'fix', section: '🐛 Bug Fixes' },
      { type: 'perf', section: '⚡ Performance' },
      { type: 'refactor', section: '♻️ Refactoring' },
      { type: 'style', section: '💄 Styles' },
      { type: 'test', section: '✅ Tests' },
      { type: 'docs', section: '📝 Documentation' },
      { type: 'build', section: '🔨 Build' },
      { type: 'ci', section: '👷 CI' },
      { type: 'chore', section: '🗂️ Chores' },
      { type: 'revert', section: '⏪ Reverts' },
    ],
  },
})
```

---

## 6. Conventional Commits Format

### Commit Structure

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

| Type | Description | Version Bump |
|------|-------------|--------------|
| `feat` | A new feature | Minor |
| `fix` | A bug fix | Patch |
| `perf` | Performance improvement | Patch |
| `feat!` / `fix!` | Breaking change | Major |
| `BREAKING CHANGE` in footer | Breaking change | Major |

### Examples

```
feat(auth): add OAuth2 login support

Implement OAuth2 authentication with Google and GitHub providers.
Users can now log in using their existing accounts.

Closes #123, #124

feat(api)!: change response format

The API response format has been changed to follow REST best practices.
All endpoints now return a standardized response object.

BREAKING CHANGE: Response format changed from { data: ... } to { success: true, data: ... }
```

---

## 7. Version Bump Rules

### conventionalcommits Preset

| Commit Type | Bump |
|-------------|------|
| `feat` | minor |
| `fix`, `perf` | patch |
| `feat!`, `fix!`, `BREAKING CHANGE` | major |
| `revert` | revert |

### Pre-releases

```bash
# Alpha
npx commit-and-tag-version --release-type alpha

# Beta
npx commit-and-tag-version --release-type beta

# RC
npx commit-and-tag-version --release-type rc

# Pre-major
npx commit-and-tag-version --release-type premajor --preid=beta
```

---

## 8. Node.js Support

| Version | Node.js |
|---------|---------|
| v25+ | Node.js 22 LTS |
| v24+ | Node.js 20 LTS |
| v23+ | Node.js 18 LTS |

Only LTS versions are supported.

---

## Cross-References

- [Commitizen & cz-git](./commitizen-cz-git.md)
- [Commitlint CLI & Config](./commitlint-cli-config.md)
- [Husky Git Hooks](./husky-git-hooks.md)
- [release-it](./release-it.md)
- [validate-branch-name](./validate-branch-name.md)
