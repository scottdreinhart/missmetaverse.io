---
slug: ts-security-best-practices
sources:
  - https://www.typescriptlang.org/docs/handbook/2/functions.html
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
  - https://www.typescriptlang.org/tsconfig
  - https://github.com/microsoft/TypeScript/wiki
date: 2026-11-02
---

# TypeScript Security Best Practices

## Type Safety as Security

TypeScript's primary security benefit is **compile-time type safety** — catching errors before they reach production. This prevents entire classes of runtime vulnerabilities.

## Strict Type Checking

### Enable Full Strict Mode

```jsonc
{
  "compilerOptions": {
    "strict": true  // Enables all strict checks
  }
}
```

This enables:
- `strictNullChecks` — prevents null/undefined dereferencing
- `strictFunctionTypes` — correct function parameter checking
- `strictBindCallApply` — validates call/bind/apply arguments
- `noImplicitAny` — prevents implicit `any` types
- `noImplicitThis` — prevents ambiguous `this` references
- `strictPropertyInitialization` — enforces constructor initialization
- `useUnknownInCatchVariables` — catch variables are `unknown` by default

### Strict Null Checks

```typescript
// ❌ Without strictNullChecks — runtime error possible
const user = users.find(u => u.id === id);
console.log(user.name); // Could crash if user is undefined

// ✅ With strictNullChecks — must handle undefined
const user = users.find(u => u.id === id);
if (user) {
  console.log(user.name); // Safe
}

// ✅ Or use optional chaining
console.log(user?.name);

// ✅ Or provide a default
const userName = user?.name ?? "Guest";
```

### Use `unknown` Instead of `any`

```typescript
// ❌ any — bypasses all type checking, security risk
function process(data: any) {
  data.someMethod(); // No compile-time check
}

// ✅ unknown — must be narrowed before use
function process(data: unknown) {
  if (typeof data === "string") {
    console.log(data.toUpperCase()); // Safe
  }
}

// ✅ In catch blocks (with useUnknownInCatchVariables)
try {
  fetchData();
} catch (err: unknown) {
  if (err instanceof Error) {
    console.error(err.message); // Safe
  }
}
```

## Input Validation

### Runtime Type Guards

```typescript
// Type guard for user input
function isUserInput(input: unknown): input is { name: string; age: number } {
  return (
    typeof input === "object" &&
    input !== null &&
    "name" in input &&
    typeof (input as any).name === "string" &&
    "age" in input &&
    typeof (input as any).age === "number"
  );
}

// Usage
function handleRegistration(data: unknown) {
  if (isUserInput(data)) {
    // TypeScript knows data has name and age
    createAccount(data.name, data.age);
  } else {
    throw new Error("Invalid input");
  }
}
```

### Discriminated Unions for Validated Data

```typescript
type Success = { status: "success"; data: UserData };
type Error = { status: "error"; message: string };
type ApiResponse = Success | Error;

function handleResponse(response: ApiResponse) {
  switch (response.status) {
    case "success":
      console.log(response.data); // TypeScript knows data exists
      break;
    case "error":
      console.error(response.message); // TypeScript knows message exists
      break;
  }
}
```

## Preventing Type Assertion Abuse

### Avoid `as` Assertions for Validation

```typescript
// ❌ Dangerous — bypasses type checking
const userInput = getFormData() as FormData;
processForm(userInput); // If shape is wrong, runtime error

// ✅ Use type guards instead
const rawInput = getFormData();
if (isFormData(rawInput)) {
  processForm(rawInput); // Type-safe
}
```

### Use `satisfies` Operator for Validation

```typescript
// ❌ Object literal may have excess properties
const config = {
  host: "localhost",
  port: 3000,
  debug: true,
  secretKey: "abc123" // Excess property — no error without satisfies
} as Config;

// ✅ satisfies — validates shape without changing type
const config = {
  host: "localhost",
  port: 3000,
  debug: true
} satisfies Config;

// ❌ Error — secretKey is not in Config type
const badConfig = {
  host: "localhost",
  port: 3000,
  secretKey: "abc123"
} satisfies Config;
```

## Safe Index Access

### noUncheckedIndexedAccess

```jsonc
{
  "compilerOptions": {
    "noUncheckedIndexedAccess": true
  }
}
```

```typescript
interface EnvVars {
  NAME: string;
  [key: string]: string;
}

declare const env: EnvVars;

// With noUncheckedIndexedAccess:
const name = env.NAME;           // string
const custom = env.CUSTOM;       // string | undefined — must handle!

// Safe usage
if (env.CUSTOM) {
  console.log(env.CUSTOM);
}
```

## noImplicitOverride — Prevent Inheritance Bugs

```typescript
class Base {
  setup() { /* ... */ }
}

class Child extends Base {
  // ❌ Without noImplicitOverride — silently fails to override
  setup() { /* ... */ }

  // ✅ With noImplicitOverride — error if override is missing
  override setup() { /* ... */ }
}
```

## Use `const` Enums Sparingly

```typescript
// ❌ const enums are erased at compile time — no runtime safety
const enum Direction { Up, Down, Left, Right }
const dir = getDirection();
if (dir === Direction.Up) { /* ... */ }

// ✅ Regular enums — exist at runtime, can be validated
enum Direction { Up, Down, Left, Right }
const dir = getDirection();
if (dir === Direction.Up) { /* ... */ }
// Can validate: if (!(dir in Direction)) { throw new Error(); }
```

## Security Checklist

| Check | Setting | Purpose |
|-------|---------|---------|
| Strict mode | `strict: true` | All strict type checks |
| Null safety | `strictNullChecks: true` | Prevent null/undefined errors |
| No implicit any | `noImplicitAny: true` | Force explicit types |
| Unknown catch | `useUnknownInCatchVariables: true` | Safe error handling |
| Index safety | `noUncheckedIndexedAccess: true` | Handle missing keys |
| Override safety | `noImplicitOverride: true` | Prevent inheritance bugs |
| Property init | `strictPropertyInitialization: true` | Ensure initialized |
| Function types | `strictFunctionTypes: true` | Correct parameter checking |
| Bind/call/apply | `strictBindCallApply: true` | Validate method calls |

## Key Takeaways

1. **Always enable `strict: true`** — it's the foundation of TypeScript security
2. **Prefer `unknown` over `any`** — forces type narrowing before use
3. **Use type guards for runtime validation** — never trust external input
4. **Avoid `as` assertions** — they bypass type safety
5. **Use `satisfies` for object validation** — catches excess properties
6. **Enable `noUncheckedIndexedAccess`** — handle missing keys explicitly
7. **Use `noImplicitOverride`** — prevent inheritance bugs
8. **Validate all external input** — types don't replace runtime validation
