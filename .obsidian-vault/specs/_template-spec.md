---
title: 
date: 
status: draft
author: 
related_adr: 
category: 
---

# Spec: {{title}}

> **Purpose:** Define the requirements, scope, and implementation plan for a feature or change.
> **When to Use:** Before starting any non-trivial feature, refactoring, or architectural change.
> **Copilot Instructions:** When the user describes a feature or change, help them fill out this template. Use it as the source of truth for implementation.

## Goal

<!-- What should this feature or change achieve? Be specific and measurable. -->

**Problem Statement:**
<!-- What problem are we solving? -->

**Expected Outcome:**
<!-- What does success look like? Include metrics if possible. -->

**Success Criteria:**
- [ ] Metric 1: <value>
- [ ] Metric 2: <value>
- [ ] Metric 3: <value>

## Acceptance Criteria

<!-- What must be true for this spec to be considered complete? -->

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Out of Scope

<!-- What is explicitly NOT covered by this spec? -->

## Architectural Context

<!-- Which architectural patterns apply? Reference ADRs and relevant notes. -->

**Referenced ADRs:**
- ADR-XXX: [Title] — [How this spec relates]

**Patterns to Apply:**
- [ ] Clean Architecture
- [ ] DDD
- [ ] CQRS
- [ ] Event-Driven
- [ ] Repository Pattern
- [ ] Service Layer Pattern

**Related Concept Notes:**
- [clean-architecture](D/clean-architecture.md)
- [ddd-patterns](D/ddd-patterns.md)
- [cqrs-pattern](D/cqrs-pattern.md)
- Add more as needed...

## Implementation Plan

<!-- Step-by-step implementation plan. -->

### Phase 1: Foundation
1. [ ] Step 1
2. [ ] Step 2
3. [ ] Step 3

### Phase 2: Core Feature
1. [ ] Step 1
2. [ ] Step 2
3. [ ] Step 3

### Phase 3: Testing & Polish
1. [ ] Step 1
2. [ ] Step 2
3. [ ] Step 3

## Technical Details

<!-- Specific technical decisions, code examples, file structure. -->

### File Structure
```
src/
├── feature/
│   ├── feature.controller.ts
│   ├── feature.service.ts
│   ├── feature.repository.ts
│   └── feature.test.ts
```

### Code Examples
<!-- Key code patterns or implementations -->

```typescript
// Example implementation
export class FeatureService {
  async execute(params: FeatureParams): Promise<FeatureResult> {
    // Implementation
  }
}
```

### API Endpoints
<!-- If applicable, define API endpoints -->

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/v1/feature` | List features |
| `POST` | `/api/v1/feature` | Create feature |
| `GET` | `/api/v1/feature/:id` | Get feature |
| `PUT` | `/api/v1/feature/:id` | Update feature |
| `DELETE` | `/api/v1/feature/:id` | Delete feature |

### Database Schema
<!-- If applicable, define database changes -->

```sql
CREATE TABLE feature (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

## Testing Strategy

<!-- How will this be tested? -->

### Unit Tests
- [ ] Test feature creation
- [ ] Test feature validation
- [ ] Test error handling

### Integration Tests
- [ ] Test API endpoints
- [ ] Test database operations
- [ ] Test external service integration

### E2E Tests
- [ ] Test user flow
- [ ] Test edge cases

### Test Commands
```bash
# Run unit tests
pnpm test

# Run with coverage
pnpm test -- --coverage

# Run integration tests
pnpm test:integration

# Run E2E tests
pnpm test:e2e
```

## Tools & Dependencies

<!-- What tools, packages, or extensions are needed? -->

### npm Packages
```bash
pnpm add <package-name>
```

### VS Code Extensions
- [Extension Name](extension-marketplace-link) — Purpose

### VS Code Settings
```json
{
  "setting.name": "value"
}
```

### CLI Commands
```bash
# Setup command
command --setup

# Run command
command --run

# Test command
command --test
```

## Security Considerations

<!-- What security implications does this have? -->

- [ ] Input validation required
- [ ] Authentication/authorization needed
- [ ] Rate limiting required
- [ ] Data encryption needed
- [ ] Audit logging required

## Performance Considerations

<!-- What performance implications does this have? -->

- [ ] Database query optimization needed
- [ ] Caching strategy required
- [ ] Pagination needed
- [ ] Bundle size impact
- [ ] Memory usage impact

## Deployment Notes

<!-- Any special deployment considerations? -->

### Environment Variables
```bash
FEATURE_ENABLED=true
FEATURE_API_KEY=your-key-here
```

### Database Migrations
- [ ] Migration required
- [ ] Migration is reversible
- [ ] Migration tested

### Breaking Changes
- [ ] No breaking changes
- [ ] Breaking changes: [Describe]
- [ ] Migration guide: [Link]

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Risk 1 | High | Mitigation 1 |
| Risk 2 | Medium | Mitigation 2 |

## Timeline

| Phase | Estimated Duration | Status |
|-------|-------------------|--------|
| Phase 1: Foundation | X days | Not Started |
| Phase 2: Core Feature | X days | Not Started |
| Phase 3: Testing & Polish | X days | Not Started |

## Review Checklist

- [ ] Goal is clear and measurable
- [ ] Acceptance criteria are specific
- [ ] Out of scope is defined
- [ ] Architectural patterns identified
- [ ] Implementation plan is detailed
- [ ] Testing strategy is comprehensive
- [ ] Security considerations addressed
- [ ] Performance considerations addressed
- [ ] Deployment notes are complete
- [ ] Risks are identified and mitigated
- [ ] Related ADRs are referenced
- [ ] Copilot instructions are embedded

---

*Spec Version: 1.0*
*Last Updated: {{date}}*
*Author: {{author}}*