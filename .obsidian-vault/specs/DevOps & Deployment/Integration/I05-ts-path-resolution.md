---
slug: ts-path-resolution
sources:
  - https://vite.dev/guide/features.html
  - https://www.typescriptlang.org/tsconfig/#paths
  - https://vite.dev/config/shared-options#resolve-tsconfigpaths
  - https://vitest.dev/config/#resolve-alias
  - https://playwright.dev/docs/typescript
date: 2026-11-02
tags:
  - integration
  - typescript
  - vite
  - vitest
  - playwright
  - path-resolution
  - aliases
  - --
# TypeScript Path Resolution

## Overview

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

TypeScript path resolution is one of the most challenging integration points in a modern React + Vite + TypeScript project. Each tool (Vite, TypeScript, Vitest, Playwright, ESLint) has its own module resolution mechanism. This note explains how to configure path aliases consistently across all tools.

---

## 1. The Problem

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

```typescript
// Without path resolution, imports look like this:
import { Button } from '../../../components/ui/button'
import { formatDate } from '../../../utils/date'

// With path resolution, imports become clean:
import { Button } from '@components/ui/button'
import { formatDate } from '@utils/date'
```

**The challenge**: TypeScript, Vite, Vitest, and Playwright all resolve modules independently. Configuring `paths` in `tsconfig.json` alone does NOT make them work at runtime or in tests.

---

## 2. TypeScript Configuration (`tsconfig.json`)

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

### Path Aliases

```json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@components/*": ["src/components/*"],
      "@hooks/*": ["src/hooks/*"],
      "@utils/*": ["src/utils/*"],
      "@types/*": ["src/types/*"],
      "@assets/*": ["src/assets/*"],
      "@styles/*": ["src/styles/*"],
      "@tests/*": ["test/*"]
    }
  }
}
```

### Key Options

| Option | Value | Purpose |
|--------|-------|---------|
| `baseUrl` | `"."` | Base directory for `paths` resolution |
| `paths` | object | Map aliases to file system paths |
| `moduleResolution` | `"bundler"` | Works with Vite's resolution |
| `isolatedModules` | `true` | Required by Oxc/esbuild |

---

## 3. Vite Configuration (`vite.config.ts`)

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

### Method 1: Manual Alias (Recommended â€” Faster)

```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
      '@components': resolve(__dirname, 'src/components'),
      '@hooks': resolve(__dirname, 'src/hooks'),
      '@utils': resolve(__dirname, 'src/utils'),
      '@types': resolve(__dirname, 'src/types'),
      '@assets': resolve(__dirname, 'src/assets'),
      '@styles': resolve(__dirname, 'src/styles'),
    },
  },
})
```

### Method 2: Auto-Resolve from tsconfig (Easier but Slower)

```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  resolve: {
    // Automatically reads paths from tsconfig.json
    tsconfigPaths: true,
  },
})
```

**âš ï¸ Warning**: `tsconfigPaths` has a performance cost. It parses `tsconfig.json` on every dev server start. The Vite documentation explicitly discourages this for large projects.

### Method 3: Hybrid (Best of Both Worlds)

```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

// Read tsconfig paths programmatically
import { readFileSync } from 'fs'
import { parseJson } from 'jsonc-parser'

const tsconfig = parseJson(
  readFileSync('tsconfig.json', 'utf-8')
).compilerOptions

export default defineConfig({
  resolve: {
    alias: tsconfig?.paths
      ? Object.entries(tsconfig.paths).map(([alias, paths]) => [
          alias.replace('/*', ''),
          resolve(__dirname, paths[0].replace('/*', '')),
        ])
      : [],
  },
})
```

---

## 4. Vitest Configuration

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

### Inherit from Vite (Recommended)

```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import viteConfig from './vite.config'

export default defineConfig({
  // Vitest inherits Vite's resolve.alias automatically
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: ['./test/setup.ts'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
    },
  },
})
```

### Explicit Alias Configuration

```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
      '@components': resolve(__dirname, 'src/components'),
      '@tests': resolve(__dirname, 'test'),
    },
  },
  test: {
    globals: true,
    environment: 'jsdom',
  },
})
```

### Mocking with Path Aliases

