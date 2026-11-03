# Copilot Consumption Guide

> **Purpose:** Instructions for how GitHub Copilot should use this knowledge base during development.
> **Last Updated:** 2026-11-02

---
tags:
  - type/guide
  - domain/architecture
  - priority/high

## How to Use This Knowledge Base













## How to Use This Knowledge Base

When given a task, follow these steps:

### 1. Read the Architecture Notes
Start with the Architecture folder notes to identify the relevant category for the task.

### 2. Identify the Domain
Determine which layer the task affects:
- **Architecture** → High-level structure, patterns, principles
- **Integration** → Tool configuration, pipelines, deployment
- **Commit Management** → Git workflow, releases
- **TypeScript** → Type system, language features
- **React** → UI components, hooks, state
- **Bundler** → Build configuration, optimization
- **Testing** → Unit, integration, E2E tests
- **Package Manager** → Dependencies, workspaces
- **Tailwind CSS / ShadCN / CSS / HTML** → Styling and markup

### 3. Retrieve Relevant Concept Notes
Open the specific concept notes that apply to the task. For example:
- Building a component → React patterns + Tailwind CSS + HTML semantics
- Setting up a pipeline → Integration master config + CI/CD + Commit management
- Refactoring → Core principles + Architecture patterns + TypeScript

### 4. Check Actual Project Requirements
Read the AGENTS.md file for project-specific constraints:
- TypeScript only (no JavaScript)
- React 19 with App Router
- Tailwind CSS (no CSS-in-JS)
- pnpm (no npm/yarn)
- Obsidian vault for documentation

### 5. Apply Only Relevant Concepts
Not every pattern applies to every task. Use judgment:
- Small utility functions → Core principles + TypeScript
- New feature → Architecture patterns + DDD + Testing
- UI component → React patterns + Tailwind + HTML semantics + Accessibility

### 6. Cite Source Slugs
When explaining significant architectural decisions, cite the stable source slugs from the concept notes.

### 7. Distinguish Guidance from Implementation
- **Researched guidance** = What authoritative sources say
- **Verified implementation** = What the project actually does
- **Unverified assumptions** = What we think but haven't confirmed

### 8. Record Unresolved Assumptions
If a decision requires judgment beyond what sources establish, note it explicitly.

### 9. Revalidate Version-Sensitive Recommendations
Before relying on framework-specific behavior, check the version in package.json and verify against current documentation.

### 10. Report Honestly
If a source is unavailable or a concept is not yet researched, state that clearly. Do not fabricate compliance scores or research completion.

---

## Quick Reference

| Task Type | Read These First |
|-----------|-----------------|
| New feature | Architecture index → DDD → React → Testing |
| Bug fix | Testing → TypeScript → Architecture |
| Refactoring | Core principles → TypeScript → Architecture |
| Performance | Vite optimization → React performance → CSS performance |
| Security | Security principles → TypeScript security → OWASP |
| Deployment | Docker Nginx → CI/CD → Vite optimization |
| Code review | Core principles → Coding practices → TypeScript |

---

## Important Distinctions

- Atomic Design is UI composition; ACID atomicity is a transaction property
- Clean Architecture and clean code are distinct concepts
- Dependency Inversion and Dependency Injection differ
- Command-Query Separation and CQRS differ
- Event-Driven Architecture does not require Event Sourcing
- CQRS does not require separate databases
- DDD does not require microservices
- REST is more than HTTP CRUD endpoints
- Static TypeScript types do not validate runtime inputs
- DRY targets duplicated knowledge rather than every repeated-looking expression
- Singleton can introduce hidden global state
- Saga compensation is not equivalent to database rollback
- Outbox alone does not guarantee exactly-once delivery
- Database consistency and distributed consistency have different meanings
- ORM entities are not automatically domain entities
- Folder structure and suffixes alone do not prove compliance
- Coverage percentages alone do not prove correctness

---

## Evidence Model

Track these independently:

- **Declared**: present in a manifest or configuration
- **Implemented**: confirmed in referenced scripts or source
- **Wired**: connected to the intended command, hook, or workflow
- **Executed**: actually run during investigation
- **Verified**: specific expected behavior demonstrated

For each, distinguish:
- Confirmed
- Partial
- Not assessed
- Not found
- Blocked
- Not applicable

---

## Limitations

- This knowledge base is a reference, not a training mechanism.
- Creating vault files does not permanently train the model.
- Not all notes are loaded into context automatically.
- Retrieval depends on the active context window.
- Do not claim that vault files guarantee retrieval by any extension.
- Subagents have their own context limits — complex tasks may need to be broken down.
- AI suggestions should always be verified against actual project constraints.
- Tool outputs are authoritative — trust terminal results over AI predictions.
- Creating a reference note does not prove that the project implements the concept.
- External documentation cannot prove that a local integration is implemented or wired correctly.
- A dependency declaration does not prove usage.
- A command name does not prove behavior.
- An installed tool does not prove enforcement.

---

## Tool Integration Guide

### VS Code Extensions to Use

