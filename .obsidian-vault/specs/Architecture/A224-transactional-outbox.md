---
slug: transactional-outbox
sources:
  - https://microservices.io/patterns/data/transactional-outbox.html
  - https://learn.microsoft.com/en-us/azure/architecture/patterns/transactional-outbox
date: 2026-11-02
tags:
  - architecture-design-patterns

  - outbox
  - distributed-systems
  - events
  - patterns
# Transactional Outbox

## Definition

## concept_id
a224-transactional-outbox

## title
Transactional Outbox

## aliases
- A224-transactional-outbox

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
The Transactional Outbox pattern is a **reliable event publishing pattern where business changes and event publication intents are persisted in one transaction**.

> "The Outbox pattern ensures that every business transaction that produces events does so in an atomic way." â€” Microsoft Azure Architecture

## Problem Addressed
