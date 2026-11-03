---
slug: abac
tags:
  - security   - authentication   - authorization

  - security   - authentication   - best-practices
---

# ABAC

> **Purpose:** Manage access with ABAC.
> **Last Updated:** 2026-11-03

## concept_id
`abac`

## title
Attribute-Based Access Control

## aliases
- ABAC
- Attribute-Based Access Control
- Attribute Management
- Context-Aware Access

## category
security

## concept_type
security-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Attribute management
- Context-aware access
- Fine-grained access control
- Dynamic authorization

## tags
- type/pattern
- domain/security
- status/verified
- priority/high

## source_ids
- abac-standard
- martinfowler-patterns

## related_concept_ids
- abac
- attribute-based-access-control
- attribute-management
- context-aware-access

## Definition

Attribute-Based Access Control (ABAC) is an access control pattern where access decisions are based on attributes of users, resources, and environment.

## Problem Addressed

Without ABAC:
- Access is coarse
- Context is ignored
- Authorization is rigid
- Flexibility is limited

## Scope of Boundaries

ABAC applies to:
- Attribute management
- Context-aware access
- Fine-grained access control
- Dynamic authorization

ABAC does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing fine-grained access
- Wanting context-aware access
- Dynamic authorization needs

## Tradeoffs and When to Avoid

- **Complexity**: ABAC adds complexity
- **Not for simple apps**: Simple apps may not need ABAC
- **Not for internal**: Internal apps may not need ABAC
- **Not for all**: Not all apps need ABAC

## Implementation Guidance

1. **Define attributes**: Define attribute types
2. **Create policies**: Create access policies
3. **Implement**: Implement ABAC
4. **Test**: Test access
5. **Monitor**: Monitor access

## Verification

- [ ] Attributes defined
- [ ] Policies created
- [ ] ABAC implemented
- [ ] Access tested
- [ ] Access monitored

## Common Misuses

- **Not defining**: Not defining attributes
- **Not creating**: Not creating policies
- **Not implementing**: Not implementing ABAC
- **Not testing**: Not testing access

## Related Concepts

- [[Security/abac]] â€” ABAC
- [[Security/abac]] â€” Attribute-Based Access Control
- [[Security/abac]] â€” Attribute Management
- [[Security/abac]] â€” Context-Aware Access

## Project Observations

The project uses ABAC through:
- Attribute definition
- Policy creation
- ABAC implementation
- Access testing

## Sources

- [[Sources/abac-standard|ABAC Standard]]
- [[Sources/martinfowler-bliki.md|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of ABAC Note**
