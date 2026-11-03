---
slug: project-structure-mapping
title: Project Structure Mapping
description: Maps architectural patterns and concepts to actual file/folder structure in the project.
author: Copilot
source: vault-research
canonical_url: 
tags:
  - maturity/deprecated
  - project-structure
  - clean-architecture
  - ddd
  - cqrs
  - folder-structure
  - mapping
created_on: 2026-11-02
updated_on: 2026-11-02
verification_status: verified
claims_supported: 10
access_limitations: None
---

# Project Structure Mapping

> **Purpose:** Maps abstract architectural patterns to concrete file/folder structure.
> **When to Use:** When creating new files, refactoring structure, or onboarding new developers.
> **Copilot Instructions:** When suggesting file creation or refactoring, reference this mapping. Always create files in the correct folder following these conventions.

---

## Recommended Folder Structure

```
src/
â”œâ”€â”€ main.ts                          # Application entry point
â”œâ”€â”€ app.ts                           # App factory (wires dependencies)
â”‚
â”œâ”€â”€ entities/                        # Circle 1: Entities (innermost)
â”‚   â”œâ”€â”€ user.entity.ts
â”‚   â”œâ”€â”€ order.entity.ts
â”‚   â””â”€â”€ ...
â”‚
â”œâ”€â”€ value-objects/                   # Value Objects
â”‚   â”œâ”€â”€ money.vo.ts
â”‚   â”œâ”€â”€ email.vo.ts
â”‚   â””â”€â”€ ...
â”‚
â”œâ”€â”€ domains/                         # Domain Layer (DDD bounded contexts)
â”‚   â”œâ”€â”€ user/
â”‚   â”‚   â”œâ”€â”€ user.repository.ts       # Repository interface
â”‚   â”‚   â”œâ”€â”€ user.service.ts          # Domain service
â”‚   â”‚   â””â”€â”€ user.events.ts           # Domain events
â”‚   â”œâ”€â”€ order/
â”‚   â”‚   â”œâ”€â”€ order.repository.ts
â”‚   â”‚   â”œâ”€â”€ order.service.ts
â”‚   â”‚   â””â”€â”€ order.events.ts
â”‚   â””â”€â”€ ...
â”‚
â”œâ”€â”€ usecases/                        # Circle 2: Use Cases
â”‚   â”œâ”€â”€ create-user.usecase.ts
â”‚   â”œâ”€â”€ place-order.usecase.ts
â”‚   â””â”€â”€ ...
â”‚
â”œâ”€â”€ commands/                        # CQRS: Command Handlers
â”‚   â”œâ”€â”€ create-user.command.ts
â”‚   â”œâ”€â”€ update-user.command.ts
â”‚   â””â”€â”€ ...
â”‚
â”œâ”€â”€ queries/                         # CQRS: Query Handlers
â”‚   â”œâ”€â”€ get-user.query.ts
â”‚   â”œâ”€â”€ list-users.query.ts
â”‚   â””â”€â”€ ...
â”‚
â”œâ”€â”€ adapters/                        # Circle 3: Interface Adapters
â”‚   â”œâ”€â”€ controllers/                 # HTTP controllers
â”‚   â”‚   â”œâ”€â”€ user.controller.ts
â”‚   â”‚   â””â”€â”€ order.controller.ts
â”‚   â”œâ”€â”€ gateways/                    # External service adapters
â”‚   â”‚   â”œâ”€â”€ email.gateway.ts
â”‚   â”‚   â”œâ”€â”€ payment.gateway.ts
â”‚   â”‚   â””â”€â”€ database.gateway.ts
â”‚   â””â”€â”€ presenters/                  # Response formatters
â”‚       â”œâ”€â”€ user.presenter.ts
â”‚       â””â”€â”€ order.presenter.ts
â”‚
â”œâ”€â”€ frameworks/                      # Circle 4: Frameworks (outermost)
â”‚   â”œâ”€â”€ web/                         # Web framework setup
â”‚   â”‚   â”œâ”€â”€ server.ts
â”‚   â”‚   â”œâ”€â”€ middleware.ts
â”‚   â”‚   â””â”€â”€ routes.ts
â”‚   â”œâ”€â”€ database/                    # Database setup
â”‚   â”‚   â”œâ”€â”€ connection.ts
â”‚   â”‚   â””â”€â”€ migrations/
â”‚   â””â”€â”€ config/                      # Configuration
â”‚       â”œâ”€â”€ app.config.ts
â”‚       â””â”€â”€ env.config.ts
â”‚
â”œâ”€â”€ ports/                           # Port interfaces (defined in domain, implemented in adapters)
â”‚   â”œâ”€â”€ user-repository.port.ts
â”‚   â”œâ”€â”€ email-service.port.ts
â”‚   â””â”€â”€ ...
â”‚
â”œâ”€â”€ shared/                          # Cross-cutting utilities
â”‚   â”œâ”€â”€ errors/                      # Custom error classes
â”‚   â”‚   â”œâ”€â”€ domain-error.ts
â”‚   â”‚   â”œâ”€â”€ validation-error.ts
â”‚   â”‚   â””â”€â”€ not-found-error.ts
â”‚   â”œâ”€â”€ types/                       # Shared TypeScript types
â”‚   â”‚   â”œâ”€â”€ result.ts
â”‚   â”‚   â””â”€â”€ pagination.ts
â”‚   â””â”€â”€ utils/                       # Utility functions
â”‚       â”œâ”€â”€ generate-id.ts
â”‚       â””â”€â”€ validate-email.ts
â”‚
â”œâ”€â”€ tests/                           # Test files
â”‚   â”œâ”€â”€ unit/                        # Unit tests
â”‚   â”‚   â”œâ”€â”€ entities/
â”‚   â”‚   â”œâ”€â”€ usecases/
â”‚   â”‚   â””â”€â”€ value-objects/
â”‚   â”œâ”€â”€ integration/                 # Integration tests
â”‚   â”‚   â”œâ”€â”€ controllers/
â”‚   â”‚   â””â”€â”€ gateways/
â”‚   â””â”€â”€ e2e/                         # E2E tests
â”‚       â””â”€â”€ features/
â”‚
â””â”€â”€ events/                          # Event handlers
    â”œâ”€â”€ user-created.handler.ts
    â”œâ”€â”€ order-placed.handler.ts
    â””â”€â”€ ...
```

