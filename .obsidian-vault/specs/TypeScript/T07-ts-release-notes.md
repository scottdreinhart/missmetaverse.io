---
slug: ts-release-notes
sources:
  - https://www.typescriptlang.org/download/
date: 2026-11-02
tags:

  - maturity/experimental








  - typescript
  - release-notes
  - changelog
  - new-features
# TypeScript 5.0+ Release Notes


## Decorators (Standard)

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
TypeScript 5.0 introduced **standard-compliant decorators** (TC39 Stage 3), separate from the legacy `--experimentalDecorators` mode.

### Key Changes
- Decorators are now valid syntax without `--experimentalDecorators`
- Full type checking on decorators
- Different emit behavior from legacy decorators
- `--emitDecoratorMetadata` is **not compatible** with standard decorators
- Parameter decorators are **not supported** in standard mode

### Decorator Factories
```typescript
function loggedMethod(headMessage = "LOG:") {
  return function actualDecorator(
    originalMethod: any,
    context: ClassMethodDecoratorContext
  ) {
    const methodName = String(context.name);
    function replacementMethod(this: any, ...args: any[]) {
      console.log(`${headMessage} Entering method '${methodName}'.`);
      const result = originalMethod.call(this, ...args);
      console.log(`${headMessage} Exiting method '${methodName}'.`);
      return result;
    }
    return replacementMethod;
  };
}

// Usage with customization
class Person {
  @loggedMethod("âš ï¸")
  greet() { }
}
```

## `const` Type Parameters

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
```typescript
// Before TS 5.0 â€” required 'as const'
const names1 = getNamesExactly({ names: ["Alice", "Bob", "Eve"] });
// Inferred: string[]

// With const type parameter â€” no 'as const' needed
function getNamesExactly<const T extends HasNames>(arg: T): T["names"] {
  return arg.names;
}
const names = getNamesExactly({ names: ["Alice", "Bob", "Eve"] });
// Inferred: readonly ["Alice", "Bob", "Eve"]
```

## Multiple `extends` in tsconfig

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
```json
{
  "extends": ["@tsconfig/strictest/tsconfig.json", "../../../tsconfig.base.json"],
  "compilerOptions": {
    "outDir": "../lib"
  }
}
```

- Multiple base configurations can be extended
- Later entries override earlier ones
- Enables composable configuration

## All Enums Are Union Enums

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
TypeScript 5.0 made **all enums** behave as union enums with literal member types, even computed members.

```typescript
enum Color { Red, Green, Blue }
// Each member has its own literal type
// Can be narrowed: c is Color.Red | Color.Green | Color.Blue
```

## `--moduleResolution bundler`

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
New module resolution strategy for bundlers (Vite, esbuild, swc, Webpack, Parcel):

```json
{
  "compilerOptions": {
    "target": "esnext",
    "moduleResolution": "bundler"
  }
}
```

- Hybrid of ES module and CommonJS lookup rules
- Extensionless imports work (like CommonJS)
- Respects `exports`/`imports` in package.json (like Node.js)
- No requirement for file extensions on relative imports

## `--verbatimModuleSyntax`

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
Simplifies import handling â€” what you write is what you get:

```typescript
// Erased entirely
import type { A } from "a";

// Preserved (b has value, c and d are type-only)
import { b, type c, type d } from "bcd";

// Rewritten to 'import {} from "xyz"'
import { type xyz } from "xyz";
```

- Replaces `--importsNotUsedAsValues` and `--preserveValueImports` (deprecated)
- `import type` and `export type` are erased
- All other imports are preserved as-is

## `export type *` Support

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
```typescript
// models/index.ts
export type * as vehicles from "./vehicles";

// main.ts
import { vehicles } from "./models";
function takeASpaceship(s: vehicles.Spaceship) { } // OK
function makeASpaceship() { return new vehicles.Spaceship(); } // Error!
```

## `@satisfies` in JSDoc

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
```javascript
// @ts-check
/**
 * @satisfies {ConfigSettings}
 */
let myConfigSettings = {
  compilerOptions: { strict: true, outDir: "../lib" },
  extends: ["@tsconfig/strictest/tsconfig.json"]
};
// Preserves original type, validates structure
```

## `@overload` in JSDoc

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
```javascript
// @ts-check
/**
 * @overload
 * @param {string} value
 * @return {void}
 */
/**
 * @overload
 * @param {number} value
 * @param {number} [maximumFractionDigits]
 * @return {void}
 */
/**
 * @param {string | number} value
 * @param {number} [maximumFractionDigits]
 */
function printValue(value, maximumFractionDigits) { }
```

## Performance Improvements (TS 5.0)

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
| Metric | Improvement |
|--------|-------------|
| TypeScript Compiler startup | 89% faster |
| material-ui build time | 89% faster |
| Playwright build time | 88% faster |
| VS Code build time | 80% faster |
| typescript npm package size | 59% smaller |

## Breaking Changes & Deprecations

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
### Runtime Requirements
- Minimum Node.js 10+ (targets ES2018)

### Deprecated Options
- `--target: ES3`
- `--out`
- `--noImplicitUseStrict`
- `--keyofStringsOnly`
- `--suppressExcessPropertyErrors`
- `--suppressImplicitAnyIndexErrors`
- `--noStrictGenericChecks`
- `--charset`
- `--importsNotUsedAsValues`
- `--preserveValueImports`
- `prepend` in project references

### New Errors
- Implicit coercion in relational operators (`>` , `<`, `<=`, `>=`) with `string | number`
- Out-of-domain enum literal assignment
- Indirected mixed string/number enums

### Default Changes
- `--newLine` defaults to `LF` (not OS-specific)
- `--forceConsistentCasingInFileNames` defaults to `true`




---



## See Also

## concept_id
t07-ts-release-notes

## title
TypeScript 5.0+ Release Notes

## aliases
- T07-ts-release-notes

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required- [[T01-TypeScript/generics]]
- [[T02-TypeScript/typescript-strict-mode]]
- [[T03-ts-decorators]]
- [[T04-TypeScript/typescript-strict-mode]]
- [[T05-TypeScript/type-inference]]


