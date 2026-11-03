---
slug: playwright-patterns
sources:
  - https://playwright.dev/
  - https://playwright.dev/docs/intro
date: 2026-11-02
tags:
  - priority/high
  - maturity/stable
  - domain/backend
  - domain/security
  - domain/frontend
  - type/guide
  - type/concept
  - domain/testing
  - domain/devops
  - status/complete
  - type/reference
  - domain/architecture
  - playwright
  - testing
  - e2e
  - patterns
---

# Playwright Patterns

## Definition

Playwright Patterns are **design patterns for working with Playwright for end-to-end testing**.

> "Playwright is a framework for writing and running end-to-end tests for web apps." — Playwright Docs

## Problem Addressed

Without Playwright patterns:
- **Testing**: Testing is inconsistent
- **Coverage**: Test coverage is low
- **Speed**: Testing is slow
- **Maintenance**: Hard to maintain tests

## Scope and Boundaries

- Playwright Patterns ≠ Playwright (Playwright patterns are patterns, Playwright is a tool)
- Playwright Patterns ≠ E2E Testing (Playwright patterns are patterns, e2e testing is a practice)
- Playwright Patterns is a **patterns**, not a tool

## When to Apply

- When building applications
- when testing matters
- when coverage is important
- when speed is important

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Complexity** — Playwright patterns are complex |
| **Time** — Playwright patterns take time |
| **Over-Playwright** — Don't use Playwright for everything |

## Common Misuses

- **Everything Playwright**: Not everything needs Playwright patterns
- **Confusing with Playwright**: Playwright patterns ≠ Playwright
- **Over-Playwright**: Too much Playwright creates complexity

## Related Concepts

- [Testing Patterns](../Testing/testing-patterns.md) — Playwright patterns with testing
- [Vitest Patterns](Architecture/vitest-patterns.md) — Playwright patterns with Vitest
- [Automated Testing](Architecture/automated-testing.md) — Playwright patterns with automated testing

## Project Observations

- The project uses Playwright patterns:
  - The project's Playwright note covers Playwright patterns (from existing notes)
  - No evidence of Playwright patterns in existing code (src/ is empty)
- File naming conventions support Playwright patterns:
  - `*.test.ts` — Test files
  - `*.spec.ts` — Spec files

## Sources

- [[Sources/fowler-patterns-2002|fowler-patterns-2002]]

---

## Decision Tree: Playwright Test Design

```mermaid
graph TD
    A[Need to write Playwright test?]\n    A --> B{What type?}
    B -->|User Flow| C[Page Object Model]
    B -->|API| D[API Testing]
    B -->|Component| E[Component Testing]
    B -->|Visual| F[Visual Regression]
    C --> G{Multiple pages?}
    G -->|Yes| H[Page Objects]
    G -->|No| I[Inline tests]
    D --> J{REST or GraphQL?}
    J -->|REST| K[request.post/get]
    J -->|GraphQL| L[request.fetch]
    F --> M{Baseline exists?}
    M -->|Yes| N[Compare to baseline]
    M -->|No| O[Generate baseline]
```

### When to Use Each Playwright Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Page Object Model** | Complex user flows | Login, checkout |
| **API Testing** | Backend validation | REST endpoints |
| **Component Testing** | UI components | Buttons, forms |
| **Visual Regression** | UI changes | Screenshots |
| **Auto-Waiting** | Dynamic content | Auto-wait for elements |

---

## Procedural Guidance: Playwright Setup

### Step 1: Install Playwright

```bash
# Install Playwright
pnpm add -D @playwright/test

# Install browsers
npx playwright install

# Install system dependencies
npx playwright install-deps
```

### Step 2: Configure Playwright

```typescript
// playwright.config.ts
import { defineConfig, devices } from '@playwright/test'

export default defineConfig({
  testDir: './tests',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  use: {
    baseURL: 'http://localhost:3000',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
  },
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'firefox',
      use: { ...devices['Desktop Firefox'] },
    },
    {
      name: 'webkit',
      use: { ...devices['Desktop Safari'] },
    },
  ],
  webServer: {
    command: 'pnpm start',
    port: 3000,
    reuseExistingServer: true,
  },
})
```

