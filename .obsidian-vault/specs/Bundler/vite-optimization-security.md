---
slug: vite-optimization-security
sources:
  - https://vite.dev/guide/build.html
  - https://vite.dev/guide/env-and-mode.html
  - https://vite.dev/guide/optimizations.html
  - https://vite.dev/config/
  - https://vite.dev/guide/performance
  - https://vite.dev/guide/why
date: 2025-01-15
tags:
  - vite
  - build
  - optimization
  - security
  - performance
  - best-practices
---

# Vite: Optimization, Security & Best Practices

## Overview

Vite is a next-generation frontend build tool that leverages native ESM in development for instant server starts and on-demand compilation. In production, it uses Rolldown (Rollup successor) for optimized builds.

## Development Server Optimization

### Instant Server Start

Vite serves source code natively via the browser's ESM support — no bundling needed in dev:

```ts
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000,
    strictPort: true,
    // Open browser on start
    open: true,
    // Proxy API requests
    proxy: {
      '/api': {
        target: 'http://localhost:8080',
        changeOrigin: true,
        secure: false,
      },
    },
  },
})
```

### HMR (Hot Module Replacement)

Vite provides instant HMR without full page reloads:

```ts
// vite.config.ts
export default defineConfig({
  server: {
    hmr: {
      protocol: 'wss',
      host: 'localhost',
      port: 24678,
    },
  },
})
```

## Production Build Optimization

### Basic Build

```bash
# Build for production
vite build

# Build with specific mode
vite build --mode staging

# Watch mode (rebuild on changes)
vite build --watch
```

### Build Configuration

```ts
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  build: {
    // Target browsers (default: Baseline Widely Available)
    target: 'es2020',
    
    // Output directory
    outDir: 'dist',
    
    // Asset directory
    assetsDir: 'assets',
    
    // Generate sourcemaps
    sourcemap: false, // true for development, false for production
    
    // Minify (default: esbuild)
    minify: 'esbuild', // or 'terser' for more options
    
    // Disable CSS code splitting
    cssCodeSplit: true,
    
    // Roll up single CSS file
    cssTarget: 'chrome61',
    
    // Chunk size warning limit (kb)
    chunkSizeWarningLimit: 1000,
    
    // Disable meta file generation
    manifest: false, // true for CDN/deployment
    
    // Empty output directory before build
    emptyOutDir: true,
    
    // Copy public directory
    // publicDir: 'public',
    
    // Rollup options
    rolldownOptions: {
      output: {
        // Manual chunk splitting
        manualChunks: (id) => {
          if (id.includes('node_modules')) {
            if (id.includes('react')) return 'react-vendor'
            if (id.includes('lodash')) return 'lodash-vendor'
            return 'vendor'
          }
        },
        // Hash filename
        entryFileNames: 'assets/[name]-[hash].js',
        chunkFileNames: 'assets/[name]-[hash].js',
        assetFileNames: 'assets/[name]-[hash].[ext]',
      },
      // Externalize dependencies
      external: ['react', 'react-dom'],
    },
  },
})
```

### Manual Chunk Splitting

```ts
rolldownOptions: {
  output: {
    manualChunks: (id, { getModuleInfo }) => {
      // React vendor chunk
      if (id.includes('node_modules') && id.includes('react')) {
        return 'react-vendor'
      }
      
      // UI library chunk
      if (id.includes('node_modules') && id.includes('@mui')) {
        return 'ui-vendor'
      }
      
      // All other vendor code
      if (id.includes('node_modules')) {
        return 'vendor'
      }
      
      // Route-based code splitting (React Router)
      if (id.includes('/pages/')) {
        const path = id.split('/pages/')[1]?.split('/')[0]
        if (path) return `page-${path}`
      }
    },
  },
}
```

### Library Mode

```ts
export default defineConfig({
  build: {
    lib: {
      entry: resolve(__dirname, 'lib/main.ts'),
      name: 'MyLibrary',
      fileName: 'my-lib',
    },
    rolldownOptions: {
      external: ['react', 'react-dom'],
      output: {
        globals: {
          react: 'React',
          'react-dom': 'ReactDOM',
        },
      },
    },
  },
})
```

### Multi-Page Application

```ts
import { resolve } from 'node:path'

export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'index.html'),
        dashboard: resolve(__dirname, 'dashboard/index.html'),
        settings: resolve(__dirname, 'settings/index.html'),
      },
    },
  },
})
```

