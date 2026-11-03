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
  - maturity/experimental
  - integration
  - vite
  - typescript
  - pnpm
  - configuration
  - master-config
  - --
# Integration Master Config

## Overview

This note consolidates all configuration files that serve as the single source of truth for your React 19 + Vite + TypeScript + Tailwind CSS project. Every tool reads from these files, making them the central integration point.

---

## 1. `vite.config.ts` â€” The Build Orchestrator

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
    // â”€â”€â”€ Core â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    root: '.',                    // Project root (where index.html lives)
    base: '/',                    // Base URL for the application
    envDir: './config/env',       // Directory for .env files
    envPrefix: 'VITE_',           // Prefix for env vars exposed to client

    // â”€â”€â”€ Plugins â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    plugins: [
      react(),                    // Official React plugin (SWC-based)
      // reactRefresh(),         // Included in react() plugin
      // vitePluginPWA(),        // PWA support (optional)
      // vitePluginCompression,  // gzip/brotli (optional)
    ],

    // â”€â”€â”€ Resolve / Path Aliases â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

    // â”€â”€â”€ TypeScript â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    oxc: {
      // Transpilation target (dev)
      target: 'esnext',
      jsx: {
        importSource: 'react',    // React 19 automatic runtime
      },
    },

    // â”€â”€â”€ Server / Dev â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

    // â”€â”€â”€ Build â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    build: {
      target: 'es2022',           // Modern browser target
      cssTarget: 'es2022',        // CSS features target
      outDir: 'dist',             // Output directory
      assetsDir: 'assets',        // Assets subdirectory
      sourcemap: isDev ? 'inline' : false,  // Dev: inline, Prod: off
      minify: isDev ? false : 'esbuild',  // Dev: no minify, Prod: esbuild
      // minify: isDev ? false : 'terser', // terser for more thorough minification (slower)
      cssCodeSplit: true,         // Per-component CSS extraction
      assetsInlineLimit: 4096,    // 4KB â€” inline small assets as base64
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

    // â”€â”€â”€ CSS â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

    // â”€â”€â”€ Preview â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    preview: {
      port: 4173,
      strictPort: true,
      open: false,
    },

    // â”€â”€â”€ Dependencies Optimization â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

    // â”€â”€â”€ Experimental â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    experimental: {
      // Build performance improvements
      buildAssetsDir: '_build',
      // Serverless SSR (if applicable)
      // ssrPayloadExposes: [],
    },

    // â”€â”€â”€ Log Level â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    logLevel: isDev ? 'info' : 'warn',

    // â”€â”€â”€ External â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    // Packages to exclude from bundling
    // external: ['some-external'],
  }
})
```

### Key Plugin Configuration

```typescript
import react from '@vitejs/plugin-react'

// Default (SWC-based â€” recommended)
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

## 2. `tsconfig.json` â€” TypeScript Configuration

### Complete Configuration

```json
{
  "compilerOptions": {
    // â”€â”€â”€ Language & Environment â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "target": "ES2022",
    "lib": ["ES2022", "DOM", "DOM.Iterable"],
    "jsx": "react-jsx",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "allowJs": true,

    // â”€â”€â”€ Type Checking â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true,
    "exactOptionalPropertyTypes": false,
    "noImplicitOverride": true,

    // â”€â”€â”€ Isolated Modules (Required for Oxc/esbuild) â”€â”€
    "isolatedModules": true,
    "verbatimModuleSyntax": true,

    // â”€â”€â”€ Emit â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "noEmit": true,               // Vite handles transpilation
    "skipLibCheck": true,         // Skip type checking of declaration files

    // â”€â”€â”€ Module Resolution â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

    // â”€â”€â”€ Completeness â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "preserveConstEnums": true,
    "suppressImplicitAnyIndexErrors": true,

    // â”€â”€â”€ Decorators â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "experimentalDecorators": true,
    "emitDecoratorMetadata": false,  // Partially supported by Oxc

    // â”€â”€â”€ Types â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "types": ["vite/client"]
  },

  // â”€â”€â”€ Include / Exclude â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

  // â”€â”€â”€ References (for monorepos) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  // "references": [
  //   { "path": "./packages/core" },
  //   { "path": "./packages/ui" }
  // ]
}
```

