---
slug: nginx-patterns
sources:
  - https://nginx.org/
  - https://docs.docker.com/
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/testing
  - domain/optimization
  - domain/devops
  - nginx
  - deployment
  - devops
  - web-server
---

# Nginx Patterns

## Definition

Nginx Patterns are **design patterns for using Nginx as a web server, reverse proxy, and load balancer for deploying and serving applications**.

> "Nginx is a high-performance HTTP server and reverse proxy, as well as an IMAP/POP3 proxy server." — Wikipedia

## Problem Addressed

Without nginx patterns:
- **No reverse proxy**: Can't proxy to backend services
- **No load balancing**: Can't distribute traffic
- **No SSL termination**: Can't handle HTTPS
- **No static file serving**: Can't serve static files efficiently

## Scope and Boundaries

- Nginx Patterns ≠ Nginx (nginx patterns are patterns, nginx is a tool)
- Nginx Patterns = Docker Deployment (nginx patterns are patterns, docker deployment is a feature)
- Nginx Patterns is a **tool**, not a pattern

## When to Apply

- When building applications
- when reverse proxy matters
- when load balancing is important
- when SSL termination is required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Nginx adds infrastructure complexity |
| **Time** — Nginx setup takes time |
| **Over-nginx** — Don't use Nginx for simple applications |

## Common Misuses

- **Nginx for everything**: Simple applications don't need Nginx
- **Complex configurations**: Keep Nginx configurations simple
- **Confusing Nginx with application server**: Nginx is a web server, not an application server

## Related Concepts

- [Docker Deployment](Frontend UI/docker-deployment-patterns.md) — Docker deployment uses Nginx
- [Deployment](DevOps/deployment.md) — Deployment uses Nginx
- [CI/CD](DevOps/ci-cd.md) — CI/CD pipelines deploy Nginx configurations

## Project Observations

- The project uses nginx patterns:
  - Nginx provides web server and reverse proxy
  - Docker provides containerization for Nginx
  - GitHub Actions provides CI/CD for Nginx
  - No evidence of nginx patterns in existing code (src/ is empty)
- File naming conventions support nginx:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]



