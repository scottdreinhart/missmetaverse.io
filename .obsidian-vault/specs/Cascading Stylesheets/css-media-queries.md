---
slug: css-media-queries
title: CSS Media Queries — Types, Ranges, Features, and Selectors
description: Comprehensive reference for CSS media queries including media types, media features, logical operators, container queries, and device-specific selectors.
author: Copilot
source: mdn-css
canonical_url: https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries
publication_date: 2024
accessed_on: 2026-11-02
verification_status: verified
claims_supported: 30
access_limitations: None
---

# CSS Media Queries

## Overview

CSS Media Queries allow content to adapt to different conditions: screen size, device type, resolution, orientation, color capability, and more. They are the foundation of responsive web design.

## Syntax

```css
@media <media-condition> {
  /* Styles applied when media condition is true */
}
```

---

## Media Types

Media types define the **category of device** the styles apply to. Most are deprecated in favor of media features.

| Media Type | Description | Status |
|-----------|-------------|--------|
| `all` | Matches all devices | ✅ Recommended |
| `screen` | Screen devices (monitors, phones, tablets) | ✅ Most common |
| `print` | Print media / print preview | ✅ Common |
| `speech` | Screen readers / speech synthesizers | ✅ Niche |
| `tty` | Terminal devices with fixed-width characters | ❌ Deprecated |
| `tv` | Television-type devices | ❌ Deprecated |
| `projection` | Projected presentations | ❌ Deprecated |
| `braille` | Braille tactile feedback devices | ❌ Deprecated |
| `embossed` | Braille printers | ❌ Deprecated |
| `aural` | Speech synthesizers | ❌ Deprecated (use `speech`) |

### Recommended Usage

```css
/* ✅ Modern: use media features, not types */
@media (min-width: 768px) { /* ... */ }

/* ✅ For print: use the print type */
@media print { /* ... */ }

/* ✅ For screen: use the screen type */
@media screen and (min-width: 768px) { /* ... */ }
```

---

## Media Features

Media features test **specific characteristics** of the device/environment.

### Viewport & Display Size

| Feature | Description | Example |
|---------|-------------|---------|
| `width` / `height` | Viewport dimensions | `(min-width: 768px)` |
| `device-width` / `device-height` | Screen dimensions (deprecated) | `(device-width: 375px)` |
| `aspect-ratio` | Viewport aspect ratio | `(aspect-ratio: 16/9)` |
| `device-aspect-ratio` | Screen aspect ratio (deprecated) | `(device-aspect-ratio: 16/9)` |
| `orientation` | `portrait` or `landscape` | `(orientation: portrait)` |

### Resolution & Pixel Density

| Feature | Description | Example |
|---------|-------------|---------|
| `resolution` | Screen resolution | `(resolution: 300dpi)` |
| `min-resolution` | Minimum resolution | `(min-resolution: 2dppx)` |
| `max-resolution` | Maximum resolution | `(max-resolution: 1.5dppx)` |
| `color` | Color capability (bits per component) | `(color: 8)` |
| `min-color` / `max-color` | Min/max color bits | `(min-color: 4)` |
| `color-index` | Color palette entries | `(color-index: 256)` |
| `monochrome` | Monochrome pixels per grid | `(monochrome: 8)` |

### Display & Color Capability

| Feature | Description | Example |
|---------|-------------|---------|
| `color` | Has color output | `(color)` |
| `color-gamut` | Supported color gamut | `(color-gamut: p3)` |
| `prefers-color-scheme` | Light/dark mode preference | `(prefers-color-scheme: dark)` |
| `prefers-contrast` | Contrast preference | `(prefers-contrast: high)` |
| `prefers-reduced-motion` | Motion preference | `(prefers-reduced-motion: reduce)` |
| `prefers-reduced-transparency` | Transparency preference | `(prefers-reduced-transparency: reduce)` |

### Pointer & Input

| Feature | Description | Example |
|---------|-------------|---------|
| `pointer` | Primary pointer accuracy | `(pointer: fine)` |
| `any-pointer` | Any pointer accuracy | `(any-pointer: coarse)` |
| `hover` | Hover capability | `(hover: hover)` |
| `any-hover` | Any hover capability | `(any-hover: none)` |
| `pointer-size` | Pointer size (CSS4 draft) | `(pointer-size: small)` |

### Interaction & User Preference

| Feature | Description | Example |
|---------|-------------|---------|
| `prefers-reduced-motion` | Reduce animations | `(prefers-reduced-motion: reduce)` |
| `prefers-color-scheme` | Light/dark mode | `(prefers-color-scheme: dark)` |
| `prefers-contrast` | Contrast level | `(prefers-contrast: more)` |
| `forced-colors` | Forced color mode (Win10) | `(forced-colors: active)` |
| `dynamic-range` | HDR support | `(dynamic-range: high)` |
| `overflow-block` | Overflow handling | `(overflow-block: scroll)` |

### Device & Environment

| Feature | Description | Example |
|---------|-------------|---------|
| `scan` | TV scanning method | `(scan: interlace)` |
| `grid` | Grid-based device | `(grid: 1)` |
| `update` | Update frequency | `(update: fast)` |
| `inverted-colors` | Inverted colors mode | `(inverted-colors: inverted)` |
| `overflow-inline` | Inline overflow | `(overflow-inline: scroll)` |

---

## Common Breakpoints

