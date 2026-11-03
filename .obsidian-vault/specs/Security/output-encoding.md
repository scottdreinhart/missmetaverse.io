---
slug: output-encoding
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:
  - output-encoding
  - security
  - xss
  - encoding
---

# Contextual Output Encoding

## Definition

Contextual Output Encoding is **a security technique that encodes data based on the context in which it will be rendered to prevent injection attacks**.

> "Output encoding encodes data based on the context in which it will be rendered to prevent injection attacks." — OWASP

## Problem Addressed

Without output encoding:
- **XSS attacks**: Cross-site scripting attacks succeed
- **Injection attacks**: Injection attacks succeed
- **Data corruption**: Data is corrupted by injection
- **Security holes**: Security holes are introduced

## Scope and Boundaries

- Output Encoding ≠ Input Validation (output encoding encodes data on output, input validation validates data on input)
- Output Encoding = Protection (output encoding protects against injection)
- Output Encoding is a **security technique**, not a pattern

## When to Apply

- When building web applications
- when user input is rendered in the browser
- when XSS attacks are a concern
- when injection attacks are a concern

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Contextual encoding adds complexity |
| **Time** — Implementing contextual encoding takes time |
| **Display**: Encoded data may display differently |

## Common Misuses

- **Everything encoded**: Not every output needs encoding
- **Wrong context**: Encoding must match the context (HTML, JavaScript, CSS, etc.)
- **Confusing with input validation**: Output encoding encodes data on output, input validation validates data on input

## Related Concepts

- [Input Validation](Security/input-validation.md) — Input validation complements output encoding
- [Content Security Policy](Security/content-security-policy.md) — Content security policy complements output encoding
- [Security Principles](Security/security-principles.md) — Security principles include output encoding

## Project Observations

- The project uses output encoding:
  - React automatically encodes output
  - TypeScript can enforce output encoding through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of output encoding in existing code (src/ is empty)
- File naming conventions support output encoding:
  - `*.encoder.ts` — Encoder files
  - `*.guard.ts` — Guard files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Output Encoding Selection

```mermaid
graph TD
    A[Need to render data?]\n    A --> B{What context?}
    B -->|HTML| C[HTML encoding]
    B -->|JavaScript| D[JS encoding]
    B -->|CSS| E[CSS encoding]
    B -->|URL| F[URL encoding]
    B -->|JSON| G[JSON encoding]
    C --> H{React?}
    H -->|Yes| I[Auto-encoded]
    H -->|No| J[Manual encode]
    I --> K{DangerouslySetInnerHTML?}
    K -->|Yes| L[Sanitize first]
    K -->|No| M[Safe]
```

### When to Use Each Encoding Context

| Context | When to Use | Example |
|---------|-------------|---------|
| **HTML** | Rendering in HTML | {userInput} |
| **JavaScript** | Injecting into JS | script tag |
| **CSS** | CSS values | style attribute |
| **URL** | URL parameters | href attribute |
| **JSON** | API responses | response body |

---

## Procedural Guidance: Output Encoding Implementation

### Step 1: HTML Encoding

```typescript
// utils/html-encoder.ts
export function encodeHtml(input: string): string {
  return input
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#x27;')
}

// Usage in React (usually not needed — React auto-encodes)
function UserComment({ comment }: { comment: string }) {
  // ✅ React auto-encodes — safe
  return <div>{comment}</div>
  
  // ❌ Never do this without sanitization
  // return <div dangerouslySetInnerHTML={{ __html: comment }} />
}
```

### Step 2: JavaScript Encoding

```typescript
// utils/js-encoder.ts
export function encodeForJavaScript(input: string): string {
  return input
    .replace(/\\/g, '\\\\')
    .replace(/'/g, "\\'")
    .replace(/"/g, '\\"')
    .replace(/\n/g, '\\n')
    .replace(/\r/g, '\\r')
    .replace(/\t/g, '\\t')
}

// Usage
const userName = 'John "The Rock" Doe'
const safeJson = JSON.stringify({ name: userName })
// Result: '{"name":"John \\"The Rock\\" Doe"}'

// Never do this:
// const unsafe = `<script>var user = '${userName}';</script>`
```

### Step 3: URL Encoding

```typescript
// utils/url-encoder.ts
export function encodeUrl(input: string): string {
  return encodeURIComponent(input)
}

export function encodeUrlPath(input: string): string {
  return encodeURI(input)
}

// Usage
const searchQuery = 'hello world & more'
const encoded = encodeUrl(searchQuery)
// Result: 'hello%20world%20%26%20more'

const url = `/search?q=${encoded}`
// Result: '/search?q=hello%20world%20%26%20more'
```

### Step 4: CSS Encoding

```typescript
// utils/css-encoder.ts
export function encodeForCss(input: string): string {
  return input
    .replace(/\\/g, '\\\\')
    .replace(/"/g, '\\"')
    .replace(/'/g, "\\'")
    .replace(/\n/g, '\\\n')
}

// Usage in React
function UserTheme({ color }: { color: string }) {
  // ✅ Safe — CSS-in-JS handles encoding
  return <div style={{ color }}>Content</div>
  
  // ❌ Never inject raw CSS
  // return <div style={{ cssText: `color: ${color}` }}>Content</div>
}
```

### Step 5: Sanitize HTML (When Needed)

