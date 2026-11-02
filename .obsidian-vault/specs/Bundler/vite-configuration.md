---
slug: vite-configuration
sources:
  - https://vitejs.dev/guide/
  - https://vitejs.dev/config/
  - https://vitejs.dev/guide/features.html
date: 2026-11-02
tags:
  - vite
  - bundler
  - configuration
  - plugins
  - optimization
  - ssr
  - library-mode
  - environment-variables
---

# Vite Configuration

## Overview

Vite is a next-generation frontend build tool that provides an extremely fast development server and optimized production builds using native ES modules and Rollup.

---

## 1. Basic Configuration

```typescript
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
      '@components': resolve(__dirname, 'src/components'),
      '@hooks': resolve(__dirname, 'src/hooks'),
    },
  },
  server: {
    port: 3000,
    strictPort: true,
    open: true,
    hmr: {
      protocol: 'ws',
      host: 'localhost',
    },
    proxy: {
      '/api': {
        target: 'http://localhost:8080',
        changeOrigin: true,
        secure: false,
      },
    },
  },
  build: {
    target: 'es2020',
    outDir: 'dist',
    sourcemap: false,
    minify: 'terser',
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          ui: ['@radix-ui/react-dropdown-menu', '@radix-ui/react-dialog'],
        },
      },
    },
  },
  optimizeDeps: {
    include: ['react', 'react-dom'],
    exclude: ['@my/internal-package'],
  },
})
```

---

## 2. Environment Variables

```typescript
// .env.development
VITE_API_URL=http://localhost:8080/api
VITE_APP_TITLE=My App Dev

// .env.production
VITE_API_URL=https://api.example.com
VITE_APP_TITLE=My App

// vite.config.ts — load custom env
export default defineConfig({
  envPrefix: 'VITE_',
})

// Usage in code
const apiUrl = import.meta.env.VITE_API_URL
const appTitle = import.meta.env.VITE_APP_TITLE

// Type-safe env access
const env = {
  apiUrl: import.meta.env.VITE_API_URL,
  appTitle: import.meta.env.VITE_APP_TITLE,
  isDev: import.meta.env.DEV,
  isProd: import.meta.env.PROD,
} as const
```

---

## 3. Plugins

### Core Plugins

```typescript
import react from '@vitejs/plugin-react'
import svgr from '@svgr/plugin-vite'
import mdx from '@mdx-js/rollup'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    svgr({
      svgrOptions: {
        icon: true,
        plugins: ['@svgr/plugin-svgo', '@svgr/plugin-jsx'],
      },
    }),
  ],
})
```

### Custom Plugin

```typescript
interface LogPluginOptions {
  pattern?: string
}

function logPlugin(options: LogPluginOptions = {}): Plugin {
  const { pattern = '*.ts' } = options

  return {
    name: 'log-plugin',

    buildStart() {
      console.log(`[log-plugin] Starting build for ${pattern}`)
    },

    transform(code, id) {
      if (id.endsWith('.ts') && id.includes(pattern)) {
        console.log(`[log-plugin] Transforming: ${id}`)
      }
    },

    closeBundle() {
      console.log('[log-plugin] Build complete')
    },
  }
}
```

---

## 4. Optimization

### Code Splitting

```typescript
export default defineConfig({
  build: {
    rollupOptions: {
      output: {
        // Manual chunk splitting
        manualChunks: (id) => {
          if (id.includes('node_modules')) {
            if (id.includes('react')) return 'vendor-react'
            if (id.includes('lodash')) return 'vendor-lodash'
            return 'vendor'
          }
        },

        // Hash filenames for caching
        entryFileNames: 'assets/[name].[hash].js',
        chunkFileNames: 'assets/[name].[hash].js',
        assetFileNames: 'assets/[name].[hash].[ext]',
      },
    },
  },
})
```

### Tree Shaking

```typescript
// ✅ Tree-shakeable — named exports
export function formatDate(date: Date): string { /* ... */ }
export function parseDate(str: string): Date { /* ... */ }

// Usage — only used functions are bundled
import { formatDate } from './utils'

// ❌ Not tree-shakeable — default export
export default {
  formatDate,
  parseDate,
}
```

### Pre-Bundling

```typescript
export default defineConfig({
  optimizeDeps: {
    // Force pre-bundling for slow dependencies
    include: ['axios', 'lodash-es'],
    // Exclude packages that don't need pre-bundling
    exclude: ['@my/internal-package'],
    // Entries to scan for dependencies
    entries: ['src/**/*.tsx', 'src/**/*.ts'],
  },
})
```

---

## 5. SSR Configuration

```typescript
// vite.config.ts
export default defineConfig({
  ssr: {
    noExternal: ['@my/internal-package'],
    external: ['axios'],
  },
})

// server.ts — SSR entry
import express from 'express'
import { createServer as createViteServer } from 'vite'

async function createServer() {
  const app = express()
  const vite = await createViteServer({
    server: { middlewareMode: true },
    appType: 'custom',
  })

  app.use(vite.middlewares)

  app.get('*', async (req, res) => {
    const template = await vite.transformIndexHtml(
      req.originalUrl,
      await fs.readFile('index.html', 'utf-8')
    )
    const appHtml = await render(req.originalUrl)
    const html = template.replace('<!--app-html-->', appHtml)
    res.status(200).set({ 'Content-Type': 'text/html' }).end(html)
  })

  app.listen(3000)
}

createServer()
```