### Step 3: Write Page Object Model

```typescript
// tests/pages/login-page.ts
import { Page, Locator } from '@playwright/test'

export class LoginPage {
  readonly page: Page
  readonly usernameInput: Locator
  readonly passwordInput: Locator
  readonly loginButton: Locator

  constructor(page: Page) {
    this.page = page
    this.usernameInput = page.getByLabel('Username')
    this.passwordInput = page.getByLabel('Password')
    this.loginButton = page.getByRole('button', { name: 'Login' })
  }

  async goto() {
    await this.page.goto('/login')
  }

  async login(username: string, password: string) {
    await this.usernameInput.fill(username)
    await this.passwordInput.fill(password)
    await this.loginButton.click()
    await this.page.waitForURL('/dashboard')
  }
}
```

### Step 4: Write Tests

```typescript
// tests/auth.spec.ts
import { test, expect } from '@playwright/test'
import { LoginPage } from './pages/login-page'

test.describe('Authentication', () => {
  test('should login successfully', async ({ page }) => {
    const loginPage = new LoginPage(page)
    await loginPage.goto()
    await loginPage.login('user', 'password')
    
    await expect(page).toHaveURL('/dashboard')
    await expect(page.getByText('Welcome')).toBeVisible()
  })

  test('should show error on invalid credentials', async ({ page }) => {
    const loginPage = new LoginPage(page)
    await loginPage.goto()
    await loginPage.login('invalid', 'invalid')
    
    await expect(page.getByText('Invalid credentials')).toBeVisible()
  })
})
```

### Step 5: Run Tests

```bash
# Run all tests
npx playwright test

# Run with UI mode
npx playwright test --ui

# Run specific project
npx playwright test --project=chromium

# Run with headed browser
npx playwright test --headed

# Generate HTML report
npx playwright show-report
```

---

## Copilot Instructions

### When to Read This Note
- Setting up Playwright for E2E testing
- Writing page object models
- Creating API tests
- Implementing visual regression testing
- Debugging flaky tests

### What to Do With This Information
1. **Use Page Object Model**: Create page objects for complex user flows
2. **Auto-waiting**: Let Playwright auto-wait for elements (don't add sleeps)
3. **Parallel execution**: Run tests in parallel for speed
4. **Multiple browsers**: Test on Chromium, Firefox, WebKit
5. **API testing**: Use Playwright's request context for API tests

### Tools to Use
- **VS Code Extension**: Playwright Test for VSCode — for test debugging
- **VS Code Extension**: Error Lens — for inline test error display
- **npm Package**: `@playwright/test` — for E2E testing
- **Terminal Command**: `npx playwright test` — run tests
- **Terminal Command**: `npx playwright test --ui` — run with UI
- **Terminal Command**: `npx playwright install` — install browsers

### Agents to Invoke
- **Testing Agent**: Run when writing new E2E tests
- **Code Review Agent**: Run when reviewing PRs with test changes

### Integration with Other Notes
- Read [vitest-testing](D/vitest-testing.md) for unit testing with Vitest
- read [testing-patterns](D/testing-patterns.md) for testing strategies
- Read [react-patterns](D/react-patterns.md) for React component testing
- Read [ci-cd-patterns](D/ci-cd-patterns.md) for CI/CD integration

### Common Pitfalls
- Don't add explicit waits (use auto-waiting)
- Don't hardcode selectors (use getByLabel, getByRole)
- Don't run tests sequentially (use fullyParallel)
- Don't forget to install browsers (npx playwright install)
- Don't ignore trace files (use trace: on-first-retry)

### Quick Validation Checklist
- [ ] Are page objects used for complex flows?
- [ ] Are auto-waits used instead of sleeps?
- [ ] Are tests parallelized?
- [ ] Are multiple browsers tested?
- [ ] Are traces enabled for debugging?
- [ ] Are selectors using Playwright's locators?




