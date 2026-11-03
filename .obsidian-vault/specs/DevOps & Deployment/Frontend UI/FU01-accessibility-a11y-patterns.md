---
slug: accessiblity-a11y-patterns.md
sources:
  - https://www.w3.org/WAI/
  - https://react.dev/
date: 2026-11-02
tags:












  - accessibility
  - a11y
  - frontend-patterns
  - react
---

## Sources

- [[Sources/wcag-21|wcag-21]]

# Accessibility (a11y) Patterns

## Definition

Accessibility Patterns are **design patterns for building inclusive user interfaces that work for all users, including those with disabilities**.

> "Web accessibility means that websites, tools, and technologies are designed and developed so that people with disabilities can use them." — W3C WAI

## Problem Addressed

Without accessibility patterns:
- **Exclusion**: Users with disabilities can't use the application
- **Legal**: May violate accessibility regulations (WCAG, ADA, EAA)
- **SEO**: Poor accessibility often correlates with poor SEO
- **UX**: Accessibility improvements benefit all users

## Scope and Boundaries

- Accessibility Patterns ≠ Accessibility (accessibility patterns are patterns, accessibility is a feature)
- Accessibility Patterns = Performance (accessibility patterns are patterns, performance is a feature)
- Accessibility Patterns is a **feature**, not a pattern

## When to Apply

- When building user interfaces
- when accessibility compliance matters (WCAG 2.1 AA minimum)
- when inclusive design is important
- when legal compliance is required

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Accessibility adds complexity to markup and styling |
| **Time** — Accessibility testing requires specialized tools and users |
| **Over-accessibility** — Don't add unnecessary complexity for marginal gains |

## Common Misuses

- **Accessibility as an afterthought**: Must be designed in from the start
- **Automated testing only**: Automated tools catch ~30% of issues; manual testing is essential
- **Confusing accessibility with accessibility tools**: Tools help but don't replace design

## Related Concepts

- [Design Systems](Frontend%20UI/design-systems-patterns.md) — Design systems provide accessibility foundations
- [Headless UI](Frontend%20UI/headless-ui-pattern-patterns.md) — Headless UI libraries provide accessible foundations
- [HTML Semantic Patterns](CSS%20UI/html-semantic-patterns.md) — Semantic HTML is the foundation of accessibility

## Project Observations

- The project uses accessibility patterns:
  - Tailwind CSS supports accessibility utilities (focus rings, screen reader classes)
  - shadcn/ui components are built on Radix UI which provides accessibility
  - React's accessibility APIs (aria-*) are available
  - No evidence of accessibility patterns in existing code (src/ is empty)
- File naming conventions support accessibility:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Accessibility Pattern Selection

```mermaid
graph TD
    A[Need accessibility pattern?]\n    A --> B{What issue?}
    B -->|Keyboard nav| C[Focus management]
    B -->|Screen reader| D[ARIA labels]
    B -->|Color contrast| E[Contrast ratios]
    B -->|Forms| F[Form labels]
    B -->|Images| G[Alt text]
    B -->|Motion| H[Reduced motion]
    C --> I{Custom component?}
    I -->|Yes| J[Tabindex + keydown]
    I -->|No| K[Use semantic HTML]
    D --> L{Landmark?}
    L -->|Yes| M[Role attributes]
    L -->|No| N[aria-label]
```

### When to Use Each Accessibility Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Focus management** | Custom interactive elements | tabindex="0" |
| **ARIA labels** | Screen reader support | aria-label="Close" |
| **Alt text** | Informative images | alt="Chart description" |
| **Form labels** | Form inputs | <label for="email"> |
| **Skip links** | Navigation | Skip to main content |
| **Reduced motion** | Animations | prefers-reduced-motion |

---

## Procedural Guidance: Accessibility Implementation

### Step 1: Semantic HTML

```html
<!-- ✅ Good: Semantic HTML -->
<nav aria-label="Main navigation">
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>

<main>
  <h1>Page Title</h1>
  <p>Page content</p>
</main>

<!-- ❌ Bad: Divs for everything -->
<div class="nav">
  <div class="link">Home</div>
</div>
```

### Step 2: ARIA Labels

```html
<!-- Button with icon only -->
<button aria-label="Close dialog">
  <svg><!-- icon --></svg>
</button>

<!-- Search input -->
<div role="search">
  <input type="search" aria-label="Search site" />
</div>

<!-- Live region for dynamic content -->
<div aria-live="polite" aria-atomic="true">
  {notificationMessage}
</div>
```

### Step 3: Focus Management

