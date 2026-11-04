---
slug: projections
sources:
  - https://www.postgresql.org/docs/
  - https://martinfowler.com/bliki/Projection.html
date: 2026-11-02
tags:
  - core-concepts

  - database
  - projections
  - event-sourcing
  - cqs
# Projections

## Definition

## concept_id
j22-projections

## title
Projections

## aliases
- J22-Projections

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Projections are **read-optimized views of data derived from domain events or source data, used to serve queries without modifying the source of truth**.

> "A projection is a read-optimized view of data derived from the event store, used to serve queries." â€” Martin Fowler

## Problem Addressed
