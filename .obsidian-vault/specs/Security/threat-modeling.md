---
slug: threat-modeling
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - threat-modeling
  - security
  - design
  - risk
---

# Threat Modeling

## Definition

Threat Modeling is **a security practice that identifies, quantifies, and addresses security risks in a system before it is built**.

> "Threat modeling is an exercise intended to help you identify and prioritize the security risks your application faces, and define and prioritize the countermeasures you want to put in place to deal with those risks." — Microsoft

## Problem Addressed

Without threat modeling:
- **Unknown threats**: Threats are not identified until it's too late
- **Security holes**: Security holes are introduced during development
- **Cost**: Security fixes are expensive
- **Risk**: System is insecure

## Scope and Boundaries

- Threat Modeling ≠ Security Testing (threat modeling identifies threats before building, security testing finds issues after building)
- Threat Modeling = Prevention (threat modeling prevents security issues)
- Threat Modeling is a **security practice**, not a pattern

## When to Apply

- When designing secure systems
- when security is critical
- when building new systems or features
- when compliance requires threat modeling

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Threat modeling takes time |
| **Complexity** — Threat modeling adds process complexity |
| **Expertise**: Requires security expertise |

## Common Misuses

- **Everything threat modeled**: Not every system needs formal threat modeling
- **One-time effort**: Threat modeling should be repeated as the system evolves
- **Confusing with security testing**: Threat modeling identifies threats before building, security testing finds issues after building

## Related Concepts

- [Secure by Design](Security/secure-by-design.md) — Secure by design includes threat modeling
- [Security Principles](Security/security-principles.md) — Security principles include threat modeling
- [Trust Boundaries](Security/trust-boundaries.md) — Trust boundaries are identified through threat modeling

## Project Observations

- The project uses threat modeling:
  - TypeScript supports threat modeling through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of threat modeling in existing code (src/ is empty)
- File naming conventions support threat modeling:
  - `*.security.ts` — Security files
  - `*.guard.ts` — Guard files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
- [[Sources/react-docs-2026|react-docs-2026]]
