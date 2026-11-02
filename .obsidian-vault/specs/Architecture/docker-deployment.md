---
slug: docker-deployment
sources:
  - https://docs.docker.com/
  - https://nginx.org/
date: 2026-11-02
tags:
  - docker
  - deployment
  - nginx
  - containers
---

# Docker Deployment

## Definition

Docker Deployment is a **practice of packaging software into containers for consistent deployment across environments**.

> "Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers." — Wikipedia

## Problem Addressed

Without Docker:
- **Inconsistency**: Software works differently in different environments
- **Deployment difficulty**: Hard to deploy consistently
- **Resource usage**: Hard to manage resources
- **Scalability**: Hard to scale

## Scope and Boundaries

- Docker ≠ Kubernetes (Docker is for containers, Kubernetes is for orchestration)
- Docker ≠ Virtual Machines (Docker is for containers, VMs are for virtualization)
- Docker is a **containerization practice**, not an orchestration practice

## When to Apply

- When building software
- When deployment matters
- When consistency is important
- When scalability is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Docker is complex |
| **Time** — Docker takes time |
| **Over-containerization** — Don't containerize everything |

## Common Misuses

- **Everything containerized**: Not everything needs Docker
- **Confusing with Kubernetes**: Docker ≠ Kubernetes
- **Over-containerization**: Too much containerization creates complexity

## Related Concepts

- [CI/CD](Architecture/cicd-github-actions.md) — Docker with CI/CD
- [Nginx](Architecture/nginx.md) — Docker with Nginx
- [Deployment](Architecture/deployment.md) — Docker with deployment

## Project Observations

- The project uses Docker:
  - The project's Docker deployment note covers Docker (from existing notes)
  - No evidence of Docker in existing code (src/ is empty)
- File naming conventions support Docker:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-srp-2014|martin-srp-2014]]
