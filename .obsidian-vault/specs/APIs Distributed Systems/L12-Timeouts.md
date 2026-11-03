---
slug: timeouts
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
  - https://microservices.io/patterns/reliability/timeouts.html
date: 2026-11-02
tags:
  - core-concepts

  - timeouts
  - distributed-systems
  - reliability
  - resilience
# Timeouts

## Definition

## concept_id
l12-timeouts

## title
Timeouts

## aliases
- L12-Timeouts

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Timeouts is **a distributed systems pattern that limits the amount of time a operation waits for a response, preventing indefinite blocking**.

> "A timeout is a limit on the amount of time an operation is allowed to run before it is aborted." â€” Microsoft

## Problem Addressed