## Environment Variables & Security

### .env Files

```bash
# .env                # Loaded in all cases
# .env.local          # Loaded in all cases, ignored by git
# .env.production     # Only in production mode
# .env.production.local # Production + local, ignored by git
```

### Security: Only Expose VITE_ Variables

```env
# .env.production
# SAFE: Exposed to client (VITE_ prefix)
VITE_APP_TITLE=My App
VITE_API_URL=https://api.example.com

# DANGEROUS: Never put secrets here — they're bundled into client code!
VITE_API_KEY=secret123

# SAFE: Server-only (no VITE_ prefix)
DB_PASSWORD=secret
JWT_SECRET=secret
```

```tsx
// Client-side — only VITE_ vars are available
console.log(import.meta.env.VITE_APP_TITLE) // "My App"
console.log(import.meta.env.DB_PASSWORD) // undefined — NOT exposed
console.log(import.meta.env.VITE_API_KEY) // "secret123" — DANGEROUS!
```

### Protecting Secrets

```tsx
// NEVER expose secrets to the client
// Use backend/serverless functions instead

// BAD: API key in client code
const API_KEY = import.meta.env.VITE_API_KEY

// GOOD: Proxy through backend
const response = await fetch('/api/proxy', {
  method: 'POST',
  body: JSON.stringify({ data }),
})
```

### TypeScript IntelliSense for Env Vars

```ts
// src/vite-env.d.ts
interface ImportMetaEnv {
  readonly VITE_APP_TITLE: string
  readonly VITE_API_URL: string
  readonly VITE_FEATURE_FLAG: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
```

### Modes

```bash
# Production mode (default)
vite build

# Staging mode
vite build --mode staging

# Development build (unminified)
vite build --mode development

# NODE_ENV vs Mode
# vite build → NODE_ENV=production, mode=production
# vite build --mode development → NODE_ENV=production, mode=development
# NODE_ENV=development vite build → NODE_ENV=development, mode=production
```

## Performance Optimization

### Dependency Pre-Bundling

Vite pre-bundles dependencies for faster page loads:

```ts
export default defineConfig({
  optimizeDeps: {
    // Include/exclude specific dependencies
    include: ['lodash-es', 'date-fns'],
    exclude: ['my-local-package'],
    
    // Entries to scan (default: auto)
    entries: ['src/**/*.{js,ts,jsx,tsx}'],
    
    // Disable pre-bundling
    // disabled: true,
  },
})
```

### Asset Optimization

```ts
export default defineConfig({
  build: {
    rollupOptions: {
      plugins: [
        // Image optimization
        // Use vite-plugin-imagemin
        // Use vite-plugin-pwa for service worker
      ],
    },
  },
})
```

### Compression

```ts
import compression from '@rollup/plugin-gzip'

export default defineConfig({
  build: {
    rollupOptions: {
      plugins: [
        compression(), // gzip
        // or
        // require('rollup-plugin-brotli').brotli(), // brotli
      ],
    },
  },
})
```

### Legacy Browser Support

```ts
import legacy from '@vitejs/plugin-legacy'

export default defineConfig({
  plugins: [
    react(),
    legacy({
      targets: ['defaults', 'not IE 11'],
      renderLegacyChunks: true,
      assetsDir: 'assets/legacy',
      polyfills: ['es6.promise', 'es6.symbol'],
    }),
  ],
})
```

## Deployment Optimization

### Cache Strategy

```html
<!-- Set Cache-Control: no-cache on HTML -->
<!-- Set Cache-Control: max-age=31536000,immutable on hashed assets -->
```

### Handle Preload Errors

```tsx
window.addEventListener('vite:preloadError', (event) => {
  event.preventDefault()
  window.location.reload() // Reload on deployment
})
```

### Relative Base Path

```ts
export default defineConfig({
  base: './', // Relative paths for any deployment location
})
```

### Advanced URL Rendering

```ts
export default defineConfig({
  experimental: {
    renderBuiltUrl(filename, { hostType }) {
      if (hostType === 'js') {
        return { runtime: `window.__toCDNUrl(${JSON.stringify(filename)})` }
      }
      return { relative: true }
    },
  },
})
```

## Security Best Practices

### Content Security Policy

```html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self';
               script-src 'self' https://trusted.cdn.com;
               style-src 'self' 'unsafe-inline';
               img-src 'self' data: https:;
               connect-src 'self' https://api.example.com;">
```

