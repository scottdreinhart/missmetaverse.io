---
slug: nginx
sources:
  - https://nginx.org/
  - https://docs.nginx.com/
date: 2026-11-02
tags:
  - nginx
  - web-server
  - reverse-proxy
  - deployment
---

# Nginx

## Definition

Nginx is a **high-performance HTTP server and reverse proxy**.

> "Nginx is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache." — Wikipedia

## Problem Addressed

Without Nginx:
- **Performance**: Hard to handle many connections
- **Reverse proxy**: Hard to proxy to backend services
- **Load balancing**: Hard to balance load
- **SSL**: Hard to manage SSL certificates

## Scope and Boundaries

- Nginx ≠ Apache (Nginx is event-driven, Apache is process-driven)
- Nginx ≠ Application Server (Nginx is a web server, application servers run code)
- Nginx is a **web server**, not an application server

## When to Apply

- When building web applications
- When performance matters
- When reverse proxy is needed
- When load balancing is needed

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Nginx is complex |
| **Time** — Nginx takes time |
| **Over-engineering** — Don't use Nginx for simple cases |

## Common Misuses

- **Everything Nginx**: Not everything needs Nginx
- **Confusing with application server**: Nginx ≠ application server
- **Over-engineering**: Too much Nginx creates complexity

## Related Concepts

- [Docker Deployment](Architecture/docker-deployment.md) — Nginx with Docker
- [CI/CD](Architecture/cicd-github-actions.md) — Nginx with CI/CD
- [Deployment](Architecture/deployment.md) — Nginx with deployment

## Project Observations

- The project uses Nginx:
  - The project's Docker deployment note covers Nginx (from existing notes)
  - No evidence of Nginx in existing code (src/ is empty)
- File naming conventions support Nginx:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

