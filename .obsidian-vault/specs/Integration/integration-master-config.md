---
slug: integration-master-config
sources:
  - https://vite.dev/config/
  - https://vite.dev/guide/using-plugins.html
  - https://vite.dev/guide/features.html
  - https://www.typescriptlang.org/tsconfig/
  - https://pnpm.io/workspaces
date: 2026-11-02
tags:
  - integration
  - vite
  - typescript
  - pnpm
  - configuration
  - master-config
---

# Integration Master Config

## Overview

This note consolidates all configuration files that serve as the single source of truth for your React 19 + Vite + TypeScript + Tailwind CSS project. Every tool reads from these files, making them the central integration point.

---

## 1. `vite.config.ts` — The Build Orchestrator

### Complete Configuration

```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

// https://vite.dev/config/
export default defineConfig(({ command, mode }) => {
  const isDev = command === 'serve'
  const isProd = command === 'build'

  return {
    // ─── Core ───────────────────────────────────────────
    root: '.',                    // Project root (where index.html lives)
    base: '/',                    // Base URL for the application
    envDir: './config/env',       // Directory for .env files
    envPrefix: 'VITE_',           // Prefix for env vars exposed to client

    // ─── Plugins ────────────────────────────────────────
    plugins: [
      react(),                    // Official React plugin (SWC-based)
      // reactRefresh(),         // Included in react() plugin
      // vitePluginPWA(),        // PWA support (optional)
      // vitePluginCompression,  // gzip/brotli (optional)
    ],

    // ─── Resolve / Path Aliases ─────────────────────────
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
      // Enable tsconfig paths resolution (has performance cost)
      // tsconfigPaths: true,     // Alternative to manual alias
    },

    // ─── TypeScript ─────────────────────────────────────
    oxc: {
      // Transpilation target (dev)
      target: 'esnext',
      jsx: {
        importSource: 'react',    // React 19 automatic runtime
      },
    },

    // ─── Server / Dev ───────────────────────────────────
    server: {
      port: 5173,
      strictPort: true,           // Exit if port in use
      open: true,                 // Open browser on start
      hmr: {
        protocol: undefined,      // Auto-detect
        host: undefined,          // Auto-detect
        port: undefined,          // Auto-detect
      },
      cors: true,
      // Proxy API requests
      proxy: {
        '/api': {
          target: 'http://localhost:3000',
          changeOrigin: true,
          secure: false,
        },
      },
      // Watch additional files for HMR
      watch: {
        ignored: ['**/node_modules/**', '**/.git/**'],
      },
    },

    // ─── Build ──────────────────────────────────────────
    build: {
      target: 'es2022',           // Modern browser target
      cssTarget: 'es2022',        // CSS features target
      outDir: 'dist',             // Output directory
      assetsDir: 'assets',        // Assets subdirectory
      sourcemap: isDev ? 'inline' : false,  // Dev: inline, Prod: off
      minify: isDev ? false : 'esbuild',  // Dev: no minify, Prod: esbuild
      // minify: isDev ? false : 'terser', // terser for more thorough minification (slower)
      cssCodeSplit: true,         // Per-component CSS extraction
      assetsInlineLimit: 4096,    // 4KB — inline small assets as base64
      // Rollup options
      rollupOptions: {
        output: {
          // Manual chunk splitting
          manualChunks: (id) => {
            if (id.includes('node_modules')) {
              // Split vendor chunks
              if (id.includes('react') || id.includes('react-dom')) {
                return 'vendor-react'
              }
              if (id.includes('tailwind') || id.includes('@tailwindcss')) {
                return 'vendor-tailwind'
              }
              return 'vendor'
            }
          },
          // File naming with content hashes
          chunkFileNames: 'assets/js/[name]-[hash].js',
          entryFileNames: 'assets/js/[name]-[hash].js',
          assetFileNames: (assetInfo) => {
            if (assetInfo.name === 'style.css') return 'assets/css/[name]-[hash].css'
            return 'assets/[ext]/[name]-[hash].[ext]'
          },
        },
      },
      // Report bundle size
      reportCompressedSize: true,
      // Empty the output directory before build
      emptyOutDir: true,
    },

    // ─── CSS ────────────────────────────────────────────
    css: {
      modules: {
        localsConvention: 'camelCaseOnly',  // .my-class -> myClass
        scopeBehaviour: 'local',
        generateScopedName: isDev
          ? '[name]__[local]__[hash:base64:5]'
          : '[hash:base64:5]',
      },
      postcss: './postcss.config.cjs',  // PostCSS config path
      transformer: 'lightningcss',      // Use Lightning CSS (faster)
      lightningcss: {
        // Lightning CSS options
        targets: {
          chrome: 120 << 16,  // 120.0.0
          firefox: 128 << 16,
          safari: 17 << 16,
        },
      },
    },

    // ─── Preview ────────────────────────────────────────
    preview: {
      port: 4173,
      strictPort: true,
      open: false,
    },

    // ─── Dependencies Optimization ──────────────────────
    optimizeDeps: {
      include: [
        'react',
        'react-dom',
        'react-dom/client',
        '@radix-ui/react-*',
      ],
      exclude: ['@my-company/some-package'],
      // Entries to scan for dependency pre-bundling
      entries: [
        './src/**/*.html',
        './src/**/*.jsx',
        './src/**/*.tsx',
      ],
      // Force dep pre-bundling (bypasses cache)
      // force: true,
    },

    // ─── Experimental ───────────────────────────────────
    experimental: {
      // Build performance improvements
      buildAssetsDir: '_build',
      // Serverless SSR (if applicable)
      // ssrPayloadExposes: [],
    },

    // ─── Log Level ──────────────────────────────────────
    logLevel: isDev ? 'info' : 'warn',

    // ─── External ───────────────────────────────────────
    // Packages to exclude from bundling
    // external: ['some-external'],
  }
})
```

