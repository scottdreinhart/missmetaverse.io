# TypeScript tsconfig.json Reference

> Slug: `ts-tsconfig`
> Source: [[https://www.typescriptlang.org/tsconfig|TSConfig Reference]]
> Date: 2026-11-02

## Top-Level Fields

| Field | Description |
|-------|-------------|
| `files` | Explicit list of files to include |
| `include` | Glob patterns for files to include |
| `exclude` | Glob patterns to exclude from `include` |
| `extends` | Base configuration(s) to inherit from |
| `references` | Project references for multi-project builds |

## Recommended tsconfig for React + Vite + TypeScript

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "useDefineForClassFields": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "skipLibCheck": true,

    /* Bundler mode */
    "moduleResolution": "bundler",
    "allowImportingTsExtensions": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",

    /* Linting */
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noFallthroughCasesInSwitch": true
  },
  "include": ["src"]
}
```

## Type Checking Options

| Option | Default | Description |
|--------|---------|-------------|
| `strict` | `true` | Enables all strict type-checking options |
| `noImplicitAny` | from `strict` | Error on implicit `any` |
| `strictNullChecks` | from `strict` | `null`/`undefined` are distinct types |
| `strictFunctionTypes` | from `strict` | Correct function parameter checking |
| `strictBindCallApply` | from `strict` | Strict bind/call/apply checking |
| `strictPropertyInitialization` | from `strict` | Class properties must be initialized |
| `useUnknownInCatchVariables` | from `strict` | Catch variables are `unknown` by default |
| `noImplicitThis` | from `strict` | Error on implicit `this: any` |
| `alwaysStrict` | from `strict` | Emit `"use strict"` in output |
| `exactOptionalPropertyTypes` | — | Optional properties can't be set to `undefined` |
| `noFallthroughCasesInSwitch` | — | Error on fallthrough in switch |
| `noImplicitReturns` | — | Error on missing return in function |
| `noImplicitOverride` | — | Require `override` modifier on overrides |
| `noPropertyAccessFromIndexSignature` | — | Use `['key']` for index signature access |
| `noUncheckedIndexedAccess` | — | Index access adds `undefined` |
| `noUnusedLocals` | — | Error on unused locals |
| `noUnusedParameters` | — | Error on unused parameters |

## Module Resolution

| Option | Description |
|--------|-------------|
| `module` | Module output format (`ESNext`, `CommonJS`, `Node16`, `NodeNext`, `Preserve`, etc.) |
| `moduleResolution` | Resolution strategy (`bundler`, `node16`, `nodenext`, `node10`, `classic`) |
| `moduleSuffixes` | File suffixes to try when resolving |
| `baseUrl` | Base directory for non-relative imports |
| `paths` | Path mappings for imports |
| `rootDir` | Root directory for input files |
| `resolveJsonModule` | Allow importing `.json` files |
| `allowArbitraryExtensions` | Import files with any extension |
| `allowImportingTsExtensions` | Import `.ts` files directly |
| `resolvePackageJsonExports` | Respect `exports` field in package.json |
| `resolvePackageJsonImports` | Respect `imports` field in package.json |
| `customConditions` | Additional conditions for package.json resolution |
| `noUncheckedSideEffectImports` | Error on missing side-effect imports |
| `verbatimModuleSyntax` | Only erase `import type` — preserve all other imports |

## Emit Options

| Option | Description |
|--------|-------------|
| `declaration` | Generate `.d.ts` files |
| `declarationDir` | Output directory for declarations |
| `declarationMap` | Generate source maps for `.d.ts` files |
| `emitDeclarationOnly` | Only emit `.d.ts`, no `.js` |
| `sourceMap` | Generate `.js.map` files |
| `inlineSourceMap` | Embed source map in `.js` |
| `outDir` | Output directory for emitted files |
| `outFile` | Concatenate into single file |
| `removeComments` | Strip comments from output |
| `noEmit` | Do not emit compiler output |
| `noEmitOnError` | Do not emit if errors exist |
| `downlevelIteration` | Better iteration for older targets |
| `importHelpers` | Import helpers from `tslib` |
| `preserveConstEnums` | Keep `const enum` in output |
| `stripInternal` | Remove `@internal` JSDoc items |

## JavaScript Support

| Option | Description |
|--------|-------------|
| `allowJs` | Allow importing `.js` files |
| `checkJs` | Report errors in `.js` files |
| `maxNodeModuleJsDepth` | Max depth to search in `node_modules` for JS |

## Interop Constraints

| Option | Description |
|--------|-------------|
| `esModuleInterop` | Enable default imports from CommonJS |
| `allowSyntheticDefaultImports` | Allow `import React from "react"` style |
| `isolatedModules` | Warn on code that can't be transpiled individually |
| `forceConsistentCasingInFileNames` | Error on casing mismatches |
| `verbatimModuleSyntax` | Use `import type` explicitly, preserve others |
| `isolatedDeclarations` | Require sufficient annotation for standalone declaration |

## Language & Environment

| Option | Description |
|--------|-------------|
| `target` | ECMAScript target version (`ES3`, `ES5`, `ES2015`–`ES2024`, `ESNext`) |
| `lib` | API definitions to include (`ES2020`, `DOM`, `DOM.Iterable`, etc.) |
| `jsx` | JSX emit mode (`react`, `react-jsx`, `react-jsxdev`, `preserve`, `react-native`) |
| `jsxFactory` | JSX factory function (default: `React.createElement`) |
| `jsxFragmentFactory` | JSX fragment factory (default: `React.Fragment`) |
| `jsxImportSource` | Module for JSX imports (default: `react`) |
| `experimentalDecorators` | Enable legacy decorators |
| `emitDecoratorMetadata` | Emit type metadata for decorators |

## Projects

| Option | Description |
|--------|-------------|
| `composite` | Enforces constraints for project references |
| `incremental` | Save build info for faster subsequent builds |
| `tsBuildInfoFile` | File to store incremental info |
| `disableReferencedProjectLoad` | Don't auto-load referenced projects |
| `disableSolutionSearching` | Don't include in "go to definition" across projects |

## Completeness

| Option | Description |
|--------|-------------|
| `skipLibCheck` | Skip type checking of declaration files |
| `skipDefaultLibCheck` | Skip checking default library files |

## Watch Options

| Option | Description |
|--------|-------------|
| `watchFile` | Strategy for file watching (`useFsEvents`, `fixedPollingInterval`, etc.) |
| `watchDirectory` | Strategy for directory watching |
| `fallbackPolling` | Polling strategy when fs events unavailable |
| `excludeDirectories` | Directories to exclude from watching |
| `excludeFiles` | Files to exclude from watching |

## Key Decisions for This Project

Based on the project's tech stack (React 19 + Vite + TypeScript + pnpm):

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "jsx": "react-jsx",
    "strict": true,
    "noEmit": true,
    "isolatedModules": true,
    "skipLibCheck": true
  }
}
```
