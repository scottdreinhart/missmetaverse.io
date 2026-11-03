# Secrets Management

> **Purpose:** Manage secrets with Secrets Management.
> **Last Updated:** 2026-11-03

---

## concept_id
`secrets-management`

## title
Secrets Management

## aliases
- Secrets Management
- Secret Rotation
- Key Management
- Credential Management

## category
security

## concept_type
security-practice

## research_status
verified

## project_adoption
declared

## applicability
- Secret storage
- Key management
- Credential rotation
- Access control

## tags
- type/practice
- domain/security
- status/verified
- priority/high

## source_ids
- secrets-management-guide
- martinfowler-patterns

## related_concept_ids
- secrets-management
- secret-rotation
- key-management
- credential-management

---

## Definition

Secrets Management is the practice of securely storing, rotating, and accessing sensitive information like API keys, passwords, and certificates.

## Problem Addressed

Without Secrets Management:
- Secrets are exposed
- Credentials are insecure
- Compliance is at risk
- Breaches occur

## Scope of Boundaries

Secrets Management applies to:
- Secret storage
- Key management
- Credential rotation
- Access control

Secrets Management does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing secret storage
- Managing credentials
- Rotating keys

## Tradeoffs and When to Avoid

- **Complexity**: Secrets Management adds complexity
- **Not for simple apps**: Simple apps may not need Secrets Management
- **Not for internal**: Internal apps may not need Secrets Management
- **Not for all**: Not all apps need Secrets Management

## Implementation Guidance

1. **Choose vault**: Choose secrets vault
2. **Store secrets**: Store secrets securely
3. **Rotate**: Rotate secrets regularly
4. **Access**: Control access
5. **Audit**: Audit access

## Verification

- [ ] Vault chosen
- [ ] Secrets stored
- [ ] Rotation configured
- [ ] Access controlled
- [ ] Access audited

## Common Misuses

- **Not choosing**: Not choosing a vault
- **Not storing**: Not storing secrets
- **Not rotating**: Not rotating secrets
- **Not controlling**: Not controlling access

## Related Concepts

- [[Security/secrets-management]] — Secrets Management
- [[Security/secret-rotation]] — Secret Rotation
- [[Security/key-management]] — Key Management
- [[Security/credential-management]] — Credential Management

## Project Observations

The project uses Secrets Management through:
- Vault selection
- Secret storage
- Secret rotation
- Access control

## Sources

- [[Sources/secrets-management-guide|Secrets Management Guide]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Secrets Management Note**
