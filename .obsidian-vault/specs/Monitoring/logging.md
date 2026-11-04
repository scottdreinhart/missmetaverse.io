---
slug: logging
tags:
  - monitoring-observability

  - monitoring-observability-devops
---

# Logging

> **Purpose:** Implement logging with Logging.
> **Last Updated:** 2026-11-03

## concept_id
`logging`

## title
Logging

## aliases
- Logging
- Application Logging
- Structured Logging
- Log Levels

## category
monitoring

## concept_type
monitoring-concept

## research_status
verified

## project_adoption
declared

## applicability
- Application logging
- Structured logging
- Log levels
- Log aggregation

## tags
- type/concept
- domain/monitoring
- status/verified
- priority/high

## source_ids
- logging-guide
- martinfowler-patterns

## related_concept_ids
- logging
- application-logging
- structured-logging
- log-levels

## Definition

Logging is the practice of recording application events and errors for debugging, monitoring, and auditing purposes using structured formats and appropriate log levels.

## Problem Addressed

Without Logging:
- Debugging is difficult
- Issues are not visible
- Auditing is impossible
- Monitoring is blind

## Scope of Boundaries

Logging applies to:
- Application logging
- Structured logging
- Log levels
- Log aggregation

Logging does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Building apps
- Needing debugging
- Wanting monitoring
- Auditing events

## Tradeoffs and When to Avoid

- **Complexity**: Logging adds complexity
- **Not for simple apps**: Simple apps may not need Logging
- **Not for internal**: Internal apps may not need Logging
- **Not for all**: Not all apps need Logging

## Implementation Guidance

1. **Choose logger**: Choose logging library
2. **Define levels**: Define log levels
3. **Structure logs**: Structure logs
4. **Aggregate**: Aggregate logs
5. **Test**: Test logging

## Verification

- [ ] Logger chosen
- [ ] Levels defined
- [ ] Logs structured
- [ ] Logs aggregated
- [ ] Logging tested

## Common Misuses

- **Not choosing**: Not choosing a logger
- **Not defining**: Not defining log levels
- **Not structuring**: Not structuring logs
- **Not aggregating**: Not aggregating logs

## Related Concepts

- [[Monitoring/logging]] â€” Logging
- [[Monitoring/logging]] â€” Application Logging
- [[Monitoring/logging]] â€” Structured Logging
- [[Monitoring/logging]] â€” Log Levels

## Project Observations

The project uses Logging through:
- Logging library implementation
- Log level definition
- Structured logging
- Log aggregation

## Sources

- [[Monitoring/logging|Logging Guide]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Logging Note**