| Extension | Purpose | When to Use |
|-----------|---------|-------------|
| **ESLint** | Linting, code quality | Always enabled, auto-fix on save |
| **Prettier** | Code formatting | Always enabled, format on save |
| **TypeScript Hero** | Type inference, imports | When adding types, managing imports |
| **Error Lens** | Inline error display | Always enabled for faster debugging |
| **GitLens** | Git blame, history | When reviewing code changes |
| **REST Client** | API testing | When testing API endpoints |
| **Tailwind CSS IntelliSense** | Tailwind autocomplete | When writing Tailwind classes |
| **Import Cost** | Bundle size awareness | When adding imports |

### Recommended VS Code Settings

```json
{
  "editor.codeActionsOnSave": {
    "source.organizeImports": "explicit",
    "source.fixAll.eslint": "explicit"
  },
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "typescript.tsdk": "node_modules/typescript/lib",
  "typescript.updateImportsOnFileMove.enabled": "always",
  "editor.inlayHints.enabled": "on",
  "editor.stickyScroll.enabled": true,
  "editor.minimap.enabled": false,
  "workbench.editor.enablePreview": false,
  "workbench.editor.enablePreviewFromQuickOpen": false,
  "files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/node_modules/**": true,
    "**/.obsidian-vault/**": true
  }
}
```

### Terminal Commands Reference

#### Development
```bash
# Start development server
pnpm dev

# Build for production
pnpm build

# Preview production build
pnpm preview

# Type checking
pnpm tsc --noEmit
```

#### Testing
```bash
# Run all tests
pnpm test

# Run tests with coverage
pnpm test -- --coverage

# Run tests in watch mode
pnpm test -- --watch

# Run E2E tests
pnpm test:e2e

# Run E2E tests in UI mode
pnpm test:e2e --ui
```

#### Linting & Formatting
```bash
# Run ESLint
pnpm lint

# Auto-fix ESLint issues
pnpm lint:fix

# Run Prettier
pnpm format

# Auto-fix Prettier issues
pnpm format:fix
```

#### Dependencies
```bash
# Add a package
pnpm add <package>

# Add a dev dependency
pnpm add -D <package>

# Remove a package
pnpm remove <package>

# Audit dependencies
pnpm audit

# Update dependencies
pnpm update
```

#### Git
```bash
# Create a conventional commit
git commit -m "feat(scope): description"

# Check commit message format
pnpm lint:commit

# Run husky hooks manually
pnpm run prepare

# View commit history
git log --oneline --graph
```

---

## Agent Workflow Definitions

### When to Use Subagents

| Task | Use Subagent? | Reason |
|------|--------------|--------|
| Single file edit | No | Direct edit is faster |
| Multi-file refactoring | Yes | Subagent can search and modify across files |
| Architecture validation | Yes | Subagent can read multiple notes and validate |
| Code review | Yes | Subagent can run checklist systematically |
| Creating tests | Yes | Subagent can analyze code and generate tests |
| Documentation update | No | Direct edit is sufficient |
| Debugging complex issues | Yes | Subagent can search logs, code, and configs |

### Agent Roles

#### Architecture Validation Agent
**When to invoke:** Before implementing any architectural change
**Responsibilities:**
1. Read relevant ADRs
2. Read relevant pattern notes (clean-architecture, ddd-patterns, cqrs-pattern)
3. Validate proposed changes against patterns
4. Flag violations with specific line numbers
5. Suggest corrections

**Process:**
```
1. Read ADRs in .obsidian-vault/specs/Architecture/
2. Read relevant pattern notes
3. Analyze proposed changes
4. Check against each pattern rule
5. Report violations
6. Suggest corrections
```

#### Code Review Agent
**When to invoke:** Before approving any PR
**Responsibilities:**
1. Run code review checklist
2. Check for security vulnerabilities
3. Check for performance issues
4. Check for test coverage
5. Check for architecture compliance
6. Report findings

**Process:**
```
1. Read code-review-checklist.md
2. Run automated checks (lint, test, build)
3. Review code changes
4. Check against each checklist item
5. Report findings with line numbers
6. Suggest improvements
```

#### Testing Agent
**When to invoke:** When adding new features or fixing bugs
**Responsibilities:**
1. Analyze code changes
2. Identify testable units
3. Generate unit tests
4. Generate integration tests
5. Identify E2E test scenarios
6. Verify test coverage

**Process:**
```
1. Read testing notes
2. Analyze code changes
3. Identify edge cases
4. Generate test cases
5. Write test code
6. Verify coverage
```

#### Security Review Agent
**When to invoke:** When handling authentication, authorization, or user data
**Responsibilities:**
1. Check for OWASP Top 10 vulnerabilities
2. Verify input validation
3. Check for SQL injection
4. Check for XSS
5. Verify authentication/authorization
6. Check for secure error handling

**Process:**
```
1. Read security notes
2. Analyze code for vulnerabilities
3. Check against OWASP Top 10
4. Verify security controls
5. Report findings
6. Suggest fixes
```

#### Performance Review Agent
**When to invoke:** When optimizing or when performance issues are reported
**Responsibilities:**
1. Analyze database queries
2. Check for N+1 queries
3. Verify caching strategy
4. Check bundle size
5. Check for memory leaks
6. Suggest optimizations

