---
slug: w3c-i18n
title: W3C Internationalization (i18n) Resources
description: W3C Internationalization activity — standards, guides, and best practices for building software that supports multiple languages, regions, and writing systems.
author: Copilot
source: w3c-i18n
canonical_url: https://www.w3.org/International/
publication_date: 2024-01-01
accessed_on: 2026-11-02
verification_status: verified
claims_supported: 20
access_limitations: Free public standard
---
tags:













# W3C Internationalization (i18n) Resources

## Overview

The **W3C Internationalization (i18n) activity** develops standards, guides, and tools for making the Web accessible to all users regardless of language, culture, or writing system. i18n covers character encoding, text direction, date/number formatting, collation, and more.

## Key Standards

| Standard | Description | URL |
|----------|-------------|-----|
| **Unicode** | Character encoding standard | unicode.org |
| **BCP 47** | Language tag format (en-US, zh-Hant) | RFC 5646 |
| **CLDR** | Unicode Common Locale Data Repository | cldr.unicode.org |
| **HTML i18n** | HTML internationalization attributes | WHATWG HTML |
| **CSS i18n** | CSS internationalization features | CSS Text Module |

## i18n vs l10n

| Term | Meaning | Scope |
|------|---------|-------|
| **i18n** (internationalization) | Designing software to support multiple languages/regions | Architecture, data formats, UI design |
| **l10n** (localization) | Adapting software for a specific region/language | Translation, cultural adaptation |
| **g11n** (globalization) | The combination of i18n + l10n + cultural adaptation | Full global strategy |

> "Internationalization is the design and development of software so that it can be adapted to various languages and regions. Localization is the adaptation for a specific region." — W3C

## Key i18n Concerns

### 1. Character Encoding

- **UTF-8**: Universal character encoding (required)
- **UTF-16**: Used internally by JavaScript
- **Never use**: ISO-8859-1, Windows-1252 for web content

### 2. Text Direction

- **LTR**: Left-to-right (English, Spanish, French)
- **RTL**: Right-to-left (Arabic, Hebrew, Urdu)
- **TTB**: Top-to-bottom (Traditional Chinese, Japanese vertical)
- **BTT**: Bottom-to-top (Mongolian)

CSS support: `direction`, `unicode-bidi`, `text-orientation`

### 3. Date and Number Formatting

| Region | Date | Number | Currency |
|--------|------|--------|----------|
| US | 01/15/2025 | 1,234.56 | $1,234.56 |
| EU | 15.01.2025 | 1.234,56 | €1.234,56 |
| JP | 2025/01/15 | 1,234 | ¥1,234 |
| CN | 2025-01-15 | 1,234.56 | ¥1,234.56 |

Use `Intl.DateTimeFormat`, `Intl.NumberFormat`, `Intl.Collator`

### 4. Collation and Sorting

- Different languages have different sort orders
- Example: German `ß` sorts as `ss`
- Use `localeCompare()` with `locale` parameter

### 5. Pluralization Rules

- English: `1 item`, `2 items` (2 forms)
- Russian: 3 forms (1, 2-4, 5-20)
- Arabic: 6 forms
- Use ICU MessageFormat or `Intl.PluralRules`

### 6. Text Expansion

- German text expands ~30% over English
- Finnish text expands ~25%
- Design UIs that handle text expansion gracefully

## Best Practices

| Practice | Description |
|----------|-------------|
| **Externalize strings** | Never hardcode text in code |
| **Use Unicode** | UTF-8 everywhere |
| **Support RTL** | Test with Arabic/Hebrew content |
| **Use locale-aware formatting** | Dates, numbers, currencies |
| **Design for text expansion** | Flexible layouts |
| **Test with real content** | Not just English |
| **Use language tags** | `lang="en-US"`, `lang="ar-SA"` |
| **Support keyboard shortcuts** | Not just mouse |
| **Consider cultural norms** | Colors, symbols, imagery |

## Tools

| Tool | Purpose | URL |
|------|---------|-----|
| **formatjs** | i18n for JavaScript/React | formatjs.io |
| **i18next** | i18n framework | i18next.com |
| **Intl API** | Built-in JavaScript i18n | MDN Intl |
| **CLDR** | Locale data | cldr.unicode.org |
| **Unicode** | Character data | unicode.org |
| **Lingui** | React i18n | lingui.dev |

## JavaScript i18n API

```javascript
// Date formatting
new Intl.DateTimeFormat('en-US').format(new Date())
// → "1/15/2025"
new Intl.DateTimeFormat('de-DE').format(new Date())
// → "15.1.2025"

// Number formatting
new Intl.NumberFormat('en-US').format(1234.56)
// → "1,234.56"
new Intl.NumberFormat('de-DE').format(1234.56)
// → "1.234,56"

// Currency formatting
new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' })
  .format(1234.56)
// → "$1,234.56"

// Collation (sorting)
['café', 'apple', 'banana'].sort((a, b) => a.localeCompare(b, 'fr'))
// → French sort order

// Pluralization
const pr = new Intl.PluralRules('en')
pr.select(1) // → "one"
pr.select(2) // → "other"
```

---

*Source: W3C Internationalization Activity*
*Last Verified: 2026-11-02*

## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


