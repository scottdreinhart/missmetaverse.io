---
slug: data-transfer-objects
sources:
  - https://martinfowler.com/bliki/DataTransferObject.html
  - https://docs.microsoft.com/en-us/dotnet/standard/microservices-architecture/microservice-ddc-caching/microservice-ddc-caching
date: 2026-11-02
tags:
  - architecture-design-patterns

  - dto
  - api
  - data-transfer
  - patterns
# Data Transfer Objects (DTOs)

## Definition

## concept_id
a073-data-transfer-objects

## title
Data Transfer Objects (DTOs)

## aliases
- A073-data-transfer-objects

## category
architecture

## concept_type
design-pattern

## research_status
verified

## project_adoption
recommended
DTOs are **simple objects that carry data between processes without behavior**. They are used to transfer data between layers or services.

> "A Data Transfer Object is an object that carries data between processes. The motivation for its existence is to reduce the number of remote calls." â€” Martin Fowler

## Problem Addressed