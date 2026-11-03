---
slug: release-it
sources:
  - https://github.com/release-it/release-it
  - https://release-it.org/
date: 2026-11-02
tags:
  - maturity/experimental
  - release-it
  - versioning
  - automated-releases
  - npm-publish
  - changelog
  - semver
  - --
# release-it

## Overview

release-it automates versioning, tagging, changelog generation, and package publishing. It supports Git, npm, GitHub Releases, GitLab Releases, and can be extended with plugins.

---

## 1. Installation

```bash
pnpm add -D release-it
```

### package.json

```json
{
  "scripts": {
    "release": "release-it",
    "release:ci": "release-it --ci",
    "release:dry-run": "release-it --dry-run",
    "release:bump": "release-it --release-version"
  }
}
```

---

## 2. Configuration

### `.release-it.json`

```json
{
  "$schema": "https://unpkg.com/release-it@21/schema/release-it.json",

  // â”€â”€â”€ Git â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  "git": {
    "commitMessage": "chore: release v${version}",
    "tagAnnotation": "v${version}",
    "pushRepo": "origin",
    "requireCommits": false,
    "requireCleanWorkingDir": true,
    "requireUpstream": false,
    "requireBranch": ["main", "release/*"],
    "changelog": "npx conventional-changelog -p conventionalcommits -i CHANGELOG.md -s",
    "changelogCmd": "npx conventional-changelog -p conventionalcommits --tag-prefix v --output CHANGELOG.md",
    "commitArgs": ["-S"],
    "tagArgs": ["-s"],
    "pushArgs": ["--follow-tags", "--sign-tags"]
  },

  // â”€â”€â”€ GitHub â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  "github": {
    "release": true,
    "releaseName": "v${version}",
    "releaseNotes": "npx conventional-changelog -p conventionalcommits -i CHANGELOG.md -s --tag-prefix v",
    "tokenRef": "GITHUB_TOKEN",
    "comments": {
      "submit": true,
      "issue": "### What's Changed\n\n${changelog}",
      "pr": "### What's Changed\n\n${changelog}",
      "issueWhen": "always"
    },
    "token": "${GITHUB_TOKEN}",
    "assets": ["dist/*.zip"],
    "draft": false,
    "tokenUrl": "https://github.com/settings/tokens"
  },

  // â”€â”€â”€ npm â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  "npm": {
    "publish": true,
    "publishArgs": ["--access", "public"],
    "tag": "latest",
    "skipChecks": false,
    "timeout": 30,
    "message": "bump version to v${version}"
  },

  // â”€â”€â”€ Hooks â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  "hooks": {
    "before:init": ["pnpm lint", "pnpm test:run"],
    "before:release": ["pnpm build"],
    "after:bump": ["echo \"Released v${version}\""],
    "after:release": ["echo \"Successfully released ${name} v${version} to ${repo.repository}\""]
  },

  // â”€â”€â”€ Plugins â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  "plugins": {
    "@release-it/conventional-changelog": {
      "preset": "conventionalcommits",
      "infile": "CHANGELOG.md",
      "ignoreRecommendedBump": false
    }
  },

  // â”€â”€â”€ Pre-releases â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  "npm": {
    "preRelease": "beta"
  },

  // â”€â”€â”€ CI Mode â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  // Automatically enabled in CI environments
  // Use --ci flag for manual CI mode

  // â”€â”€â”€ Verbose â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  // verbose: 1  // Log hook output
  // verbose: 2  // Log all internal commands
}
```

### Simplified Configuration

```json
{
  "git": {
    "commitMessage": "chore: release v${version}"
  },
  "github": {
    "release": true
  }
}
```

---

## 3. Git Configuration

### Basic Git Setup

```json
{
  "git": {
    "commitMessage": "chore: release v${version}",
    "tagAnnotation": "v${version}",
    "pushRepo": "origin",
    "requireBranch": "main",
    "requireCommits": false,
    "requireCleanWorkingDir": true
  }
}
```

### Git with Signing

```json
{
  "git": {
    "commitArgs": ["-S"],
    "tagArgs": ["-s", "-m", "v${version}"],
    "pushArgs": ["--follow-tags", "--sign-tags"]
  }
}
```

### Branch Requirements

