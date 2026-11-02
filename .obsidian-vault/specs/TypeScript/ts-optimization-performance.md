---
slug: ts-optimization-performance
sources:
  - https://www.typescriptlang.org/docs/handbook/release-notes/typescript-5-4.html
  - https://www.typescriptlang.org/docs/handbook/release-notes/typescript-5-0.html
  - https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-8.html
  - https://github.com/microsoft/TypeScript/wiki/Roadmap
date: 2026-11-02
---

# TypeScript Optimization & Performance

## Build Performance

### Incremental Builds

Enable faster subsequent builds by caching compilation information:

```jsonc
// tsconfig.json
{
  "compilerOptions": {
    "incremental": true,        // Saves .tsbuildinfo files
    "composite": true,          // Required for project references
    "tsBuildInfoFile": "./.tsbuildinfo"
  }
}
```

- Creates `.tsbuildinfo` files that store the project graph
- TypeScript only recompiles changed files and their dependents
- Significant speedup for large codebases on subsequent builds

### Project References

Split large projects into smaller, independently buildable units:

```jsonc
// tsconfig.json (library)
{
  "compilerOptions": {
    "composite": true,
    "declaration": true,
    "declarationMap": true
  },
  "include": ["src/**/*"]
}
```

```jsonc
// tsconfig.json (app)
{
  "references": [
    { "path": "./library" }
  ],
  "include": ["src/**/*"]
}
```

Benefits:
- Parallel compilation across projects
- Only recompile projects with changes
- Enforces logical separation between components
- Faster editor interaction

### Build-Free Editing

With TypeScript 3.7+, project references enable build-free editing:

- Editor uses source `.ts` files directly instead of `.d.ts` boundaries
- Faster navigation (Go to Definition, Find All References)
- Set `disableSourceOfProjectReferenceRedirect: false` to opt back to old behavior

## Compiler Performance

### Skip Library Checking

```jsonc
{
  "compilerOptions": {
    "skipLibCheck": true  // Skip type checking of .d.ts files
  }
}
```

- Speeds up compilation by skipping declaration file checks
- May allow inconsistent types from different libraries to coexist
- Recommended for most projects

### Explain Files

Debug why files are included in compilation:

```jsonc
{
  "compilerOptions": {
    "explainFiles": true
  }
}
```

Output shows which files TypeScript processes and why — useful for identifying unnecessary file inclusion.

### Performance Profiling

Generate CPU profiles to identify bottlenecks:

```bash
tsc --generateCpuProfile tsc-output.cpuprofile
```

Open `tsc-output.cpuprofile` in Chrome DevTools → Performance tab for detailed analysis.

## Runtime Performance

### Type-Only Imports

Use `import type` to avoid runtime overhead for type-only imports:

```typescript
// ❌ Type import is erased but bundler may still process it
import { MyType } from "./types";

// ✅ Explicit type-only import — bundlers can tree-shake
import type { MyType } from "./types";

// ✅ For namespace imports
import type * as Types from "./types";
```

### Verbatim Module Syntax

```jsonc
{
  "compilerOptions": {
    "verbatimModuleSyntax": true  // TypeScript 5.0+
  }
}
```

- No automatic import elision — what you write is what you get
- `import type` statements are dropped; regular imports are preserved
- Makes side-effects explicit and predictable
- Better compatibility with single-file transpilers (Babel, esbuild, SWC)

### Tree Shaking with Bundlers

TypeScript works with bundlers for optimal tree shaking:

```jsonc
{
  "compilerOptions": {
    "module": "esnext",           // Preserve ES modules for bundler
    "moduleResolution": "bundler", // Modern resolution
    "verbatimModuleSyntax": true  // Explicit imports
  }
}
```

## Memory Optimization

### Disable Size Limit

For very large projects that hit memory limits:

```jsonc
{
  "compilerOptions": {
    "disableSizeLimit": true
  }
}
```

### Isolated Modules

```jsonc
{
  "compilerOptions": {
    "isolatedModules": true  // Process each file independently
  }
}
```

- Required for compatibility with Babel, SWC, esbuild
- Prevents cross-file transformations that require full program analysis
- Enables parallel compilation

## Recommended Configuration for Performance

```jsonc
{
  "compilerOptions": {
    // Type checking
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,

    // Performance
    "incremental": true,
    "skipLibCheck": true,
    "isolatedModules": true,
    "verbatimModuleSyntax": true,

    // Module resolution
    "module": "esnext",
    "moduleResolution": "bundler",
    "esModuleInterop": true,
    "resolveJsonModule": true,

    // Target
    "target": "ES2022",
    "lib": ["ES2022", "DOM", "DOM.Iterable"]
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```

## Key Takeaways

| Technique | Impact | Complexity |
|-----------|--------|------------|
| Incremental builds | High | Low |
| Project references | High | Medium |
| skipLibCheck | Medium | Low |
| verbatimModuleSyntax | Medium | Low |
| import type | Medium | Low |
| CPU profiling | Diagnostic | Low |
| disableSizeLimit | Low | Low |