### Avoid Inline Scripts

```html
<!-- BAD: Inline script (blocked by CSP) -->
<script>console.log('hello')</script>

<!-- GOOD: External script -->
<script src="/assets/app.js"></script>
```

### Environment Variable Security

```bash
# .env.local (never commit)
DB_PASSWORD=secret
JWT_SECRET=secret

# .env (safe — only VITE_ exposed to client)
VITE_APP_TITLE=My App

# Command-line override (highest priority)
VITE_API_URL=https://api.example.com vite build
```

### Disable Console in Production

```ts
export default defineConfig({
  build: {
    minify: 'esbuild',
    // esbuild removes console.log by default in production
  },
})
```

## Vite Configuration Reference

### Key Config Options

| Option | Description | Default |
|--------|-------------|---------|
| `root` | Project root directory | `process.cwd()` |
| `base` | Public base path | `/` |
| `build.target` | Browser target | Baseline Widely Available |
| `build.outDir` | Output directory | `dist` |
| `build.sourcemap` | Generate sourcemaps | `false` |
| `build.minify` | Minifier | `'esbuild'` |
| `build.chunkSizeWarningLimit` | Chunk warning (kb) | `500` |
| `build.emptyOutDir` | Empty outDir before build | `false` |
| `build.manifest` | Generate manifest.json | `false` |
| `server.port` | Dev server port | `5173` |
| `server.strictPort` | Exit on port in use | `false` |
| `server.open` | Open browser on start | `false` |
| `server.hmr` | HMR configuration | `true` |
| `server.proxy` | Proxy API requests | `{}` |
| `publicDir` | Public assets directory | `public` |
| `clearScreen` | Clear terminal on dev start | `true` |
| `envDir` | Directory for .env files | `root` |
| `envPrefix` | Env var prefix for client | `VITE_` |

### Performance Tips

1. **Use `optimizeDeps.include`** for slow packages
2. **Disable `sourcemap` in production**
3. **Use `esbuild` minification** (faster than terser)
4. **Enable `manualChunks`** for better caching
5. **Use `--watch`** for continuous builds
6. **Cache node_modules** in CI
7. **Use `--frozen-lockfile`** in CI
8. **Pre-bundle dependencies** with `optimizeDeps`

## Best Practices Checklist

- [x] **Use `vite build`** for production builds
- [x] **Set `build.target`** for target browsers
- [x] **Use `manualChunks`** for vendor splitting
- [x] **Disable sourcemaps in production**
- [x] **Use `esbuild` minification** (default, fastest)
- [x] **Set `emptyOutDir: true`** for clean builds
- [x] **Only expose `VITE_` prefixed env vars**
- [x] **Never put secrets in env files**
- [x] **Use `.env.local` for sensitive data** (gitignore)
- [x] **Handle `vite:preloadError`** for deployments
- [x] **Use CSP headers** in production
- [x] **Configure `optimizeDeps`** for slow packages
- [x] **Use `--frozen-lockfile` in CI**
- [x] **Add TypeScript IntelliSense** for env vars
- [x] **Use relative base path** for flexible deployment

## Cross-References

- See [react-performance-security](D/react-performance-security.md) for React optimization
- See [pnpm-best-practices](D/pnpm-best-practices.md) for package management
- See [vitest-testing](D/vitest-testing.md) for testing setup
- See [tw-optimization-performance](D/tw-optimization-performance.md) for Tailwind CSS integration

---

## Decision Tree: Vite Build Optimization

```mermaid
graph TD
    A[Need to optimize Vite build?]\n    A --> B{What type?}
    B -->|Bundle Size| C[Manual Chunks]
    B -->|Load Time| D[Preload/Prefetch]
    B -->|Build Speed| E[OptimizeDeps]
    B -->|Security| F[CSP Headers]
    C --> G{Common libs?}
    G -->|Yes| H[Split vendor]
    G -->|No| I[Single bundle]
    D --> J{Critical CSS?}
    J -->|Yes| K[Preload critical]
    J -->|No| L[Normal load]
```

### When to Use Each Vite Optimization

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Manual Chunks** | Large bundles | Split vendor, UI libs |
| **Preload** | Critical resources | Fonts, hero images |
| **OptimizeDeps** | Slow dev start | Pre-bundle dependencies |
| **Gzip/Brotli** | Production deploy | Compress assets |
| **Tree Shaking** | Remove unused code | ES modules only |