```json
{
  "git": {
    "requireBranch": "main",
    "requireBranch": ["main", "release/*"],
    "requireBranch": "/^(feature|fix|release)\\//",
    "requireUpstream": true
  }
}
```

---

## 4. npm Publishing

### Basic npm Publish

```json
{
  "npm": {
    "publish": true,
    "publishArgs": ["--access", "public"],
    "tag": "latest"
  }
}
```

### Pre-release Publishing

```json
{
  "npm": {
    "preRelease": "beta",
    "preReleaseId": "beta.0",
    "tag": "beta"
  }
}
```

### Skip npm Publish

```json
{
  "npm": {
    "publish": false
  }
}
```

### Trusted Publishing (OIDC)

```bash
# GitHub Actions with OIDC (no token needed)
# Configure in GitHub Settings > Packages > Trusted Publishing
```

---

## 5. GitHub Releases

### Automated GitHub Release

```json
{
  "github": {
    "release": true,
    "releaseName": "v${version}",
    "releaseNotes": "cat CHANGELOG.md",
    "tokenRef": "GITHUB_TOKEN",
    "draft": false,
    "prerelease": false,
    "assets": ["dist/*.zip", "dist/*.tar.gz"]
  }
}
```

### Manual GitHub Release

```json
{
  "github": {
    "release": true,
    "releaseName": "v${version}",
    "autoGenerateReleaseNotes": true,
    "draft": true  // Creates draft release
  }
}
```

---

## 6. Changelog Generation

### Default Changelog

```json
{
  "git": {
    "changelog": "npx conventional-changelog -p conventionalcommits -i CHANGELOG.md -s"
  }
}
```

### With @release-it/conventional-changelog Plugin

```bash
pnpm add -D @release-it/conventional-changelog
```

```json
{
  "plugins": {
    "@release-it/conventional-changelog": {
      "preset": "conventionalcommits",
      "infile": "CHANGELOG.md",
      "ignoreRecommendedBump": false,
      "writers": [
        {
          "group": "feat",
          "section": "âœ¨ Features"
        },
        {
          "group": "fix",
          "section": "ðŸ› Bug Fixes"
        },
        {
          "group": "perf",
          "section": "âš¡ Performance"
        }
      ]
    }
  }
}
```

### Print Changelog Without Releasing

```bash
npx release-it --changelog
```

---

## 7. Hooks

### Available Hooks

| Hook | When |
|------|------|
| `before:init` | Before anything starts |
| `before:bump` | Before version bump |
| `after:bump` | After version bump |
| `before:release` | Before git push/release |
| `after:release` | After everything completes |

### Plugin-Specific Hooks

| Hook | When |
|------|------|
| `before:version:init` | Before version plugin |
| `after:version:bump` | After version bump |
| `before:git:init` | Before git plugin |
| `after:git:release` | After git push |
| `before:npm:init` | Before npm plugin |
| `after:npm:release` | After npm publish |
| `before:github:init` | Before GitHub plugin |
| `after:github:release` | After GitHub release |

### Hook Examples

```json
{
  "hooks": {
    "before:init": [
      "pnpm lint",
      "pnpm test:run",
      "pnpm type-check"
    ],
    "before:bump": [
      "echo \"Preparing release v${version}\"",
      "pnpm build"
    ],
    "after:bump": [
      "echo \"Version bumped to v${version}\"",
      "cat package.json | jq '.version'"
    ],
    "before:release": [
      "echo \"Creating release for v${version}\"",
      "pnpm build:prod"
    ],
    "after:release": [
      "echo \"Successfully released v${version}\"",
      "echo \"Release URL: ${releaseUrl}\"",
      "./scripts/post-release.sh"
    ]
  }
}
```

### Available Variables

```
${version}           â€” New version
${latestVersion}     â€” Latest version
${changelog}         â€” Changelog text
${name}              â€” Package name
${repo.owner}        â€” Repository owner
${repo.repository}   â€” Repository name
${repo.remote}       â€” Remote name (origin)
${repo.protocol}     â€” Protocol (https/git)
${repo.host}         â€” Host (github.com)
${branchName}        â€” Current branch
${releaseUrl}        â€” Release URL
```

---

## 8. CLI Options

