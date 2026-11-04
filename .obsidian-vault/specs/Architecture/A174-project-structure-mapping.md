---
slug: Project File Conventions
title: Project Structure Mapping
description: Maps architectural patterns and concepts to actual file/folder structure in the project.
author: Copilot
source: vault-research
canonical_url: 
tags:
  - architecture-design-patterns

  - maturity-deprecated
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

## concept_id
a174-project-structure-mapping

## title
Project Structure Mapping

## aliases
- A174-project-structure-mapping

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
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