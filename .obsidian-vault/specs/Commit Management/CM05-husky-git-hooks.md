---
slug: husky-git-hooks
sources:
  - https://typicode.github.io/husky/
  - https://typicode.github.io/husky/get-started.html
  - https://typicode.github.io/husky/how-to.html
  - https://typicode.github.io/husky/troubleshoot.html
date: 2026-11-02
tags:
  - maturity/deprecated
  - husky
  - git-hooks
  - pre-commit
  - commit-msg
  - pre-push
# Husky Git Hooks

## Overview

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
Husky is an ultra-fast (2 kB gzipped, ~1ms execution), modern native git hooks manager for Node.js. It uses Git's `core.hooksPath` feature to manage hooks without modifying the `.git` directory.

---

## 1. Features

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
- **2 kB gzipped** with zero dependencies
- **~1ms execution** â€” fastest hooks manager
- Uses `core.hooksPath` â€” no `.git/hooks` modifications
- Supports all 13 client-side Git hooks
- Works on macOS, Linux, Windows
- Works with Git GUIs, Node version managers, monorepos
- POSIX shell scripting support
- Branch-specific hooks
- Aligns with npm `prepare` script best practices

---

## 2. Installation (Husky v9)

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Setup

```bash
# Install Husky
pnpm add -D husky

# Initialize (creates .husky/ directory and pre-commit hook)
npx husky init

# This creates:
# .husky/pre-commit  â€” default hook
# package.json "prepare" script
```

### package.json

```json
{
  "scripts": {
    "prepare": "husky"
  }
}
```

### Add Hooks

```bash
# Add commit-msg hook
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"'

# Add pre-commit hook (lint-staged)
npx husky add .husky/pre-commit 'npx lint-staged'

# Add pre-push hook (run tests)
npx husky add .husky/pre-push 'pnpm test:run'

# Add post-merge hook
npx husky add .husky/post-merge 'pnpm install --frozen-lockfile'
```

---

## 3. Available Hooks

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Client-Side Hooks

| Hook | When It Runs | Common Use |
|------|-------------|------------|
| `pre-commit` | Before `git commit` | Lint, format, type-check staged files |
| `prepare-commit-msg` | After pre-commit, before editor opens | Add template, conventional commit prefix |
| `commit-msg` | After user enters commit message | Validate commit message format |
| `post-commit` | After successful commit | Notify, log, backup |
| `pre-merge-commit` | Before merge commit | Same as pre-commit for merges |
| `pre-rebase` | Before `git rebase` | Prevent rebasing protected branches |
| `post-merge` | After `git merge` | Reinstall deps, rebuild |
| `pre-push` | Before `git push` | Run tests, lint entire codebase |
| `pre-auto-gc` | Before auto garbage collection | Cleanup tasks |
| `post-rewrite` | After rewrite commands (amend, squash) | Sync hooks |
| `post-checkout` | After `git checkout` | Setup environment |
| `post-merge` | After `git merge` | Reinstall dependencies |
| `commit-filter` | Filter commits during filter-branch | Modify commits |

### Server-Side Hooks

| Hook | When It Runs | Common Use |
|------|-------------|------------|
| `pre-receive` | Before `git push` accepted | Reject pushes, enforce rules |
| `update` | Before each ref update | Per-ref validation |
| `post-receive` | After push accepted | Notifications, deployments |

---

## 4. Hook Examples

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### `.husky/pre-commit` â€” Lint Staged Files

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Run lint-staged (lints only staged files)
npx lint-staged
```

### `.husky/commit-msg` â€” Validate Commit Message

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Validate conventional commit format
npx --no -- commitlint --edit "$1"
```

### `.husky/pre-push` â€” Run Tests

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Run tests before push
pnpm test:run
```

### `.husky/post-merge` â€” Reinstall Dependencies

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Reinstall dependencies after merge
if [ -f "package.json" ]; then
  pnpm install --frozen-lockfile
fi
```

### `.husky/pre-rebase` â€” Prevent Rebasing Main

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Prevent rebasing protected branches
if [ "$1" = "main" ] || [ "$1" = "master" ]; then
  echo "Error: Cannot rebase the main branch"
  exit 1
