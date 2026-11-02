---
slug: testing-patterns
sources:
  - https://vitest.dev/guide/
  - https://playwright.dev/
  - https://testing-library.com/docs/react-testing-library/intro/
date: 2026-11-02
tags:
  - testing
  - vitest
  - playwright
  - react-testing-library
  - unit-testing
  - integration-testing
  - e2e-testing
  - mocking
  - coverage
---

# Testing Patterns

## Overview

Comprehensive testing strategy for React + TypeScript applications using Vitest (unit/integration) and Playwright (E2E).

---

## 1. Vitest Configuration

```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import tsconfigPaths from 'vite-tsconfig-paths'

export default defineConfig({
  plugins: [react(), tsconfigPaths()],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './src/test/setup.ts',
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      exclude: [
        'node_modules/',
        'src/test/',
        '**/*.d.ts',
        '**/*.config.*',
      ],
      thresholds: {
        branches: 80,
        functions: 80,
        lines: 80,
        statements: 80,
      },
    },
  },
})
```

### Test Setup

```typescript
// src/test/setup.ts
import '@testing-library/jest-dom'
import { vi } from 'vitest'

// Mock fetch globally
global.fetch = vi.fn()

// Mock localStorage
const localStorageMock = {
  getItem: vi.fn(),
  setItem: vi.fn(),
  removeItem: vi.fn(),
  clear: vi.fn(),
}
Object.defineProperty(window, 'localStorage', { value: localStorageMock })

// Mock window.matchMedia
Object.defineProperty(window, 'matchMedia', {
  writable: true,
  value: vi.fn().mockImplementation(query => ({
    matches: false,
    media: query,
    onchange: null,
    addListener: vi.fn(),
    removeListener: vi.fn(),
    addEventListener: vi.fn(),
    removeEventListener: vi.fn(),
    dispatchEvent: vi.fn(),
  })),
})
```

---

## 2. Unit Testing

### Testing Pure Functions

```typescript
// utils/formatDate.test.ts
import { describe, it, expect } from 'vitest'
import { formatDate, parseDate } from './formatDate'

describe('formatDate', () => {
  it('should format date as YYYY-MM-DD', () => {
    const date = new Date('2026-11-02')
    expect(formatDate(date)).toBe('2026-11-02')
  })

  it('should handle different date formats', () => {
    expect(formatDate(new Date(2026, 0, 1))).toBe('2026-01-01')
    expect(formatDate(new Date(2026, 11, 31))).toBe('2026-12-31')
  })

  it('should throw on invalid date', () => {
    expect(() => formatDate(new Date('invalid'))).toThrow()
  })
})

describe('parseDate', () => {
  it('should parse YYYY-MM-DD format', () => {
    const result = parseDate('2026-11-02')
    expect(result.getFullYear()).toBe(2026)
    expect(result.getMonth()).toBe(10)
    expect(result.getDate()).toBe(2)
  })
})
```

### Testing Classes

```typescript
// services/Calculator.test.ts
import { describe, it, expect, beforeEach } from 'vitest'
import { Calculator } from './Calculator'

describe('Calculator', () => {
  let calculator: Calculator

  beforeEach(() => {
    calculator = new Calculator()
  })

  it('should add numbers', () => {
    expect(calculator.add(2, 3)).toBe(5)
  })

  it('should subtract numbers', () => {
    expect(calculator.subtract(5, 3)).toBe(2)
  })

  it('should multiply numbers', () => {
    expect(calculator.multiply(4, 3)).toBe(12)
  })

  it('should divide numbers', () => {
    expect(calculator.divide(10, 2)).toBe(5)
  })

  it('should throw on division by zero', () => {
    expect(() => calculator.divide(10, 0)).toThrow('Division by zero')
  })
})
```

---

## 3. Integration Testing

### Testing API Calls

