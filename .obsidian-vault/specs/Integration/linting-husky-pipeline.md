---
slug: linting-husky-pipeline
sources:
  - https://eslint.org/docs/latest/use/getting-started
  - https://typescript-eslint.io/getting-started
  - https://typicode.github.io/husky/
  - https://github.com/okonet/lint-staged
date: 2026-11-02
tags:
  - integration
  - eslint
  - prettier
  - husky
  - lint-staged
  - pre-commit
  - code-quality
---

# Linting, Formatting & Husky Pipeline

## Overview

This note covers the complete code quality pipeline: ESLint (with TypeScript), Prettier, Husky (git hooks), and lint-staged (staged file linting). Together, these tools ensure code quality is enforced before any commit enters the repository.

---

## 1. ESLint Configuration (Flat Config — ESLint 9+)

### `eslint.config.mjs`

```javascript
// @ts-check
import js from '@eslint/js'
import tseslint from 'typescript-eslint'
import react from 'eslint-plugin-react'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import globals from 'globals'

export default tseslint.config(
  // ─── Global Ignores ────────────────────────────────
  {
    ignores: [
      'dist/**',
      '.vite/**',
      'node_modules/**',
      'coverage/**',
      '**/*.d.ts',
    ],
  },

  // ─── Base Config (All Files) ───────────────────────
  {
    files: ['**/*.{js,ts,tsx,jsx}'],
    extends: [
      js.configs.recommended,
      ...tseslint.configs.recommended,
      // ...tseslint.configs.strict,     // Uncomment for stricter rules
      // ...tseslint.configs.stylistic,   // Uncomment for stylistic rules
    ],
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
        ...globals.es2024,
      },
    },
    rules: {
      // ─── React Rules ───────────────────────────────
      'react/react-in-jsx-scope': 'off',  // Not needed in React 19
      'react/prop-types': 'off',          // TypeScript handles this
      'react/jsx-no-target-blank': 'warn',
      'react/jsx-key': 'warn',

      // ─── React Hooks Rules ────────────────────────
      'react-hooks/rules-of-hooks': 'error',
      'react-hooks/exhaustive-deps': 'warn',

      // ─── React Refresh ────────────────────────────
      'react-refresh/only-export-components': [
        'warn',
        { allowConstantExport: true },
      ],

      // ─── TypeScript Rules ─────────────────────────
      '@typescript-eslint/no-unused-vars': [
        'error',
        { argsIgnorePattern: '^_', varsIgnorePattern: '^_' },
      ],
      '@typescript-eslint/consistent-type-imports': 'error',
      '@typescript-eslint/no-explicit-any': 'warn',
      '@typescript-eslint/no-non-null-assertion': 'warn',
      '@typescript-eslint/no-floating-promises': 'off',
      '@typescript-eslint/await-thenable': 'warn',
      '@typescript-eslint/promise-function-async': 'warn',

      // ─── General Rules ────────────────────────────
      'no-console': ['warn', { allow: ['warn', 'error'] }],
      'no-debugger': 'error',
      'prefer-const': 'warn',
      'prefer-template': 'warn',
    },
  },

  // ─── Test Files ────────────────────────────────────
  {
    files: ['**/*.test.{ts,tsx}', '**/*.spec.{ts,tsx}'],
    languageOptions: {
      globals: {
        ...globals.jest,
        ...globals.vitest,
        ...globals.node,
      },
    },
    rules: {
      '@typescript-eslint/no-unused-vars': 'off',
      'no-console': 'off',
    },
  },

  // ─── Markdown Files ────────────────────────────────
  {
    files: ['**/*.md'],
    extends: [
      // ...tseslint.configs.disableTypeChecked,  // Skip type checking for markdown
    ],
    rules: {
      'no-console': 'off',
    },
  },
)
```

### ESLint + TypeScript Integration

