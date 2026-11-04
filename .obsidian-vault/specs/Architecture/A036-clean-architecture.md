---
slug: a036-clean-architecture
sources:
  - https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
  - https://blog.cleancoder.com/
date: 2026-11-02
tags:
  - architecture-design-patterns

  - clean-architecture
  - hexagonal-architecture
  - ports-adapters
  - onion-architecture
  - dependency-inversion
  - architecture
# Clean Architecture

## Overview

## concept_id
a036-clean-architecture

## title
Clean Architecture

## aliases
- A036-clean-architecture

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Clean Architecture (also known as Hexagonal Architecture, Ports and Adapters, Onion Architecture) is an architectural style that keeps business rules independent of frameworks, databases, UIs, and external services. The overriding rule is **The Dependency Rule**: source code dependencies can only point inwards.

---

## 1. The Dependency Rule
