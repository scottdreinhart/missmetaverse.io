---
slug: tw-optimization-performance
sources:
  - https://tailwindcss.com/docs/content-configuration
  - https://tailwindcss.com/docs/responsive-design
  - https://tailwindcss.com/docs/installation
  - https://tailwindcss.com/docs
date: 2025-01-15
tags:
  - priority/high
  - maturity/deprecated
  - domain/security
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - domain/optimization
  - tailwind-css
  - performance
  - optimization
  - responsive-design
  - build-optimization
---

# Tailwind CSS: Optimization, Performance & Best Practices

## Overview

Tailwind CSS v4.3 is a utility-first CSS framework that works by scanning all your HTML files, JavaScript components, and templates for class names, generating corresponding styles, and writing them to a static CSS file. It is **fast, flexible, and reliable — with zero-runtime**.

## Installation (Vite + React)

```bash
npm install tailwindcss @tailwindcss/vite
```

```ts
// vite.config.ts
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss(),
  ],
})
```

```css
/* src/index.css */
@import "tailwindcss";
```

## Content Scanning & Source Detection

### How Tailwind Scans Files

Tailwind CSS scans your source files for class names using **plain text scanning** — it doesn't need to parse your HTML/JSX. It looks for patterns that match class names.

**Scanned by default:**
- `./src/**/*.{html,js,ts,jsx,tsx,vue,svelte}`
- Any file matching common web framework extensions

**File naming conventions that are scanned:**
- Files with common extensions: `.html`, `.js`, `.ts`, `.jsx`, `.tsx`, `.vue`, `.svelte`, `.astro`
- Files in `src/`, `components/`, `pages/`, `views/` directories

### Safelisting Classes (Inline)

Use `@source()` with `inline()` to safelist dynamic classes:

```css
@source('./path/to/files/**/*.{html,js}');

/* Safelist specific classes */
@source {
  inline(
    'bg-red-500'
    'text-lg'
  );
}
```

### Dynamic Class Names

When class names are constructed dynamically, Tailwind may not detect them:

```tsx
// BAD: Tailwind won't detect these classes
<div className={`bg-${color}-500 text-${size}-lg`}>Content</div>

// GOOD: Use full class names or safelist
<div className={`bg-blue-500 text-lg`}>Content</div>
```

## Responsive Design

### Default Breakpoints

| Prefix | Min-Width | Screen Size |
|--------|-----------|-------------|
| `sm:` | 640px | Small devices |
| `md:` | 768px | Medium devices |
| `lg:` | 1024px | Large devices |
| `xl:` | 1280px | Extra large |
| `2xl:` | 1536px | 2X large |

### Usage Examples

```html
<!-- Text is base-sm, md-lg, lg-xl across breakpoints -->
<h1 class="text-sm md:text-lg lg:text-xl">Responsive Heading</h1>

<!-- Background changes at different breakpoints -->
<div class="bg-blue-500 md:bg-green-500 lg:bg-purple-500">Responsive Box</div>

<!-- Layout changes: stack on mobile, row on desktop -->
<div class="flex flex-col md:flex-row">
  <aside>Sidebar</aside>
  <main>Main Content</main>
</div>
```

### Container Queries

Tailwind v4 supports **container queries** for component-level responsive design:

```css
/* Define a container */
.card-container {
  container-type: inline-size;
}

/* Use container query utilities */
@container (min-width: 400px) {
  .card {
    flex-direction: row;
  }
}
```

```html
<div class="@container">
  <div class="@sm:flex @sm:row">Responsive Card</div>
</div>
```

### Custom Breakpoints

Configure custom breakpoints in `tailwind.config.js`:

```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      screens: {
        '3xl': '1920px',
        'tablet': '768px',
        'landscape': { 'raw': '(min-width: 1024px) and (max-aspect-ratio: 16/9)' },
      }
    }
  }
}
```

Usage:
```html
<div class="text-sm tablet:text-lg landscape:text-xl">Content</div>
```

## Build Performance Optimization

### Tree-Shaking & PurgeCSS (v3) / Automatic (v4)

**Tailwind v4** automatically tree-shakes unused CSS — no PurgeCSS configuration needed.

**Tailwind v3** required PurgeCSS:
```js
// tailwind.config.js (v3)
module.exports = {
  purge: [
    './src/**/*.{js,ts,jsx,tsx,html}',
    './public/index.html',
  ],
  // ...
}
```

### Production Build Optimization

```json
// package.json
{
  "scripts": {
    "build": "vite build",
    "dev": "vite"
  }
}
```