---

## File Naming Conventions

| Pattern | Example | Purpose |
|---------|---------|---------|
| `*.entity.ts` | `user.entity.ts` | Domain entities |
| `*.vo.ts` | `money.vo.ts` | Value objects |
| `*.repository.ts` | `user.repository.ts` | Repository interfaces |
| `*.repository.adapter.ts` | `user-repository.adapter.ts` | Repository implementations |
| `*.service.ts` | `payment.service.ts` | Domain services |
| `*.usecase.ts` | `create-user.usecase.ts` | Use case handlers |
| `*.command.ts` | `create-user.command.ts` | CQRS command handlers |
| `*.query.ts` | `get-user.query.ts` | CQRS query handlers |
| `*.controller.ts` | `user.controller.ts` | HTTP controllers |
| `*.gateway.ts` | `email.gateway.ts` | External service adapters |
| `*.presenter.ts` | `user.presenter.ts` | Response formatters |
| `*.port.ts` | `email-service.port.ts` | Port interfaces |
| `*.event.ts` | `user-created.event.ts` | Domain events |
| `*.handler.ts` | `user-created.handler.ts` | Event handlers |
| `*.adapter.ts` | `db-client.adapter.ts` | Infrastructure adapters |
| `*.use-case.ts` | `create-user.use-case.ts` | Alternative use case naming |
| `*.data.ts` | `user.data.ts` | Data access layer |
| `*.test.ts` | `user.test.ts` | Unit tests |
| `*.spec.ts` | `user.spec.ts` | Spec tests |

---

## Pattern-to-Folder Mapping

### Clean Architecture

| Circle | Folder | Contents |
|--------|--------|----------|
| **Entities** (innermost) | `entities/` | Business entities with invariants |
| **Use Cases** | `usecases/` | Application business rules |
| **Interface Adapters** | `adapters/` | Controllers, gateways, presenters |
| **Frameworks** (outermost) | `frameworks/` | Web framework, database, config |
| **Ports** | `ports/` | Interface definitions |

### DDD

| Pattern | Folder | Example |
|---------|--------|---------|
| **Bounded Context** | `domains/{context}/` | `domains/user/`, `domains/order/` |
| **Aggregate Root** | `entities/{aggregate}.entity.ts` | `entities/order.entity.ts` |
| **Value Object** | `value-objects/{vo}.vo.ts` | `value-objects/money.vo.ts` |
| **Repository** | `domains/{context}/{entity}.repository.ts` | `domains/order/order.repository.ts` |
| **Domain Service** | `domains/{context}/{service}.service.ts` | `domains/order/payment.service.ts` |
| **Domain Event** | `domains/{context}/{event}.event.ts` | `domains/order/order-created.event.ts` |
| **Factory** | `domains/{context}/{entity}.factory.ts` | `domains/order/order.factory.ts` |

### CQRS

| Side | Folder | Example |
|------|--------|---------|
| **Commands** | `commands/` | `commands/create-user.command.ts` |
| **Queries** | `queries/` | `queries/get-user.query.ts` |
| **Command Handler** | `commands/{name}.command.ts` | `commands/create-user.command.ts` |
| **Query Handler** | `queries/{name}.query.ts` | `queries/get-user.query.ts` |