### Critical Compiler Options Explained

| Option | Value | Why |
|--------|-------|-----|
| `isolatedModules` | `true` | Required by Oxc transformer â€” each file transpiled in isolation |
| `verbatimModuleSyntax` | `true` | Enforces proper `import type` syntax (TS 5.0+) |
| `jsx` | `react-jsx` | React 19 automatic JSX runtime (faster, smaller output) |
| `moduleResolution` | `bundler` | Works with Vite's module resolution |
| `noEmit` | `true` | Vite handles transpilation; `tsc` only for type checking |
| `skipLibCheck` | `true` | Speeds up type checking by skipping `.d.ts` files in dependencies |
| `strict` | `true` | Enables all strict type-checking options |

---

## 3. `package.json` â€” Scripts & Dependencies

### Complete Configuration

```json
{
  "name": "missmetaverse-io",
  "version": "1.0.0",
  "private": true,
  "type": "module",
  "scripts": {
    // â”€â”€â”€ Development â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "dev": "vite",
    "start": "vite",
    "serve": "vite",

    // â”€â”€â”€ Building â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "build": "tsc --noEmit && vite build",
    "build:analyze": "vite build --mode analyze",
    "build:preview": "vite preview",

    // â”€â”€â”€ Testing â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "test": "vitest",
    "test:run": "vitest run",
    "test:watch": "vitest watch",
    "test:coverage": "vitest run --coverage",
    "test:e2e": "playwright test",
    "test:e2e:ui": "playwright test --ui",
    "test:e2e:headed": "playwright test --headed",

    // â”€â”€â”€ Linting & Formatting â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "lint": "eslint . --ext .ts,.tsx --report-unused-disable-directives",
    "lint:fix": "eslint . --ext .ts,.tsx --fix",
    "format": "prettier --write \"src/**/*.{ts,tsx,css,json,md}\"",
    "format:check": "prettier --check \"src/**/*.{ts,tsx,css,json,md}\"",

    // â”€â”€â”€ Type Checking â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "type-check": "tsc --noEmit",
    "type-check:watch": "tsc --noEmit --watch",

    // â”€â”€â”€ Husky / Pre-commit â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "prepare": "husky install",
    "precommit": "lint-staged",

    // â”€â”€â”€ Docker â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "docker:build": "docker build -t missmetaverse-io .",
    "docker:run": "docker run -p 80:80 missmetaverse-io",
    "docker:dev": "docker build -t missmetaverse-io-dev --target dev .",

    // â”€â”€â”€ Cleanup â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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
    // â”€â”€â”€ Core â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "vite": "^6.x.x",
    "@vitejs/plugin-react": "^4.x.x",
    "typescript": "^5.x.x",

    // â”€â”€â”€ Styling â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "tailwindcss": "^4.x.x",
    "@tailwindcss/vite": "^4.x.x",

    // â”€â”€â”€ Testing â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "vitest": "^3.x.x",
    "@testing-library/react": "^16.x.x",
    "@testing-library/jest-dom": "^6.x.x",
    "playwright": "^1.x.x",

    // â”€â”€â”€ Linting / Formatting â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "eslint": "^9.x.x",
    "@typescript-eslint/eslint-plugin": "^8.x.x",
    "@typescript-eslint/parser": "^8.x.x",
    "prettier": "^3.x.x",
    "lint-staged": "^15.x.x",

    // â”€â”€â”€ Husky â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    "husky": "^9.x.x",

    // â”€â”€â”€ Docker â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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

## 4. `pnpm-workspace.yaml` â€” Workspace Configuration

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
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                  MASTER CONFIGURATIONS                 â”‚
â”‚                                                        â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”‚
â”‚  â”‚ vite.config  â”‚  â”‚ tsconfig.jsonâ”‚  â”‚ package.json â”‚  â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜  â”‚
â”‚         â”‚                 â”‚                 â”‚          â”‚
â”‚         â–¼                 â–¼                 â–¼          â”‚
â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”‚
â”‚  â”‚              TOOL INTEGRATION LAYER              â”‚  â”‚
â”‚  â”‚                                                  â”‚  â”‚
â”‚  â”‚  Vite reads:   tsconfig paths (if enabled)       â”‚  â”‚
â”‚  â”‚  Vite reads:   package.json scripts              â”‚  â”‚
â”‚  â”‚  Vite reads:   tsconfig jsx, target, module      â”‚  â”‚
â”‚  â”‚  tsc reads:    tsconfig.json (full config)       â”‚  â”‚
â”‚  â”‚  ESLint reads: tsconfig paths (for resolution)   â”‚  â”‚
â”‚  â”‚  Vitest reads: vite.config (aliases, globals)    â”‚  â”‚
â”‚  â”‚  Playwright:   tsconfig paths (for types)        â”‚  â”‚
â”‚  â”‚  pnpm reads:   pnpm-workspace.yaml               â”‚  â”‚
â”‚  â”‚  Husky reads:  package.json scripts              â”‚  â”‚
â”‚  â”‚  Docker:       vite.config (build output)        â”‚  â”‚
â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

### Path Resolution Across Tools

| Tool | Configuration | Path Alias Support |
|------|--------------|-------------------|
| **Vite (dev)** | `resolve.alias` in `vite.config.ts` | âœ… Full support |
| **Vite (build)** | `resolve.alias` in `vite.config.ts` | âœ… Full support |
| **TypeScript** | `paths` in `tsconfig.json` | âœ… Full support |
| **Vitest** | `resolve.alias` in `vite.config.ts` | âœ… Inherits from Vite |
| **ESLint** | `@typescript-eslint/resolver` + `tsconfigPaths` | âœ… With plugin |
| **Playwright** | `tsconfig.json` paths | âœ… Via TypeScript |
| **Node.js** | None (requires `--paths` flag) | âš ï¸ Limited |

### Recommended Approach

**Use `resolve.alias` in `vite.config.ts`** as the primary method (faster than `tsconfigPaths`). Keep `paths` in `tsconfig.json` for IDE support and type checking.

---

## 6. Environment Variables

### File Structure

```
config/env/
â”œâ”€â”€ .env                  # Base environment
â”œâ”€â”€ .env.local            # Local overrides (gitignored)
â”œâ”€â”€ .env.development      # Development mode
â”œâ”€â”€ .env.production       # Production mode
â””â”€â”€ .env.test             # Test mode
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
- [TypeScript Best Practices](./TypeScript/TypeScript/typescript-strict-mode.md)
- [TypeScript tsconfig Reference](./TypeScript/TypeScript/typescript-configuration.md)
- [React Performance & Security](./React/React/modern-react-performance.md)
- [pnpm Best Practices](./Package%20Manager/Package Manager/pnpm-package-manager.md)
- [Vitest Testing](./Testing/vitest-testing.md)
- [HTML5 Best Practices](./Hypertext%20Markup/html5-best-practices.md)
- [CSS3 Performance & Security](./Cascading%20Stylesheets/css3-performance-security.md)
- [Tailwind CSS Optimization](./TailwindsCSS/TailwindsCSS/tailwind-css-utility-first-styling.md)
- [shadcn/ui Best Practices](./ShadCN/ShadCN/shadcn-ui-component-library.md)

## See Also
- [[I01-cicd-github-actions]]
- [[I02-docker-nginx-deployment]]
- [[I04-linting-husky-pipeline]]
- [[I05-ts-path-resolution]]


