---
slug: nginx-patterns
sources:
  - https://nginx.org/
  - https://docs.nginx.com/
date: 2026-11-02
tags:
  - nginx
  - web-server
  - reverse-proxy
  - patterns
---

# Nginx Patterns

## Definition

Nginx Patterns are **design patterns for working with Nginx as a web server and reverse proxy**.

> "Nginx is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache." — Wikipedia

## Problem Addressed

Without Nginx patterns:
- **Performance**: Hard to handle many connections
- **Reverse proxy**: Hard to proxy to backend services
- **Load balancing**: Hard to balance load
- **SSL**: Hard to manage SSL certificates

## Scope and Boundaries

- Nginx Patterns ≠ Nginx (Nginx patterns are patterns, Nginx is a tool)
- Nginx Patterns ≠ Web Server (Nginx patterns are patterns, web server is a concept)
- Nginx Patterns is a **patterns**, not a tool

## When to Apply

- When building web applications
- when performance matters
- when reverse proxy is needed
- when load balancing is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Nginx patterns are complex |
| **Time** — Nginx patterns take time |
| **Over-Nginx** — Don't use Nginx for everything |

## Common Misuses

- **Everything Nginx**: Not everything needs Nginx patterns
- **Confusing with Nginx**: Nginx patterns ≠ Nginx
- **Over-Nginx**: Too much Nginx creates complexity

## Related Concepts

- [Docker Deployment](Architecture/docker-deployment-patterns.md) — Nginx patterns with Docker
- [CI/CD](Architecture/ci-cd.md) — Nginx patterns with CI/CD
- [Deployment](Architecture/deployment.md) — Nginx patterns with deployment

## Project Observations

- The project uses Nginx patterns:
  - The project's Docker deployment note covers Nginx patterns (from existing notes)
  - No evidence of Nginx patterns in existing code (src/ is empty)
- File naming conventions support Nginx patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