### Event-Driven

| Pattern | Folder | Example |
|---------|--------|---------|
| **Event Definition** | `domains/{context}/{event}.event.ts` | `domains/order/order-placed.event.ts` |
| **Event Handler** | `events/{event}.handler.ts` | `events/order-placed.handler.ts` |
| **Event Bus** | `shared/events/event-bus.ts` | `shared/events/event-bus.ts` |

---

## Dependency Rules

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚  frameworks/        â†’ Can import from: adapters/, ports/ â”‚
â”‚  adapters/          â†’ Can import from: usecases/, ports/ â”‚
â”‚  commands/          â†’ Can import from: domains/, shared/ â”‚
â”‚  queries/           â†’ Can import from: domains/, shared/ â”‚
â”‚  usecases/          â†’ Can import from: entities/, domains/â”‚
â”‚  domains/           â†’ Can import from: entities/, value-objects/, shared/ â”‚
â”‚  entities/          â†’ Can import from: value-objects/, shared/ â”‚
â”‚  value-objects/     â†’ Can import from: shared/ only      â”‚
â”‚  ports/             â†’ Can import from: shared/ only      â”‚
â”‚  shared/            â†’ No imports (leaf module)           â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜

Rule: Dependencies point INWARDS only.
Outer folders can import inner folders.
Inner folders NEVER import outer folders.
```

---

## Copilot Instructions

### When Creating New Files

1. **Identify the pattern**: Is this an entity, use case, command, query, controller, gateway, etc.?
2. **Choose the folder**: Use the mapping above to select the correct folder
3. **Follow naming conventions**: Use the naming pattern for the file type
4. **Create port first**: If adding a new external dependency, create the port interface in `ports/` first
5. **Implement the adapter**: Create the adapter in `adapters/gateways/`
6. **Wire dependencies**: Register in `app.ts` or the appropriate dependency injection container

### When Refactoring

1. **Check dependency rules**: Ensure no inner folder imports from an outer folder
2. **Move business logic inward**: If a controller has business logic, move it to a use case
3. **Push framework dependencies outward**: If a use case imports from `frameworks/`, create a port
4. **Preserve file naming**: Keep the naming convention consistent

### When Reviewing Code

1. **Check folder placement**: Is the file in the correct folder?
2. **Check naming**: Does the file follow the naming convention?
3. **Check dependencies**: Are there any inward-pointing dependency violations?
4. **Check port usage**: Are external dependencies accessed through ports?

---

## Quick Reference

| I want to create... | Create it in... |
|---------------------|-----------------|
| New entity | `entities/` |
| New value object | `value-objects/` |
| New use case | `usecases/` |
| New CQRS command | `commands/` |
| New CQRS query | `queries/` |
| New API endpoint | `adapters/controllers/` |
| New external service | `adapters/gateways/` + `ports/` |
| New domain event | `domains/{context}/` |
| New event handler | `events/` |
| New custom error | `shared/errors/` |
| New utility function | `shared/utils/` |
| New shared type | `shared/types/` |
| New unit test | `tests/unit/` |
| New integration test | `tests/integration/` |
| New E2E test | `tests/e2e/` |

---

## Decision Tree: File Creation

```mermaid
graph TD
    A[Need to create a file?]\n    A --> B{What is it?}
    B -->|Entity| C[entities/]
    B -->|Value Object| D[value-objects/]
    B -->|Use Case| E[usecases/]
    B -->|Command| F[commands/]
    B -->|Query| G[queries/]
    B -->|Controller| H[adapters/controllers/]
    B -->|Gateway| I[adapters/gateways/]
    B -->|Event| J[events/]
    B -->|Handler| K[events/]
    B -->|Error| L[shared/errors/]
    B -->|Utility| M[shared/utils/]
    B -->|Test| N[tests/]
    C --> O[*.entity.ts]
    D --> P[*.vo.ts]
    E --> Q[*.usecase.ts]
    F --> R[*.command.ts]
    G --> S[*.query.ts]
    H --> T[*.controller.ts]
    I --> U[*.gateway.ts]
    J --> V[*.event.ts]
    K --> W[*.handler.ts]
    L --> X[*.error.ts]
    M --> Y[*.util.ts]
    N --> Z[*.test.ts]
```

### When to Use Each Folder

| Folder | When to Use | Example |
|--------|-------------|---------|
| **entities/** | Core business entities | user.entity.ts |
| **value-objects/** | Immutable value objects | money.vo.ts |
| **usecases/** | Business logic use cases | create-user.usecase.ts |
| **commands/** | CQRS commands | CreateUserCommand.ts |
| **queries/** | CQRS queries | GetUserQuery.ts |
| **adapters/controllers/** | API endpoints | user.controller.ts |
| **adapters/gateways/** | External services | email.gateway.ts |
| **events/** | Domain events/handlers | UserCreatedEvent.ts |
| **shared/** | Cross-cutting utilities | shared/utils/format.ts |
| **tests/** | All tests | tests/unit/user.test.ts |

---

## Procedural Guidance: Creating New Files

### Step 1: Determine File Type

```
Is it a core business entity?
  â†’ entities/