---

## Procedural Guidance: Vite Optimization Setup

### Step 1: Configure Manual Chunks

```typescript
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  build: {
    rollupOptions: {
      output: {
        manualChunks: {
          // Split vendor bundle
          vendor: ['react', 'react-dom'],
          // Split UI library
          ui: ['@radix-ui/react-dropdown-menu', '@radix-ui/react-dialog'],
          // Split charts
          charts: ['recharts'],
        },
      },
    },
  },
})
```

### Step 2: Add Preload Directives

```typescript
// vite.config.ts
export default defineConfig({
  build: {
    rollupOptions: {
      output: {
        // Add preload directives for critical chunks
        inlineDynamicImports: false,
      },
    },
  },
})
```

```html
<!-- index.html -->
<head>
  <!-- Preload critical resources -->
  <link rel="preload" href="/fonts/main.woff2" as="font" type="font/woff2" crossorigin>
  <link rel="preload" href="/css/critical.css" as="style">
  <link rel="prefetch" href="/js/non-critical.js" as="script">
</head>
```

### Step 3: Configure OptimizeDeps

```typescript
export default defineConfig({
  optimizeDeps: {
    // Pre-bundle slow dependencies
    include: ['lodash-es', 'date-fns'],
    // Exclude already bundled packages
    exclude: ['my-local-package'],
    // Force dep pre-bundling
    force: true, // Only in development when needed
  },
})
```

### Step 4: Enable Compression

```typescript
import compression from 'vite-plugin-compression'

export default defineConfig({
  plugins: [
    react(),
    // Enable gzip compression
    compression({ algorithm: 'gzip' }),
    // Enable brotli compression (smaller than gzip)
    compression({ algorithm: 'brotliCompress', ext: '.br' }),
  ],
})
```

### Step 5: Production Build

```bash
# Build for production
pnpm build

# Preview production build
pnpm preview

# Build with specific mode
pnpm build --mode production

# Analyze bundle size
pnpm add -D rollup-plugin-visualizer
# Add to vite.config.ts
import { visualizer } from 'rollup-plugin-visualizer'

export default defineConfig({
  plugins: [
    react(),
    visualizer({ open: true, gzipSize: true }),
  ],
})
```

---

## Copilot Instructions

### When to Read This Note
- Optimizing Vite build size
- Configuring manual chunks
- Adding preload directives
- Enabling compression
- Securing Vite builds

### What to Do With This Information
1. **Split bundles**: Use manualChunks to split vendor, UI, and chart bundles
2. **Preload critical**: Add preload directives for fonts, critical CSS
3. **Optimize deps**: Pre-bundle slow dependencies for faster dev start
4. **Enable compression**: Use gzip/brotli for smaller production assets
5. **Analyze bundle**: Use rollup-plugin-visualizer to analyze bundle size

### Tools to Use
- **VS Code Extension**: Error Lens — for inline Vite error display
- **npm Package**: `vite-plugin-compression` — for gzip/brotli compression
- **npm Package**: `rollup-plugin-visualizer` — for bundle analysis
- **Terminal Command**: `pnpm build` — build for production
- **Terminal Command**: `pnpm preview` — preview production build
- **Terminal Command**: `pnpm add -D rollup-plugin-visualizer` — install bundle analyzer

### Agents to Invoke
- **Performance Review Agent**: Run when optimizing Vite builds
- **Security Review Agent**: Run when configuring CSP headers

### Integration with Other Notes
- Read [vite-configuration](D/vite-configuration.md) for Vite configuration patterns
- read [react-performance-security](D/react-performance-security.md) for React optimization
- Read [pnpm-best-practices](D/pnpm-best-practices.md) for package management
- Read [docker-deployment](D/docker-deployment.md) for Docker deployment

### Common Pitfalls
- Don't over-split bundles (too many chunks hurt performance)
- Don't preload everything (only critical resources)
- Don't forget to test production builds locally
- Don't ignore bundle size (analyze regularly)
- Don't hardcode secrets in VITE_ env vars

### Quick Validation Checklist
- [ ] Are bundles split by concern?
- [ ] Are critical resources preloaded?
- [ ] Is compression enabled?
- [ ] Is bundle size analyzed?
- [ ] Are production builds tested?
- [ ] Are secrets excluded from VITE_ vars?
