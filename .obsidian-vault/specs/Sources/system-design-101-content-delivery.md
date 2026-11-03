---
slug: system-design-101-content-delivery
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - cdn
  - networking
  - reference
---

# Content Delivery Network (CDN) Design

## Overview

Reference: [[system-design-101/guides/how-do-we-design-a-cdn]]

This guide covers CDN architecture, caching strategies, and edge computing.

## CDN Architecture

### Components
1. **Origin Server** — Original source of content
2. **Edge Servers** — Geographically distributed caches
3. **DNS Routing** — Directs users to nearest edge
4. **Cache Invalidation** — Updates cached content

### How It Works
1. User requests content
2. DNS resolves to nearest edge server
3. Edge server checks cache
4. Cache hit: Return content
5. Cache miss: Fetch from origin, cache, return

## CDN Caching Strategies

### Cacheable Content
- Static assets (images, CSS, JS)
- Video/audio streams
- API responses (with TTL)
- Dynamic content (edge computing)

### Cache Invalidation
- TTL-based expiration
- Purge on update
- Versioned URLs
- Stale-while-revalidate

## Implementation Example

### CDN Cache Header Strategy

```typescript
// cdn/cache-headers.ts
export const cacheStrategies = {
  // Static assets: Cache for 1 year
  staticAssets: {
    'Cache-Control': 'public, max-age=31536000, immutable',
  },

  // HTML: Short cache
  html: {
    'Cache-Control': 'public, max-age=300, stale-while-revalidate=3600',
  },

  // API: No cache
  api: {
    'Cache-Control': 'no-cache, no-store, must-revalidate',
  },

  // Images: Medium cache
  images: {
    'Cache-Control': 'public, max-age=86400',
  },
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[cdn-patterns]] — CDN patterns
- [[caching-strategies]] — Caching patterns
- [[performance-optimization]] — Performance optimization

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-a-cdn|cdn-guide]]
