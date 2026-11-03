---
slug: testing-patterns
sources:
  - https://vitest.dev/guide/
  - https://playwright.dev/
  - https://testing-library.com/docs/react-testing-library/intro/
date: 2026-11-02
tags:
  - priority/high
  - maturity/deprecated
  - domain/backend
  - type/reference
  - domain/security
  - domain/frontend
  - domain/architecture
  - type/concept
  - domain/optimization
  - domain/devops
  - status/complete
  - type/guide
  - domain/testing
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
- [React Patterns](../React/react-patterns)
- [CI/CD GitHub Actions](./cicd-github-actions.md)

---

## Integration with Other Notes

- Read [[vitest-testing]] for Vitest testing patterns
- Read [playwright-patterns](D/playwright-patterns.md) for E2E testing with Playwright
- Read [react-patterns](D/react-patterns.md) for React testing patterns
- Read [[Quality Delivery/ci-cd-patterns]] for CI/CD testing integration

---

## Decision Tree: Testing Strategy

```mermaid
graph TD
    A[Need to test?]\n    A --> B{What level?}
    B -->|Unit| C[Vitest]
    B -->|Integration| D[Vitest + MSW]
    B -->|E2E| E[Playwright]
    B -->|Component| F[React Testing Library]
    C --> G{Pure function?}
    G -->|Yes| H[Direct call]
    G -->|No| I[Mock dependencies]
    D --> J{API call?}
    J -->|Yes| K[MSW mock]
    J -->|No| L[Direct call]
    E --> M{User flow?}
    M -->|Yes| N[Page Object Model]
    M -->|No| O[Inline test]
```

### When to Use Each Testing Level

| Level | When to Use | Tool |
|-------|-------------|------|
| **Unit** | Pure functions, utilities | Vitest |
| **Integration** | Component interactions | Vitest + MSW |
| **Component** | React components | React Testing Library |
| **E2E** | User flows | Playwright |
| **Visual** | UI changes | Playwright screenshots |

---

## Procedural Guidance: Testing Setup

### Step 1: Configure Vitest

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
        lines: 80,
        statements: 80,
        functions: 80,
        branches: 80,
      },
    },
  },
})
```

### Step 2: Setup Test Environment

```typescript
// src/test/setup.ts
import { afterEach } from 'vitest'
import { cleanup } from '@testing-library/react'
import '@testing-library/jest-dom/vitest'

afterEach(() => {
  cleanup()
})
```

### Step 3: Write Unit Tests

```typescript
// src/utils/validators.test.ts
import { describe, it, expect } from 'vitest'
import { isValidEmail, isValidPassword } from './validators'

describe('validators', () => {
  describe('isValidEmail', () => {
    it('should return true for valid email', () => {
      expect(isValidEmail('user@example.com')).toBe(true)
    })

    it('should return false for invalid email', () => {
      expect(isValidEmail('invalid-email')).toBe(false)
    })

    it('should return false for empty string', () => {
      expect(isValidEmail('')).toBe(false)
    })
  })

  describe('isValidPassword', () => {
    it('should return true for valid password', () => {
      expect(isValidPassword('SecurePass123')).toBe(true)
    })

    it('should return false for short password', () => {
      expect(isValidPassword('Ab1')).toBe(false)
    })
  })
})
```

### Step 4: Write Component Tests

```typescript
// src/components/LoginForm.test.tsx
import { describe, it, expect, vi } from 'vitest'
import { render, screen, fireEvent } from '@testing-library/react'
import { LoginForm } from './LoginForm'

describe('LoginForm', () => {
  it('should render form fields', () => {
    render(<LoginForm onSubmit={vi.fn()} />)
    
    expect(screen.getByLabelText(/email/i)).toBeInTheDocument()
    expect(screen.getByLabelText(/password/i)).toBeInTheDocument()
    expect(screen.getByRole('button', { name: /sign in/i })).toBeInTheDocument()
  })

  it('should call onSubmit with form data', async () => {
    const mockSubmit = vi.fn()
    render(<LoginForm onSubmit={mockSubmit} />)
    
    fireEvent.change(screen.getByLabelText(/email/i), {
      target: { value: 'user@example.com' },
    })
    fireEvent.change(screen.getByLabelText(/password/i), {
      target: { value: 'password123' },
    })
    fireEvent.click(screen.getByRole('button', { name: /sign in/i }))
    
    expect(mockSubmit).toHaveBeenCalledWith({
      email: 'user@example.com',
      password: 'password123',
    })
  })
})
```

### Step 5: Mock API with MSW

```typescript
// src/test/mocks.ts
import { http, HttpResponse } from 'msw'
import { setupServer } from 'msw/node'

export const handlers = [
  http.get('/api/users/:id', ({ params }) => {
    return HttpResponse.json({
      id: params.id,
      name: 'John Doe',
      email: 'john@example.com',
    })
  }),

  http.post('/api/auth/login', async ({ request }) => {
    const body = await request.json()
    if (body.email === 'invalid@example.com') {
      return HttpResponse.json(
        { error: 'Invalid credentials' },
        { status: 401 },
      )
    }
    return HttpResponse.json({
      token: 'mock-token',
      user: { id: '1', name: 'John Doe' },
    })
  }),
]

export const server = setupServer(...handlers)
```

### Step 6: Run Tests

```bash
# Run all tests
pnpm test

# Run with coverage
pnpm test -- --coverage

# Run in watch mode
pnpm test -- --watch

# Run specific test file
pnpm test src/utils/validators.test.ts

# Run specific test
pnpm test -- -t "isValidEmail"
```

---

## Copilot Instructions

### When to Read This Note
- Setting up testing infrastructure
- Writing unit tests with Vitest
- Testing React components
- Mocking API calls with MSW
- Configuring test coverage

### What to Do With This Information
1. **Unit tests**: Test pure functions and utilities with Vitest
2. **Component tests**: Test React components with React Testing Library
3. **API mocks**: Use MSW for mocking API calls
4. **E2E tests**: Use Playwright for user flow testing
5. **Coverage**: Aim for 80%+ coverage on critical code

### Tools to Use
- **VS Code Extension**: Error Lens — for inline test error display
- **VS Code Extension**: Test Explorer UI — for test navigation
- **npm Package**: `vitest` — for unit testing
- **npm Package**: `@testing-library/react` — for component testing
- **npm Package**: `msw` — for API mocking
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm test -- --coverage` — run with coverage

### Agents to Invoke
- **Testing Agent**: Run when writing new tests
- **Code Review Agent**: Run when reviewing PRs with test changes

### Integration with Other Notes
- Read [[vitest-testing]] for Vitest testing patterns
- Read [playwright-patterns](D/playwright-patterns.md) for E2E testing with Playwright
- Read [react-patterns](D/react-patterns.md) for React testing patterns
- Read [[Quality Delivery/ci-cd-patterns]] for CI/CD testing integration
- Read [react-performance-security](D/react-performance-security.md) for testing security

### Common Pitfalls
- Don't test implementation details (test behavior)
- Don't skip edge cases (test null, empty, errors)
- Don't hardcode timeouts (use async/await)
- Don't ignore coverage thresholds (aim for 80%+)
- Don't mock everything (test real behavior when possible)

### Quick Validation Checklist
- [ ] Are unit tests written for pure functions?
- [ ] Are component tests testing behavior, not implementation?
- [ ] Are API calls mocked with MSW?
- [ ] Are edge cases tested (null, empty, errors)?
- [ ] Is coverage above 80%?
- [ ] Are tests running in CI/CD?



## See Also
- [[T01-playwright-e2e]]
- [[T03-vitest-testing]]


