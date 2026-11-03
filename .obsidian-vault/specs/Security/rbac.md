# RBAC

> **Purpose:** Manage access with RBAC.
> **Last Updated:** 2026-11-03

---

## concept_id
`rbac`

## title
Role-Based Access Control

## aliases
- RBAC
- Role-Based Access Control
- Role Management
- Access Control

## category
security

## concept_type
security-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Role management
- Access control
- Permission management
- User authorization

## tags
- type/pattern
- domain/security
- status/verified
- priority/high

## source_ids
- rbac-standard
- martinfowler-patterns

## related_concept_ids
- rbac
- role-based-access-control
- role-management
- access-control

---

## Definition

Role-Based Access Control (RBAC) is an access control pattern where permissions are assigned to roles, and users are assigned to roles.

## Problem Addressed

Without RBAC:
- Access is unmanaged
- Permissions are scattered
- Authorization is difficult
- Compliance is at risk

## Scope of Boundaries

RBAC applies to:
- Role management
- Access control
- Permission management
- User authorization

RBAC does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing access control
- Managing roles
- Authorizing users

## Tradeoffs and When to Avoid

- **Complexity**: RBAC adds complexity
- **Not for simple apps**: Simple apps may not need RBAC
- **Not for internal**: Internal apps may not need RBAC
- **Not for all**: Not all apps need RBAC

## Implementation Guidance

1. **Define roles**: Define application roles
2. **Assign permissions**: Assign permissions to roles
3. **Assign users**: Assign users to roles
4. **Enforce**: Enforce access control
5. **Test**: Test access

## Verification

- [ ] Roles defined
- [ ] Permissions assigned
- [ ] Users assigned
- [ ] Access enforced
- [ ] Access tested

## Common Misuses

- **Not defining**: Not defining roles
- **Not assigning**: Not assigning permissions
- **Not assigning**: Not assigning users
- **Not enforcing**: Not enforcing access

## Related Concepts

- [[Security/rbac]] — RBAC
- [[Security/role-based-access-control]] — Role-Based Access Control
- [[Security/role-management]] — Role Management
- [[Security/access-control]] — Access Control

## Project Observations

The project uses RBAC through:
- Role definition
- Permission assignment
- User assignment
- Access enforcement

## Sources

- [[Sources/rbac-standard|RBAC Standard]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of RBAC Note**
