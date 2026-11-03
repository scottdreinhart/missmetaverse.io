# Data Minimization

> **Purpose:** Minimize data with Data Minimization.
> **Last Updated:** 2026-11-03

---

## concept_id
`data-minimization`

## title
Data Minimization

## aliases
- Data Minimization
- Minimal Data Collection
- Data Retention
- Privacy by Design

## category
security

## concept_type
security-principle

## research_status
verified

## project_adoption
declared

## applicability
- Data collection
- Privacy compliance
- Data retention
- GDPR compliance

## tags
- type/principle
- domain/security
- status/verified
- priority/high

## source_ids
- privacy-principles
- martinfowler-patterns

## related_concept_ids
- data-minimization
- minimal-data-collection
- data-retention
- privacy-by-design

---

## Definition

Data Minimization is the principle of collecting and retaining only the data that is strictly necessary for the intended purpose.

## Problem Addressed

Without Data Minimization:
- Too much data is collected
- Privacy is at risk
- Compliance is at risk
- Breach impact is larger

## Scope of Boundaries

Data Minimization applies to:
- Data collection
- Privacy compliance
- Data retention
- GDPR compliance

Data Minimization does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing privacy compliance
- Collecting data
- Retaining data

## Tradeoffs and When to Avoid

- **Complexity**: Data Minimization adds complexity
- **Not for simple apps**: Simple apps may not need Data Minimization
- **Not for internal**: Internal apps may not need Data Minimization
- **Not for all**: Not all apps need Data Minimization

## Implementation Guidance

1. **Identify data**: Identify necessary data
2. **Collect minimal**: Collect only necessary data
3. **Set retention**: Set retention policies
4. **Delete**: Delete when done
5. **Audit**: Audit data

## Verification

- [ ] Data identified
- [ ] Minimal collection
- [ ] Retention set
- [ ] Data deleted
- [ ] Data audited

## Common Misuses

- **Not identifying**: Not identifying data
- **Not collecting**: Not collecting minimally
- **Not setting**: Not setting retention
- **Not deleting**: Not deleting data

## Related Concepts

- [[Security/data-minimization]] — Data Minimization
- [[Security/minimal-data-collection]] — Minimal Data Collection
- [[Security/data-retention]] — Data Retention
- [[Security/privacy-by-design]] — Privacy by Design

## Project Observations

The project uses Data Minimization through:
- Data identification
- Minimal collection
- Retention setting
- Data deletion

## Sources

- [[Sources/privacy-principles|Privacy Principles]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Data Minimization Note**
