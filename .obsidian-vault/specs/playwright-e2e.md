---
slug: playwright-e2e
sources:
  - https://playwright.dev/docs/intro
  - https://playwright.dev/docs/test-config
  - https://playwright.dev/docs/test-timeouts
  - https://playwright.dev/docs/test-sharding
  - https://playwright.dev/docs/test-parallel
  - https://playwright.dev/docs/test-retries
  - https://playwright.dev/docs/test-fixtures
  - https://playwright.dev/docs/test-ui-mode
  - https://playwright.dev/docs/trace-viewer-intro
date: 2025-01-15
tags:
  - playwright
  - e2e
  - testing
  - performance
  - security
  - best-practices
---

# Playwright: Best Practices, Performance & Security

## Overview

Playwright Test is an end-to-end test framework with built-in test runner, assertions, isolation, parallelization, and rich tooling. It supports Chromium, WebKit, and Firefox across Windows, Linux, and macOS.

**Requirements:** Node.js 22.x, 24.x, or 26.x

## Installation

```bash
pnpm add -D @playwright/test
npx playwright install
```

```ts
// playwright.config.ts
import { defineConfig, devices } from '@playwright/test'

export default defineConfig({
  testDir: './tests',
  
  // Fail build on CI if tests are flaky
  fullyParallel: true,
  
  // Retry flaky tests (max 3)
  retries: 2,
  
  // Optimize parallelism
  workers: process.env.CI ? 1 : undefined,
  
  // Report mode
  reporter: 'html',
  
  // Shared settings
  use: {
    // Base URL
    baseURL: 'http://localhost:3000',
    
    // Collect trace on failure
    trace: 'on-first-retry',
    
    // Screenshot on failure
    screenshot: 'only-on-failure',
    
    // Video on failure
    video: 'retain-on-failure',
    
    // Action timeout
    actionTimeout: 10_000,
    
    // Navigation timeout
    navigationTimeout: 30_000,
    
    // Extra HTTP headers
    // extraHTTPHeaders: {},
    
    // Storage state (auth)
    // storageState: 'auth.json',
  },
  
  // Projects (browsers)
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
    // Mobile
    {
      name: 'Mobile Chrome',
      use: { ...devices['Pixel 5'] },
    },
    {
      name: 'Mobile Safari',
      use: { ...devices['iPhone 13'] },
    },
  ],
  
  // Global timeout (prevents resource exhaustion)
  globalTimeout: 3_600_000, // 1 hour
  
  // Test timeout
  timeout: 30_000,
  
  // Expect timeout
  expect: {
    timeout: 5_000,
  },
  
  // Web server (auto-started)
  webServer: {
    command: 'pnpm dev',
    port: 3000,
    reuseExistingServer: true,
  },
})
```

## Writing Tests

### Basic Test

```ts
// tests/example.spec.ts
import { test, expect } from '@playwright/test'

test('basic test', async ({ page }) => {
  await page.goto('https://playwright.dev/')
  await expect(page).toHaveTitle(/Playwright/)
})
```

### Web-First Assertions

Playwright assertions auto-retry until condition is met:

```ts
import { test, expect } from '@playwright/test'

test('web-first assertions', async ({ page }) => {
  await page.goto('/dashboard')
  
  // Auto-retries until element is visible
  await expect(page.getByRole('heading', { name: 'Dashboard' }))
    .toBeVisible()
  
  // Auto-retries until text matches
  await expect(page.getByText('Welcome'))
    .toHaveText('Welcome, John')
  
  // Auto-retries until URL matches
  await expect(page)
    .toHaveURL('/dashboard')
  
  // Auto-retries until count matches
  await expect(page.getByRole('listitem'))
    .toHaveCount(5)
  
  // Auto-retries until value matches
  await expect(page.getByLabel('Email'))
    .toHaveValue('john@example.com')
})
```

### Locators

