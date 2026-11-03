---
slug: continuous-deployment
sources:
  - https://martinfowler.com/articles/continuousDeployment.html
  - https://docs.github.com/en/actions/deployment
date: 2026-11-02
tags:
  - cd
  - devops
  - github-actions
  - deployment
# Continuous Deployment

## Definition

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Continuous Deployment (CD) is a **software development practice where code changes are automatically deployed to production after passing automated tests**.

> "Continuous deployment is a software development approach in which software releases are automated." â€” Martin Fowler

## Problem Addressed

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Without CD:
- **Slow releases**: Releases are manual and slow
- **Risk**: Manual deployments are error-prone
- **Feedback delay**: Users don't get new features quickly
- **Inconsistency**: Manual deployments vary

## Scope and Boundaries

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- CD â‰  CI (CD is about deployment, CI is about integration)
- CD â‰  Manual deployment (CD is automated, manual is not)
- CD is a **deployment practice**, not a tool

## When to Apply

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- When automation matters
- When frequent releases are needed
- When quality is important
- When user feedback is valuable

## Tradeoffs and When to Avoid

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Risk** â€” Automated deployments can fail |
| **Infrastructure** â€” CD requires infrastructure |
| **Complexity** â€” CD pipelines are complex |

## Common Misuses

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- **Everything CD**: Not every project needs CD
- **Confusing with CI**: CD â‰  CI
- **Skipping tests**: CD without tests is dangerous

## Related Concepts

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [Continuous Integration](Architecture/continuous-integration.md) â€” CD with CI
- [Automated Testing](Architecture/quality-delivery-maintainability.md) â€” CD includes testing
- [Docker Deployment](Architecture/docker-nginx-deployment.md) â€” CD with Docker

## Project Observations

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- The project uses CD:
  - GitHub Actions is configured (from existing notes)
  - Docker is configured for deployment (from existing notes)
  - The project's CI note covers GitHub Actions
- No evidence of CD in existing code (src/ is empty)
- File naming conventions support CD:
  - `*.test.ts` â€” Test files
  - `*.spec.ts` â€” Spec files

## Sources

## concept_id
a054-continuous-deployment

## title
Continuous Deployment

## aliases
- A054-continuous-deployment

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]



