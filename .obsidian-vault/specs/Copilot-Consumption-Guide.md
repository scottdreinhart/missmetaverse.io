# Copilot Consumption Guide

> **Purpose:** Instructions for how GitHub Copilot should use this knowledge base during development.
> **Last Updated:** 2026-11-02

---

## How to Use This Knowledge Base

When given a task, follow these steps:

### 1. Read the Architecture Index
Start with [[00-architecture-index]] to identify the relevant category for the task.

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

## Limitations

- This knowledge base is a reference, not a training mechanism.
- Creating vault files does not permanently train the model.
- Not all notes are loaded into context automatically.
- Retrieval depends on the active context window.
- Do not claim that vault files guarantee retrieval by any extension.