### Key Plugin Configuration

```typescript
import react from '@vitejs/plugin-react'

// Default (SWC-based — recommended)
react()

// With options
react({
  babel: {
    plugins: ['babel-plugin-styled-components'],
    presets: ['@babel/preset-react'],
  },
  // Exclude certain files from React Refresh
  exclude: ['**/node_modules/**'],
  // Include specific files
  include: ['src/**/*.{jsx,tsx}'],
})
```

---

## 2. `tsconfig.json` — TypeScript Configuration

### Complete Configuration

```json
{
  "compilerOptions": {
    // ─── Language & Environment ───────────────────────
    "target": "ES2022",
    "lib": ["ES2022", "DOM", "DOM.Iterable"],
    "jsx": "react-jsx",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "allowJs": true,

    // ─── Type Checking ────────────────────────────────
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "exactOptionalPropertyTypes": false,
    "noImplicitOverride": true,

    // ─── Isolated Modules (Required for Oxc/esbuild) ──
    "isolatedModules": true,
    "verbatimModuleSyntax": true,

    // ─── Emit ─────────────────────────────────────────
    "noEmit": true,               // Vite handles transpilation
    "skipLibCheck": true,         // Skip type checking of declaration files

    // ─── Module Resolution ────────────────────────────
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@components/*": ["src/components/*"],
      "@hooks/*": ["src/hooks/*"],
      "@utils/*": ["src/utils/*"],
      "@types/*": ["src/types/*"],
      "@assets/*": ["src/assets/*"],
      "@styles/*": ["src/styles/*"]
    },

    // ─── Completeness ─────────────────────────────────
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "preserveConstEnums": true,
    "suppressImplicitAnyIndexErrors": true,

    // ─── Decorators ───────────────────────────────────
    "experimentalDecorators": true,
    "emitDecoratorMetadata": false,  // Partially supported by Oxc

    // ─── Types ────────────────────────────────────────
    "types": ["vite/client"]
  },

  // ─── Include / Exclude ──────────────────────────────
  "include": [
    "src/**/*.ts",
    "src/**/*.tsx",
    "src/**/*.d.ts",
    "src/**/*.json",
    "vite-env.d.ts"
  ],
  "exclude": [
    "node_modules",
    "dist",
    "build",
    "**/*.test.ts",
    "**/*.test.tsx",
    "**/*.spec.ts",
    "**/*.spec.tsx"
  ],

  // ─── References (for monorepos) ─────────────────────
  // "references": [
  //   { "path": "./packages/core" },
  //   { "path": "./packages/ui" }
  // ]
}
```

### Critical Compiler Options Explained

