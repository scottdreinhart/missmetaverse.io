---
slug: threat-modeling
---

# Threat Modeling

> **Purpose:** Analyze threats with Threat Modeling.
> **Last Updated:** 2026-11-03

## concept_id
`threat-modeling`

## title
Threat Modeling

## aliases
- Threat Modeling
- Security Threat Analysis
- STRIDE
- Attack Trees

## category
security

## concept_type
security-practice

## research_status
verified

## project_adoption
declared

## applicability
- Security analysis
- Threat identification
- Risk assessment
- Design review

## tags
- type/practice
- domain/security
- status/verified
- priority/high

## source_ids
- threat-modeling-guide
- martinfowler-patterns

## related_concept_ids
- threat-modeling
- security-threat-analysis
- stride
- attack-trees

## Definition

Threat Modeling is the practice of identifying, understanding, and prioritizing security threats to systems through systematic analysis.

## Problem Addressed

Without Threat Modeling:
- Threats are unknown
- Risks are unmanaged
- Security is reactive
- Design is vulnerable

## Scope of Boundaries

Threat Modeling applies to:
- Security analysis
- Threat identification
- Risk assessment
- Design review

Threat Modeling does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Designing systems
- Needing security analysis
- Identifying threats
- Assessing risks

## Tradeoffs and When to Avoid

- **Complexity**: Threat Modeling adds complexity
- **Not for simple apps**: Simple apps may not need Threat Modeling
- **Not for internal**: Internal apps may not need Threat Modeling
- **Not for all**: Not all apps need Threat Modeling

## Implementation Guidance

1. **Choose framework**: Choose threat modeling framework
2. **Identify assets**: Identify critical assets
3. **Identify threats**: Identify potential threats
4. **Assess risks**: Assess risk levels
5. **Mitigate**: Implement mitigations

## Verification

- [ ] Framework chosen
- [ ] Assets identified
- [ ] Threats identified
- [ ] Risks assessed
- [ ] Mitigations implemented

## Common Misuses

- **Not choosing**: Not choosing a framework
- **Not identifying**: Not identifying assets
- **Not identifying**: Not identifying threats
- **Not assessing**: Not assessing risks

## Related Concepts

- [[Security/threat-modeling]] â€” Threat Modeling
- [[Security/threat-modeling]] â€” Security Threat Analysis
- [[Security/threat-modeling]] â€” STRIDE
- [[Security/threat-modeling]] â€” Attack Trees

## Project Observations

The project uses Threat Modeling through:
- Framework selection
- Asset identification
- Threat identification
- Risk assessment

## Sources

- [[Sources/threat-modeling-guide|Threat Modeling Guide]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Threat Modeling Note**