---

## 6. Library Mode

```typescript
// vite.config.ts — Library build
export default defineConfig({
  build: {
    lib: {
      entry: resolve(__dirname, 'src/index.ts'),
      name: 'MyLibrary',
      formats: ['es', 'umd'],
      fileName: 'my-library',
    },
    rollupOptions: {
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

---

## 7. Common Patterns

### Multi-Environment Config

```typescript
// vite.config.ts
export default defineConfig(({ mode }) => {
  const isDev = mode === 'development'
  const isProd = mode === 'production'

  return {
    plugins: [react()],
    server: isDev ? { open: true, hmr: true } : {},
    build: isProd ? {
      sourcemap: false,
      minify: 'terser',
      target: 'es2020',
    } : {},
  }
})
```

### Alias Configuration

```typescript
// tsconfig.json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@components/*": ["src/components/*"],
      "@hooks/*": ["src/hooks/*"],
      "@utils/*": ["src/utils/*"],
    }
  }
}

// vite.config.ts
import { resolve } from 'path'

export default defineConfig({
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
      '@components': resolve(__dirname, 'src/components'),
      '@hooks': resolve(__dirname, 'src/hooks'),
      '@utils': resolve(__dirname, 'src/utils'),
    },
  },
})
```

---

## Cross-References

- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md)
- [Testing Patterns](../Testing/testing-patterns.md)
- [Docker Nginx Deployment](./docker-nginx-deployment.md)

---

## Decision Tree: Vite Configuration

```mermaid
graph TD
    A[Configuring Vite?]
    A --> B{What type of project?}
    B -->|SPA| C[Default config]
    B -->|SSR| D[SSR config]
    B -->|Library| E[Library mode]
    B -->|Monorepo| F[Workspace config]
    C --> G{Need plugins?}
    G -->|Yes| H[Add plugins]
    G -->|No| I[Default]
    D --> J{Need SSR?}
    J -->|Yes| K[Enable ssr.external]
    J -->|No| C
    H --> L{Which plugins?}
    L -->|React| M[@vitejs/plugin-react]
    L -->|Vue| N[@vitejs/plugin-vue]
    L -->|Tailwind| O[vite-plugin-tailwind]
    L -->|Other| P[Community plugins]
```

### When to Use Each Vite Mode

| Mode | When to Use | Command |
|------|-------------|---------|
| **Development** | Local development | `pnpm dev` |
| **Production** | Build for production | `pnpm build` |
| **Preview** | Test production build locally | `pnpm preview` |
| **Library** | Build as library | `pnpm build --lib` |

---

## Procedural Guidance: Vite Configuration Checklist

### Step 1: Basic Setup

```typescript
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': '/src',
    },
  },
})
```

### Step 2: Add Environment Variables

```typescript
// .env.development
VITE_API_URL=http://localhost:3000/api
VITE_APP_TITLE=My App

// .env.production
VITE_API_URL=https://api.example.com
VITE_APP_TITLE=My App
```

### Step 3: Configure Build Optimization

```typescript
export default defineConfig({
  build: {
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          ui: ['@radix-ui/react-dropdown-menu'],
        },
      },
    },
  },
})
```

### Step 4: Test the Build

```bash
# Development
pnpm dev

# Production build
pnpm build

# Preview production build
pnpm preview
```

---

## Copilot Instructions

### When to Read This Note
- Setting up a new Vite project
- Configuring Vite for SSR
- Optimizing production builds
- Adding Vite plugins
- Configuring environment variables

### What to Do With This Information
1. **Start with default config**: Only add what you need
2. **Use aliases**: Configure path aliases for cleaner imports
3. **Optimize builds**: Use manualChunks for better caching
4. **Environment variables**: Use `.env.*` files for different environments
5. **Test locally**: Always preview production builds before deploying

### Tools to Use
- **VS Code Extension**: Error Lens — for inline build error display
- **VS Code Extension**: GitLens — for understanding config history
- **npm Package**: `@vitejs/plugin-react` — for React support
- **npm Package**: `vite-plugin-tailwind` — for Tailwind CSS
- **Terminal Command**: `pnpm build` — build for production
- **Terminal Command**: `pnpm preview` — preview production build

### Agents to Invoke
- **Performance Review Agent**: Run when optimizing production builds
- **Code Review Agent**: Run when reviewing Vite config changes

### Integration with Other Notes
- Read [[vite-optimization]] for build optimization patterns
- Read [[docker-nginx-deployment]] for deployment configuration
- Read [[typescript-strict-mode]] for TypeScript integration
- Read [[testing-patterns]] for testing configuration

### Common Pitfalls
- Don't over-optimize development config (keep it fast)
- Don't forget to test production builds locally
- Don't hardcode environment variables (use .env files)
- Don't add unnecessary plugins (each plugin adds build time)
- Don't forget to configure path aliases (makes imports cleaner)

### Quick Validation Checklist
- [ ] Does the development server start quickly?
- [ ] Are environment variables configured correctly?
- [ ] Is the production build optimized (manualChunks, minification)?
- [ ] Are path aliases working?
- [ ] Can you preview the production build locally?
- [ ] Are unnecessary plugins removed?

