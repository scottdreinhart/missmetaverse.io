---
slug: html-semantic-patterns
sources:
  - https://developer.mozilla.org/en-US/docs/Web/HTML
  - https://html.spec.whatwg.org/
  - https://www.w3.org/TR/html/
date: 2026-11-02
tags:

  - maturity-deprecated
  - infographic
  - attachment








  - html
  - semantic
  - accessibility
  - forms
  - meta
  - seo
  - structured-data
---

# Hypertext Markup Language (HTML) Fundamentals

## Overview

HTML fundamentals covering semantic markup, accessibility, forms, and SEO best practices.

---

## 1. Document Structure

```html
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="My application description" />
    <meta name="keywords" content="react, typescript, tailwind" />
    <meta name="author" content="Developer" />
    <meta name="theme-color" content="#3b82f6" />

    <!-- Open Graph -->
    <meta property="og:title" content="My App" />
    <meta property="og:description" content="Application description" />
    <meta property="og:image" content="/og-image.png" />
    <meta property="og:url" content="https://myapp.com" />
    <meta property="og:type" content="website" />

    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="My App" />
    <meta name="twitter:description" content="Application description" />

    <title>My App — Title</title>
    <link rel="icon" type="image/png" href="/favicon.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preload" as="style" href="/styles.css" />
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
```

---

## 2. Semantic Elements

```html
<!-- Header -->
<header>
  <nav aria-label="Main navigation">
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/about">About</a></li>
    </ul>
  </nav>
</header>

<!-- Main content -->
<main>
  <article>
    <header>
      <h1>Article Title</h1>
      <time datetime="2026-11-02">November 2, 2026</time>
    </header>
    <p>Article content...</p>
    <footer>
      <span>By John Doe</span>
      <span>5 min read</span>
    </footer>
  </article>

  <section aria-labelledby="features-heading">
    <h2 id="features-heading">Features</h2>
    <div>Feature 1</div>
    <div>Feature 2</div>
  </section>
</main>

<!-- Aside (sidebar, related content) -->
<aside>
  <h2>Related Articles</h2>
  <ul>
    <li><a href="/related-1">Related Article 1</a></li>
  </ul>
</aside>

<!-- Footer -->
<footer>
  <p>&copy; 2026 My App</p>
  <nav aria-label="Footer navigation">
    <ul>
      <li><a href="/privacy">Privacy Policy</a></li>
      <li><a href="/terms">Terms of Service</a></li>
    </ul>
  </nav>
</footer>
```

---

## 3. Accessible Forms

```html
<form action="/submit" method="POST" novalidate>
  <!-- Text input with label -->
  <div class="form-group">
    <label for="email">Email address</label>
    <input
      type="email"
      id="email"
      name="email"
      required
      autocomplete="email"
      aria-describedby="email-help"
      aria-invalid="false"
    />
    <span id="email-help" class="help-text">We'll never share your email.</span>
    <span id="email-error" class="error-text" role="alert" hidden></span>
  </div>

  <!-- Select -->
  <div class="form-group">
    <label for="role">Role</label>
    <select id="role" name="role" required>
      <option value="">Select a role</option>
      <option value="admin">Admin</option>
      <option value="user">User</option>
    </select>
  </div>

  <!-- Radio buttons -->
  <fieldset>
    <legend>Notification preference</legend>
    <div>
      <input type="radio" id="email-notif" name="notification" value="email" />
      <label for="email-notif">Email</label>
    </div>
    <div>
      <input type="radio" id="sms-notif" name="notification" value="sms" />
      <label for="sms-notif">SMS</label>
    </div>
  </fieldset>

  <!-- Checkbox -->
  <div>
    <input type="checkbox" id="terms" name="terms" required />
    <label for="terms">I agree to the terms</label>
  </div>

  <!-- Submit -->
  <button type="submit">Submit</button>
  <button type="reset">Reset</button>
</form>
```

---

## 4. Tables

```html
<table>
  <caption>Monthly Sales Report</caption>
  <thead>
    <tr>
      <th scope="col">Month</th>
      <th scope="col">Revenue</th>
      <th scope="col">Expenses</th>
      <th scope="col">Profit</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>January</td>
      <td>$10,000</td>
      <td>$6,000</td>
      <td>$4,000</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="3"><strong>Total</strong></td>
      <td><strong>$48,000</strong></td>
    </tr>
  </tfoot>
</table>
```

---

## 5. Media & Embeds

```html
<!-- Responsive image -->
<picture>
  <source media="(min-width: 1024px)" srcset="/hero-large.webp" />
  <source media="(min-width: 768px)" srcset="/hero-medium.webp" />
  <img src="/hero-small.webp" alt="Hero image description" loading="lazy" />
</picture>

<!-- Video -->
<video controls width="800" poster="/video-poster.jpg">
  <source src="/video.mp4" type="video/mp4" />
  <source src="/video.webm" type="video/webm" />
  <track src="/captions.vtt" kind="captions" srclang="en" label="English" />
  Your browser does not support the video tag.
</video>

<!-- Audio -->
<audio controls>
  <source src="/audio.mp3" type="audio/mpeg" />
  Your browser does not support the audio element.
</audio>

<!-- Iframe -->
<iframe
  src="https://maps.example.com"
  width="600"
  height="400"
  loading="lazy"
  allow="accelerometer; clipboard-write; encrypted-media"
  referrerpolicy="strict-origin-when-cross-origin"
  title="Map location"
  sandbox="allow-scripts"
></iframe>
```

---

## 6. Structured Data (JSON-LD)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebApplication",
  "name": "My App",
  "description": "A web application description",
  "url": "https://myapp.com",
  "applicationCategory": "BusinessApplication",
  "operatingSystem": "Web",
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD"
  }
}
</script>
```

---

## 7. Interactive Elements

```html
<!-- Details/Summary (accordion) -->
<details>
  <summary>FAQ Title</summary>
  <p>FAQ answer content...</p>
</details>

<!-- Dialog (modal) -->
<dialog id="confirm-dialog">
  <p>Are you sure?</p>
  <form method="dialog">
    <button type="submit">Yes</button>
    <button type="submit">No</button>
  </form>
</dialog>
<script>
  document.getElementById('confirm-dialog').showModal()
</script>

<!-- Progress -->
<progress value="70" max="100"></progress>

<!-- Meter -->
<meter value="0.7" min="0" max="1" low="0.3" high="0.7" optimum="0.8">70%</meter>
```

---

## 8. Best Practices

| Practice | Description |
|----------|-------------|
| **Semantic HTML** | Use appropriate elements (`<article>`, `<nav>`, `<main>`) |
| **Language attribute** | Always set `<html lang="en">` |
| **Viewport meta** | Include viewport meta for responsive design |
| **Alt text** | All images need descriptive `alt` attributes |
| **Label association** | Every form input needs a `<label>` |
| **Heading hierarchy** | Use `h1` → `h6` in order, no skipping |
| **ARIA** | Use ARIA only when native HTML isn't sufficient |
| **Keyboard navigation** | All interactive elements must be keyboard accessible |
| **Loading attributes** | Use `loading="lazy"` for below-fold images |
| **Preconnect** | Use `preconnect` for external resources |

---

## Cross-References

- [Tailwind CSS](../TailwindsCSS/tailwind-css-patterns.md)
- [Cascading Stylesheets](../Cascading Stylesheets/css-fundamentals.md)
- [ShadCN UI](../ShadCN/shadcn-ui-patterns.md)


