---
slug: a034-circuit-breaker-pattern
sources:
  - https://martinfowler.com/bliki/CircuitBreaker.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/circuit-breaker
date: 2026-11-02
tags:
  - architecture-design-patterns

  - maturity/deprecated
  - circuit-breaker
  - distributed-systems
  - resilience
  - patterns
# Circuit Breaker

## Definition

## concept_id
a034-circuit-breaker-pattern

## title
Circuit Breaker

## aliases
- A034-circuit-breaker-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
A Circuit Breaker is a **resilience pattern that temporarily stops calls to a failing service to prevent cascading failures**. It has three states: Closed (normal), Open (failing), and Half-Open (testing recovery).

> "The circuit breaker pattern is a design pattern used to detect failures and encapsulate logic to prevent a failure from happening repeatedly." â€” Martin Fowler

## Problem Addressed