```typescript
// utils/html-sanitizer.ts
import DOMPurify from 'dompurify'

export function sanitizeHtml(input: string): string {
  return DOMPurify.sanitize(input, {
    ALLOWED_TAGS: ['p', 'br', 'strong', 'em', 'ul', 'ol', 'li', 'a'],
    ALLOWED_ATTR: ['href', 'target', 'rel'],
    ALLOWED_URI_REGEXP: /^(?:(?:(?:f|ht)tps?|mailto):|[^a-z])/i,
  })
}

// Usage
function RichTextContent({ content }: { content: string }) {
  const sanitized = sanitizeHtml(content)
  return <div dangerouslySetInnerHTML={{ __html: sanitized }} />
}
```

### Step 6: React Security Best Practices

```typescript
// components/SecureComponent.tsx
import DOMPurify from 'dompurify'

// ✅ Safe — React auto-encodes
function SafeComponent({ userInput }: { userInput: string }) {
  return <div>{userInput}</div>
}

// ⚠️ Use with caution — sanitize first
function SanitizedComponent({ userInput }: { userInput: string }) {
  const sanitized = DOMPurify.sanitize(userInput)
  return <div dangerouslySetInnerHTML={{ __html: sanitized }} />
}

// ❌ Never do this
function UnsafeComponent({ userInput }: { userInput: string }) {
  return <div dangerouslySetInnerHTML={{ __html: userInput }} />
}

// ✅ Use React's built-in encoding
function FormComponent() {
  const [input, setInput] = useState('')
  
  return (
    <div>
      {/* ✅ Safe — React auto-encodes */}
      <p>{input}</p>
      
      {/* ✅ Safe — React auto-encodes */}
      <input value={input} onChange={(e) => setInput(e.target.value)} />
      
      {/* ✅ Safe — React auto-encodes */}
      <button onClick={() => alert(input)}>Click</button>
    </div>
  )
}
```

### Step 7: Test Output Encoding

```typescript
// tests/output-encoding.test.ts
import { describe, it, expect } from 'vitest'
import { encodeHtml, encodeForJavaScript, encodeUrl, sanitizeHtml } from '@/utils/html-encoder'
import DOMPurify from 'dompurify'

describe('Output Encoding', () => {
  describe('encodeHtml', () => {
    it('should encode special characters', () => {
      expect(encodeHtml('<script>alert("XSS")</script>')).toBe(
        '&lt;script&gt;alert(&quot;XSS&quot;)&lt;/script&gt;',
      )
    })

    it('should encode ampersands', () => {
      expect(encodeHtml('Tom & Jerry')).toBe('Tom &amp; Jerry')
    })
  })

  describe('encodeForJavaScript', () => {
    it('should escape quotes', () => {
      expect(encodeForJavaScript("John's \"Rock\" Doe")).toBe(
        "John\\'s \\\\\"Rock\\\\\" Doe",
      )
    })
  })

  describe('encodeUrl', () => {
    it('should encode spaces and special chars', () => {
      expect(encodeUrl('hello world & more')).toBe('hello%20world%20%26%20more')
    })
  })

  describe('sanitizeHtml', () => {
    it('should remove script tags', () => {
      const sanitized = sanitizeHtml('<script>alert("XSS")</script><p>Safe</p>')
      expect(sanitized).not.toContain('<script>')
      expect(sanitized).toContain('<p>Safe</p>')
    })

    it('should allow safe tags', () => {
      const sanitized = sanitizeHtml('<strong>Bold</strong>')
      expect(sanitized).toContain('<strong>Bold</strong>')
    })
  })
})
```

---

## Copilot Instructions

### When to Read This Note
- Preventing XSS attacks
- Encoding output for different contexts
- Sanitizing HTML content
- Implementing React security
- Testing output encoding

### What to Do With This Information
1. **HTML encoding**: Encode special characters for HTML context
2. **JavaScript encoding**: Escape quotes and special chars for JS
3. **URL encoding**: Use encodeURIComponent for URL parameters
4. **CSS encoding**: Escape special chars for CSS values
5. **HTML sanitization**: Use DOMPurify for rich text content

### Tools to Use
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `dompurify` — for HTML sanitization
- **npm Package**: `express` — for security headers
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm audit` — check for vulnerabilities

### Agents to Invoke
- **Security Review Agent**: Run when adding new output rendering
- **Code Review Agent**: Run when reviewing PRs with user input handling

### Integration with Other Notes
- read [[security-principles]] for security principles
- read [[input-validation]] for input validation
- read [[content-security-policy]] for CSP headers
- read [[parameterized-queries]] for SQL injection prevention
- read [[output-encoding]] for output encoding patterns

### Common Pitfalls
- Don't rely only on input validation (always encode output)
- Don't use dangerouslySetInnerHTML without sanitization
- Don't forget different contexts (HTML, JS, CSS, URL)
- Don't implement custom encoders (use established libraries)
- Don't ignore React's auto-encoding (React handles most cases)

### Quick Validation Checklist
- [ ] Are special characters encoded for HTML?
- [ ] Are quotes escaped for JavaScript?
- [ ] Are URLs encoded with encodeURIComponent?
- [ ] Is HTML sanitized before rendering?
- [ ] Are security headers set (CSP)?
- [ ] Is output encoding tested?

