---
slug: expand-contract
sources:
  - https://martinfowler.com/articles/evodb.html
  - https://www.postgresql.org/docs/
date: 2026-11-02
tags:
  - core-concepts

  - maturity-deprecated
  - database
  - migrations
  - schema
  - zero-downtime
# Expand-Contract Migrations

## Definition

## concept_id
j16-expand-contract-migrations

## title
Expand-Contract Migrations

## aliases
- J16-Expand-Contract-Migrations

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Expand-Contract Migrations are **a two-phase migration strategy: first expand (add new functionality without removing old), then contract (remove old functionality)**.

> "The expand/contract pattern is a way to evolve a database schema without downtime." â€” Martin Fowler

## Problem Addressed
