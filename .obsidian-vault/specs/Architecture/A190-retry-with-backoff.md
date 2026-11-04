---
slug: retry-with-backoff
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
  - https://www.awsarchitectureblog.com/2015/03/backoff.html
date: 2026-11-02
tags:
  - architecture-design-patterns

  - retry
  - backoff
  - resilience
  - distributed-systems
# Retry with Backoff and Jitter

## Definition

## concept_id
a190-retry-with-backoff

## title
Retry with Backoff and Jitter

## aliases
- A190-retry-with-backoff

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Retry with Backoff and Jitter is a **resilience pattern where failed operations are retried with increasing delays and randomization to avoid thundering herd**.

> "Exponential backoff with jitter is a technique that adds random variation to the delay between retries." â€” AWS Architecture Blog

## Problem Addressed