```ts
import { test, expect } from '@playwright/test'

test('locators', async ({ page }) => {
  // By role (recommended — most accessible)
  page.getByRole('button', { name: 'Submit' })
  page.getByRole('link', { name: 'Home' })
  page.getByRole('heading', { name: 'Welcome' })
  page.getByRole('textbox', { name: 'Email' })
  
  // By text
  page.getByText('Welcome')
  page.getByText(/Welcome.*John/)
  
  // By label
  page.getByLabel('Email')
  page.getByLabel('Password')
  
  // By placeholder
  page.getByPlaceholder('Search...')
  
  // By test ID (recommended for automation)
  page.getByTestId('submit-button')
  
  // By CSS
  page.locator('button.submit')
  page.locator('#main > .card')
  
  // Chaining
  page.getByRole('list').getByRole('listitem').first()
  page.getByRole('button').filter({ hasText: 'Submit' })
})
```

### Actions

```ts
import { test, expect } from '@playwright/test'

test('actions', async ({ page }) => {
  // Navigation
  await page.goto('https://example.com')
  await page.goto('https://example.com', { waitUntil: 'domcontentloaded' })
  await page.reload()
  await page.goBack()
  await page.goForward()
  
  // Clicking
  await page.getByRole('button', { name: 'Submit' }).click()
  await page.getByRole('button', { name: 'Submit' }).dblclick()
  await page.getByRole('button', { name: 'Submit' }).click({ button: 'right' })
  await page.getByRole('button', { name: 'Submit' }).click({ modifiers: ['Control'] })
  
  // Typing
  await page.getByLabel('Email').fill('john@example.com')
  await page.getByLabel('Email').type('j')
  await page.getByLabel('Email').press('Backspace')
  
  // Selecting
  await page.getByLabel('Country').selectOption('US')
  await page.getByLabel('Country').selectOption({ label: 'United States' })
  
  // Check/uncheck
  await page.getByLabel('Accept terms').check()
  await page.getByLabel('Accept terms').uncheck()
  
  // Upload
  await page.getByLabel('Upload').setInputFiles(['./file.txt'])
  
  // Keyboard
  await page.keyboard.press('Control+a')
  await page.keyboard.press('Control+c')
  
  // Mouse
  await page.mouse.move(100, 100)
  await page.mouse.click(100, 100)
})
```

### Forms & API Testing

```ts
import { test, expect } from '@playwright/test'

test('form submission', async ({ page }) => {
  await page.goto('/register')
  
  // Fill form
  await page.getByLabel('Name').fill('John Doe')
  await page.getByLabel('Email').fill('john@example.com')
  await page.getByLabel('Password').fill('password123')
  
  // Submit
  await page.getByRole('button', { name: 'Register' }).click()
  
  // Assert success
  await expect(page).toHaveURL('/dashboard')
  await expect(page.getByText('Welcome, John')).toBeVisible()
})

test('API testing', async ({ request }) => {
  // GET
  const response = await request.get('/api/users')
  await expect(response.status()).toBe(200)
  const users = await response.json()
  expect(users).toHaveLength(3)
  
  // POST
  const createResponse = await request.post('/api/users', {
    data: { name: 'John', email: 'john@example.com' },
  })
  await expect(createResponse.status()).toBe(201)
  
  // PUT
  await request.put('/api/users/1', {
    data: { name: 'John Updated' },
  })
  
  // DELETE
  await request.delete('/api/users/1')
  await expect(createResponse.status()).toBe(204)
})
```

### Authentication

```ts
import { test as base, expect } from '@playwright/test'

// Save auth state
const test = base.extend({
  authenticatedPage: async ({ page }, use) => {
    await page.goto('/login')
    await page.getByLabel('Email').fill('admin@example.com')
    await page.getByLabel('Password').fill('password')
    await page.getByRole('button', { name: 'Login' }).click()
    await expect(page).toHaveURL('/dashboard')
    
    // Save state
    await page.context().storageState({ path: 'auth.json' })
    await use(page)
  },
})

// Use auth state
test('authenticated test', async ({ authenticatedPage }) => {
  await expect(authenticatedPage.getByText('Dashboard')).toBeVisible()
})
```

## Test Fixtures

### Custom Fixtures