```typescript
// components/FocusTrap.tsx
import { useEffect, useRef } from 'react'

export function FocusTrap({ children }: { children: React.ReactNode }) {
  const containerRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const container = containerRef.current
    if (!container) return

    const focusableElements = container.querySelectorAll(
      'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
    )
    const firstElement = focusableElements[0] as HTMLElement
    const lastElement = focusableElements[focusableElements.length - 1] as HTMLElement

    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key !== 'Tab') return

      if (e.shiftKey) {
        if (document.activeElement === firstElement) {
          e.preventDefault()
          lastElement.focus()
        }
      } else {
        if (document.activeElement === lastElement) {
          e.preventDefault()
          firstElement.focus()
        }
      }
    }

    container.addEventListener('keydown', handleKeyDown)
    firstElement?.focus()

    return () => container.removeEventListener('keydown', handleKeyDown)
  }, [])

  return <div ref={containerRef} tabIndex={-1}>{children}</div>
}
```

### Step 4: Color Contrast

```css
/* ✅ WCAG AA compliant (4.5:1 for normal text) */
.text-primary {
  color: #1a1a1a; /* #1a1a1a on #ffffff = 18.5:1 */
}

/* ✅ WCAG AA compliant for large text (3:1) */
.text-large {
  color: #4a4a4a; /* #4a4a4a on #ffffff = 8.8:1 */
}

/* ❌ Fails contrast */
.text-light {
  color: #999999; /* #999999 on #ffffff = 2.8:1 */
}
```

### Step 5: Reduced Motion

```css
/* Respect user's motion preferences */
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}

/* Animated element */
.animate-fade-in {
  animation: fadeIn 0.3s ease-in;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
```

### Step 6: Form Accessibility

```html
<form>
  <div>
    <label for="email">Email Address</label>
    <input
      type="email"
      id="email"
      name="email"
      required
      aria-required="true"
      aria-describedby="email-help"
      autocomplete="email"
    />
    <span id="email-help" class="help-text">We'll never share your email.</span>
    <span class="error" role="alert" aria-live="assertive">
      {emailError}
    </span>
  </div>

  <div>
    <label for="password">Password</label>
    <input
      type="password"
      id="password"
      name="password"
      required
      aria-required="true"
      aria-describedby="password-help password-requirements"
      autocomplete="new-password"
    />
    <div id="password-requirements" class="help-text">
      <ul>
        <li>At least 8 characters</li>
        <li>One uppercase letter</li>
        <li>One number</li>
      </ul>
    </div>
  </div>

  <button type="submit">Sign Up</button>
</form>
```

---

## Copilot Instructions

### When to Read This Note
- Building accessible user interfaces
- Implementing ARIA labels
- Managing focus in custom components
- Ensuring color contrast compliance
- Creating accessible forms

### What to Do With This Information
1. **Semantic HTML**: Use semantic elements instead of divs
2. **ARIA labels**: Add ARIA where semantic HTML is insufficient
3. **Focus management**: Trap focus in modals, manage focus on navigation
4. **Color contrast**: Ensure 4.5:1 ratio for normal text, 3:1 for large text
5. **Reduced motion**: Honor prefers-reduced-motion

### Tools to Use
- **Browser Extension**: axe DevTools — for accessibility testing
- **Browser Extension**: WAVE — for accessibility evaluation
- **Browser Extension**: Lighthouse — for accessibility audit
- **VS Code Extension**: Error Lens — for inline accessibility errors
- **Terminal Command**: `npx pa11y https://localhost:3000` — run accessibility tests
- **Terminal Command**: `npx lighthouse https://localhost:3000 --categories accessibility` — run audit

### Agents to Invoke
- **Code Review Agent**: Run when reviewing PRs with UI changes
- **Security Review Agent**: Run when adding forms

### Integration with Other Notes
- Read [accessibility-a11y](D/accessibility-a11y.md) for accessibility best practices
- Read [accessibility-by-design](D/accessibility-by-design.md) for accessibility by design patterns
- Read [html5-best-practices](D/html5-best-practices.md) for HTML5 accessibility patterns
- Read [[ShadCN/shadcn-ui-patterns]] for shadcn/ui accessibility
- Read [wcag-21](D/wcag-21.md) for WCAG 2.1 guidelines

### Common Pitfalls
- Don't use accessibility as an afterthought (design in from start)
- Don't rely only on automated testing (manual testing is essential)
- Don't skip keyboard navigation (test with Tab/Escape)
- Don't use divs for everything (use semantic HTML)
- Don't forget focus management (trap focus in modals)

### Quick Validation Checklist
- [ ] Are semantic HTML elements used?
- [ ] Do all images have alt text?
- [ ] Are form inputs labeled?
- [ ] Can the page be navigated with keyboard only?
- [ ] Is color contrast WCAG AA compliant?
- [ ] Is prefers-reduced-motion honored?
- [ ] Are ARIA labels used where needed?
- [ ] Is focus managed in modals/dialogs?