Vite + Tailwind automatically:
- **Minifies** CSS output
- **Tree-shakes** unused utilities
- **Deduplicates** styles
- **Caches** build artifacts

### CSS Layering for Performance

Use `@layer` to control cascade order and improve maintainability:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer components {
  .btn-primary {
    @apply px-4 py-2 bg-blue-500 text-white rounded;
  }
}
```

## Customization Best Practices

### Extending the Theme

```js
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#f0f9ff',
          100: '#e0f2fe',
          500: '#0284c7',
          900: '#0c4a6e',
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
      },
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
      }
    }
  }
}
```

### Custom Utilities

```css
@layer utilities {
  .scrollbar-hide {
    -ms-overflow-style: none;
    scrollbar-width: none;
  }
  .scrollbar-hide::-webkit-scrollbar {
    display: none;
  }
}
```

## Security Best Practices

### Content Security Policy (CSP)

Tailwind CSS generates deterministic class names, making it CSP-friendly:

```html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self'; style-src 'self' 'unsafe-inline';">
```

Since Tailwind outputs a single static CSS file, you can reference it by hash:

```html
<link rel="stylesheet" href="/assets/styles.css" 
      integrity="sha384-<hash>" crossorigin="anonymous">
```

### Avoiding Inline Styles

Prefer Tailwind classes over inline styles for CSP compliance:

```tsx
// BAD: Inline styles bypass CSP
<div style={{ backgroundColor: 'red', fontSize: '16px' }}>Content</div>

// GOOD: Use Tailwind classes
<div className="bg-red-500 text-base">Content</div>
```

## Performance Tuning Checklist

- [x] **Use Vite plugin** for fastest build times
- [x] **Enable production build** (`vite build`) for tree-shaking
- [x] **Safelist dynamic classes** with `@source { inline() }`
- [x] **Use `@layer`** for custom component styles
- [x] **Extend theme** instead of creating custom CSS when possible
- [x] **Avoid `!important`** — use specificity properly
- [x] **Use responsive prefixes** instead of media queries when possible
- [x] **Minimize arbitrary values** (`[color:red]`) — use theme values
- [x] **Enable CSS minification** in production
- [x] **Use container queries** for component-level responsiveness

## Common Anti-Patterns

| Anti-Pattern | Better Alternative |
|--------------|-------------------|
| Inline styles | Tailwind utility classes |
| `!important` overrides | `@layer components` |
| Arbitrary values for colors | Theme color palette |
| Duplicate utility classes | Custom component with `@apply` |
| Ignoring responsive design | Mobile-first responsive prefixes |
| Loading Tailwind via CDN in production | Build-time installation |

## Recommended Configuration for React + Vite + TypeScript

```ts
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [react(), tailwindcss()],
  css: {
    postcss: {
      plugins: [],
    },
  },
})
```

```css
/* src/index.css */
@import "tailwindcss";

@layer base {
  html {
    @apply antialiased text-base bg-background text-foreground;
  }
}

@layer components {
  .container {
    @apply mx-auto px-4 sm:px-6 lg:px-8 max-w-7xl;
  }
}
```

## Cross-References

- See [ts-best-practices](D/ts-best-practices.md) for TypeScript integration patterns
- See [css-media-queries](D/css-media-queries.md) for media query patterns and breakpoints
- See [tailwind-css-patterns](D/tailwind-css-patterns.md) for Tailwind CSS patterns

## Sources

- [[Sources/tailwind-docs-2024|tailwind-docs-2024]]
- [[Sources/mdn-css-2024|mdn-css-2024]]
- See [css3-performance-security](D/css3-performance-security.md) for CSS3 performance fundamentals
- See [html5-best-practices](D/html5-best-practices.md) for HTML5 semantic structure with Tailwind

---

## Integration with Other Notes

- Read [tailwind-css-patterns](D/tailwind-css-patterns.md) for Tailwind CSS patterns
- Read [[Cascading Stylesheets/css-fundamentals]] for CSS fundamentals
- Read [css-media-queries](D/css-media-queries.md) for media query patterns
- Read [html5-best-practices](D/html5-best-practices.md) for HTML5 best practices
- Read [[ShadCN/shadcn-ui-patterns]] for shadcn/ui component patterns

---

## Decision Tree: Tailwind Optimization

```mermaid
graph TD
    A[Need to optimize Tailwind?]\n    A --> B{What issue?}
    B -->|Bundle size| C[Content scanning]
    B -->|Build speed| D[CSS processing]
    B -->|Unused CSS| E[Production build]
    B -->|Dynamic classes| F[Content array]
    C --> G{Scan all files?}
    G -->|Yes| H[content array]
    G -->|No| I[content.files]
    D --> J{Vite?}
    J -->|Yes| K[@tailwindcss/vite]
    J -->|No| L[@tailwindcss/postcss]
    F --> M{Known classes?}
    M -->|Yes| N[string array]
    M -->|No| O[safeList]
