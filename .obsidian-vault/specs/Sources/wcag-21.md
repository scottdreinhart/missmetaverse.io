---
slug: wcag-21
title: WCAG 2.1 — Web Content Accessibility Guidelines
description: W3C Web Content Accessibility Guidelines 2.1 — the international standard for web accessibility covering perceivable, operable, understandable, and robust content.
author: Copilot
source: w3c-wai
canonical_url: https://www.w3.org/TR/WCAG21/
publication_date: 2018-06-05
accessed_on: 2026-11-02
verification_status: verified
claims_supported: 25
access_limitations: Free public standard
---

# WCAG 2.1 — Web Content Accessibility Guidelines

## Overview

WCAG 2.1 is the **W3C Web Content Accessibility Guidelines 2.1**, the international standard for making web content accessible to people with disabilities. It builds on WCAG 2.0 with 17 additional success criteria focused on mobile and low-vision accessibility.

## Conformance Levels

| Level | Description | Requirement |
|-------|-------------|-------------|
| **A** | Minimum | Critical accessibility barriers removed |
| **AA** | Recommended | Standard accessibility (legal requirement in many jurisdictions) |
| **AAA** | Enhanced | Maximum accessibility |

## Four Principles (POUR)

### 1. Perceivable

Information and UI components must be presentable to users in ways they can perceive.

| Success Criterion | Level | Description |
|------------------|-------|-------------|
| 1.1 Non-text Content | A | All non-text content has text alternatives |
| 1.2 Time-based Media | A | Alternatives for audio/video content |
| 1.3 Adaptable | A | Content can be presented in different ways without losing meaning |
| 1.4 Distinguishable | A | Visual and auditory presentation is distinguishable |

### 2. Operable

UI components and navigation must be operable by all users.

| Success Criterion | Level | Description |
|------------------|-------|-------------|
| 2.1 Keyboard | A | All functionality available via keyboard |
| 2.2 Timing | A | Users have enough time to read and use content |
| 2.3 Seizures | A | No content that causes seizures (3 flashes/sec) |
| 2.4 Navigable | A | Ways to find content, navigate, locate pages |
| 2.5 Input Modalities | AA | Target size, pointer gestures, drag gestures |

### 3. Understandable

Information and UI operation must be understandable.

| Success Criterion | Level | Description |
|------------------|-------|-------------|
| 3.1 Readable | A | Language of content is programmatically determinable |
| 3.2 Predictable | A | Pages behave predictably |
| 3.3 Input Assistance | A | Help users avoid and correct mistakes |

### 4. Robust

Content must be robust enough to work with current and future assistive technologies.

| Success Criterion | Level | Description |
|------------------|-------|-------------|
| 4.1 Compatible | A | Maximize compatibility with assistive technologies |

## WCAG 2.1 Additions (over 2.0)

| Criterion | Level | Focus |
|-----------|-------|-------|
| 1.4.10 Re-flow | AA | Content reflows at 320px without horizontal scrolling |
| 1.4.11 Non-text Contrast | AA | UI components and focus indicators have 3:1 contrast |
| 1.4.12 Text Spacing | AA | Users can adjust spacing without content loss |
| 1.4.13 Content on Hover or Focus | AA | Hoverable/focusable content remains visible |
| 2.1.2 No Keyboard Trap | A | Users can navigate away from focus traps |
| 2.5.1 Pointer Gestures | AA | Single pointer gestures, not multi-pointer/multi-touch |
| 2.5.2 Pointer Cancellation | A | Lift-up cancels actions, or confirms with lift-up |
| 2.5.3 Label in Name | A | Visible label matches accessible name |
| 2.5.4 Motion Actuation | A | Functionality not activated by motion sensor alone |

## Legal Framework

| Jurisdiction | Requirement | Reference |
|-------------|-------------|-----------|
| **USA** | ADA Title III, Section 508 | WCAG 2.1 AA |
| **EU** | EN 301 549, EAA | WCAG 2.1 AA |
| **Canada** | Accessible Canada Act | WCAG 2.1 AA |
| **Australia** | DDA 1992 | WCAG 2.1 AA |
| **UK** | Equality Act 2010 | WCAG 2.1 AA |

## Testing Tools

| Tool | Purpose | Platform |
|------|---------|----------|
| **axe DevTools** | Automated a11y testing | Chrome, Firefox, VS Code |
| **WAVE** | Visual feedback on a11y issues | Chrome, Firefox |
| **Lighthouse** | Performance + a11y audit | Chrome DevTools |
| **Pa11y** | CLI a11y testing | Node.js |
| **NVDA** | Screen reader testing | Windows |
| **VoiceOver** | Screen reader testing | macOS, iOS |
| **TalkBack** | Screen reader testing | Android |

## Key Metrics

| Metric | Target |
|--------|--------|
| Color contrast ratio (normal text) | 4.5:1 minimum |
| Color contrast ratio (large text) | 3:1 minimum |
| Target size (touch) | 24x24 CSS pixels minimum |
| Focus indicator visibility | Clearly visible |
| Keyboard navigation | All interactive elements reachable |
| Alt text | All meaningful images have alt text |
| Form labels | All form inputs have associated labels |
| Heading hierarchy | Logical h1 → h2 → h3 structure |

---

*Source: W3C Web Accessibility Initiative (WAI)*
*Last Verified: 2026-11-02*
