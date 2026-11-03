---
slug: security-headers
---

# Security Headers

> **Purpose:** Protect APIs with Security Headers.
> **Last Updated:** 2026-11-03

## concept_id
`security-headers`

## title
Security Headers

## aliases
- HTTP Security Headers
- Security Headers Best Practices
- CSP
- HSTS

## category
security

## concept_type
security-concept

## research_status
verified

## project_adoption
declared

## applicability
- HTTP security
- XSS prevention
- Clickjacking prevention
- Content security

## tags
- type/concept
- domain/security
- status/verified
- priority/high

## source_ids
- owasp-top-10
- martinfowler-patterns

## related_concept_ids
- security-headers
- csp-header
- hsts-header
- x-frame-options

## Definition

Security Headers are HTTP response headers that protect against common web vulnerabilities including XSS, clickjacking, and MIME type sniffing.

## Problem Addressed

Without Security Headers:
- XSS attacks are possible
- Clickjacking occurs
- MIME type sniffing exploits
- Content security is weak

## Scope of Boundaries

Security Headers apply to:
- HTTP security
- XSS prevention
- Clickjacking prevention
- Content security

Security Headers do not apply to:
- Backend logic
- Database design
- Authentication
- Authorization

## When to Apply

- Deploying web applications
- Securing HTTP responses
- Preventing XSS attacks
- Protecting content

## Tradeoffs and When to Avoid

- **Compatibility**: Some headers affect compatibility
- **Not for APIs**: APIs may not need all headers
- **Not for internal**: Internal apps may not need all headers
- **Not for SSR**: SSR may need different headers

## Implementation Guidance

1. **Add CSP**: Add Content-Security-Policy header
2. **Add HSTS**: Add Strict-Transport-Security header
3. **Add X-Frame-Options**: Add X-Frame-Options header
4. **Add X-Content-Type-Options**: Add X-Content-Type-Options header
5. **Test headers**: Test security headers

## Verification

- [ ] CSP added
- [ ] HSTS added
- [ ] X-Frame-Options added
- [ ] X-Content-Type-Options added
- [ ] Headers tested

## Common Misuses

- **Wrong CSP**: Using overly permissive CSP
- **Not testing**: Not testing headers
- **Not updating**: Not updating headers as app evolves
- **Not monitoring**: Not monitoring header effectiveness

## Related Concepts

- [[Security/security-headers]] â€” Security Headers
- [[Security/security-headers]] â€” CSP Header
- [[Security/security-headers]] â€” HSTS Header
- [[Security/security-headers]] â€” X-Frame-Options

## Project Observations

The project uses Security Headers through:
- Content-Security-Policy configuration
- HSTS enforcement
- X-Frame-Options for clickjacking prevention
- X-Content-Type-Options for MIME sniffing prevention

## Sources

- [[Sources/owasp-top-10|OWASP Top 10]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Security Headers Note**
