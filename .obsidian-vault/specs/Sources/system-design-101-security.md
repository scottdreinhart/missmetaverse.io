---
slug: system-design-101-security-overview
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - security
  - authentication
  - reference
---

# Security — Complete ByteByteGo Guide Index

## Overview

Reference: [Guide: security](https://bytebytego.com/guides/security)

This category covers all security-related guides from ByteByteGo System Design 101.

## Security Guides

### Authentication & Authorization
| Guide | Slug | Description |
|-------|------|-------------|
| [Designing a Permission System](https://bytebytego.com/guides/how-do-we-design-a-permission-system) | `system-design-101-permission-systems` | ACL, DAC, MAC, ABAC, RBAC |
| [How to Design a Secure System](https://bytebytego.com/guides/how-do-we-design-a-secure-system) | `system-design-101-secure-systems` | Security design principles |
| [Managing Sensitive Data](https://bytebytego.com/guides/how-do-we-manage-sensitive-data-in-a-system) | `system-design-101-sensitive-data` | Sensitive data management |
| [Storing Passwords Safely](https://bytebytego.com/guides/how-to-store-passwords-in-the-database) | `system-design-101-passwords` | Password hashing (bcrypt, Argon2) |
| [JWT 101](https://bytebytego.com/guides/jwt-101-key-to-stateless-authentication) | `system-design-101-jwt` | Stateless authentication |
| [OAuth 2.0 Explained](https://bytebytego.com/guides/oauth-2-explained-with-simple-terms) | `system-design-101-oauth` | OAuth 2.0 framework |
| [OAuth 2.0 Flows](https://bytebytego.com/guides/oauth-20-flows) | `system-design-101-oauth-flows` | Auth Code, Client Credentials |
| [Session, Cookie, JWT, SSO, OAuth](https://bytebytego.com/guides/session-cookie-jwt-token-sso-and-oauth-2) | `system-design-101-session-auth` | Authentication comparison |
| [Token, Cookie, Session](https://bytebytego.com/guides/token-cookie-session) | `system-design-101-token-cookie` | Identity management |
| [What is a Cookie?](https://bytebytego.com/guides/what-is-a-cookie) | `system-design-101-cookie` | Cookie mechanics |
| [Cookies vs Sessions](https://bytebytego.com/guides/what-are-the-differences-between-cookies-and-sessions) | `system-design-101-cookies-sessions` | Cookie vs Session |
| [Session vs JWT](https://bytebytego.com/guides/what's-the-difference-between-session-based-authentication-and-jwts) | `system-design-101-session-vs-jwt` | Auth comparison |
| [PassKey Future](https://bytebytego.com/guides/is-passkey-shaping-a-passwordless-future) | `system-design-101-passkey` | Passwordless authentication |
| [What is SSO?](https://bytebytego.com/guides/v1what-is-sso-single-sign-on) | `system-design-101-sso` | Single Sign-On |
| [Top 4 Authentication](https://bytebytego.com/guides/top-4-forms-of-authentication-mechanisms) | `system-design-101-auth-mechanisms` | Authentication types |
| [Secure Web API Access](https://bytebytego.com/guides/how-to-design-secure-web-api-access-for-your-website) | `system-design-101-secure-api` | API security |
| [Top 12 API Security Tips](https://bytebytego.com/guides/top-12-tips-for-api-security) | `system-design-101-api-security` | API security best practices |

### Encryption & Network Security
| Guide | Slug | Description |
|-------|------|-------------|
| [HTTPS, SSL Handshake](https://bytebytego.com/guides/https-ssl-handshake-and-data-encryption-explained-to-kids) | `system-design-101-https-ssl` | SSL/TLS encryption |
| [Is HTTPS Safe?](https://bytebytego.com/guides/is-https-safe) | `system-design-101-https-safe` | HTTPS vulnerabilities |
| [Symmetric vs Asymmetric](https://bytebytego.com/guides/symmetric-encryption-vs-asymmetric-encryption) | `system-design-101-encryption` | Encryption types |
| [Top Network Security](https://bytebytego.com/guides/top-network-security-cheatsheet) | `system-design-101-network-security` | Network threats |
| [Top 6 Firewall Use Cases](https://bytebytego.com/guides/top-6-firewall-use-cases) | `system-design-101-firewall` | Firewall patterns |
| [Types of VPNs](https://bytebytego.com/guides/types-of-vpns) | `system-design-101-vpns` | VPN types |
| [HTTP Cookies](https://bytebytego.com/guides/http-cookies-explained-with-a-simple-diagram) | `system-design-101-http-cookies` | Cookie mechanics |

### DevSecOps
| Guide | Slug | Description |
|-------|------|-------------|
| [What is DevSecOps?](https://bytebytego.com/guides/what-is-devsecops) | `system-design-101-devsecops` | Security in DevOps |

## Integration with Vault

Read these vault notes for deeper understanding:

- [abac](D/abac.md) — Attribute-Based Access Control
- [rbac](D/rbac.md) — Role-Based Access Control
- [security-principles](D/security-principles.md) — Security best practices
- [secure-by-design](D/secure-by-design.md) — Secure by design patterns
- [secrets-management](D/secrets-management.md) — Secrets management
- [data-minimization](D/data-minimization.md) — Data minimization principles
- [output-encoding](D/output-encoding.md) — Output encoding patterns
- [parameterized-queries](D/parameterized-queries.md) — SQL injection prevention
- [content-security-policy](D/content-security-policy.md) — CSP headers
- [rate-limiting](D/rate-limiting.md) — Rate limiting patterns

## Citation Format

All guides use the citation format:
- `system-design-101/security/<guide-name>` — Citation slug for verification
- Original source: https://bytebytego.com/