```typescript
// services/userService.test.ts
import { describe, it, expect, vi, beforeEach } from 'vitest'
import { userService } from './userService'

vi.mock('../api/client', () => ({
  api: {
    get: vi.fn(),
    post: vi.fn(),
  },
}))

describe('userService', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  it('should fetch user by ID', async () => {
    const mockUser = { id: '1', name: 'John', email: 'john@example.com' }
    vi.mocked(api.get).mockResolvedValue({ data: mockUser })

    const user = await userService.getById('1')

    expect(user).toEqual(mockUser)
    expect(api.get).toHaveBeenCalledWith('/users/1')
  })

  it('should create user', async () => {
    const userData = { name: 'Jane', email: 'jane@example.com' }
    const createdUser = { id: '2', ...userData }
    vi.mocked(api.post).mockResolvedValue({ data: createdUser })

    const user = await userService.create(userData)

    expect(user).toEqual(createdUser)
    expect(api.post).toHaveBeenCalledWith('/users', userData)
  })

  it('should handle API errors', async () => {
    vi.mocked(api.get).mockRejectedValue(new Error('Network error'))

    await expect(userService.getById('1')).rejects.toThrow('Network error')
  })
})
```

### Testing React Components

```typescript
// components/UserProfile.test.tsx
import { describe, it, expect, vi } from 'vitest'
import { render, screen, fireEvent, waitFor } from '@testing-library/react'
import { UserProfile } from './UserProfile'
import { userService } from '../services/userService'

vi.mock('../services/userService', () => ({
  userService: { getById: vi.fn() },
}))

describe('UserProfile', () => {
  it('should display user information', async () => {
    const mockUser = { id: '1', name: 'John', email: 'john@example.com' }
    vi.mocked(userService.getById).mockResolvedValue(mockUser)

    render(<UserProfile userId="1" />)

    await waitFor(() => screen.getByText('John'))
    expect(screen.getByText('john@example.com')).toBeInTheDocument()
  })

  it('should show loading state', () => {
    vi.mocked(userService.getById).mockResolvedValue(null)

    render(<UserProfile userId="1" />)

    expect(screen.getByText('Loading...')).toBeInTheDocument()
  })

  it('should show error state', async () => {
    vi.mocked(userService.getById).mockRejectedValue(new Error('Not found'))

    render(<UserProfile userId="1" />)

    await waitFor(() => screen.getByText('Error loading profile'))
  })

  it('should call onEdit when edit button is clicked', async () => {
    const mockUser = { id: '1', name: 'John', email: 'john@example.com' }
    vi.mocked(userService.getById).mockResolvedValue(mockUser)

    const onEdit = vi.fn()
    render(<UserProfile userId="1" onEdit={onEdit} />)

    await waitFor(() => screen.getByText('John'))
    fireEvent.click(screen.getByText('Edit'))

    expect(onEdit).toHaveBeenCalledWith('1')
  })
})
```

---

## 4. Playwright E2E Testing

### Configuration

```typescript
// playwright.config.ts
import { defineConfig, devices } from '@playwright/test'

export default defineConfig({
  testDir: './e2e',
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
    command: 'npm run dev',
    port: 3000,
    reuseExistingServer: !process.env.CI,
  },
})
```

### Page Objects

```typescript
// e2e/page-objects/LoginPage.ts
import { Page, expect } from '@playwright/test'

export class LoginPage {
  constructor(private page: Page) {}

  async goto() {
    await this.page.goto('/login')
  }

  async fillEmail(email: string) {
    await this.page.getByLabel('Email').fill(email)
  }

  async fillPassword(password: string) {
    await this.page.getByLabel('Password').fill(password)
  }

  async submit() {
    await this.page.getByRole('button', { name: 'Sign in' }).click()
  }

  async login(email: string, password: string) {
    await this.goto()
    await this.fillEmail(email)
    await this.fillPassword(password)
    await this.submit()
  }

  async getErrorMessage() {
    return this.page.getByRole('alert').textContent()
  }
}

// e2e/page-objects/DashboardPage.ts
import { Page, expect } from '@playwright/test'

export class DashboardPage {
  constructor(private page: Page) {}

  async goto() {
    await this.page.goto('/dashboard')
  }

  async getWelcomeMessage() {
    return this.page.getByRole('heading', { name: 'Welcome' }).textContent()
  }

  async getOrderCount() {
    return this.page.getByTestId('order-count').textContent()
  }
}
```

### E2E Tests