```ts
import { test as base } from '@playwright/test'

interface Fixtures {
  apiClient: any
  dbConnection: any
}

const test = base.extend<Fixtures>({
  apiClient: async ({}, use) => {
    const client = { /* ... */ }
    await use(client)
    // Cleanup
  },
  
  dbConnection: async ({}, use) => {
    const connection = await connectDB()
    await use(connection)
    await connection.close()
  },
})

test('uses fixtures', async ({ apiClient, dbConnection }) => {
  await apiClient.get('/users')
  await dbConnection.query('SELECT * FROM users')
})
```

### Fixture Scopes

```ts
const test = base.extend({
  // Test-scoped (default) — created/destroyed per test
  testFixture: [async ({}, use) => {
    const value = 'test-scoped'
    await use(value)
  }, { scope: 'test' }],
  
  // Worker-scoped — shared across tests in same worker
  workerFixture: [async ({}, use) => {
    const value = 'worker-scoped'
    await use(value)
  }, { scope: 'worker' }],
})
```

## Test Organization

### Test File Structure

```
tests/
├── e2e/
│   ├── login.spec.ts
│   ├── dashboard.spec.ts
│   └── checkout.spec.ts
├── integration/
│   ├── api.spec.ts
│   └── webhooks.spec.ts
├── fixtures/
│   └── auth.ts
├── utils/
│   └── helpers.ts
├── global-setup.ts
└── global-teardown.ts
```

### global-setup.ts

```ts
import { chromium } from 'playwright/test'

export default async function globalSetup() {
  const browser = await chromium.launch()
  const context = await browser.newContext()
  const page = await context.newPage()
  
  // Seed database
  await page.goto('/admin/seed')
  await page.getByRole('button', { name: 'Seed' }).click()
  
  await browser.close()
}
```

### Test Tags & Filtering

```ts
import { test, expect } from '@playwright/test'

test('smoke test', { tag: ['smoke'] }, async ({ page }) => {
  // ...
})

test('integration test', { tag: ['integration'] }, async ({ page }) => {
  // ...
})

// Run only smoke tests
// npx playwright test --grep-invert '@slow'
```

## Performance Optimization

### Parallel Execution

```ts
export default defineConfig({
  // Run tests in parallel (default: true)
  fullyParallel: true,
  
  // Number of parallel workers
  workers: process.env.CI ? 4 : undefined,
  
  // Max parallel tests per worker
  parallel: true,
  
  // Shard for CI
  // shard: { current: 1, total: 4 },
})
```

### Timeouts

| Timeout | Default | Config |
|---------|---------|--------|
| Test timeout | 30s | `{ timeout: 60_000 }` |
| Expect timeout | 5s | `{ expect: { timeout: 10_000 } }` |
| Action timeout | none | `{ use: { actionTimeout: 10_000 } }` |
| Navigation timeout | none | `{ use: { navigationTimeout: 30_000 } }` |
| Global timeout | none | `{ globalTimeout: 3_600_000 }` |
| Fixture timeout | test timeout | `{ scope: 'test', timeout: 30_000 }` |

### Per-Test Timeout

```ts
import { test, expect } from '@playwright/test'

test('slow test', async ({ page }) => {
  test.setTimeout(120_000) // 2 minutes
  
  // Or mark as slow (3x default timeout)
  test.slow()
  
  // ...
})
```

### Retries

```ts
export default defineConfig({
  // Retry flaky tests
  retries: 2,
  
  // Per-test retries
  test('flaky test', { retries: 3 }, async ({ page }) => {
    // ...
  }),
})
```

### Sharding for CI

```ts
export default defineConfig({
  // Shard for parallel CI execution
  // CI: npx playwright test --shard=1/3
  shard: process.env.CI ? { current: parseInt(process.env.CI_SHARD_CURRENT || '1'), total: parseInt(process.env.CI_SHARD_TOTAL || '3') } : undefined,
})
```

## Debugging & Tooling

### UI Mode

```bash
npx playwright test --ui
```

UI Mode provides:
- Watch mode with file watching
- Live step view
- Time travel debugging
- Test filtering
- Trace integration

### Trace Viewer

```ts
export default defineConfig({
  use: {
    trace: 'retain-on-failure', // or 'on' for all tests
  },
})
```

