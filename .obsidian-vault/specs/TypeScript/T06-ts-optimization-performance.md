---
slug: typescript-optimization-performance
sources:
  - https://www.typescriptlang.org/docs/handbook/2/decorators.html
date: 2026-11-02
tags:
  - typescript-javascript-type-system

  - maturity/deprecated

  - typescript
  - performance
  - optimization
  - tree-shaking
---

# TypeScript Optimization & Performance
sources:
  - https://www.typescriptlang.org/docs/handbook/release-notes/typescript-5-4.html
  - https://www.typescriptlang.org/docs/handbook/release-notes/typescript-5-0.html
  - https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-8.html
  - https://github.com/microsoft/TypeScript/wiki/Roadmap
date: 2026-11-02
---

# TypeScript Optimization & Performance

## Build Performance

## concept_id
t06-ts-optimization-performance

## title
TypeScript Optimization & Performance

## aliases
- T06-ts-optimization-performance

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
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