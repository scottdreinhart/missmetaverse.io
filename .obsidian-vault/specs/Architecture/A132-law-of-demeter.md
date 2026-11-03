---
slug: a132-law-of-demeter
sources:
  - https://en.wikipedia.org/wiki/Law_of_Demeter
  - https://www.slideshare.net/bill_lacoste/law-of-demeter
date: 2026-11-02
tags:
  - architecture   - design-patterns

  - demeter
  - principles
  - coupling
  - oop
# Law of Demeter (Principle of Least Knowledge)

## Definition

## concept_id
a132-law-of-demeter

## title
Law of Demeter (Principle of Least Knowledge)

## aliases
- A132-law-of-demeter

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
The Law of Demeter states that **a method should only call methods on**:
1. Itself
2. Its parameters
3. Objects it creates
4. Its direct component objects

> "Each unit should have only limited knowledge about other units: only units 'closely' related to the current unit." â€” Ian Holland (coined the term)

## Problem Addressed