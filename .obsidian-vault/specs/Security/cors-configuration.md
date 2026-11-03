---
slug: cors-configuration
tags:
  - security   - authentication   - best-practices
---

# CORS Configuration

> **Purpose:** Configure Cross-Origin Resource Sharing.
> **Last Updated:** 2026-11-03

## concept_id
`cors-configuration`

## title
CORS Configuration

## aliases
- CORS
- Cross-Origin Resource Sharing
- CORS Policy
- CORS Headers

## category
security

## concept_type
security-concept

## research_status
verified

## project_adoption
declared

## applicability
- Cross-origin requests
- API security
- Browser security
- Domain restrictions

## tags
- type/concept
- domain/security
- status/verified
- priority/high

## source_ids
- mdn-cors
- martinfowler-patterns

## related_concept_ids
- cors-configuration
- security-headers
- same-origin-policy
- api-security

## Definition

CORS Configuration is the setup of Cross-Origin Resource Sharing headers to control which domains can access resources on a server.

## Problem Addressed

Without CORS:
- Cross-origin requests are blocked
- APIs are inaccessible from browsers
- Security is weak
- Domain restrictions are impossible

## Scope of Boundaries

CORS applies to:
- Cross-origin requests
- API security
- Browser security
- Domain restrictions

CORS does not apply to:
- Backend logic
- Database design
- Authentication
- Authorization

## When to Apply

- Deploying APIs accessed from browsers
- Needing cross-origin access
- Restricting domains
- Securing APIs

## Tradeoffs and When to Avoid

- **Security risk**: Overly permissive CORS is risky
- **Not for APIs only**: CORS is for browser access
- **Not for server-to-server**: Server-to-server doesn't need CORS
- **Not for mobile**: Mobile apps don't need CORS

## Implementation Guidance

1. **Configure origins**: Configure allowed origins
2. **Configure methods**: Configure allowed HTTP methods
3. **Configure headers**: Configure allowed headers
4. **Add credentials**: Add credentials support if needed
5. **Test CORS**: Test CORS configuration

## Verification

- [ ] Origins configured
- [ ] Methods configured
- [ ] Headers configured
- [ ] Credentials added
- [ ] CORS tested

## Common Misuses

- **Wildcard origin**: Using wildcard (*) origin
- **Not testing**: Not testing CORS configuration
- **Overly permissive**: Allowing too many origins
- **Not updating**: Not updating CORS as app evolves

## Related Concepts

- [[Security/cors-configuration]] â€” CORS Configuration
- [[Security/security-headers]] â€” Security Headers
- [[Security/cors-configuration]] â€” Same Origin Policy
- [[Security/web-security]] â€” API Security

## Project Observations

The project uses CORS Configuration through:
- Allowed origin configuration
- HTTP method restrictions
- Header configuration
- Credentials support

## Sources

- [[Sources/mdn-cors|MDN CORS Documentation]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of CORS Configuration Note**
