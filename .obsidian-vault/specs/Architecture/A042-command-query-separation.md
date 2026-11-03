---
slug: a042-command-query-separation
sources:
  - https://en.wikipedia.org/wiki/Command%E2%80%93query_separation
  - https://en.wikipedia.org/wiki/CQRS
date: 2026-11-02
tags:
  - architecture   - design-patterns

  - cqs
  - cqrs
  - principles
  - design
# Command-Query Separation (CQS)

## Definition

## concept_id
a042-command-query-separation

## title
Command-Query Separation (CQS)

## aliases
- A042-command-query-separation

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Command-Query Separation is the principle that **methods should either do something (command) or return something (query), not both**. A method should not have side effects when it is a query, and a command should not return meaningful data.

> "Every method should either do something or answer something, but not both." â€” Bertrand Meyer (1988)

## Problem Addressed