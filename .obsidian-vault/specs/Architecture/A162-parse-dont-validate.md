---
slug: a162-parse-dont-validate
sources:
  - https://hynek.me/articles/validate-before-parsing/
  - https://gleb-tarasov.com/blog/parse-dont-validate/
date: 2026-11-02
tags:
  - architecture-design-patterns

  - parsing
  - validation
  - typescript
  - type-systems
# Parse, Don't Merely Validate

## Definition

## concept_id
a162-parse-dont-validate

## title
Parse, Don't Merely Validate

## aliases
- A162-parse-dont-validate

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Parse, Don't Validate is the principle that **input should be parsed into typed values rather than validated as raw strings**. Parsing enforces invariants at the boundary, while validation only checks.

> "Parse don't validate: convert raw input into typed values at the boundary, so the rest of your code works with guaranteed valid data." â€” Gleb T.

## Problem Addressed
