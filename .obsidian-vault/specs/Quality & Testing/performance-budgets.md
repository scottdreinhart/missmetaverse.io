---
slug: performance-budgets
tags:
  - core-concepts

  - quality   - testing   - best-practices
---

# Performance Budgets

> **Purpose:** Set and enforce performance targets.
> **Last Updated:** 2026-11-03

## concept_id
`testing-performance-budgets`

## title
Performance Budgets

## aliases
- Performance Budgets
- Performance Targets
- Performance Limits

## category
quality-delivery

## concept_type
development-practice

## research_status
verified

## project_adoption
declared

## applicability
- Web applications
- Mobile applications
- Performance monitoring
- User experience

## tags
- type/practice
- domain/performance
- status/verified
- priority/high

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-observability
- testing-slo
- testing-architecture-fitness
- arch-quality-gate

## Definition

Performance Budgets are predefined limits on performance metrics (bundle size, load time, etc.) that must not be exceeded. They ensure performance remains acceptable as the application grows.

## Problem Addressed

Without performance budgets:
- Performance degrades over time
- Bundle size grows uncontrollably
- Load times increase
- User experience suffers

## Scope and Boundaries

Performance budgets apply to:
- Web applications
- Mobile applications
- Performance monitoring
- User experience

Performance budgets do not apply to:
- Backend performance
- Database performance
- Network performance
- Infrastructure performance

## When to Apply

- Building web applications
- Monitoring performance
- Setting targets
- Enforcing limits

## Tradeoffs and When to Avoid

- **Over-constraining**: Too strict budgets restrict functionality
- **Not for backend**: Backend performance is different
- **Not for database**: Database performance is different
- **Not for network**: Network performance is different

## Implementation Guidance

1. **Define metrics**: Define performance metrics
2. **Set budgets**: Set acceptable limits
3. **Monitor**: Monitor performance continuously
4. **Enforce**: Fail builds when budgets are exceeded
5. **Review**: Review budgets regularly

## Verification

- [ ] Metrics are defined
- [ ] Budgets are set
- [ ] Performance is monitored
- [ ] Builds fail when budgets are exceeded
- [ ] Budgets are reviewed

## Common Misuses

- **Not defining metrics**: Not defining performance metrics
- **Not setting budgets**: Not setting limits
- **Not monitoring**: Not monitoring performance
- **Not enforcing**: Not enforcing budgets

## Related Concepts

- [[Quality & Testing/observability]] â€” Observability
- [[Quality & Testing/service-level-objectives]] â€” Service-Level Objectives
- [[Quality & Testing/architecture-fitness-functions]] â€” Architecture Fitness Functions

## Project Observations

The project follows performance budgets through:
- Bundle size limits
- Load time targets
- Performance monitoring
- Build enforcement

## Sources

- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Test Driven Development]]
- [[Sources/goF-1994.md|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Performance Budgets Note**
