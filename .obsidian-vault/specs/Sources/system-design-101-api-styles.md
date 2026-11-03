---
slug: system-design-101-api-styles
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - api
  - architecture
  - reference
---

# Comparing API Architectural Styles

## Overview

Reference: [Guide: a-cheatsheet-on-comparing-api-architectural-styles](https://bytebytego.com/guides/a-cheatsheet-on-comparing-api-architectural-styles)

This guide compares different API architectural styles to help choose the right approach.

## API Styles Compared

### REST (Representational State Transfer)
- Resource-based architecture
- HTTP methods (GET, POST, PUT, DELETE)
- Stateless communication
- Cacheable responses
- Example: `/api/users/123`

### GraphQL
- Query-based API
- Single endpoint
- Client specifies data needs
- Reduces over-fetching
- Example: `query { user(id: "123") { name email } }`

### gRPC (Remote Procedure Call)
- Protocol Buffers for serialization
- HTTP/2 for transport
- High performance
- Strongly typed
- Example: `UserService.GetUser(request)`

### SOAP (Simple Object Access Protocol)
- XML-based protocol
- WSDL for service description
- Built-in security (WS-Security)
- ACID compliance
- Example: XML envelope with SOAP header/body

### RPC (Remote Procedure Call)
- Procedure-oriented
- Simple interface
- Synchronous calls
- Example: `getUser(123)`

## Comparison Table

| Feature | REST | GraphQL | gRPC | SOAP | RPC |
|---------|------|---------|------|------|-----|
| **Protocol** | HTTP/1.1, HTTP/2 | HTTP/1.1, HTTP/2 | HTTP/2 | HTTP/HTTPS | Various |
| **Data Format** | JSON, XML | JSON | Protocol Buffers | XML | Various |
| **Caching** | Yes (HTTP cache) | Limited | No | No | No |
| **Performance** | Good | Good | Excellent | Poor | Good |
| **Learning Curve** | Low | Medium | High | High | Low |
| **Tooling** | Excellent | Good | Good | Good | Limited |
| **Security** | HTTPS, OAuth | HTTPS, OAuth | mTLS, OAuth | WS-Security | Varies |
| **Best For** | Public APIs | Mobile/Flexible | Internal Services | Enterprise | Simple Services |

## When to Use Each Style

### Use REST When:
- Building public APIs
- Need caching for performance
- Simple CRUD operations
- Wide client support needed

### Use GraphQL When:
- Mobile apps with bandwidth constraints
- Complex data relationships
- Multiple client types
- Need flexible queries

### Use gRPC When:
- Internal microservices communication
- High performance required
- Strongly typed contracts
- Polyglot environments

### Use SOAP When:
- Enterprise environments
- ACID transactions required
- Built-in security needed
- Legacy system integration

### Use RPC When:
- Simple procedure calls
- Internal services
- Low latency required
- Simple interfaces

## Integration with Vault

Read these vault notes for deeper understanding:

- [[api-design]] — API design principles
- [[rest-api-cheatsheet]] — REST API best practices
- [[graphql-adoption-patterns]] — GraphQL implementation
- [[microservices-architecture]] — Microservice communication
- [api-gateway-pattern](D/api-gateway-pattern.md) — API gateway patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [api-styles-guide](https://bytebytego.com/guides/a-cheatsheet-on-comparing-api-architectural-styles)
