---
slug: system-design-101-secure-systems
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - security
  - architecture
  - reference
---

# How to Design a Secure System

## Overview

Reference: [Guide: how-do-we-design-a-secure-system](https://bytebytego.com/guides/how-do-we-design-a-secure-system)

This cheat sheet covers key design points for building secure systems.

## Security Design Principles

### 1. Defense in Depth
- Multiple layers of security controls
- Don't rely on single point of defense
- Example: Firewall + WAF + IDS + Encryption

### 2. Least Privilege
- Grant minimum necessary permissions
- Principle of least privilege (PoLP)
- Example: Service accounts with minimal permissions

### 3. Fail Securely
- Default to secure state on failure
- Don't expose sensitive data in errors
- Example: Return generic error messages

### 4. Secure by Default
- Secure configurations by default
- Require explicit action to reduce security
- Example: HTTPS enabled by default

### 5. Complete Mediation
- Check authorization for every request
- Don't cache authorization decisions
- Example: Validate token on every API call

### 6. Open Design
- Security shouldn't rely on secrecy
- Design should be publicly reviewable
- Example: Kerberos algorithm is public

### 7. Separation of Duties
- Critical tasks require multiple people
- Prevent fraud and errors
- Example: Developer ≠ Deployer

### 8. Economy of Mechanism
- Keep security mechanisms simple
- Smaller trusted computing base
- Example: Simple access control lists

## Security Layers

### Network Security
- Firewalls (network, host)
- VPNs (site-to-site, client)
- DDoS protection
- Network segmentation
- Example: AWS Security Groups, NACLs

### Application Security
- Input validation
- Authentication (OAuth 2.0, JWT)
- Authorization (RBAC, ABAC)
- Rate limiting
- Example: API gateway with rate limiting

### Data Security
- Encryption at rest (AES-256)
- Encryption in transit (TLS 1.3)
- Key management (KMS)
- Data masking/tokenization
- Example: AWS KMS, HashiCorp Vault

### Host Security
- OS hardening
- Patch management
- File integrity monitoring
- Endpoint detection (EDR)
- Example: CIS benchmarks

### Identity Security
- Multi-factor authentication (MFA)
- Single sign-on (SSO)
- Just-in-time access
- Privileged access management (PAM)
- Example: Okta, Azure AD

## Security Checklist

### Design Phase
- [ ] Threat modeling performed
- [ ] Security requirements defined
- [ ] Architecture reviewed for security
- [ ] Data classification completed
- [ ] Compliance requirements identified

### Implementation Phase
- [ ] Input validation implemented
- [ ] Authentication configured
- [ ] Authorization enforced
- [ ] Encryption implemented
- [ ] Logging and monitoring configured
- [ ] Error handling secure

### Testing Phase
- [ ] Security testing performed
- [ ] Penetration testing completed
- [ ] Vulnerability scanning done
- [ ] Code review for security
- [ ] Dependency scanning done

### Deployment Phase
- [ ] Security configurations verified
- [ ] Secrets management configured
- [ ] Monitoring and alerting active
- [ ] Incident response plan ready
- [ ] Backup and recovery tested

## Common Security Anti-Patterns

### ❌ Don't Do This
- Hardcoding secrets in code
- Using HTTP instead of HTTPS
- Storing passwords in plain text
- Disabling SSL certificate validation
- Using default credentials
- Logging sensitive data
- Exposing internal errors to users
- Relying on security through obscurity

### ✅ Do This Instead
- Use secrets management (Vault, AWS Secrets Manager)
- Enforce HTTPS everywhere
- Hash passwords (bcrypt, Argon2)
- Validate SSL certificates
- Enforce strong authentication
- Sanitize logs
- Return generic error messages
- Use established security standards

## Integration with Vault

Read these vault notes for deeper understanding:

- [security-principles](D/security-principles.md) — Security design principles
- [secure-by-design](D/secure-by-design.md) — Secure by design patterns
- [secure-defaults](D/secure-defaults.md) — Secure defaults implementation
- [input-validation](D/input-validation.md) — Input validation patterns
- [output-encoding](D/output-encoding.md) — Output encoding patterns
- [parameterized-queries](D/parameterized-queries.md) — SQL injection prevention
- [content-security-policy](D/content-security-policy.md) — CSP headers
- [secrets-management](D/secrets-management.md) — Secrets management

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [secure-system-guide](https://bytebytego.com/guides/how-do-we-design-a-secure-system)