```bash
# Interactive release (default)
pnpm release

# CI mode (non-interactive)
pnpm release:ci
npx release-it --ci

# Dry run (show what would happen)
npx release-it --dry-run

# Only bump version (no release)
npx release-it --only-version

# Print recommended version
npx release-it --release-version

# Print changelog only
npx release-it --changelog

# Verbose output
npx release-it --verbose
npx release-it -VV

# Specific version
npx release-it 2.0.0

# Pre-release
npx release-it --preRelease=beta
npx release-it --preRelease=rc

# Skip plugins
npx release-it --no-npm
npx release-it --no-github
npx release-it --no-git

# Skip hooks
npx release-it --no-hooks
```

---

## 9. Pre-releases

### Configuration

```json
{
  "npm": {
    "preRelease": "beta",
    "preReleaseId": "beta.0"
  }
}
```

### CLI

```bash
# Alpha
npx release-it --preRelease=alpha

# Beta
npx release-it --preRelease=beta

# RC
npx release-it --preRelease=rc

# Custom pre-release ID
npx release-it --preRelease=beta --preReleaseId=beta.2
```

### Pre-release Versions

```
1.0.0-alpha.0
1.0.0-alpha.1
1.0.0-beta.0
1.0.0-rc.0
1.0.0
```

---

## 10. Plugins

### Available Plugins

| Plugin | Purpose |
|--------|---------|
| `@release-it/conventional-changelog` | Conventional changelog, recommended bump |
| `@release-it/keep-a-changelog` | Keep a Changelog format |
| `@release-it/bumper` | Read/write version from any file |
| `release-it-pnpm` | pnpm workspace support |
| `@release-it-plugins/workspaces` | Multi-package releases |
| `release-it-git-cliff` | Use git-cliff for changelog |
| `release-it-calver-plugin` | Calendar versioning |

### Using @release-it/conventional-changelog

```bash
pnpm add -D @release-it/conventional-changelog
```

```json
{
  "plugins": {
    "@release-it/conventional-changelog": {
      "preset": "conventionalcommits",
      "infile": "CHANGELOG.md",
      "ignoreRecommendedBump": false,
      "gitRawOpts": {
        "merges": /merge/i
      },
      "writerOpts": {
        "transform": (commit, context) => commit
      }
    }
  }
}
```

---

## 11. Monorepo Support

### Using @release-it-plugins/workspaces

```bash
pnpm add -D @release-it-plugins/workspaces
```

```json
{
  "plugins": {
    "@release-it-plugins/workspaces": {
      "packages": ["packages/*"],
      "changelog": true,
      "git": true
    }
  }
}
```

### Using release-it-pnpm

```bash
pnpm add -D release-it-pnpm
```

---

## 12. CI/CD Integration

### GitHub Actions

```yaml
# .github/workflows/release.yml
name: Release

on:
  push:
    branches: [main]

permissions:
  contents: write
  packages: write

jobs:
  release:
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
          registry-url: 'https://registry.npmjs.org'

      - run: pnpm install --frozen-lockfile

      - run: npx release-it --ci
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NODE_AUTH_TOKEN: ${{ secrets.NODE_AUTH_TOKEN }}
```

---

## 13. Best Practices

### Do's

- âœ… Use `--ci` mode in CI/CD pipelines
- âœ… Configure hooks for pre-release validation (lint, test)
- âœ… Use `@release-it/conventional-changelog` for automated changelogs
- âœ… Use `--dry-run` before actual releases
- âœ… Sign your commits and tags for security
- âœ… Use GitHub OIDC for token-free publishing

### Don'ts

- âŒ Don't run release-it on feature branches
- âŒ Don't skip pre-release validation hooks
- âŒ Don't use `--no-hooks` in production releases
- âŒ Don't forget to configure `requireBranch`

---

## Cross-References

- [Commitizen & cz-git](./commitizen-cz-git.md)
- [Commitlint CLI & Config](./commitlint-cli-config.md)
- [Husky Git Hooks](./husky-git-hooks.md)
- [Conventional Changelog](./conventional-changelog.md)
- [validate-branch-name](./validate-branch-name.md)
- [CI/CD GitHub Actions](./Integration/cicd-github-actions.md)

## See Also
- [[CM01-commitizen-cz-git]]
- [[CM02-commitlint-cli-config]]
- [[CM03-commit-management-integration]]
- [[CM04-conventional-changelog]]
- [[CM05-husky-git-hooks]]


