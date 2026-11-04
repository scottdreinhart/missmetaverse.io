---
slug: adr-template
title: Architecture Decision Record Template
description: Template for recording architectural decisions with context, options considered, consequences, and status tracking.
author: Copilot
source: vault-research
canonical_url: https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions
tags:
  - templates-boilerplate

  - maturity-deprecated

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

## concept_id
adr-template

## title
adr-template

## aliases
- adr-template

## category
template

## concept_type
template

## research_status
verified

## project_adoption
template

### Status
- [ ] **Proposed** â€” Decision under consideration, not yet implemented
- [ ] **Accepted** â€” Decision approved, implementation in progress
- [ ] **Deprecated** â€” Decision no longer recommended, replacement identified
- [ ] **Superseded** â€” Replaced by ADR-XXX (link to new ADR)

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
- Can adopt incrementally â€” no need to refactor existing components
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