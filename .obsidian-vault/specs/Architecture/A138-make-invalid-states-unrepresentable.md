---
slug: a138-make-invalid-states-unrepresentable
sources:
  - https://www.youtube.com/watch?v=rFfWjDnBjAU
  - https://voithos.github.io/blog/posts/make-illegal-states-unrepresentable/
date: 2026-11-02
tags:
  - architecture-design-patterns

  - priority/low
  - typescript
  - type-systems
  - design
  - safety
# Make Invalid States Unrepresentable

## Definition

## concept_id
a138-make-invalid-states-unrepresentable

## title
Make Invalid States Unrepresentable

## aliases
- A138-make-invalid-states-unrepresentable

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Make Invalid States Unrepresentable is the principle that **the type system should prevent invalid states from being expressible at compile time**. If a state cannot be represented in the type system, it cannot occur at runtime.

> "Make illegal states unrepresentable: use the type system to prevent invalid states from being expressible." â€” Functional programming principle

## Problem Addressed