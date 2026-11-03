# Domain-Driven Design

> **Purpose:** Strategic and tactical patterns for complex domain modeling.
> **Last Updated:** 2026-11-03

---

## concept_id
`arch-domain-driven-design`

## title
Domain-Driven Design

## aliases
- DDD
- Domain-Driven Design
- Evans DDD

## category
application-architecture

## concept_type
architectural-pattern

## research_status
verified

## project_adoption
declared

## applicability
- Complex business domains
- Enterprise applications
- Systems with complex business logic
- Teams working on the same domain

## tags
- type/pattern
- domain/architecture
- domain/ddd
- status/verified
- priority/high

## source_ids
- evans-ddd-2003
- martin-fowler-patterns

## related_concept_ids
- ddd-ubiquitous-language
- ddd-bounded-context
- ddd-entity
- ddd-value-object
- ddd-aggregate
- ddd-repository
- ddd-domain-event
- arch-hexagonal-architecture
- arch-clean-architecture

---

## Definition

Domain-Driven Design (DDD) is an approach to software development that seeks to connect the implementation in the code to an evolving model of the core business domain. It emphasizes:

1. **Strategic Design**: Bounded contexts, ubiquitous language, context maps
2. **Tactical Design**: Entities, value objects, aggregates, domain events, repositories
3. **Domain Modeling**: Collaborative modeling with domain experts
4. **Model-Driven Design**: The model is the heart of the software

## Problem Addressed

Complex business domains are difficult to model and implement because:
- Business terminology differs from technical terminology
- Domain experts and developers speak different languages
- Business rules are complex and constantly evolving
- The gap between domain knowledge and code implementation grows over time

## Scope and Boundaries

DDD applies to:
- Domain model design
- Bounded context identification
- Ubiquitous language development
- Tactical pattern implementation

DDD does not directly address:
- Infrastructure concerns
- UI implementation
- Deployment strategies
- Performance optimization

## When to Apply

- The domain is complex and requires deep understanding
- The business rules are complex and frequently changing
- You need to align technical implementation with business goals
- You have domain experts available for collaboration

## Tradeoffs and When to Avoid

- **Over-engineering risk**: DDD adds complexity and should not be used for simple CRUD applications
- **Learning curve**: Requires significant investment in understanding domain modeling
- **Time investment**: Strategic design takes time and collaboration
- **Not for simple domains**: YAGNI applies — simple domains don't need DDD

## Implementation Guidance

### Strategic Design
1. Identify bounded contexts
2. Develop ubiquitous language with domain experts
3. Create context maps to show relationships between contexts
4. Define anti-corruption layers for external domains

### Tactical Design
1. Model entities with identity
2. Create value objects for descriptive aspects
3. Define aggregates with consistency boundaries
4. Implement domain events for state changes
5. Use repositories for aggregate access
6. Apply domain services for domain logic that doesn't belong to a single entity

## Verification

- [ ] Confirmed in project codebase
- [ ] Bounded contexts identified
- [ ] Ubiquitous language established
- [ ] Domain models implemented
- [ ] Aggregates defined with consistency boundaries

## Common Misuses

- **DDD for simple domains**: Using DDD patterns for CRUD applications
- **Ignoring strategic design**: Jumping straight to tactical patterns without understanding the domain
- **Over-modeling**: Creating too many abstractions and patterns
- **Ignoring ubiquitous language**: Not involving domain experts in modeling
- **Confusing DDD with microservices**: DDD does not require microservices

## Related Concepts

- [[DDD/ubiquitous-language]] — Ubiquitous Language
- [[DDD/bounded-context]] — Bounded Context
- [[DDD/entity]] — Entity
- [[DDD/value-object]] — Value Object
- [[DDD/aggregate]] — Aggregate
- [[Architecture/hexagonal-architecture]] — Hexagonal Architecture
- [[Architecture/clean-architecture]] — Clean Architecture

## Project Observations

The project uses TypeScript, which supports DDD patterns through:
- Classes and interfaces for entities and value objects
- Generics for type-safe repositories
- Discriminated unions for domain events
- Strict typing for domain invariants

## Sources

- [[Sources/evans-ddd-2003|Eric Evans — Domain-Driven Design: Tackling Complexity in the Heart of Software]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Domain-Driven Design Note**
