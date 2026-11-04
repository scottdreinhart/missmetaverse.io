---
tags:
  - typescript-javascript-type-system

---
slug: TypeScript/typescript-strict-mode
sources:
  - https://www.typescriptlang.org/docs/handbook/2/everyday-types.html
  - https://www.typescriptlang.org/docs/handbook/2/functions.html
  - https://www.typescriptlang.org/docs/handbook/2/objects.html
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
  - https://www.typescriptlang.org/tsconfig
date: 2026-11-02
---

tags:
  - typescript-javascript-type-system

---
# TypeScript Best Practices

## Project Structure

## concept_id
t02-ts-best-practices

## title
TypeScript Best Practices

## aliases
- T02-ts-best-practices

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
### File Organization

```
src/
â”œâ”€â”€ components/        # React components
â”œâ”€â”€ services/          # API/business logic
â”œâ”€â”€ types/             # Shared type definitions
â”œâ”€â”€ utils/             # Helper functions
â”œâ”€â”€ hooks/             # Custom React hooks
â””â”€â”€ constants/         # Constants and enums
```

### Separate Type Definitions

```typescript
// types/user.ts â€” dedicated type file
export interface User {
  id: string;
  name: string;
  email: string;
  role: UserRole;
}

export enum UserRole {
  Admin = "admin",
  User = "user",
  Guest = "guest",
}

// In your component â€” import types explicitly
import type { User, UserRole } from "@/types/user";
```

## Type Definitions