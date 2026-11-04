---
slug: c07-aggregate-root
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/Aggregate.html
date: 2026-11-02
tags:
  - core-concepts

  - maturity-deprecated
  - ddd
  - aggregate-root
  - domain-modeling
  - boundary
# Aggregate Root

## Definition

## concept_id
c07-aggregate-root

## title
Aggregate Root

## aliases
- C07-Aggregate-Root

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
Aggregate Root is **the single entry point to an aggregate â€” all external access to aggregate objects goes through the root**.

> "The root object is the only member of the aggregate that external objects can hold references to." â€” Eric Evans

## Problem Addressed