| Option | Value | Why |
|--------|-------|-----|
| `isolatedModules` | `true` | Required by Oxc transformer — each file transpiled in isolation |
| `verbatimModuleSyntax` | `true` | Enforces proper `import type` syntax (TS 5.0+) |
| `jsx` | `react-jsx` | React 19 automatic JSX runtime (faster, smaller output) |
| `moduleResolution` | `bundler` | Works with Vite's module resolution |
| `noEmit` | `true` | Vite handles transpilation; `tsc` only for type checking |
| `skipLibCheck` | `true` | Speeds up type checking by skipping `.d.ts` files in dependencies |
| `strict` | `true` | Enables all strict type-checking options |

---

## 3. `package.json` — Scripts & Dependencies

### Complete Configuration

```json
{
  "name": "missmetaverse-io",
  "version": "1.0.0",
  "private": true,
  "type": "module",
  "scripts": {
    // ─── Development ──────────────────────────────────
    "dev": "vite",
    "start": "vite",
    "serve": "vite",

    // ─── Building ─────────────────────────────────────
    "build": "tsc --noEmit && vite build",
    "build:analyze": "vite build --mode analyze",
    "build:preview": "vite preview",

    // ─── Testing ──────────────────────────────────────
    "test": "vitest",
    "test:run": "vitest run",
    "test:watch": "vitest watch",
    "test:coverage": "vitest run --coverage",
    "test:e2e": "playwright test",
    "test:e2e:ui": "playwright test --ui",
    "test:e2e:headed": "playwright test --headed",

    // ─── Linting & Formatting ─────────────────────────
    "lint": "eslint . --ext .ts,.tsx --report-unused-disable-directives",
    "lint:fix": "eslint . --ext .ts,.tsx --fix",
    "format": "prettier --write \"src/**/*.{ts,tsx,css,json,md}\"",
    "format:check": "prettier --check \"src/**/*.{ts,tsx,css,json,md}\"",

    // ─── Type Checking ────────────────────────────────
    "type-check": "tsc --noEmit",
    "type-check:watch": "tsc --noEmit --watch",

    // ─── Husky / Pre-commit ───────────────────────────
    "prepare": "husky install",
    "precommit": "lint-staged",

    // ─── Docker ───────────────────────────────────────
    "docker:build": "docker build -t missmetaverse-io .",
    "docker:run": "docker run -p 80:80 missmetaverse-io",
    "docker:dev": "docker build -t missmetaverse-io-dev --target dev .",

    // ─── Cleanup ──────────────────────────────────────
    "clean": "rm -rf dist .vite node_modules/.vite",
    "cleanup": "pnpm clean && pnpm store prune"
  },
  "dependencies": {
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "@radix-ui/react-*": "^1.x.x",
    // ... other dependencies
  },
  "devDependencies": {
    // ─── Core ─────────────────────────────────────────
    "vite": "^6.x.x",
    "@vitejs/plugin-react": "^4.x.x",
    "typescript": "^5.x.x",

    // ─── Styling ──────────────────────────────────────
    "tailwindcss": "^4.x.x",
    "@tailwindcss/vite": "^4.x.x",

    // ─── Testing ──────────────────────────────────────
    "vitest": "^3.x.x",
    "@testing-library/react": "^16.x.x",
    "@testing-library/jest-dom": "^6.x.x",
    "playwright": "^1.x.x",

    // ─── Linting / Formatting ─────────────────────────
    "eslint": "^9.x.x",
    "@typescript-eslint/eslint-plugin": "^8.x.x",
    "@typescript-eslint/parser": "^8.x.x",
    "prettier": "^3.x.x",
    "lint-staged": "^15.x.x",

    // ─── Husky ────────────────────────────────────────
    "husky": "^9.x.x",

    // ─── Docker ───────────────────────────────────────
    // Docker is managed outside package.json typically
  },
  "lint-staged": {
    "*.{ts,tsx}": [
      "eslint --fix",
      "prettier --write"
    ],
    "*.{css,json,md,html}": [
      "prettier --write"
    ]
  }
}
```

---

## 4. `pnpm-workspace.yaml` — Workspace Configuration

### For Monorepo Setup

```yaml
# pnpm-workspace.yaml
packages:
  - 'apps/*'
  - 'packages/*'
  - 'libs/*'
  - 'tools/*'

# Package selection pattern
packageExtensions:
  # Override dependencies for specific packages
  'some-package@*':
    peerDependencies:
      'react': '*'

# Configuration for pnpm
settings:
  pnpm:
    # Respect peer dependencies
    respectPeerDependencies: true
```

### Workspace Dependencies