```bash
# Show trace
npx playwright show-trace trace.zip

# Generate trace on failure
npx playwright test --trace on
```

### Codegen

```bash
# Generate tests visually
npx playwright codegen https://example.com

# Generate test for specific browser
npx playwright codegen --browser=chromium https://example.com
```

### Debug Mode

```bash
# Debug with VS Code
npx playwright test --debug

# Debug specific test
npx playwright test login.spec.ts --debug

# Open inspector
PWDEBUG=1 npx playwright test
```

### HTML Report

```bash
# Generate HTML report
npx playwright test --reporter=html

# Open report
npx playwright show-report
```

## Security Best Practices

### Isolated Test Contexts

```ts
import { test, expect } from '@playwright/test'

// Each test gets a fresh browser context
test('test 1', async ({ page }) => {
  // Isolated from other tests
})

test('test 2', async ({ page }) => {
  // Also isolated
})
```

### Storage State Isolation

```ts
import { test, expect } from '@playwright/test'

test('authenticated', async ({ context }) => {
  // Each test gets a fresh context
  const page = await context.newPage()
  await page.goto('/login')
  // ...
})
```

### Avoid Hardcoded Secrets

```ts
// BAD: Hardcoded credentials
await page.getByLabel('Email').fill('admin@example.com')
await page.getByLabel('Password').fill('super-secret-password')

// GOOD: Use environment variables
await page.getByLabel('Email').fill(process.env.TEST_USER_EMAIL || 'admin@test.com')
await page.getByLabel('Password').fill(process.env.TEST_USER_PASSWORD || 'test-password')
```

### Content Security Policy Testing

```ts
import { test, expect } from '@playwright/test'

test('CSP headers are set', async ({ page }) => {
  const response = await page.goto('/')
  const csp = response.headers()['content-security-policy']
  expect(csp).toBeDefined()
  expect(csp).toContain("default-src 'self'")
})
```

## Best Practices Checklist

- [x] **Use `getByRole`** — most accessible locators
- [x] **Use `getByTestId`** — stable automation selectors
- [x] **Use web-first assertions** — auto-retry
- [x] **Enable `fullyParallel`** — max speed
- [x] **Use `retries`** — handle flakiness
- [x] **Use `trace: 'on-first-retry'`** — debug failures
- [x] **Use `screenshot: 'only-on-failure'`** — save space
- [x] **Use `webServer`** — auto-start dev server
- [x] **Use fixtures** — share setup/teardown
- [x] **Use `globalSetup`** — seed data once
- [x] **Use `baseURL`** — avoid hardcoding URLs
- [x] **Use `storageState`** — auth persistence
- [x] **Use `--shard`** in CI for parallel execution
- [x] **Use `--ui`** for interactive debugging
- [x] **Use `--debug`** for step-through debugging
- [x] **Generate HTML reports** for test results
- [x] **Never commit secrets** in test files
- [x] **Use environment variables** for test credentials
- [x] **Add `tests/` to `.gitignore`** (if containing secrets)
- [x] **Use `trace: 'retain-on-failure'`** for debugging

## CLI Reference

| Command | Description |
|---------|-------------|
| `npx playwright test` | Run all tests |
| `npx playwright test --headed` | Run with visible browser |
| `npx playwright test --ui` | Open UI mode |
| `npx playwright test --debug` | Debug mode |
| `npx playwright test --project=chromium` | Run single browser |
| `npx playwright test tests/login.spec.ts` | Run single file |
| `npx playwright test --grep="login"` | Filter by name |
| `npx playwright test --shard=1/3` | Shard for CI |
| `npx playwright test --retries=0` | No retries |
| `npx playwright codegen` | Generate tests |
| `npx playwright show-report` | Open HTML report |
| `npx playwright show-trace` | Open trace viewer |
| `npx playwright install` | Install browsers |

## Cross-References

- See [[vitest-testing]] for unit testing with Vitest
- See [[react-performance-security]] for React testing patterns
- See [[vite-optimization-security]] for Vite configuration
- See [[pnpm-best-practices]] for package management
