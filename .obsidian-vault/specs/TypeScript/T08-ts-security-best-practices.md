---
slug: ts-Security/web-security
sources:
  - https://www.typescriptlang.org/docs/handbook/security.html
date: 2026-11-02
tags:














  - typescript
  - security
  - best-practices
  - validation
---

# TypeScript Security Best Practices
sources:
  - https://www.typescriptlang.org/docs/handbook/2/functions.html
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
  - https://www.typescriptlang.org/tsconfig
  - https://github.com/microsoft/TypeScript/wiki
date: 2026-11-02
---

# TypeScript Security Best Practices

## Type Safety as Security

TypeScript's primary security benefit is **compile-time type safety** â€” catching errors before they reach production. This prevents entire classes of runtime vulnerabilities.

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
- `strictNullChecks` â€” prevents null/undefined dereferencing
- `strictFunctionTypes` â€” correct function parameter checking
- `strictBindCallApply` â€” validates call/bind/apply arguments
- `noImplicitAny` â€” prevents implicit `any` types
- `noImplicitThis` â€” prevents ambiguous `this` references
- `strictPropertyInitialization` â€” enforces constructor initialization
- `useUnknownInCatchVariables` â€” catch variables are `unknown` by default

### Strict Null Checks

```typescript
// âŒ Without strictNullChecks â€” runtime error possible
const user = users.find(u => u.id === id);
console.log(user.name); // Could crash if user is undefined

// âœ… With strictNullChecks â€” must handle undefined
const user = users.find(u => u.id === id);
if (user) {
  console.log(user.name); // Safe
}

// âœ… Or use optional chaining
console.log(user?.name);

// âœ… Or provide a default
const userName = user?.name ?? "Guest";
```

### Use `unknown` Instead of `any`

```typescript
// âŒ any â€” bypasses all type checking, security risk
function process(data: any) {
  data.someMethod(); // No compile-time check
}

// âœ… unknown â€” must be narrowed before use
function process(data: unknown) {
  if (typeof data === "string") {
    console.log(data.toUpperCase()); // Safe
  }
}

// âœ… In catch blocks (with useUnknownInCatchVariables)
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
// âŒ Dangerous â€” bypasses type checking
const userInput = getFormData() as FormData;
processForm(userInput); // If shape is wrong, runtime error

// âœ… Use type guards instead
const rawInput = getFormData();
if (isFormData(rawInput)) {
  processForm(rawInput); // Type-safe
}
```

### Use `satisfies` Operator for Validation

```typescript
// âŒ Object literal may have excess properties
const config = {
  host: "localhost",
  port: 3000,
  debug: true,
  secretKey: "abc123" // Excess property â€” no error without satisfies
} as Config;

// âœ… satisfies â€” validates shape without changing type
const config = {
  host: "localhost",
  port: 3000,
  debug: true
} satisfies Config;

// âŒ Error â€” secretKey is not in Config type
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
const custom = env.CUSTOM;       // string | undefined â€” must handle!

// Safe usage
if (env.CUSTOM) {
  console.log(env.CUSTOM);
}
```

## noImplicitOverride â€” Prevent Inheritance Bugs

```typescript
class Base {
  setup() { /* ... */ }
}

class Child extends Base {
  // âŒ Without noImplicitOverride â€” silently fails to override
  setup() { /* ... */ }

  // âœ… With noImplicitOverride â€” error if override is missing
  override setup() { /* ... */ }
}
```

## Use `const` Enums Sparingly

```typescript
// âŒ const enums are erased at compile time â€” no runtime safety
const enum Direction { Up, Down, Left, Right }
const dir = getDirection();
if (dir === Direction.Up) { /* ... */ }

// âœ… Regular enums â€” exist at runtime, can be validated
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

1. **Always enable `strict: true`** â€” it's the foundation of TypeScript security
2. **Prefer `unknown` over `any`** â€” forces type narrowing before use
3. **Use type guards for runtime validation** â€” never trust external input
4. **Avoid `as` assertions** â€” they bypass type safety
---

## Decision Tree: TypeScript Security Patterns

```mermaid
graph TD
    A[Need TypeScript security?]\n    A --> B{What type?}
    B -->|Type Safety| C[Strict Mode]
    B -->|Input Validation| D[Runtime Validation]
    B -->|Null Safety| E[Null Checks]
    B -->|Inheritance| F[Override Checks]
    C --> G{Enable all?}
    G -->|Yes| H[Full strict]
    G -->|No| I[Selective strict]
    D --> J{Schema or Manual?}
    J -->|Schema| K[Zod/Joi]
    J -->|Manual| L[Custom validators]
    E --> M{Always check?}
    M -->|Yes| N[!null checks]
    M -->|Optional| O[? optional]