```json
// In a workspace package's package.json
{
  "dependencies": {
    "@missmetaverse/core": "workspace:*",
    "@missmetaverse/ui": "workspace:^",
    "@missmetaverse/utils": "workspace:~"
  }
}
```

---

## 5. Cross-Tool Integration Map

### How Tools Read Configuration

```
┌────────────────────────────────────────────────────────┐
│                  MASTER CONFIGURATIONS                 │
│                                                        │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │ vite.config  │  │ tsconfig.json│  │ package.json │  │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘  │
│         │                 │                 │          │
│         ▼                 ▼                 ▼          │
│  ┌──────────────────────────────────────────────────┐  │
│  │              TOOL INTEGRATION LAYER              │  │
│  │                                                  │  │
│  │  Vite reads:   tsconfig paths (if enabled)       │  │
│  │  Vite reads:   package.json scripts              │  │
│  │  Vite reads:   tsconfig jsx, target, module      │  │
│  │  tsc reads:    tsconfig.json (full config)       │  │
│  │  ESLint reads: tsconfig paths (for resolution)   │  │
│  │  Vitest reads: vite.config (aliases, globals)    │  │
│  │  Playwright:   tsconfig paths (for types)        │  │
│  │  pnpm reads:   pnpm-workspace.yaml               │  │
│  │  Husky reads:  package.json scripts              │  │
│  │  Docker:       vite.config (build output)        │  │
│  └──────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────┘
```

### Path Resolution Across Tools

| Tool | Configuration | Path Alias Support |
|------|--------------|-------------------|
| **Vite (dev)** | `resolve.alias` in `vite.config.ts` | ✅ Full support |
| **Vite (build)** | `resolve.alias` in `vite.config.ts` | ✅ Full support |
| **TypeScript** | `paths` in `tsconfig.json` | ✅ Full support |
| **Vitest** | `resolve.alias` in `vite.config.ts` | ✅ Inherits from Vite |
| **ESLint** | `@typescript-eslint/resolver` + `tsconfigPaths` | ✅ With plugin |
| **Playwright** | `tsconfig.json` paths | ✅ Via TypeScript |
| **Node.js** | None (requires `--paths` flag) | ⚠️ Limited |

### Recommended Approach

**Use `resolve.alias` in `vite.config.ts`** as the primary method (faster than `tsconfigPaths`). Keep `paths` in `tsconfig.json` for IDE support and type checking.

---

## 6. Environment Variables

### File Structure

```
config/env/
├── .env                  # Base environment
├── .env.local            # Local overrides (gitignored)
├── .env.development      # Development mode
├── .env.production       # Production mode
└── .env.test             # Test mode
```

### Usage Pattern

```typescript
// Access in code
const apiUrl = import.meta.env.VITE_API_URL
const isProd = import.meta.env.PROD
const isDev = import.meta.env.DEV
const mode = import.meta.env.MODE

// Type-safe access (with vite/client types)
// import.meta.env provides full TypeScript support
```

---

## 7. Quick Reference: Common Patterns

### Adding a New Path Alias

1. **vite.config.ts**: Add to `resolve.alias`
2. **tsconfig.json**: Add to `paths` and ensure `baseUrl` is set
3. **Test**: Restart dev server, verify imports work

### Adding a New Dependency

```bash
# pnpm
pnpm add react
pnpm add -D vitest
```

### Changing Build Target

```typescript
// vite.config.ts
build: {
  target: 'es2020',  // or 'es2022', 'esnext'
}
```

```json
// tsconfig.json
{
  "compilerOptions": {
    "target": "ES2020"
  }
}
```

---

## Cross-References

- [Vite Optimization & Security](./vite-optimization-security.md)
- [TypeScript Best Practices](./TypeScript/ts-best-practices.md)
- [TypeScript tsconfig Reference](./TypeScript/ts-tsconfig.md)
- [React Performance & Security](./React/react-performance-security.md)
- [pnpm Best Practices](./Package%20Manager/pnpm-best-practices.md)
- [Vitest Testing](./Testing/vitest-testing.md)
- [HTML5 Best Practices](./Hypertext%20Markup/html5-best-practices.md)
- [CSS3 Performance & Security](./Cascading%20Stylesheets/css3-performance-security.md)
- [Tailwind CSS Optimization](./TailwindsCSS/tw-optimization-performance.md)
- [shadcn/ui Best Practices](./ShadCN/shadcn-best-practices.md)
