---
slug: pessimistic-cc
sources:
  - https://www.postgresql.org/docs/
  - https://dev.mysql.com/doc/
date: 2026-11-02
tags:
  - core-concepts

  - database
  - concurrency
  - locking
  - consistency
# Pessimistic Concurrency Control

## Definition

## concept_id
j13-pessimistic-concurrency-control

## title
Pessimistic Concurrency Control

## aliases
- J13-Pessimistic-Concurrency-Control

## category
data-management

## concept_type
data-pattern

## research_status
verified

## project_adoption
recommended
Pessimistic Concurrency Control is **a concurrency control method that assumes conflicts will occur and locks resources to prevent concurrent modifications**.

> "Pessimistic concurrency control assumes that concurrent transactions are likely to conflict, so it locks resources before they are accessed." â€” Wikipedia

## Problem Addressed