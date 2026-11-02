---
slug: html5-best-practices
sources:
  - https://developer.mozilla.org/en-US/docs/Glossary/HTML5
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta
  - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe
  - https://developer.mozilla.org/en-US/docs/Web/Accessibility
date: 2025-01-15
tags:
  - html5
  - accessibility
  - seo
  - security
  - semantic-html
  - best-practices
---

# HTML5: Best Practices, Security & Performance

## Overview

HTML5 is the current HTML standard, introducing semantic elements, modern forms, multimedia support, Web Components, and improved accessibility features.

## Semantic HTML Elements

### Main Root Elements

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
</head>
<body>
  <!-- Content -->
</body>
</html>
```

### Document Metadata

```html
<head>
  <!-- Character encoding (first 1024 bytes) -->
  <meta charset="UTF-8">
  
  <!-- Viewport for responsive design -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- SEO description -->
  <meta name="description" content="Page description for search engines">
  
  <!-- Keywords (largely ignored by search engines) -->
  <meta name="keywords" content="html, css, javascript">
  
  <!-- Author -->
  <meta name="author" content="Author Name">
  
  <!-- Theme color for mobile browsers -->
  <meta name="theme-color" content="#3b82f6">
  
  <!-- Content Security Policy -->
  <meta http-equiv="Content-Security-Policy" content="default-src 'self'">
  
  <!-- Referrer policy -->
  <meta name="referrer" content="strict-origin-when-cross-origin">
  
  <!-- Open Graph for social sharing -->
  <meta property="og:title" content="Page Title">
  <meta property="og:description" content="Description">
  <meta property="og:image" content="https://example.com/image.jpg">
  <meta property="og:url" content="https://example.com">
  
  <!-- Twitter Card -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="Page Title">
  <meta name="twitter:description" content="Description">
</head>
```

### Content Sectioning Elements

| Element | Purpose |
|---------|---------|
| `<article>` | Self-contained content (blog post, news) |
| `<aside>` | Indirectly related content (sidebar) |
| `<details>` | Disclosure widget for more info |
| `<dialog>` | Modal or popup dialog |
| `<figure>` | Self-contained content (image, code) |
| `<figcaption>` | Caption for `<figure>` |
| `<main>` | Primary content (unique per page) |
| `<nav>` | Navigation links |
| `<section>` | Thematic grouping of content |
| `<summary>` | Visible heading for `<details>` |

```html
<main>
  <article>
    <header>
      <h1>Article Title</h1>
      <time datetime="2025-01-15">January 15, 2025</time>
    </header>
    <p>Article content...</p>
    <footer>
      <p>By Author Name</p>
    </footer>
  </article>
  
  <aside>
    <h2>Related Links</h2>
    <ul>
      <li><a href="/related-1">Related Article 1</a></li>
    </ul>
  </aside>
</main>
```

### Text Content Elements

```html
<!-- Headings (h1-h6) -->
<h1>Page Heading</h1>
<h2>Section Heading</h2>
<h3>Subsection Heading</h3>

<!-- Paragraphs and text -->
<p>Paragraph text with <strong>bold</strong> and <em>emphasis</em>.</p>

<!-- Quotes -->
<p>As said in the documentation: <q>Short quote text</q></p>
<blockquote>
  <p>Longer quoted content from another source.</p>
  <cite>Source Name</cite>
</blockquote>

<!-- Preformatted text -->
<pre><code>
function hello() {
  console.log("Hello, world!");
}
</code></pre>

<!-- Line breaks and horizontal rules -->
<p>Line one<br>Line two</p>
<hr>
```

## Accessibility (a11y) Best Practices

### ARIA Landmarks

```html
<body>
  <!-- Navigation landmark -->
  <nav aria-label="Main navigation">
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/about">About</a></li>
    </ul>
  </nav>
  
  <!-- Main content landmark -->
  <main>
    <h1>Main Content</h1>
  </main>
  
  <!-- Complementary landmark -->
  <aside aria-label="Sidebar">
    <h2>Sidebar</h2>
  </aside>
  
  <!-- Search landmark -->
  <form role="search" aria-label="Site search">
    <input type="search" placeholder="Search..." aria-label="Search">
    <button type="submit">Search</button>
  </form>
  
  <!-- Footer -->
  <footer>
    <p>Copyright 2025</p>
  </footer>