```

### When to Use Each Optimization Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Content scanning** | Remove unused CSS | content array |
| **Production build** | Minify CSS | tailwindcss -m |
| **Dynamic classes** | Unknown classes | content array |
| **safeList** | External content | safelist: ['bg-red-500'] |
| **@apply** | Repeated utilities | @apply px-4 py-2 |

---

## Procedural Guidance: Tailwind Performance Setup

### Step 1: Configure Content Scanning

```typescript
// vite.config.ts
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss({
      content: [
        './index.html',
        './src/**/*.{js,ts,jsx,tsx,vue,svelte,html}',
      ],
    }),
  ],
})
```

### Step 2: Handle Dynamic Classes

```typescript
// For dynamic class names, use content array
const content = [
  './src/**/*.{js,ts,jsx,tsx}',
  // Add dynamic classes
  'bg-red-500',
  'bg-blue-500',
  'bg-green-500',
]

// Or use safelist
tailwindcss({
  content: ['./src/**/*.{js,ts,jsx,tsx}'],
  safelist: [
    'bg-red-500',
    'bg-blue-500',
    'bg-green-500',
  ],
})
```

### Step 3: Production Build

```bash
# Build for production
pnpm build

# This runs: vite build
# Which includes:
# - CSS minification
# - Tree shaking
# - PurgeCSS (automatic in Tailwind v4)
```

### Step 4: Optimize Build Speed

```typescript
// vite.config.ts
export default defineConfig({
  css: {
    postcss: {
      plugins: [
        tailwindcss({
          content: ['./src/**/*.{js,ts,jsx,tsx}'],
        }),
      ],
    },
  },
  // Enable fast refresh
  optimizeDeps: {
    include: ['react', 'react-dom'],
  },
})
```

### Step 5: Use @apply for Repeated Utilities

```css
/* Instead of repeating utilities */
.btn-primary {
  @apply px-4 py-2 bg-blue-500 text-white font-semibold rounded hover:bg-blue-600;
}

.btn-secondary {
  @apply px-4 py-2 bg-gray-500 text-white font-semibold rounded hover:bg-gray-600;
}
```

---

## Copilot Instructions

### When to Read This Note
- Setting up Tailwind CSS for performance
- Optimizing build speed
- Removing unused CSS
- Handling dynamic classes
- Configuring content scanning

### What to Do With This Information
1. **Content scanning**: Configure content array to scan all files
2. **Dynamic classes**: Use content array or safelist for dynamic classes
3. **Production build**: Use vite build for optimized CSS
4. **@apply**: Use @apply for repeated utility combinations
5. **Build speed**: Enable fast refresh and optimize dependencies

### Tools to Use
- **VS Code Extension**: Tailwind CSS IntelliSense — for autocomplete and preview
- **VS Code Extension**: Error Lens — for inline CSS error display
- **npm Package**: `@tailwindcss/vite` — for Vite integration
- **Terminal Command**: `pnpm build` — production build
- **Terminal Command**: `pnpm dev` — dev server with hot reload

### Agents to Invoke
- **Performance Review Agent**: Run when optimizing CSS bundle size
- **Code Review Agent**: Run when reviewing PRs with Tailwind changes

### Integration with Other Notes
- Read [tailwind-css-patterns](D/tailwind-css-patterns.md) for Tailwind CSS patterns
- Read [[Cascading Stylesheets/css-fundamentals]] for CSS fundamentals
- Read [css-media-queries](D/css-media-queries.md) for media query patterns
- Read [html5-best-practices](D/html5-best-practices.md) for HTML5 best practices
- Read [[ShadCN/shadcn-ui-patterns]] for shadcn/ui component patterns

### Common Pitfalls
- Don't forget to add new files to content array
- Don't use dynamic classes without safelist
- Don't skip production build testing
- Don't ignore bundle size (check CSS output)
- Don't use @apply for simple cases (use utilities directly)

### Quick Validation Checklist
- [ ] Is content scanning configured?
- [ ] Are dynamic classes in safelist?
- [ ] Is production build tested?
- [ ] Is bundle size optimized?
- [ ] Are @apply patterns used correctly?
- [ ] Is Tailwind IntelliSense enabled?


## See Also
- [[TC01-tailwind-css-patterns]]


