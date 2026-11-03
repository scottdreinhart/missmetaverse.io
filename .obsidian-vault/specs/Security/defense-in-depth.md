---
slug: defense-in-depth
---

# Defense in Depth

> **Purpose:** Secure apps with Defense in Depth.
> **Last Updated:** 2026-11-03

## concept_id
`defense-in-depth`

## title
Defense in Depth

## aliases
- Defense in Depth
- Layered Security
- Multiple Layers
- Security Layers

## category
security

## concept_type
security-principle

## research_status
verified

## project_adoption
declared

## applicability
- Layered security
- Multiple defense layers
- Securityçºµæ·±
- Risk mitigation

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- security-principles
- martinfowler-patterns

## related_concept_ids
- defense-in-depth
- layered-security
- multiple-layers
- security-layers

## Definition

Defense in Depth is a security strategy that uses multiple layers of defense to protect assets, ensuring that if one layer fails, others still provide protection.

## Problem Addressed

Without Defense in Depth:
- Single point of failure
- Security is fragile
- Breaches are easier
- Risk is concentrated

## Scope of Boundaries

Defense in Depth applies to:
- Layered security
- Multiple defense layers
- Securityçºµæ·±
- Risk mitigation

Defense in Depth does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building secure apps
- Needing layered security
- Wanting risk mitigation
- Protecting assets

## Tradeoffs and When to Avoid

- **Complexity**: Defense in Depth adds complexity
- **Not for simple apps**: Simple apps may not need Defense in Depth
- **Not for internal**: Internal apps may not need Defense in Depth
- **Not for all**: Not all apps need Defense in Depth

## Implementation Guidance

1. **Identify assets**: Identify critical assets
2. **Define layers**: Define defense layers
3. **Implement**: Implement controls
4. **Test**: Test defenses
5. **Monitor**: Monitor security

## Verification

- [ ] Assets identified
- [ ] Layers defined
- [ ] Controls implemented
- [ ] Defenses tested
- [ ] Security monitored

## Common Misuses

- **Not identifying**: Not identifying assets
- **Not defining**: Not defining layers
- **Not implementing**: Not implementing controls
- **Not testing**: Not testing defenses

## Related Concepts

- [[Security/defense-in-depth]] â€” Defense in Depth
- [[Security/defense-in-depth]] â€” Layered Security
- [[Security/defense-in-depth]] â€” Multiple Layers
- [[Security/defense-in-depth]] â€” Security Layers

## Project Observations

The project uses Defense in Depth through:
- Asset identification
- Layer definition
- Control implementation
- Defense testing

## Sources

- [[Sources/security-principles|Security Principles]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Defense in Depth Note**