```typescript
// test/mocks.ts
import { vi } from 'vitest'

// Mock a module using path alias
vi.mock('@utils/api', () => ({
  fetchUsers: vi.fn(() => [{ id: 1, name: 'Mock User' }]),
  fetchPosts: vi.fn(() => []),
}))

// Mock a component
vi.mock('@components/ui/button', () => ({
  Button: ({ children, onClick }) => (
    // eslint-disable-next-line react/jsx-no-useless-fragment
    <button data-testid="mock-button" onClick={onClick}>
      {children}
    </button>
  ),
}))
```

---

## 5. Playwright Configuration

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

### TypeScript Support

```typescript
// playwright.config.ts
import { defineConfig, devices } from '@playwright/test'

export default defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,

  // TypeScript configuration for Playwright tests
  use: {
    baseURL: process.env.VITE_APP_URL || 'http://localhost:5173',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure',
  },

  // Configure TypeScript compilation
  // Playwright uses its own TypeScript compilation
  // Path aliases work via tsconfig.json automatically
})
```

### Test File with Path Aliases

```typescript
// e2e/examples/home.spec.ts
import { test, expect } from '@playwright/test'
import { HomePage } from '@tests/pages/home-page'  // Path alias works!

test('homepage loads correctly', async ({ page }) => {
  const home = new HomePage(page)
  await home.goto()
  await home.waitForLoaded()
  await expect(home.title).toBeVisible()
})
```

### Page Object Model with Path Aliases

```typescript
// e2e/pages/home-page.ts
import { Page, Locator } from '@playwright/test'

export class HomePage {
  readonly page: Page
  readonly title: Locator
  readonly nav: Locator

  constructor(page: Page) {
    this.page = page
    this.title = page.getByRole('heading', { name: 'Welcome' })
    this.nav = page.getByRole('navigation')
  }

  async goto() {
    await this.page.goto('/')
  }

  async waitForLoaded() {
    await this.title.waitFor({ state: 'visible' })
  }
}
```

---

## 6. ESLint Configuration

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

### TypeScript Resolver

```bash
pnpm add -D @typescript-eslint/parser @typescript-eslint/eslint-plugin
```

```javascript
// eslint.config.mjs
import tseslint from 'typescript-eslint'

export default tseslint.config({
  files: ['**/*.{ts,tsx}'],
  extends: [
    ...tseslint.configs.recommended,
  ],
  // TypeScript resolver automatically uses tsconfig.json paths
  // No additional configuration needed!
})
```

### Import Resolution

```javascript
// eslint.config.mjs â€” Ensure imports are resolved correctly
import tseslint from 'typescript-eslint'
import importPlugin from 'eslint-plugin-import'

export default tseslint.config({
  files: ['**/*.{ts,tsx}'],
  plugins: {
    import: importPlugin,
  },
  rules: {
    // These rules work with path aliases automatically
    'import/no-unresolved': 'error',
    'import/named': 'error',
  },
})
```

---