```bash
# Install required packages
pnpm add -D eslint @eslint/js typescript-typescript-eslint
pnpm add -D eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-react-refresh
pnpm add -D globals
```

### Typed Linting (Full Type Information)

For rules that require full type information (slower but more accurate):

```javascript
// eslint.config.mjs — Add this config block
{
  files: ['**/*.{ts,tsx}'],
  extends: [
    ...tseslint.configs.strictTypeChecked,
    ...tseslint.configs.stylisticTypeChecked,
  ],
  languageOptions: {
    parserOptions: {
      projectService: true,
      tsconfigRootDir: import.meta.dirname,
    },
  },
}
```

---

## 2. Prettier Configuration

### `.prettierrc.cjs`

```javascript
module.exports = {
  // ─── Formatting ────────────────────────────────────
  semi: true,               // Semicolons
  trailingComma: 'all',     // Trailing commas everywhere
  singleQuote: true,        // Single quotes
  printWidth: 80,           // Line length
  tabWidth: 2,              // Indentation width
  useTabs: false,           // Spaces over tabs
  bracketSpacing: true,     // Object spread: { ...obj }
  bracketSameLine: false,   // JSX brackets on new line
  arrowParens: 'always',    // (x) => x

  // ─── File Handling ─────────────────────────────────
  endOfLine: 'auto',        // Auto-detect line endings
  quoteProps: 'as-needed',  // Only quote when needed
  jsxSingleQuote: false,    // Double quotes in JSX
  proseWrap: 'preserve',    // Preserve markdown wrapping

  // ─── Plugins ───────────────────────────────────────
  plugins: [
    'prettier-plugin-tailwindcss',  // Tailwind CSS sorting
  ],
  tailwindFunctions: ['cn', 'clsx', 'cls'],  // Tailwind utility functions
}
```

### `.prettierignore`

```gitignore
# Generated files
dist/
.vite/
node_modules/

# Build artifacts
coverage/
*.tsbuildinfo

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db

# Test
playwright-report/
test-results/

# Environment
.env
.env.local
.env.*.local
```

### Prettier + Tailwind Plugin

```bash
pnpm add -D prettier-plugin-tailwindcss
```

---

## 3. Husky — Git Hooks

### Setup (Husky v9+)

```bash
# Initialize Husky
pnpm add -D husky
pnpm prepare  # Runs husky install

# Create default hooks directory
npx husky install

# Add a pre-commit hook
npx husky add .husky/pre-commit "pnpm lint-staged"

# Add a commit-msg hook (conventional commits)
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"'
```

### `.husky/pre-commit`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Run lint-staged (lints only staged files)
pnpm lint-staged
```

### `.husky/commit-msg`

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Enforce conventional commit messages
npx --no -- commitlint --edit "$1"
```

### `.husky/prepare-commit-msg` (Optional)

```bash
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

# Conventional commit types:
# feat:     A new feature
# fix:      A bug fix
# docs:     Documentation only changes
# style:    Code style changes (whitespace, etc.)
# refactor: Code refactoring
# test:     Adding or updating tests
# chore:    Maintenance tasks
```

---

## 4. lint-staged — Staged File Linting

### `lint-staged.config.mjs`

```javascript
import { defineConfig } from 'lint-staged/config'

export default defineConfig({
  // ─── TypeScript / React Files ──────────────────────
  '*.{ts,tsx}': [
    // Lint and auto-fix
    'eslint --fix',
    // Format
    'prettier --write',
  ],

  // ─── JavaScript Files ──────────────────────────────
  '*.{js,jsx}': [
    'eslint --fix',
    'prettier --write',
  ],

  // ─── CSS / SCSS Files ──────────────────────────────
  '*.{css,scss}': [
    'stylelint --fix',           // If using stylelint
    'prettier --write',
  ],

  // ─── JSON Files ────────────────────────────────────
  '*.json': [
    'prettier --write',
  ],

  // ─── Markdown Files ────────────────────────────────
  '*.md': [
    'prettier --write',
  ],

  // ─── HTML Files ────────────────────────────────────
  '*.html': [
    'prettier --write',
  ],
})
```