fi
```

### `.husky/prepare-commit-msg` â€” Add Conventional Commit Template

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Only modify if not a merge, amend, or revert
COMMIT_SOURCE=$2
if [ "$COMMIT_SOURCE" = "message" ] || [ -z "$COMMIT_SOURCE" ]; then
  # Add conventional commit template
  echo "# feat: description" > "$1"
  echo "# " >> "$1"
  echo "# body" >> "$1"
  echo "# " >> "$1"
  echo "# breaking: description" >> "$1"
  echo "# " >> "$1"
  echo "# closes #" >> "$1"
fi
```

---

## 5. POSIX Shell Scripting

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Inline Linting (No Dependencies)

```bash
# .husky/pre-commit â€” Inline Prettier
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

prettier $(git diff --cached --name-only --diff-filter=ACMR | sed 's| |\\ |g') --write --ignore-unknown
git update-index --again
```

### Multiple Commands

```bash
# .husky/pre-commit
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Run multiple commands
pnpm lint
pnpm format
pnpm type-check
```

### Conditional Execution

```bash
# .husky/pre-push
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Only run on certain branches
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
  pnpm test:run --coverage
else
  pnpm test:run
fi
```

---

## 6. Branch-Specific Hooks

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
Husky supports branch-specific hooks in Husky v9:

```bash
# Create branch-specific hook
npx husky add .husky/pre-commit.main 'pnpm lint:fix'
npx husky add .husky/pre-commit.feature 'pnpm lint'
```

These hooks only run when on the specified branch.

---

## 7. Disabling Hooks

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Globally

```bash
# Disable all Husky hooks
export HUSKY=0

# Or in .bashrc / .zshrc
echo 'export HUSKY=0' >> ~/.zshrc
```

### Per-Commit

```bash
# Skip all hooks
git commit --no-verify -m "message"
```

### Temporarily

```bash
# Rename .husky directory
mv .husky .husky-disabled

# Re-enable
mv .husky-disabled .husky
```

---

## 8. Troubleshooting

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Hooks Not Running

```bash
# Check if Husky is installed
ls -la .husky/

# Check core.hooksPath
git config core.hooksPath

# Reinstall
pnpm install

# Check hook permissions
chmod +x .husky/*.sh
```

### Interactive Prompts in Hooks

```bash
# Husky v9 handles interactive prompts automatically
# No need for exec < /dev/tty (unlike older versions)
```

### Windows Issues

```bash
# Ensure line endings are LF
git config core.autocrlf false

# Make hooks executable
chmod +x .husky/*.sh

# Or use Git Bash for all hook operations
```

### Debug Mode

```bash
# Enable verbose output
HUSKY=1 git commit -m "test"

# Check hook output
cat .husky/pre-commit
```

---

## 9. Complete Integration Example

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required
### Full `.husky/` Directory

```
.husky/
â”œâ”€â”€ pre-commit          # Lint staged files
â”œâ”€â”€ commit-msg          # Validate commit message
â”œâ”€â”€ pre-push            # Run tests before push
â”œâ”€â”€ post-merge          # Reinstall deps after merge
â””â”€â”€ prepare-commit-msg  # Add commit template
```

### `.husky/pre-commit`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx lint-staged
```

### `.husky/commit-msg`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx --no -- commitlint --edit "$1"
```

### `.husky/pre-push`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

pnpm test:run
```

### `.husky/post-merge`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

if [ -f "package.json" ]; then
  pnpm install --frozen-lockfile
fi
```

---

## Cross-References

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

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
- [validate-branch-name](./validate-branch-name.md)
- [Conventional Changelog](./conventional-changelog.md)
- [release-it](./release-it.md)
- [Linting & Husky Pipeline](./Integration/linting-husky-pipeline.md)

## See Also

## concept_id
cm05-husky-git-hooks

## title
Husky Git Hooks

## aliases
- CM05-husky-git-hooks

## category
version-control

## concept_type
convention

## research_status
verified

## project_adoption
required- [[CM01-commitizen-cz-git]]
- [[CM02-commitlint-cli-config]]
- [[CM03-commit-management-integration]]
- [[CM04-conventional-changelog]]
- [[CM06-release-it]]


