---
slug: adr-template
title: Architecture Decision Record Template
description: Template for recording architectural decisions with context, options considered, consequences, and status tracking.
author: Copilot
source: vault-research
canonical_url: https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions
tags:
  - priority/high
  - maturity/deprecated
  - domain/security
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - domain/optimization
  - adr
  - architecture
  - decision-making
  - documentation
  - template
  - governance
created_on: 2026-11-02
updated_on: 2026-11-02
verification_status: verified
claims_supported: 5
access_limitations: None
---

# Architecture Decision Record (ADR) Template

> **Purpose:** Record architectural decisions with full context, options considered, and consequences.
> **When to Use:** Any time a significant architectural choice is made (framework selection, pattern adoption, technology swap).
> **Copilot Instructions:** When Copilot suggests an architectural change, create an ADR before implementing. When reviewing code, check if existing ADRs apply.

---

## ADR-XXX: [Short Title Describing the Decision]

### Status
- [ ] **Proposed** — Decision under consideration, not yet implemented
- [ ] **Accepted** — Decision approved, implementation in progress
- [ ] **Deprecated** — Decision no longer recommended, replacement identified
- [ ] **Superseded** — Replaced by ADR-XXX (link to new ADR)

### Context

> **What is the force that drives this decision?** Describe the situation that requires a decision. Include:
> - Business requirements driving the decision
> - Technical constraints (timeline, budget, team size, existing infrastructure)
> - Stakeholders affected
> - Risks of not making a decision
> - Relevant metrics or data (performance targets, user counts, compliance requirements)

**Example:**
```
We need to choose a state management solution for our React application.
Current state: Using prop drilling with 5+ levels of component nesting.
Business requirement: Application must support 10,000+ concurrent users.
Technical constraint: Team has 2 React developers, 0 Redux experience.
Timeline: 4 weeks to MVP.
```

### Decision

> **What is the choice made?** State the decision clearly and concisely. Include:
> - The chosen option
> - What was rejected (with brief reason)
> - The rationale (why this option was chosen)

**Example:**
```
We will use Zustand for state management.
Rejected: Redux Toolkit (steep learning curve, too much boilerplate for our team)
Rejected: MobX (smaller community, less TypeScript support)
Rejected: React Context (performance issues with 10,000+ users, prop drilling at 5+ levels)
Rationale: Zustand has minimal boilerplate, excellent TypeScript support, small bundle size
(1.5KB vs Redux Toolkit's 16KB), and can be adopted incrementally without refactoring
existing components.
```

### Consequences

> **What becomes easier and more difficult because of this decision?** Be explicit about trade-offs.

**Positive Consequences:**
- [ ] What becomes easier?
- [ ] What capabilities are enabled?
- [ ] What costs are reduced?

**Negative Consequences:**
- [ ] What becomes harder?
- [ ] What new dependencies are introduced?
- [ ] What operational overhead is added?
- [ ] What learning curve exists for the team?

**Example:**
```
Positive:
- New developers can onboard in 1 day vs 1 week (Redux)
- Bundle size reduced by 14.5KB (vs Redux Toolkit)
- Can adopt incrementally — no need to refactor existing components
- Excellent TypeScript inference (no manual type definitions needed)

Negative:
- Smaller community than Redux (fewer Stack Overflow answers, fewer tutorials)
- Less battle-tested at extreme scale (Redux has 50K+ GitHub stars)
- May need to migrate later if state complexity grows beyond our needs
- Team has zero prior experience (requires learning period)
```

### Alternatives Considered

> **What other options were evaluated?** List each alternative with a brief comparison.

| Alternative | Pros | Cons | Why Rejected |
|-------------|------|------|--------------|
| Option A | ... | ... | ... |
| Option B | ... | ... | ... |
| Option C | ... | ... | ... |

### Implementation Notes

> **How should this decision be implemented?** Include:
> - Step-by-step migration plan
> - Code examples or patterns to follow
> - VS Code extensions to use
> - npm packages to install
> - Terminal commands to run
> - Testing strategy

**Example:**
```
## Migration Steps

1. Install Zustand: `pnpm add zustand`
2. Create initial store in `src/stores/useAppStore.ts`
3. Replace prop drilling in one component as proof of concept
4. Run tests: `pnpm test`
5. Gradually migrate remaining components
6. Remove prop drilling patterns
7. Update ESLint config to flag prop drilling: `no-prop-drilling` rule

## VS Code Extensions
- ESLint (for prop-drilling detection)
- TypeScript Hero (for type inference)

## Code Pattern to Follow
\`\`\`typescript
// src/stores/useAppStore.ts
import { create } from 'zustand'

interface AppState {
  count: number
  increment: () => void
  decrement: () => void
}

export const useAppStore = create<AppState>((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  decrement: () => set((state) => ({ count: state.count - 1 })),
}))
\`\`\`

## Testing Strategy
- Unit test: Test store actions in isolation (Vitest)
- Integration test: Test component using store (React Testing Library)
- E2E test: Test user flow with store state (Playwright)
```

### References

> **What external resources informed this decision?** Link to:
> - Documentation URLs
> - Benchmark results
> - Community discussions
> - Related ADRs

- [Zustand Documentation](https://github.com/pmndrs/zustand)
- [Redux Toolkit Documentation](https://redux-toolkit.js.org/)
- [MobX Documentation](https://mobx.js.org/)
- [Bundlephobia Comparison](https://bundlephobia.com/)
- Related: ADR-XXX (if any)

### Review Date

> **When should this decision be reviewed?** Set a date to revisit the decision.

- **Review Date:** 2027-02-02 (90 days from acceptance)
- **Review Trigger:** When any of the following occur:
  - Performance degrades beyond acceptable thresholds
  - Team size grows beyond 5 React developers
  - Concurrent users exceed 50,000
  - A significantly better alternative emerges

---

## How Copilot Should Use This Template

### When Creating an ADR
1. **Detect architectural decisions**: When you suggest a framework, pattern, or technology choice, ask the user if an ADR should be created
2. **Gather context**: Ask clarifying questions about business requirements, constraints, and stakeholders
3. **Evaluate alternatives**: Research at least 3 alternatives before recommending one
4. **Document consequences**: Be explicit about both positive and negative consequences
5. **Include implementation details**: Provide code examples, terminal commands, and VS Code settings
6. **Set review date**: Always set a 90-day review date for new ADRs

### When Reviewing Code
1. **Check existing ADRs**: Before suggesting changes, check if an existing ADR applies
2. **Flag ADR violations**: If code violates an accepted ADR, flag it in code review
3. **Suggest new ADRs**: If a new architectural pattern is needed, suggest creating an ADR
4. **Update ADRs**: If implementation differs from the ADR, suggest updating the ADR

### When Refactoring
1. **Reference ADRs**: When refactoring, check if existing ADRs define the target architecture
2. **Create superseding ADRs**: When replacing a previous decision, create a new ADR that supersedes the old one
3. **Document migration**: Include step-by-step migration plan in the new ADR

---

## Quick Reference

| Question | Where to Find Answer |
|----------|---------------------|
| Why did we choose X? | Context section |
| What was rejected? | Alternatives Considered table |
| What are the trade-offs? | Consequences section |
| How do I implement this? | Implementation Notes section |
| What should I read first? | References section |
| Is this decision still valid? | Status field + Review Date |

---

*Template Version: 1.0*
*Last Updated: 2026-11-02*
*Based on: [Documenting Architecture Decisions](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions) — Michael Nygard*

## See Also
- [[code-review-checklist]]
- [[commit-message-template]]
- [[pr-template]]