```typescript
// e2e/auth.spec.ts
import { test, expect } from '@playwright/test'
import { LoginPage } from './page-objects/LoginPage'
import { DashboardPage } from './page-objects/DashboardPage'

test.describe('Authentication', () => {
  test('should login with valid credentials', async ({ page }) => {
    const loginPage = new LoginPage(page)
    await loginPage.login('user@example.com', 'password123')

    const dashboard = new DashboardPage(page)
    await expect(dashboard.getWelcomeMessage()).resolves.toBe('Welcome, User!')
  })

  test('should show error with invalid credentials', async ({ page }) => {
    const loginPage = new LoginPage(page)
    await loginPage.fillEmail('user@example.com')
    await loginPage.fillPassword('wrongpassword')
    await loginPage.submit()

    await expect(loginPage.getErrorMessage()).resolves.toContain('Invalid credentials')
  })

  test('should redirect to login when not authenticated', async ({ page }) => {
    await page.goto('/dashboard')
    await expect(page).toHaveURL(/\/login/)
  })
})

// e2e/orders.spec.ts
import { test, expect } from '@playwright/test'

test.describe('Orders', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/login')
    await page.getByLabel('Email').fill('user@example.com')
    await page.getByLabel('Password').fill('password123')
    await page.getByRole('button', { name: 'Sign in' }).click()
    await page.goto('/orders')
  })

  test('should display order list', async ({ page }) => {
    await expect(page.getByRole('heading', { name: 'Orders' })).toBeVisible()
    await expect(page.getByTestId('order-item')).toHaveCount(3)
  })

  test('should filter orders by status', async ({ page }) => {
    await page.getByRole('button', { name: 'Pending' }).click()
    await expect(page.getByTestId('order-item')).toHaveCount(1)
  })

  test('should navigate to order detail', async ({ page }) => {
    await page.getByTestId('order-item').first().click()
    await expect(page).toHaveURL(/\/orders\/\d+/)
  })
})
```

---

## 5. Testing Utilities

### Test Helpers

```typescript
// src/test/helpers.ts
import { vi } from 'vitest'

export function createMockUser(overrides = {}): User {
  return {
    id: 'mock-user-1',
    name: 'Mock User',
    email: 'mock@example.com',
    ...overrides,
  }
}

export function createMockOrder(overrides = {}): Order {
  return {
    id: 'mock-order-1',
    customerId: 'mock-user-1',
    items: [],
    total: { amount: 0, currency: 'USD' },
    status: 'pending',
    ...overrides,
  }
}

export function delay(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms))
}

export function mockFetch(response: unknown, status = 200) {
  global.fetch = vi.fn().mockResolvedValue({
    ok: status < 400,
    status,
    json: () => Promise.resolve(response),
    text: () => Promise.resolve(JSON.stringify(response)),
  })
}
```

### Testing Hooks

```typescript
// hooks/useAuth.test.ts
import { renderHook, waitFor } from '@testing-library/react'
import { describe, it, expect, vi } from 'vitest'
import { useAuth } from './useAuth'

describe('useAuth', () => {
  it('should return user when authenticated', async () => {
    const mockUser = { id: '1', name: 'John' }
    vi.mocked(authService.getCurrentUser).mockResolvedValue(mockUser)

    const { result } = renderHook(() => useAuth())

    await waitFor(() => expect(result.current.user).toEqual(mockUser))
    expect(result.current.loading).toBe(false)
  })

  it('should handle authentication error', async () => {
    vi.mocked(authService.getCurrentUser).mockRejectedValue(new Error('Failed'))

    const { result } = renderHook(() => useAuth())

    await waitFor(() => expect(result.current.error).toBeDefined())
  })
})
```

---

## 6. Test Types

```typescript
// src/test/types.ts
export interface TestUser {
  id: string
  name: string
  email: string
}

export interface TestOrder {
  id: string
  customerId: string
  items: TestOrderItem[]
  total: number
  status: 'pending' | 'confirmed' | 'shipped'
}

export interface TestOrderItem {
  productId: string
  name: string
  price: number
  quantity: number
}
```

---

## Cross-References

- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md)
- [React Patterns](../React/react-patterns.md)
- [CI/CD GitHub Actions](./cicd-github-actions.md)
