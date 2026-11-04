---
slug: dead-letter-queues
sources:
  - https://www.enterpriseintegrationpatterns.com/patterns/messaging/DeadLetterChannel.html
  - https://docs.microsoft.com/en-us/azure/architecture/patterns/dead-letter-queue
date: 2026-11-02
tags:
  - architecture-design-patterns

  - dlq
  - messaging
  - distributed-systems
  - patterns
# Dead-Letter Queues

## Definition

## concept_id
a075-dead-letter-queues

## title
Dead-Letter Queues

## aliases
- A075-dead-letter-queues

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
Dead-Letter Queues (DLQs) are **queues where messages that can't be processed are sent for later inspection and handling**.

> "A dead-letter channel captures messages that cannot be processed or routed to their intended destination." â€” Enterprise Integration Patterns

## Problem Addressed