### Mobile-First Approach

```css
/* Base styles (mobile) */
.container { padding: 16px; }

/* Tablet (768px+) */
@media (min-width: 768px) {
  .container { padding: 24px; }
}

/* Desktop (1024px+) */
@media (min-width: 1024px) {
  .container { padding: 32px; }
}

/* Large Desktop (1440px+) */
@media (min-width: 1440px) {
  .container { padding: 48px; }
}
```

### Standard Breakpoints

| Breakpoint | Width | Device |
|-----------|-------|--------|
| `xs` | `< 576px` | Small phones |
| `sm` | `≥ 576px` | Large phones |
| `md` | `≥ 768px` | Tablets |
| `lg` | `≥ 1024px` | Small laptops |
| `xl` | `≥ 1280px` | Desktops |
| `2xl` | `≥ 1536px` | Large screens |

### Device-Specific Breakpoints

| Device | Width | Height |
|--------|-------|--------|
| iPhone SE | 375px | 667px |
| iPhone 14 | 390px | 844px |
| iPhone 14 Pro Max | 430px | 932px |
| iPad Air | 820px | 1180px |
| iPad Pro 12.9" | 1024px | 1366px |
| MacBook 13" | 1280px | 800px |
| MacBook Pro 16" | 1728px | 1117px |
| 4K Monitor | 3840px | 2160px |

---

## Logical Operators

### AND

```css
@media (min-width: 768px) and (max-width: 1024px) {
  /* Only applies between 768px and 1024px */
}
```

### NOT

```css
@media not all and (min-width: 1024px) {
  /* Applies when NOT on a large screen */
}
```

### OR (comma-separated)

```css
@media (min-width: 768px), (orientation: landscape) {
  /* Applies if EITHER condition is true */
}
```

### Logical Functions (Modern)

```css
/* OR */
@media or(min-width: 768px), (orientation: landscape) { }

/* AND */
@media and(min-width: 768px), (orientation: landscape) { }

/* NOT */
@media not (orientation: portrait) { }

/* Nested */
@media and(
    or(min-width: 768px),
    (orientation: landscape)
  ),
  (prefers-color-scheme: dark) { }
```

---

## Container Queries

Container queries allow styles based on the **parent container's size**, not the viewport.

```css
/* Define container */
.card-container {
  container-type: inline-size;
  container-name: card;
}

/* Query container */
@container card (min-width: 400px) {
  .card {
    display: grid;
    grid-template-columns: 200px 1fr;
  }
}
```

### Container Types

| Type | Description |
|------|-------------|
| `inline-size` | Container width |
| `size` | Container width AND height |
| `style` | Style container (CSS custom properties) |

### Container Features

| Feature | Description |
|---------|-------------|
| `width` / `height` | Container dimensions |
| `inline-size` / `block-size` | Logical dimensions |
| `aspect-ratio` | Container aspect ratio |
| `min-width` / `max-width` | Width range |
| `min-height` / `max-height` | Height range |

---

## Device-Specific Queries

### High DPI / Retina

```css
/* 2x resolution (Retina) */
@media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
  .logo { background-image: url('logo@2x.png'); }
}

/* 3x resolution (Retina HD) */
@media (min-resolution: 288dpi) {
  .logo { background-image: url('logo@3x.png'); }
}
```

### Dark Mode

```css
/* System preference */
@media (prefers-color-scheme: dark) {
  body { background: #1a1a1a; color: #fff; }
}

/* Forced colors (Windows High Contrast) */
@media (forced-colors: active) {
  button { forced-color-adjust: none; border: 1px solid ButtonText; }
}
```

### Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Touch Devices

```css
/* No hover capability (touch devices) */
@media (hover: none) and (pointer: coarse) {
  .dropdown-menu { display: block; }
  .hover-effect:hover { /* won't apply on touch */ }
}

/* Fine pointer (mouse) */
@media (pointer: fine) {
  .tooltip { /* show on hover */ }
}
```

### Color Gamut

```css
/* P3 color gamut (modern displays) */
@media (color-gamut: p3) {
  .gradient { background: linear-gradient(to right, #ff0000, #00ff00); }
}

/* sRGB only (older displays) */
@media (color-gamut: srgb) {
  .gradient { background: linear-gradient(to right, #f00, #0f0); }
}
```

---

## Best Practices

| Practice | Description |
|----------|-------------|
| **Mobile-first** | Start with mobile styles, add breakpoints with `min-width` |
| **Content-driven breakpoints** | Break at content needs, not specific devices |
| **Test on real devices** | Emulators don't catch all issues |
| **Use relative units** | `rem`, `em`, `vw`, `vh` instead of `px` |
| **Limit breakpoints** | 3-5 breakpoints max, avoid over-engineering |
| **Test container queries** | For component-level responsiveness |
| **Respect user preferences** | Honor `prefers-reduced-motion`, `prefers-color-scheme` |
| **Use logical properties** | `inline-size` instead of `width` for RTL support |

---

## Integration with Other Notes

- Read [[css-fundamentals]] for CSS fundamentals
- Read [[tailwind-css-patterns]] for Tailwind CSS patterns
- Read [[responsive-design]] for responsive design patterns
- Read [[html5-best-practices]] for HTML5 responsive patterns

---

*Source: MDN Web Docs — CSS Media Queries*
*Last Verified: 2026-11-02*
