---
slug: a191-saga-pattern
sources:
  - https://microservices.io/patterns/data/saga.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/saga
date: 2026-11-02
tags:
  - architecture   - design-patterns

  - saga
  - distributed-systems
  - transactions
  - patterns
# Saga Pattern

## Definition

## concept_id
a191-saga-pattern

## title
Saga Pattern

## aliases
- A191-saga-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
A Saga is a **sequence of local transactions where each transaction updates data within a single service, and each step has a compensating action for rollback**.

> "A saga is a sequence of local transactions. Each local transaction updates the database and publishes a message or event to trigger the next local transaction in the saga." â€” Martin Fowler

## Problem Addressed