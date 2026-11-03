---
slug: system-design-101-api-web-development
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - system-design
  - api
  - web-development
  - reference
---

# API & Web Development — Complete ByteByteGo Guide Index

## Overview

Reference: [Guide: api-web-development](https://bytebytego.com/guides/api-web-development)

This category covers all API and web development guides from ByteByteGo System Design 101.

## API Design Guides

### API Fundamentals
| Guide | Slug | Description |
|-------|------|-------------|
| [REST API Cheatsheet](https://bytebytego.com/guides/rest-api-cheatsheet) | `system-design-101-rest-cheatsheet` | REST principles |
| [REST API vs GraphQL](https://bytebytego.com/guides/rest-api-vs-graphql) | `system-design-101-rest-vs-graphql` | API comparison |
| [SOAP vs REST vs GraphQL vs RPC](https://bytebytego.com/guides/soap-vs-rest-vs-graphql-vs-rpc) | `system-design-101-api-styles` | API style comparison |
| [API Protocols 2023](https://bytebytego.com/guides/the-evolving-landscape-of-api-protocols-in-2023) | `system-design-101-api-protocols` | API protocol evolution |
| [Ultimate API Learning Roadmap](https://bytebytego.com/guides/the-ultimate-api-learning-roadmap) | `system-design-101-api-roadmap` | API learning guide |
| [Effective and Safe APIs](https://bytebytego.com/guides/how-do-we-design-effective-and-safe-apis) | `system-design-101-effective-apis` | API best practices |
| [API Pagination](https://bytebytego.com/guides/how-do-we-perform-pagination-in-api-design) | `system-design-101-pagination` | Pagination techniques |
| [What do Version Numbers Mean?](https://bytebytego.com/guides/what-do-version-numbers-mean) | `system-design-101-versioning` | Semantic versioning |

### HTTP & Protocols
| Guide | Slug | Description |
|-------|------|-------------|
| [HTTP/1 → HTTP/2 → HTTP/3](https://bytebytego.com/guides/http1-http2-http3) | `system-design-101-http-evolution` | HTTP evolution |
| [What makes HTTP2 Faster](https://bytebytego.com/guides/what-makes-http2-faster-than-http1) | `system-design-101-http2-fast` | HTTP2 features |
| [HTTP Status Codes](https://bytebytego.com/guides/http-status-code-you-should-know) | `system-design-101-status-codes` | Status code categories |
| [Top 9 HTTP Methods](https://bytebytego.com/guides/top-9-http-request-methods) | `system-design-101-http-methods` | HTTP methods |
| [HTTP Headers](https://bytebytego.com/guides/important-things-about-http-headers-you-may-not-know) | `system-design-101-http-headers` | HTTP headers |
| [5 Quirky HTTP Status Codes](https://bytebytego.com/guides/5-http-status-codes-that-should-never-have-been-created) | `system-design-101-quirky-status` | Unusual status codes |
| [URL, URI, URN](https://bytebytego.com/guides/url-uri-urn-do-you-know-the-differences) | `system-design-101-url-uri` | URL vs URI vs URN |

### API Gateway & Load Balancing
| Guide | Slug | Description |
|-------|------|-------------|
| [What Does API Gateway Do?](https://bytebytego.com/guides/what-does-api-gateway-do) | `system-design-101-api-gateway` | API gateway functions |
| [Top 3 API Gateway Use Cases](https://bytebytego.com/guides/top-3-api-gateway-use-cases) | `system-design-101-api-gateway-use` | API gateway patterns |
| [Reverse Proxy vs API Gateway vs LB](https://bytebytego.com/guides/reverse-proxy-vs-api-gateway-vs-load-balancer) | `system-design-101-proxy-gateway-lb` | Infrastructure comparison |
| [Load Balancer vs API Gateway](https://bytebytego.com/guides/what-are-the-differences-between-a-load-balancer-and-an-api-gateway) | `system-design-101-lb-vs-gateway` | LB vs Gateway |
| [Key Use Cases for Load Balancers](https://bytebytego.com/guides/key-use-cases-for-load-balancers) | `system-design-101-lb-use-cases` | Load balancer patterns |
| [Load Balancer Realistic Use Cases](https://bytebytego.com/guides/load-balancer-realistic-use-cases-you-may-not-know) | `system-design-101-lb-realistic` | Realistic LB patterns |
| [What is a Load Balancer?](https://bytebytego.com/guides/what-is-a-load-balancer) | `system-design-101-what-lb` | Load balancer fundamentals |

### Web Development
| Guide | Slug | Description |
|-------|------|-------------|
| [Polling vs Webhooks](https://bytebytego.com/guides/polling-vs-webhooks) | `system-design-101-polling-webhooks` | Data retrieval methods |
| [Short/Long Polling, SSE, WebSocket](https://bytebytego.com/guides/shortlong-polling-sse-websocket) | `system-design-101-realtime` | Real-time updates |
| [Proxy vs Reverse Proxy](https://bytebytego.com/guides/proxy-vs-reverse-proxy) | `system-design-101-proxy` | Proxy types |
| [Unicast vs Broadcast vs Multicast vs Anycast](https://bytebytego.com/guides/unicast-vs-broadcast-vs-multicast-vs-anycast) | `system-design-101-unicast` | Network transmission |
| [WAN, LAN, PAN, MAN](https://bytebytego.com/guides/what-are-the-differences-between-wan-lan-pan-and-man) | `system-design-101-network-types` | Network types |
| [NAT Enabled Internet](https://bytebytego.com/guides/nat-made-the-growth-of-the-internet-possible) | `system-design-101-nat` | NAT mechanics |
| [Internet Traffic Routing](https://bytebytego.com/guides/internet-traffic-routing-policies) | `system-design-101-routing` | Routing policies |
| [What is CSS?](https://bytebytego.com/guides/what-is-css-cascading-style-sheets) | `system-design-101-css` | CSS fundamentals |

## Integration with Vault

Read these vault notes for deeper understanding:

- [rest-api-design](D/rest-api-design.md) — REST API design patterns
- [[graphql-api-design]] — GraphQL API design
- [api-gateway](D/api-gateway.md) — API gateway patterns
- [[versioning-strategies]] — API versioning strategies
- [rate-limiting](D/rate-limiting.md) — Rate limiting patterns

## Citation Format

All guides use the citation format:
- `system-design-101/api-web-development/<guide-name>` — Citation slug for verification
- Original source: https://bytebytego.com/


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


