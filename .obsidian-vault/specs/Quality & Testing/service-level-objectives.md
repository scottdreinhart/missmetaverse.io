---
slug: service-level-objectives
tags:
  - core-concepts

  - quality-testing-best-practices
---

# Service-Level Objectives

> **Purpose:** Define measurable reliability targets.
> **Last Updated:** 2026-11-03

## concept_id
`testing-slo`

## title
Service-Level Objectives

## aliases
- SLO
- Service-Level Objectives
- SLI
- Service-Level Indicators

## category
quality-delivery

## concept_type
development-practice

## research_status
verified

## project_adoption
declared

## applicability
- Production systems
- SRE practices
- Reliability engineering
- Performance monitoring

## tags
- type/practice
- domain/devops
- status/verified
- priority/high

## source_ids
- martinfowler-bliki
- goF-1994

## related_concept_ids
- testing-observability
- testing-ci
- testing-architecture-fitness
- arch-quality-gate

## Definition

Service-Level Objectives (SLOs) are measurable reliability targets for a service. They define the acceptable level of service quality and help guide engineering decisions.

## Problem Addressed

Without SLOs:
- Reliability targets are unclear
- Engineering decisions are arbitrary
- Trade-offs are not managed
- User experience suffers

## Scope and Boundaries

SLOs apply to:
- Production systems
- SRE practices
- Reliability engineering
- Performance monitoring

SLOs do not apply to:
- Development environment
- Local testing
- Unit testing
- Build systems

## When to Apply

- Deploying to production
- Implementing SRE practices
- Managing reliability
- Making engineering decisions

## Tradeoffs and When to Avoid

- **Over-constraining**: Too strict SLOs restrict flexibility
- **Cost**: Achieving high SLOs costs money
- **Not for development**: Development environment doesn't need SLOs
- **Not for testing**: Testing environment doesn't need SLOs

## Implementation Guidance

1. **Define SLIs**: Define Service-Level Indicators
2. **Set SLOs**: Set measurable targets
3. **Monitor**: Monitor SLIs continuously
4. **Alert**: Set up alerts for SLO violations
5. **Review**: Review SLOs regularly

## Verification

- [ ] SLIs are defined
- [ ] SLOs are set
- [ ] SLIs are monitored
- [ ] Alerts are set up
- [ ] SLOs are reviewed

## Common Misuses

- **Not defining SLIs**: Not defining indicators
- **Not setting SLOs**: Not setting targets
- **Not monitoring**: Not monitoring SLIs
- **Not reviewing**: Not reviewing SLOs

## Related Concepts

- [[Quality & Testing/observability]] â€” Observability
- [[Quality & Testing/continuous-integration]] â€” Continuous Integration
- [[Quality & Testing/architecture-fitness-functions]] â€” Architecture Fitness Functions

## Project Observations

The project follows SLOs through:
- Error tracking with Sentry
- Performance monitoring
- Reliability targets
- Engineering decisions

## Sources

- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Test Driven Development]]
- [[Sources/S005-gof-1994|GoF â€” Design Patterns: Elements of Reusable Object-Oriented Software]]

**End of Service-Level Objectives Note**
