---
slug: a095-explicit-error-modeling
sources:
  - https://en.wikipedia.org/wiki/Error_handling
  - https://www.typescriptlang.org/docs/handbook/2/narrowing.html
date: 2026-11-02
tags:
  - architecture-design-patterns

  - error-handling
  - typescript
  - design
  - types
# Explicit Error Modeling

## Definition

## concept_id
a095-explicit-error-modeling

## title
Explicit Error Modeling

## aliases
- A095-explicit-error-modeling

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Explicit Error Modeling is the principle that **errors should be modeled as values in the type system rather than using exceptions for control flow**. This makes error handling visible in the function signature.

> "Errors should be values, not exceptions." â€” Functional programming principle

## Problem Addressed
