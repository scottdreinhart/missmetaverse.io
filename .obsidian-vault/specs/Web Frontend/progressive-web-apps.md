---
slug: progressive-web-apps
tags:
  - frontend   - web   - ui
---

# Progressive Web Apps

> **Purpose:** Build PWAs with service workers.
> **Last Updated:** 2026-11-03

## concept_id
`progressive-web-apps`

## title
Progressive Web Apps

## aliases
- PWA
- Progressive Web App
- Service Workers
- Web App Manifest

## category
web-frontend

## concept_type
web-technology

## research_status
verified

## project_adoption
declared

## applicability
- Offline support
- Push notifications
- App-like experience
- Cross-platform

## tags
- type/technology
- domain/frontend
- status/verified
- priority/high

## source_ids
- pwa-specification
- martinfowler-patterns

## related_concept_ids
- progressive-web-apps
- service-workers
- web-app-manifest
- offline-support

## Definition

Progressive Web Apps are web applications that use modern web capabilities to deliver an app-like experience, including offline support and push notifications.

## Problem Addressed

Without PWA:
- No offline support
- No push notifications
- App-like experience is missing
- Cross-platform is difficult

## Scope of Boundaries

PWA applies to:
- Offline support
- Push notifications
- App-like experience
- Cross-platform

PWA does not apply to:
- Native apps
- Backend code
- Database design
- Infrastructure

## When to Apply

- Building web apps
- Needing offline support
- Wanting push notifications
- Cross-platform needs

## Tradeoffs and When to Avoid

- **Browser support**: PWA requires modern browsers
- **Not for native**: Native apps may be better
- **Not for complex**: Complex apps may need native
- **Not for all**: Not all apps need PWA

## Implementation Guidance

1. **Add manifest**: Add web app manifest
2. **Register service worker**: Register service worker
3. **Cache assets**: Cache assets for offline
4. **Handle push**: Handle push notifications
5. **Test**: Test PWA features

## Verification

- [ ] Manifest added
- [ ] Service worker registered
- [ ] Assets cached
- [ ] Push handled
- [ ] Features tested

## Common Misuses

- **Not testing**: Not testing PWA features
- **Not caching**: Not caching assets
- **Not handling push**: Not handling push notifications
- **Ignoring support**: Ignoring browser support

## Related Concepts

- [[Web Frontend/progressive-web-apps]] â€” Progressive Web Apps
- [[Web Frontend/progressive-web-apps]] â€” Service Workers
- [[Web Frontend/progressive-web-apps]] â€” Web App Manifest
- [[Web Frontend/progressive-web-apps]] â€” Offline Support

## Project Observations

The project uses Progressive Web Apps through:
- Web app manifest
- Service worker registration
- Asset caching
- Push notification handling

## Sources

- [[Sources/pwa-specification|PWA Specification]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Progressive Web Apps Note**