</body>
```

### ARIA Attributes

| Attribute | Purpose | Example |
|-----------|---------|---------|
| `aria-label` | Accessible name | `<div aria-label="Close menu">` |
| `aria-labelledby` | Label from element | `<input aria-labelledby="name-label">` |
| `aria-describedby` | Description text | `<input aria-describedby="email-help">` |
| `aria-hidden` | Hide from AT | `<i class="icon" aria-hidden="true">` |
| `aria-live` | Dynamic updates | `<div aria-live="polite">` |
| `aria-expanded` | Expandable state | `<button aria-expanded="false">` |
| `aria-disabled` | Disabled state | `<button aria-disabled="true">` |
| `aria-required` | Required field | `<input aria-required="true">` |
| `aria-invalid` | Validation state | `<input aria-invalid="true">` |

### Accessible Forms

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
      aria-describedby="email-help email-error"
    >
    <span id="email-help">We'll never share your email.</span>
    <span id="email-error" role="alert" class="hidden">Please enter a valid email.</span>
  </div>
  
  <div>
    <label for="password">Password</label>
    <input 
      type="password" 
      id="password" 
      name="password"
      required
      minlength="8"
      aria-describedby="password-strength"
    >
    <div id="password-strength" aria-live="polite">
      Password must be at least 8 characters.
    </div>
  </div>
  
  <fieldset>
    <legend>Preferences</legend>
    <label>
      <input type="checkbox" name="notifications" value="email">
      Email notifications
    </label>
    <label>
      <input type="checkbox" name="notifications" value="sms">
      SMS notifications
    </label>
  </fieldset>
  
  <button type="submit">Submit</button>
</form>
```

### Skip Navigation

```html
<body>
  <a href="#main-content" class="skip-link">Skip to main content</a>
  <nav>...</nav>
  <main id="main-content">...</main>
</body>
```

```css
.skip-link {
  position: absolute;
  top: -40px;
  left: 0;
  background: #000;
  color: white;
  padding: 8px;
  z-index: 100;
}
.skip-link:focus {
  top: 0;
}
```

## SEO Optimization

### Essential Meta Tags

```html
<head>
  <!-- Primary SEO tags -->
  <title>Page Title - Site Name</title>
  <meta name="description" content="Compelling description under 160 characters">
  <link rel="canonical" href="https://example.com/page">
  
  <!-- Open Graph (Facebook, LinkedIn) -->
  <meta property="og:type" content="website">
  <meta property="og:site_name" content="Site Name">
  <meta property="og:locale" content="en_US">
  
  <!-- Twitter -->
  <meta name="twitter:domain" content="example.com">
  
  <!-- Mobile -->
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  
  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="/favicon.svg">
  <link rel="apple-touch-icon" href="/apple-touch-icon.png">
</head>
```

### Structured Data (JSON-LD)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebPage",
  "name": "Page Title",
  "description": "Page description",
  "author": {
    "@type": "Person",
    "name": "Author Name"
  }
}
</script>
```

## Security Best Practices

### Content Security Policy (CSP)

```html
<!-- Strict CSP -->
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self';
               script-src 'self' https://trusted.cdn.com;
               style-src 'self' 'unsafe-inline';
               img-src 'self' data: https:;
               connect-src 'self' https://api.example.com;
               font-src 'self' https://fonts.gstatic.com;
               object-src 'none';
               frame-ancestors 'none';
               base-uri 'self';
               form-action 'self';">
```

### iframe Security

```html
<!-- Sandboxed iframe (most restrictive) -->
<iframe 
  src="https://example.com" 
  sandbox
  title="Embedded content description"
  loading="lazy"
  referrerpolicy="no-referrer">
</iframe>

<!-- Sandboxed with specific permissions -->
<iframe 
  src="https://example.com" 
  sandbox="allow-scripts allow-same-origin"
  title="Trusted embedded content">
</iframe>

<!-- Permissions Policy for iframe -->
<iframe 
  src="https://example.com" 
  allow="camera; microphone; geolocation"
  title="Interactive content">
