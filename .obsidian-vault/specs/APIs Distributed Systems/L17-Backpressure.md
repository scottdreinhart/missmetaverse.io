---
slug: backpressure
sources:
  - https://en.wikipedia.org/wiki/Backpressure_(computing)
  - https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific
date: 2026-11-02
tags:
  - core-concepts

  - backpressure
  - distributed-systems
  - reliability
  - performance
# Backpressure

## Definition

## concept_id
l17-backpressure

## title
Backpressure

## aliases
- L17-Backpressure

## category
api-design

## concept_type
integration-pattern

## research_status
verified

## project_adoption
recommended
Backpressure is **a distributed systems pattern that controls the rate of data flow between components to prevent overwhelming downstream systems**.

> "Backpressure is a mechanism that allows a consumer to signal to a producer that it is unable to keep up with the current rate of data." â€” Wikipedia

## Problem Addressed
