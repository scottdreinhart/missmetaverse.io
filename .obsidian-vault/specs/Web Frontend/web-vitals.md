---
slug: web-vitals
tags:
  - core-concepts

  - frontend   - web   - ui
---

# Web Vitals

> **Purpose:** Measure web vitals with Web Vitals.
> **Last Updated:** 2026-11-03

## concept_id
`web-vitals`

## title
Web Vitals

## aliases
- Web Vitals
- Core Web Vitals
- Performance Metrics
- LCP
- FID
- CLS

## category
web-frontend

## concept_type
performance-metric

## research_status
verified

## project_adoption
declared

## applicability
- Performance measurement
- Core Web Vitals
- User experience
- SEO impact

## tags
- type/metric
- domain/frontend
- status/verified
- priority/high

## source_ids
- web-vitals-specification
- martinfowler-patterns

## related_concept_ids
- web-vitals
- core-web-vitals
- performance-metrics
- lcp-metric
- fid-metric
- cls-metric

## Definition

Web Vitals are a set of user-centric performance metrics introduced by Google that measure loading performance, interactivity, and visual stability.

## Problem Addressed

Without Web Vitals:
- Performance is not measured
- User experience is unknown
- SEO impact is unclear
- Optimization is blind

## Scope of Boundaries

Web Vitals applies to:
- Performance measurement
- Core Web Vitals
- User experience
- SEO impact

Web Vitals does not apply to:
- Backend code
- Database design
- Infrastructure
- Testing

## When to Apply

- Measuring performance
- Optimizing user experience
- Improving SEO
- Monitoring web apps

## Tradeoffs and When to Avoid

- **Complexity**: Web Vitals adds complexity
- **Not for simple apps**: Simple apps may not need Web Vitals
- **Not for internal**: Internal apps may not need Web Vitals
- **Not for all**: Not all apps need Web Vitals

## Implementation Guidance

1. **Install library**: Install web-vitals library
2. **Measure LCP**: Measure Largest Contentful Paint
3. **Measure FID**: Measure First Input Delay
4. **Measure CLS**: Measure Cumulative Layout Shift
5. **Monitor**: Monitor metrics

## Verification

- [ ] Library installed
- [ ] LCP measured
- [ ] FID measured
- [ ] CLS measured
- [ ] Metrics monitored

## Common Misuses

- **Not measuring**: Not measuring metrics
- **Not monitoring**: Not monitoring over time
- **Not optimizing**: Not optimizing based on metrics
- **Ignoring thresholds**: Ignoring recommended thresholds

## Related Concepts

- [[Web Frontend/web-vitals]] â€” Web Vitals
- [[Web Frontend/web-vitals]] â€” Core Web Vitals
- [[Web Frontend/web-vitals]] â€” Performance Metrics
- [[Web Frontend/web-vitals]] â€” LCP Metric
- [[Web Frontend/web-vitals]] â€” FID Metric
- [[Web Frontend/web-vitals]] â€” CLS Metric

## Project Observations

The project uses Web Vitals through:
- Performance measurement
- Core Web Vitals monitoring
- User experience optimization
- SEO improvement

## Sources

- [[Web Frontend/web-vitals|Web Vitals Specification]]
- [[Sources/S007-martinfowler-bliki|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Web Vitals Note**