**Process:**
```
1. Read performance notes
2. Analyze code for bottlenecks
3. Check database queries
4. Verify caching
5. Check bundle size
6. Suggest optimizations
```

---

## Symbolic AI Offloading Guide

### When to Use AI (Copilot)

| Task | Use AI | Reason |
|------|--------|--------|
| Code generation | ✅ Yes | AI excels at pattern matching and code synthesis |
| Code refactoring | ✅ Yes | AI can understand context and apply patterns |
| Explaining code | ✅ Yes | AI can summarize and explain complex logic |
| Writing tests | ✅ Yes | AI can identify edge cases and generate test code |
| Documentation | ✅ Yes | AI can generate clear, structured documentation |
| Architecture decisions | ⚠️ Partial | AI can suggest options, but human should decide |
| Security review | ⚠️ Partial | AI can flag issues, but human should verify |
| Performance optimization | ⚠️ Partial | AI can suggest, but benchmarks should verify |

### When to Use Tools (Terminal)

| Task | Use Tools | Reason |
|------|-----------|--------|
| Building code | ✅ Yes | Tools are deterministic and reliable |
| Running tests | ✅ Yes | Tools provide accurate pass/fail results |
| Linting/Formatting | ✅ Yes | Tools are automated and consistent |
| Git operations | ✅ Yes | Tools are the source of truth |
| Installing dependencies | ✅ Yes | Tools manage the package graph |
| Database migrations | ✅ Yes | Tools are deterministic |
| Deploying | ✅ Yes | Tools handle infrastructure |
| Monitoring | ✅ Yes | Tools provide real-time data |

### When to Use Subagents

| Task | Use Subagent | Reason |
|------|-------------|--------|
| Multi-file refactoring | ✅ Yes | Subagent can search and modify across files |
| Architecture validation | ✅ Yes | Subagent can read multiple notes and validate |
| Code review | ✅ Yes | Subagent can run checklist systematically |
| Creating tests | ✅ Yes | Subagent can analyze code and generate tests |
| Debugging complex issues | ✅ Yes | Subagent can search logs, code, and configs |
| Documentation updates | ⚠️ Optional | Direct edit is usually sufficient |
| Simple file edits | ❌ No | Direct edit is faster |

### When to Use Human Judgment

| Task | Use Human | Reason |
|------|-----------|--------|
| Architecture decisions | ✅ Yes | Requires business context and trade-off analysis |
| Security approvals | ✅ Yes | AI can flag, but human must verify |
| Performance benchmarks | ✅ Yes | AI can suggest, but human must validate |
| User experience decisions | ✅ Yes | Requires empathy and user understanding |
| Team coordination | ✅ Yes | Requires communication and negotiation |
| Production deployments | ✅ Yes | Requires accountability and oversight |

---

## Copilot Instructions Embedded in Notes

### How to Read Enhanced Notes

Each note may now include these additional sections:

1. **Copilot Instructions** — When to read this note, what to do with the information
2. **Tools to Use** — VS Code extensions, npm packages, CLI commands
3. **Agents to Invoke** — Which subagent to use for validation
4. **Integration with Other Notes** — Which other notes to read
5. **Common Pitfalls** — What to avoid

### Example Enhanced Note Structure

```
---
slug: example-enhanced-note
# ... existing fields ...
---

# Example Enhanced Note

## ... existing content ...

## Copilot Instructions

### When to Read This Note
- Creating a new feature with read/write separation
- Refactoring a monolithic service into read/write models
- Performance issues with mixed read/write operations
- Code review: checking for CQRS violations

### What to Do With This Information
1. Identify commands (state-changing operations) and queries (read operations)
2. Create separate handler classes for each
3. Use separate DTOs for read models vs write models
4. Validate that queries don't modify state

### Tools to Use
- **VS Code Extension**: ESLint with `@typescript-eslint` for type safety
- **npm Package**: `@nestjs/cqrs` for NestJS CQRS implementation
- **CLI Command**: `pnpm add @nestjs/cqrs`
- **VS Code Setting**: `"editor.codeActionsOnSave": { "source.organizeImports": true }`

### Agents to Invoke
- **Architecture Validation Agent**: Run when creating new CQRS handlers
- **Code Review Agent**: Run when reviewing CQRS-related PRs

### Integration with Other Notes
- Read [clean-architecture](D/clean-architecture.md) for the overall architectural context
- Read [event-driven-architecture](D/event-driven-architecture.md) for event publishing patterns
- Read [transactional-outbox](D/transactional-outbox.md) for reliable event publishing
- Read [api-versioning](D/api-versioning.md) for versioning CQRS endpoints

### Common Pitfalls
- Don't use CQRS for simple CRUD (see [modular-monolith](D/modular-monolith.md))
- Don't forget eventual consistency (see [event-driven-architecture](D/event-driven-architecture.md))
- Don't mix read/write logic in the same handler
```

## See Also
- [[playwright-e2e]]
- [[_template-spec]]


