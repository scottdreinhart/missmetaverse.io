---
slug: transaction-boundaries
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - core-concepts

  - maturity-deprecated
  - database
  - transactions
  - data-modeling
  - consistency
# Transaction Boundaries

## Definition

## concept_id
j11-transaction-boundaries

## title
Transaction Boundaries

## aliases
- J11-Transaction-Boundaries

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Transaction Boundaries are **the explicit start and end points of a database transaction, ensuring all operations within the boundary succeed or fail together**.

> "A transaction is a single logical unit of work that accesses and possibly modifies data. A transaction may access data in a database or update/modify data." â€” SQL Standard

## Problem Addressed