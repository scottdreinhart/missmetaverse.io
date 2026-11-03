---
slug: health-checks
tags:
  - monitoring   - observability

  - monitoring   - observability   - devops
---

# Health Checks

> **Purpose:** Monitor health with Health Checks.
> **Last Updated:** 2026-11-03

## concept_id
`health-checks`

## title
Health Checks

## aliases
- Health Checks
- Readiness Probes
- Liveness Probes
- Service Health

## category
monitoring

## concept_type
monitoring-concept

## research_status
verified

## project_adoption
declared

## applicability
- Service health
- Readiness probes
- Liveness probes
- Health monitoring

## tags
- type/concept
- domain/monitoring
- status/verified
- priority/high

## source_ids
- health-checks-guide
- martinfowler-patterns

## related_concept_ids
- health-checks
- readiness-probes
- liveness-probes
- service-health

## Definition

Health Checks are endpoints or mechanisms that report the operational status of an application or service, including readiness and liveness probes for orchestration systems.

## Problem Addressed

Without Health Checks:
- Service status is unknown
- Orchestration cannot manage
- Users experience issues
- Recovery is delayed

## Scope of Boundaries

Health Checks applies to:
- Service health
- Readiness probes
- Liveness probes
- Health monitoring

Health Checks does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing health monitoring
- Using orchestration
- Ensuring availability

## Tradeoffs and When to Avoid

- **Complexity**: Health Checks adds complexity
- **Not for simple apps**: Simple apps may not need Health Checks
- **Not for internal**: Internal apps may not need Health Checks
- **Not for all**: Not all apps need Health Checks

## Implementation Guidance

1. **Define endpoints**: Define health check endpoints
2. **Check dependencies**: Check dependencies
3. **Report status**: Report status
4. **Integrate**: Integrate with orchestration
5. **Test**: Test health checks

## Verification

- [ ] Endpoints defined
- [ ] Dependencies checked
- [ ] Status reported
- [ ] Orchestration integrated
- [ ] Health checks tested

## Common Misuses

- **Not defining**: Not defining health check endpoints
- **Not checking**: Not checking dependencies
- **Not reporting**: Not reporting status
- **Not integrating**: Not integrating with orchestration

## Related Concepts

- [[Monitoring/health-checks]] â€” Health Checks
- [[Monitoring/health-checks]] â€” Readiness Probes
- [[Monitoring/health-checks]] â€” Liveness Probes
- [[Monitoring/health-checks]] â€” Service Health

## Project Observations

The project uses Health Checks through:
- Health check endpoint definition
- Dependency checking
- Status reporting
- Orchestration integration

## Sources

- [[Monitoring/health-checks|Health Checks Guide]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Health Checks Note**
