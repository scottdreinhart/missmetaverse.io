---
slug: bulkheads-pattern
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/bulkhead
  - https://en.wikipedia.org/wiki/Bulkhead_pattern
date: 2026-11-02
tags:
  - architecture   - design-patterns

  - bulkhead
  - resilience
  - distributed-systems
  - patterns
# Bulkheads Pattern

## Definition

## concept_id
a028-bulkheads-pattern

## title
Bulkheads Pattern

## aliases
- A028-bulkheads-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
The Bulkheads pattern is a **resilience pattern that isolates resources so that a failure in one component doesn't exhaust resources in another**.

> "The bulkhead pattern isolates elements of functionality so that a failure in one doesn't take down all functionality." â€” Microsoft Azure Architecture

## Problem Addressed