</iframe>
```

### iframe Security Attributes

| Attribute | Purpose |
|-----------|---------|
| `sandbox` | Restricts iframe capabilities |
| `allow` | Permissions Policy for features |
| `referrerpolicy` | Controls referrer information |
| `loading="lazy"` | Defers loading for performance |
| `title` | Accessibility label for screen readers |
| `csp` (experimental) | Inline CSP for iframe |

### Sandbox Token Values

| Token | Effect |
|-------|--------|
| (empty) | All restrictions applied |
| `allow-scripts` | Allows script execution |
| `allow-same-origin` | Treats as same-origin |
| `allow-forms` | Allows form submission |
| `allow-popups` | Allows popup windows |
| `allow-top-navigation` | Allows top-level navigation |
| `allow-downloads` | Allows file downloads |

**Warning:** Never use both `allow-scripts` and `allow-same-origin` together on untrusted content — it allows the iframe to remove the sandbox.

### Input Sanitization

```html
<!-- BAD: User-controlled content without sanitization -->
<div><%= userInput %></div>

<!-- GOOD: Sanitized content -->
<div><!-- sanitized HTML --></div>

<!-- Use textContent for plain text -->
<p><%= escape(userInput) %></p>
```

## Performance Optimization

### Lazy Loading

```html
<!-- Images -->
<img src="image.jpg" loading="lazy" alt="Description">
<img src="image.jpg" loading="eager" alt="Above-fold image">

<!-- Iframes -->
<iframe src="embed.html" loading="lazy" title="Content"></iframe>

<!-- Preload critical resources -->
<link rel="preload" href="font.woff2" as="font" crossorigin>
<link rel="preload" href="hero.jpg" as="image">

<!-- Preconnect to origins -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://cdn.example.com">

<!-- DNS prefetch -->
<link rel="dns-prefetch" href="https://api.example.com">
```

### Modern Image Formats

```html
<picture>
  <source srcset="image.avif" type="image/avif">
  <source srcset="image.webp" type="image/webp">
  <img src="image.jpg" alt="Description" loading="lazy">
</picture>
```

### Resource Hints

```html
<!-- Preconnect (TLS handshake + TCP) -->
<link rel="preconnect" href="https://api.example.com">

<!-- Prefetch (predictive navigation) -->
<link rel="prefetch" href="/next-page.html">

<!-- Preload (critical resources) -->
<link rel="preload" href="critical.css" as="style">
<link rel="preload" href="font.woff2" as="font" type="font/woff2" crossorigin>

<!-- Modulepreload (ES modules) -->
<link rel="modulepreload" href="app.js">
```

## Modern HTML5 Features

### Web Components

```html
<!-- Custom Element Definition -->
<script>
class MyCard extends HTMLElement {
  connectedCallback() {
    this.innerHTML = `
      <article>
        <h2><slot name="title">Default Title</slot></h2>
        <div><slot></slot></div>
      </article>
    `;
  }
}
customElements.define('my-card', MyCard);
</script>

<!-- Usage -->
<my-card>
  <span slot="title">Custom Title</span>
  Card content here.
</my-card>
```

### Modern Form Features

```html
<form>
  <!-- Email validation -->
  <input type="email" placeholder="email@example.com" required>
  
  <!-- URL validation -->
  <input type="url" placeholder="https://example.com">
  
  <!-- Number with range -->
  <input type="number" min="0" max="100" step="5">
  
  <!-- Search -->
  <input type="search" placeholder="Search...">
  
  <!-- Tel -->
  <input type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" placeholder="123-456-7890">
  
  <!-- Date/Time -->
  <input type="date" min="2025-01-01" max="2025-12-31">
  <input type="time" step="300"> <!-- 5-minute intervals -->
  <input type="datetime-local">
  
  <!-- Color picker -->
  <input type="color" value="#3b82f6">
  
  <!-- Range slider -->
  <input type="range" min="0" max="100" value="50">
  
  <!-- File with multiple -->
  <input type="file" multiple accept="image/*,.pdf">
  
  <!-- Datalist for autocomplete -->
  <input list="browsers" name="browser">
  <datalist id="browsers">
    <option value="Chrome">
    <option value="Firefox">
    <option value="Safari">
  </datalist>
  
  <!-- Progress -->
  <progress value="70" max="100"></progress>
  
  <!-- Meter -->
  <meter value="0.6">60%</meter>
