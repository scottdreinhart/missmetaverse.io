---
slug: inbox-pattern
sources:
  - https://docs.microsoft.com/en-us/azure/architecture/guide/components/inbox-outbox
  - https://microservices.io/patterns/data/transactional-outbox.html
date: 2026-11-02
tags:
  - core-concepts

  - inbox-pattern
  - distributed-systems
  - messaging
  - reliability
# Inbox Pattern

## Definition

## concept_id
l08-inbox-pattern

## title
Inbox Pattern

## aliases
- L08-Inbox-Pattern

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Inbox Pattern is **a distributed systems pattern that prevents duplicate processing of messages by tracking which messages have already been processed**.

> "The inbox pattern prevents duplicate processing by tracking which messages have been processed by a service." â€” Microsoft

## Problem Addressed