### Task Concurrency Patterns

```javascript
// Sequential execution (default for arrays)
{
  '*.ts': ['eslint --fix', 'prettier --write']
  // eslint runs first, then prettier on same files
}

// Parallel execution (nested arrays)
{
  '*.ts': [['eslint --fix'], ['prettier --write']]
  // Both run in parallel for .ts files
}

// Mixed (sequential per glob, parallel across globs)
{
  '*.ts': ['eslint --fix', 'prettier --write'],
  '*.css': ['stylelint --fix', 'prettier --write'],
  '*.{json,md}': 'prettier --write'
  // All three globs run in parallel
}
```

---

## 5. Complete Setup Workflow

### Step-by-Step Installation

```bash
# 1. Install all tools
pnpm add -D eslint @eslint/js typescript-eslint \
  eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-react-refresh \
  prettier prettier-plugin-tailwindcss \
  husky lint-staged \
  globals

# 2. Create configuration files
# - eslint.config.mjs
# - .prettierrc.cjs
# - .prettierignore
# - lint-staged.config.mjs

# 3. Initialize Husky
pnpm prepare

# 4. Create hooks
npx husky add .husky/pre-commit "pnpm lint-staged"
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"'

# 5. Make hooks executable (Linux/macOS)
chmod +x .husky/*.sh

# 6. Test the setup
echo 'console.log("test")' > test-file.ts
git add test-file.ts
git commit -m "test: add test file"
```

### package.json Scripts

```json
{
  "scripts": {
    "lint": "eslint . --ext .ts,.tsx --report-unused-disable-directives",
    "lint:fix": "eslint . --ext .ts,.tsx --fix",
    "format": "prettier --write \"src/**/*.{ts,tsx,css,json,md}\"",
    "format:check": "prettier --check \"src/**/*.{ts,tsx,css,json,md}\"",
    "prepare": "husky install",
    "precommit": "lint-staged"
  }
}
```

---

## 6. CI/CD Integration

### GitHub Actions Example

```yaml
# .github/workflows/lint.yml
name: Lint & Format

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: pnpm/action-setup@v4
        with:
          version: 9

      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: 'pnpm'

      - run: pnpm install --frozen-lockfile

      - name: Run ESLint
        run: pnpm lint

      - name: Check Prettier
        run: pnpm format:check

      - name: Type Check
        run: pnpm type-check
```

---

## 7. Troubleshooting

### Common Issues

| Problem | Solution |
|---------|----------|
| ESLint doesn't find TypeScript types | Use `projectService: true` in parserOptions |
| Husky hooks not running on Windows | Run `chmod +x .husky/*.sh` or use Git Bash |
| lint-staged fails silently | Add `--verbose` flag: `lint-staged --verbose` |
| Prettier conflicts with ESLint | Use `eslint-config-prettier` or ensure ESLint doesn't override Prettier rules |
| Tailwind classes not sorted | Ensure `prettier-plugin-tailwindcss` is installed and configured |

### Debug Mode

```bash
# lint-staged debug
npx lint-staged --debug

# ESLint debug
npx eslint --debug src/

# Husky debug
HUSKY=1 git commit -m "test"
```

---

## Cross-References

- [Integration Master Config](integration-master-config.md)
- [TypeScript Best Practices](./TypeScript/ts-best-practices.md)
- [Vite Optimization & Security](./vite-optimization-security.md)
- [CI/CD GitHub Actions](./cicd-github-actions.md)
- [Docker Nginx Deployment](./docker-nginx-deployment.md)
- [HTML5 Best Practices](./Hypertext%20Markup/html5-best-practices.md)
- [CSS3 Performance & Security](./Cascading%20Stylesheets/css3-performance-security.md)
