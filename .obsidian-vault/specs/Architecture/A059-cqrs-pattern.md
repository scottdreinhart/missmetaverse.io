---
slug: a059-cqrs-pattern
sources:
  - https://martinfowler.com/bliki/CQRS.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs
date: 2026-11-02
tags:
  - architecture-design-patterns

  - cqrs
  - architecture
  - command
  - query
  - cqs
# CQRS (Command Query Responsibility Segregation)

## Definition

## concept_id
a059-cqrs-pattern

## title
CQRS (Command Query Responsibility Segregation)

## aliases
- A059-cqrs-pattern

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
CQRS is an **architectural pattern that separates read and write operations into different models**. Commands modify state, queries read state.

> "CQRS separates the responsibility of reading data from the responsibility of writing data." â€” Martin Fowler

## Problem Addressed