## 7. Complete Integration Map

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                    PATH RESOLUTION FLOW                      â”‚
â”‚                                                             â”‚
â”‚  Developer writes:                                          â”‚
â”‚  import { Button } from '@components/ui/button'            â”‚
â”‚                     â”‚                                       â”‚
â”‚                     â–¼                                       â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”      â”‚
â”‚  â”‚              IDE / Editor                        â”‚      â”‚
â”‚  â”‚  Reads: tsconfig.json paths                     â”‚      â”‚
â”‚  â”‚  Provides: IntelliSense, go-to-definition       â”‚      â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜      â”‚
â”‚                     â”‚                                       â”‚
â”‚        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                         â”‚
â”‚        â–¼                         â–¼                         â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”               â”‚
â”‚  â”‚ Vite (dev)  â”‚        â”‚ Vite (build)    â”‚               â”‚
â”‚  â”‚ resolve.aliasâ”‚       â”‚ resolve.alias   â”‚               â”‚
â”‚  â”‚ âœ… Works     â”‚        â”‚ âœ… Works        â”‚               â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜        â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜               â”‚
â”‚        â”‚                         â”‚                        â”‚
â”‚        â–¼                         â–¼                        â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”             â”‚
â”‚  â”‚         Output (JavaScript)               â”‚             â”‚
â”‚  â”‚  import { Button } from '/src/.../button'â”‚             â”‚
â”‚  â”‚  (Aliases are resolved to real paths)    â”‚             â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜             â”‚
â”‚                     â”‚                                       â”‚
â”‚        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                         â”‚
â”‚        â–¼                         â–¼                         â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”               â”‚
â”‚  â”‚ Vitest      â”‚        â”‚ Playwright        â”‚             â”‚
â”‚  â”‚ resolve.aliasâ”‚       â”‚ tsconfig paths   â”‚               â”‚
â”‚  â”‚ âœ… Works     â”‚        â”‚ âœ… Works         â”‚               â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜        â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜               â”‚
â”‚                     â”‚                                       â”‚
â”‚        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”                         â”‚
â”‚        â–¼                         â–¼                         â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”        â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”               â”‚
â”‚  â”‚ ESLint       â”‚        â”‚ TypeScript      â”‚               â”‚
â”‚  â”‚ ts resolver  â”‚        â”‚ tsc --noEmit    â”‚               â”‚
â”‚  â”‚ âœ… Works     â”‚        â”‚ âœ… Works        â”‚               â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜        â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜               â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## 8. Common Pitfalls & Solutions

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

### Problem 1: Works in IDE but not in Vite dev server

```typescript
// âŒ Only in tsconfig.json (Vite doesn't read this by default)
{
  "compilerOptions": {
    "paths": { "@components/*": ["src/components/*"] }
  }
}

// âœ… Also add to vite.config.ts
resolve: {
  alias: {
    '@components': resolve(__dirname, 'src/components'),
  }
}
```

### Problem 2: Works in Vite but not in Vitest

```typescript
// âŒ Vitest config missing resolve.alias
// vitest.config.ts
export default defineConfig({
  test: { /* ... */ }
  // Missing resolve.alias!
})

// âœ… Vitest inherits from vite.config.ts
import viteConfig from './vite.config'
export default defineConfig({
  ...viteConfig,
  test: { /* ... */ }
})
```

### Problem 3: Path alias with trailing slash

```typescript
// âŒ This won't work
alias: {
  '@components': resolve(__dirname, 'src/components/')  // Trailing slash
}

// âœ… Remove trailing slash
alias: {
  '@components': resolve(__dirname, 'src/components')
}
```

### Problem 4: Wildcard paths

```typescript
// âŒ Wildcards in vite alias don't work
alias: {
  '@components/*': resolve(__dirname, 'src/components/*')  // Won't work
}

// âœ… Use base path (wildcard is implicit)
alias: {
  '@components': resolve(__dirname, 'src/components')
}
// Then import: import { X } from '@components/ui/button'  âœ…
```

---

## 9. Verification Checklist

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

- [ ] `tsconfig.json` has `paths` configured
- [ ] `vite.config.ts` has matching `resolve.alias`
- [ ] `vitest.config.ts` inherits Vite config or has matching aliases
- [ ] `eslint.config.mjs` uses `typescript-eslint` (auto-resolves paths)
- [ ] Playwright tests use path aliases (works via tsconfig)
- [ ] IDE shows IntelliSense for all aliases
- [ ] `tsc --noEmit` passes with no errors
- [ ] `vite dev` starts without resolution errors
- [ ] `vitest run` passes all tests
- [ ] `playwright test` runs successfully

---

## Cross-References

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended

- [Integration Master Config](integration-master-config.md)
- [TypeScript tsconfig Reference](TypeScript/typescript-configuration.md)
- [Vite Optimization & Security](./vite-optimization-security.md)
- [Vitest Testing](vitest-testing.md)
- [Playwright E2E Testing](Testing/playwright-e2e-testing.md)
- [Linting & Husky Pipeline](linting-husky-pipeline.md)

## See Also

## concept_id
i05-ts-path-resolution

## title
I05-ts-path-resolution

## aliases
- I05-ts-path-resolution

## category
integration

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
- [[I01-cicd-github-actions]]
- [[I02-docker-nginx-deployment]]
- [[I03-integration-master-config]]
- [[I04-linting-husky-pipeline]]