```

### When to Use Each TypeScript Security Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Strict Mode** | All projects | compilerOptions.strict |
| **Null Checks** | API responses, DB queries | user?.name |
| **Runtime Validation** | User input, API payloads | Zod schema |
| **Override Checks** | Inheritance | noImplicitOverride |
| **Satisfies** | Object validation | config satisfies Config |

---

## Procedural Guidance: TypeScript Security Setup

### Step 1: Enable Strict Mode

```jsonc
// tsconfig.json
{
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "useUnknownInCatchVariables": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitOverride": true
  }
}
```

### Step 2: Type-Safe API Responses

```typescript
// src/types/api.ts
interface ApiResponse<T> {
  data: T
  error?: string
  status: number
}

// src/services/user.service.ts
import { ApiResponse } from '../types/api'

async function fetchUser(id: string): Promise<ApiResponse<User>> {
  try {
    const response = await fetch(`/api/users/${id}`)
    const data = await response.json()
    
    return {
      data: data as User,
      status: response.status,
    }
  } catch (error) {
    return {
      error: error instanceof Error ? error.message : 'Unknown error',
      status: 500,
    }
  }
}
```

### Step 3: Runtime Validation with Zod

```typescript
// src/schemas/user.schema.ts
import { z } from 'zod'

export const CreateUserSchema = z.object({
  name: z.string().min(2).max(100),
  email: z.string().email(),
  age: z.number().int().min(0).max(150).optional(),
})

export type CreateUserInput = z.infer<typeof CreateUserSchema>

// Usage
function createUser(input: unknown) {
  const result = CreateUserSchema.safeParse(input)
  
  if (!result.success) {
    throw new Error(`Validation failed: ${result.error.message}`)
  }
  
  // result.data is typed as CreateUserInput
  return result.data
}
```

### Step 4: Null Safety

```typescript
// src/services/user.service.ts
interface User {
  id: string
  name: string
  email: string
  role?: string  // Optional field
}

async function getUser(id: string): Promise<User | null> {
  const user = await db.query('SELECT * FROM users WHERE id = $1', [id])
  
  // TypeScript knows user might be null
  if (!user) {
    return null
  }
  
  // TypeScript knows user is User here
  return user
}

// Usage with optional chaining
const user = await getUser('123')
console.log(user?.name)  // Safe access
```

### Step 5: Override Safety

```typescript
// src/components/BaseComponent.ts
class BaseComponent {
  render(): string {
    return '<div>Base</div>'
  }
}

// src/components/ExtendedComponent.ts
class ExtendedComponent extends BaseComponent {
  override render(): string {  // Required with noImplicitOverride
    return '<div>Extended</div>'
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Setting up TypeScript security
- Implementing type-safe APIs
- Adding runtime validation
- Preventing null/undefined errors
- Using inheritance safely

### What to Do With This Information
1. **Enable strict mode**: Use full strict mode for all projects
2. **Type-safe APIs**: Create generic ApiResponse<T> types
3. **Runtime validation**: Use Zod/Joi for user input validation
4. **Null safety**: Use optional chaining and null checks
5. **Override safety**: Use noImplicitOverride for inheritance

### Tools to Use
- **VS Code Extension**: TypeScript Hero â€” for TypeScript shortcuts
- **VS Code Extension**: Error Lens â€” for inline TypeScript error display
- **npm Package**: `zod` â€” for runtime validation
- **npm Package**: `joi` â€” alternative to Zod
- **Terminal Command**: `pnpm tsc --noEmit` â€” type check without emitting
- **Terminal Command**: `pnpm tsc --strict` â€” enable strict mode

### Agents to Invoke
- **Security Review Agent**: Run when adding new types
- **Code Review Agent**: Run when reviewing PRs with TypeScript changes

### Integration with Other Notes
- Read [security-principles](D/security-principles.md) for security best practices
- read [input-validation](D/input-validation.md) for input validation patterns
- Read [Architecture/react-patterns](D/Architecture/react-patterns.md) for React component patterns
- Read [Quality & Testing/test-driven-developments](D/Quality & Testing/test-driven-developments.md) for testing strategies

### Common Pitfalls
- Don't use any type (use unknown instead)
- Don't skip runtime validation (types don't replace validation)
- Don't ignore null checks (always check for null/undefined)
- Don't skip override checks (use noImplicitOverride)
- Don't use satisfies incorrectly (use for object validation)

### Quick Validation Checklist
- [ ] Is strict mode enabled?
- [ ] Are API responses type-safe?
- [ ] Is runtime validation implemented?
- [ ] Are null checks handled?
- [ ] Is override safety enabled?
- [ ] Are types tested?




## See Also
- [[T01-TypeScript/generics]]
- [[T02-TypeScript/typescript-strict-mode]]
- [[T03-ts-decorators]]
- [[T04-TypeScript/typescript-strict-mode]]
- [[T05-TypeScript/type-inference]]