</form>
```

### Multimedia

```html
<!-- Audio -->
<audio controls preload="metadata">
  <source src="audio.mp3" type="audio/mpeg">
  <source src="audio.ogg" type="audio/ogg">
  Your browser does not support the audio element.
</audio>

<!-- Video -->
<video controls width="1280" height="720" preload="metadata" 
       poster="thumbnail.jpg">
  <source src="video.mp4" type="video/mp4">
  <source src="video.webm" type="video/webm">
  <track src="subtitles.vtt" kind="subtitles" srclang="en" label="English">
  Your browser does not support the video element.
</video>

<!-- Figure with caption -->
<figure>
  <img src="diagram.jpg" alt="System architecture diagram">
  <figcaption>Figure 1: System architecture overview</figcaption>
</figure>
```

## HTML Best Practices Checklist

### Semantic Structure
- [x] Use `<!DOCTYPE html>` declaration
- [x] Set `<html lang="en">` attribute
- [x] Use semantic elements (`<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<footer>`)
- [x] Single `<h1>` per page, proper heading hierarchy
- [x] Use `<main>` for primary content
- [x] Use `<nav>` for navigation
- [x] Use `<aside>` for tangential content

### Accessibility
- [x] All images have `alt` attributes
- [x] Forms have associated `<label>` elements
- [x] ARIA landmarks are properly used
- [x] Skip navigation link is present
- [x] Focus order is logical
- [x] Color is not the only indicator
- [x] Interactive elements are keyboard-accessible

### SEO
- [x] Unique `<title>` on every page
- [x> Meta description under 160 characters
- [x] Canonical URL specified
- [x] Open Graph tags for social sharing
- [x] Structured data (JSON-LD) where appropriate
- [x] Sitemap.xml and robots.txt

### Security
- [x] Content Security Policy header/meta tag
- [x] Sandboxed iframes for untrusted content
- [x] Referrer-Policy header
- [x] X-Frame-Options or frame-ancestors CSP
- [x] Input sanitization for user content
- [x] `rel="noopener noreferrer"` on external links

### Performance
- [x] Lazy loading for images/iframes below fold
- [x] Preload critical resources
- [x] Preconnect to third-party origins
- [x] Modern image formats (AVIF, WebP)
- [x] Minimize DOM size
- [x] Defer non-critical JavaScript

## Cross-References

- See [[css3-performance-security]] for CSS3 integration patterns
- See [[tw-optimization-performance]] for Tailwind CSS styling
- See [[shadcn-best-practices]] for component accessibility patterns
- See [[css-media-queries]] for responsive design and media query patterns

## Sources

- [[Sources/mdn-html-2024|mdn-html-2024]]


---

## Decision Tree: HTML5 Semantic Elements

\\\mermaid
graph TD
    A[Need to structure content?]
    A --> B{What type?}
    B -->|Navigation| C[nav]
    B -->|Article| D[article]
    B -->|Section| E[section]
    B -->|Aside| F[aside]
    B -->|Header| G[header]
    B -->|Footer| H[footer]
    B -->|Main| I[main]
    B -->|Figure| J[figure]
    C --> K{Multiple navs?}
    K -->|Yes| L[nav + aria-label]
    K -->|No| M[Single nav]
    D --> N{Self-contained?}
    N -->|Yes| O[article]
    N -->|No| P[section]
\\\

### When to Use Each Semantic Element

| Element | When to Use | Example |
|---------|-------------|---------|
| **<nav>** | Navigation links | Main menu, breadcrumbs |
| **<article>** | Self-contained content | Blog post, news article |
| **<section>** | Thematic grouping | Chapter, tabbed content |
| **<aside>** | Indirectly related | Sidebar, callout |
| **<header>** | Introductory content | Page header, section header |
| **<footer>** | Footer content | Page footer, article footer |
| **<main>** | Primary content | Main page content |
| **<figure>** | Self-contained media | Image with caption |

---

## Procedural Guidance: HTML5 Accessibility Checklist

### Step 1: Document Structure

\\\html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
</head>
<body>
  <header>
    <nav aria-label="Main navigation">
      <!-- Navigation links -->
    </nav>
  </header>

  <main id="main-content">
    <!-- Primary content -->
  </main>

  <aside aria-label="Related content">
    <!-- Sidebar content -->
  </aside>

  <footer>
    <!-- Footer content -->
  </footer>
</body>
</html>
\\\

### Step 2: Form Accessibility

\\\html
<form>
  <div>
    <label for="email">Email Address</label>
    <input type="email" id="email" name="email" required
           aria-describedby="email-help" autocomplete="email">
    <span id="email-help" class="help-text">We'll never share your email.</span>
  </div>

  <div>
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required
           aria-describedby="password-help" autocomplete="new-password">
    <span id="password-help" class="help-text">Min 8 characters.</span>
  </div>

  <button type="submit">Sign Up</button>
</form>
\\\

### Step 3: Image Accessibility

\\\html
<!-- Decorative image -->
<img src="decorative.png" alt="" role="presentation">

<!-- Informative image -->
<img src="chart.png" alt="Sales increased 20% in Q4 2024">

<!-- Complex image with long description -->
<img src="complex-chart.png" alt="See detailed chart description below">
<figcaption id="chart-desc">The chart shows quarterly sales data...</figcaption>
\\\

### Step 4: ARIA Landmarks

\\\html
<!-- Landmark roles for screen readers -->
<header role="banner">Site header</header>
<nav role="navigation">Main navigation</nav>
<main role="main">Primary content</main>
<aside role="complementary">Sidebar</aside>
<footer role="contentinfo">Site footer</footer>
\\\

### Step 5: Keyboard Navigation

\\\html
<!-- Focusable elements -->
<a href="#main-content" class="skip-link">Skip to main content</a>

<!-- Custom keyboard navigation -->
<div tabindex="0" role="button" aria-pressed="false" 
     @keydown="handleKeydown()">
  Toggle
</div>
\\\

---

## Copilot Instructions

### When to Read This Note
- Building accessible HTML5 pages
- Implementing semantic HTML structure
- Adding ARIA attributes
- Creating responsive HTML templates
- SEO optimization with HTML

### What to Do With This Information
1. **Use semantic elements**: Prefer semantic HTML over divs with classes
2. **Add ARIA labels**: Where semantic HTML is insufficient
3. **Include viewport meta**: Always include viewport meta tag
4. **Label forms properly**: Use label elements with for attributes
5. **Provide alt text**: All informative images need alt text

### Tools to Use
- **VS Code Extension**: HTML CSS Support — for HTML/CSS integration
- **VS Code Extension**: Error Lens — for inline HTML error display
- **Browser Extension**: axe DevTools — for accessibility testing
- **Browser Extension**: Lighthouse — for SEO/performance audit
- **Terminal Command**: \
px pa11y https://localhost:3000\ — run accessibility tests
- **Terminal Command**: \
px lighthouse https://localhost:3000 --categories accessibility,seo\ — run audit

### Agents to Invoke
- **Security Review Agent**: Run when adding new HTML forms
- **Code Review Agent**: Run when reviewing PRs with HTML changes

### Integration with Other Notes
- Read [[css-media-queries]] for responsive design patterns
- Read [[accessibility-a11y]] for accessibility best practices
- Read [[seo-best-practices]] for SEO optimization
- Read [[html-semantic-patterns]] for HTML semantic patterns

### Common Pitfalls
- Don't use divs for everything (use semantic elements)
- Don't skip alt text (all images need alt text)
- Don't forget form labels (all inputs need labels)
- Don't ignore keyboard navigation (test with Tab/Escape)
- Don't use ARIA when semantic HTML suffices

### Quick Validation Checklist
- [ ] Are semantic HTML elements used appropriately?
- [ ] Do all images have alt text?
- [ ] Are form inputs properly labeled?
- [ ] Is the viewport meta tag included?
- [ ] Are ARIA landmarks used correctly?
- [ ] Can the page be navigated with keyboard only?