Is it an immutable value object?
  â†’ value-objects/
Is it a business logic use case?
  â†’ usecases/
Is it a CQRS command or query?
  â†’ commands/ or queries/
Is it an API endpoint?
  â†’ adapters/controllers/
Is it an external service integration?
  â†’ adapters/gateways/
Is it a domain event?
  â†’ events/
Is it a shared utility?
  â†’ shared/
```

### Step 2: Create File with Correct Naming

```typescript
// entities/user.entity.ts
export class UserEntity {
  constructor(
    public readonly id: string,
    public readonly name: string,
    public readonly email: string,
  ) {}
}

// value-objects/email.vo.ts
export class EmailValueObject {
  constructor(public readonly value: string) {
    if (!this.value.includes('@')) {
      throw new Error('Invalid email')
    }
  }
}

// usecases/create-user.usecase.ts
import { UserEntity } from '@/entities/user.entity'
import { EmailValueObject } from '@/value-objects/email.vo'

export class CreateUserUseCase {
  constructor(
    private readonly userRepository: UserRepository,
  ) {}

  async execute(name: string, email: string): Promise<UserEntity> {
    const emailVO = new EmailValueObject(email)
    const user = new UserEntity(crypto.randomUUID(), name, emailVO.value)
    return this.userRepository.save(user)
  }
}
```

### Step 3: Write Tests

```typescript
// tests/unit/create-user.usecase.test.ts
import { describe, it, expect } from 'vitest'
import { CreateUserUseCase } from '@/usecases/create-user.usecase'
import { UserEntity } from '@/entities/user.entity'

describe('CreateUserUseCase', () => {
  it('should create a user', async () => {
    const mockRepo = {
      save: vi.fn().mockResolvedValue(new UserEntity('1', 'John', 'john@example.com')),
    }
    const useCase = new CreateUserUseCase(mockRepo as any)
    const user = await useCase.execute('John', 'john@example.com')
    expect(user.name).toBe('John')
  })
})
```

### Step 4: Update Imports

```typescript
// Always use absolute imports with @/ alias
import { UserEntity } from '@/entities/user.entity'
import { EmailValueObject } from '@/value-objects/email.vo'
import { CreateUserUseCase } from '@/usecases/create-user.usecase'
```

---

## Copilot Instructions

### When to Read This Note
- Creating new files in the project
- Refactoring file structure
- Onboarding new developers
- Suggesting file creation or refactoring
- Understanding project architecture

### What to Do With This Information
1. **Follow folder conventions**: Create files in the correct folder based on type
2. **Use naming patterns**: Follow the established naming conventions
3. **Absolute imports**: Use @/ alias for all imports
4. **Dependency rules**: Respect inward-only dependencies
5. **Test placement**: Put tests in the correct test folder

### Tools to Use
- **VS Code Extension**: TypeScript Hero â€” for TypeScript shortcuts
- **VS Code Extension**: Error Lens â€” for inline error display
- **Terminal Command**: `pnpm tsc --noEmit` â€” type check
- **Terminal Command**: `pnpm test` â€” run tests
- **Terminal Command**: `pnpm build` â€” production build

### Agents to Invoke
- **Architecture Validation Agent**: Run when creating new files or refactoring
- **Code Review Agent**: Run when reviewing PRs with file structure changes

### Integration with Other Notes
- Read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for Clean Architecture principles
- Read [[ddd-patterns]] for DDD patterns
- Read [cqrs-pattern](https://learn.microsoft.com/azure/architecture/patterns/cqrs) for CQRS patterns
- Read [repository-pattern](https://martinfowler.com/eaaCatalog/repository.html) for repository pattern
- Read [ts-best-practices](D/ts-best-practices.md) for TypeScript best practices

### Common Pitfalls
- Don't create files in wrong folder (follow conventions)
- Don't use relative imports (use @/ alias)
- Don't break dependency rules (inward-only)
- Don't skip tests (create tests with new files)
- Don't ignore naming conventions (follow patterns)

### Quick Validation Checklist
- [ ] Is the file in the correct folder?
- [ ] Does the filename follow naming conventions?
- [ ] Are imports using @/ alias?
- [ ] Are tests created in the correct test folder?
- [ ] Are dependency rules respected?
- [ ] Is the file referenced in imports?


## See Also
- [[A001-abstract-factory-pattern]]
- [[A002-abstract-factory-patterns]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


