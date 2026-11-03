---
slug: system-design-101-real-world-case-studies
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - case-studies
  - architecture
  - reference
---

# Real-World System Design Case Studies

## Overview

Reference: [[system-design-101/guides/how-do-we-design-real-world-systems]]

This guide covers real-world system design examples and lessons learned.

## Case Study 1: URL Shortener (Bitly)

### Requirements
- Shorten long URLs
- Redirect to original URL
- Track click analytics
- Expiration support

### Design
- Hash function for short codes
- Database for URL mapping
- 302 redirect for temporary redirects
- Analytics service for tracking

### Key Decisions
- Base62 encoding for short codes
- Distributed ID generation
- Caching for popular URLs

## Case Study 2: Social Network Feed (Twitter)

### Requirements
- Post tweets
- Follow/unfollow users
- Timeline with tweets from followed users
- Real-time updates

### Design Options

**Fan-out on Write** (Twitter's original approach):
- Push tweets to followers' timelines
- Fast reads, slow writes
- Works well for most users

**Fan-out on Read** (for celebrities):
- Fetch followed tweets on demand
- Slow reads, fast writes
- Used for users with many followers

### Key Decisions
- Hybrid approach for scalability
- Redis for timeline caching
- Kafka for event streaming

## Case Study 3: E-commerce Platform (Amazon)

### Requirements
- Product catalog
- Shopping cart
- Order management
- Payment processing
- Inventory management

### Design
- Microservices architecture
- Event-driven order processing
- Distributed inventory management
- CDN for product images

### Key Decisions
- CQRS for order management
- Event sourcing for audit trail
- Multi-region deployment

## Case Study 4: Video Streaming (YouTube)

### Requirements
- Upload videos
- Transcode to multiple formats
- Stream to users globally
- Track views and analytics

### Design
- CDN for video distribution
- Adaptive bitrate streaming
- Distributed transcoding pipeline
- Analytics at edge

### Key Decisions
- HLS/DASH for adaptive streaming
- Edge caching for popular videos
- Batch processing for analytics

## Case Study 5: Ride-Sharing (Uber)

### Requirements
- Match riders with drivers
- Real-time location tracking
- Route optimization
- Payment processing

### Design
- Geospatial indexing (GeoHash)
- WebSocket for real-time updates
- Event-driven architecture
- Multi-layer caching

### Key Decisions
- Redis Geo for location tracking
- Kafka for event streaming
- Machine learning for ETA prediction

## Lessons Learned

### Common Patterns
1. **Start simple, scale later** — Don't over-engineer early
2. **Cache aggressively** — Most systems are read-heavy
3. **Design for failure** — Assume components will fail
4. **Monitor everything** — You can't improve what you don't measure
5. **Automate operations** — Manual processes don't scale

### Common Anti-Patterns
1. **Single point of failure** — Always have redundancy
2. **Tight coupling** — Services should be loosely coupled
3. **No monitoring** — Blind deployments are risky
4. **Ignoring security** — Security can't be an afterthought
5. **Over-optimization** — Optimize based on data, not assumptions

## Integration with Vault

Read these vault notes for deeper understanding:

- [[microservices]] — Microservices architecture
- [[event-driven-architecture]] — Event-driven patterns
- [[scalability-strategies]] — Scalability patterns
- [[architecture-patterns]] — Architecture patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-real-world-systems|case-studies-guide]]
