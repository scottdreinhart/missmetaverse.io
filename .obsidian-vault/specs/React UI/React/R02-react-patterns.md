---
slug: react-patterns
sources:
  - https://react.dev/reference/react
  - https://react-typescript-cheatsheet.netlify.app/
  - https://github.com/alan2207/react-patterns
date: 2026-11-02
tags:

  - maturity/deprecated











  - react
  - hooks
  - patterns
  - composition
  - state-management
  - performance
  - server-components
  - react-19
---

# React Patterns

## Overview

React patterns for building scalable, performant user interfaces with TypeScript.

---

## 1. Hooks Patterns

### Custom Hook — Data Fetching

```typescript
interface UseFetchResult<T> {
  data: T | null
  loading: boolean
  error: Error | null
  refetch: () => void
}

function useFetch<T>(url: string, dependencies: unknown[] = []): UseFetchResult<T> {
  const [data, setData] = useState<T | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<Error | null>(null)

  const refetch = useCallback(async () => {
    setLoading(true)
    setError(null)
    try {
      const response = await fetch(url)
      if (!response.ok) throw new Error(`HTTP ${response.status}`)
      const result = await response.json()
      setData(result)
    } catch (err) {
      setError(err as Error)
    } finally {
      setLoading(false)
    }
  }, [url, ...dependencies])

  useEffect(() => {
    refetch()
  }, [refetch])

  return { data, loading, error, refetch }
}

// Usage
function UserProfile({ userId }: { userId: string }) {
  const { data: user, loading, error } = useFetch<User>(`/api/users/${userId}`)

  if (loading) return <Spinner />
  if (error) return <Error message={error.message} />
  if (!user) return null

  return <div>{user.name}</div>
}
```

### Custom Hook — Local Storage

```typescript
function useLocalStorage<T>(key: string, initialValue: T): [T, (value: T) => void] {
  const [storedValue, setStoredValue] = useState<T>(() => {
    try {
      const item = window.localStorage.getItem(key)
      return item ? JSON.parse(item) : initialValue
    } catch {
      return initialValue
    }
  })

  const setValue = useCallback((value: T) => {
    setStoredValue(value)
    window.localStorage.setItem(key, JSON.stringify(value))
  }, [key])

  return [storedValue, setValue]
}

// Usage
function ThemeToggle() {
  const [theme, setTheme] = useLocalStorage<'light' | 'dark'>('theme', 'light')

  return (
    <button onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}>
      Toggle Theme
    </button>
  )
}
```

### Custom Hook — Debounce

```typescript
function useDebounce<T>(value: T, delay: number): T {
  const [debouncedValue, setDebouncedValue] = useState<T>(value)

  useEffect(() => {
    const handler = setTimeout(() => setDebouncedValue(value), delay)
    return () => clearTimeout(handler)
  }, [value, delay])

  return debouncedValue
}

// Usage — search with debounce
function SearchInput() {
  const [query, setQuery] = useState('')
  const debouncedQuery = useDebounce(query, 300)
  const { data: results } = useFetch(`/api/search?q=${debouncedQuery}`)

  return (
    <input
      value={query}
      onChange={(e) => setQuery(e.target.value)}
      placeholder="Search..."
    />
  )
}
```

---

## 2. Component Patterns

### Compound Components

```typescript
interface SelectProps {
  children: React.ReactNode
  value: string
  onChange: (value: string) => void
}

function Select({ children, value, onChange }: SelectProps) {
  const context = { value, onChange }

  return (
    <div className="relative">
      {React.Children.map(children, child =>
        React.isValidElement(child)
          ? React.cloneElement(child as React.ReactElement<SelectContext>, context)
          : child
      )}
    </div>
  )
}

function SelectTrigger({ ...props }: SelectProps) {
  const { value, onChange } = useSelectContext()
  return (
    <button onClick={() => alert(value)}>{value}</button>
  )
}

function SelectOption({ value, children }: { value: string; children: React.ReactNode }) {
  const { onChange } = useSelectContext()
  return (
    <option value={value} onChange={() => onChange(value)}>
      {children}
    </option>
  )
}

Select.Trigger = SelectTrigger
Select.Option = SelectOption

// Usage
<Select value={selected} onChange={setSelected}>
  <Select.Trigger />
  <Select.Option value="a">Option A</Select.Option>
  <Select.Option value="b">Option B</Select.Option>
</Select>
```

### Render Props

```typescript
interface WithLoadingProps {
  children: (loading: boolean) => React.ReactNode
}

function WithLoading({ children }: WithLoadingProps) {
  const [loading, setLoading] = useState(false)

  return (
    <>
      {loading && <Spinner />}
      {children(loading)}
    </>
  )
}

// Usage
<WithLoading>
  {(loading) => (
    <div>
      {!loading && <DataDisplay />}
    </div>
  )}
</WithLoading>
```

### Higher-Order Component (HOC)

```typescript
function withAuth<P extends object>(
  Component: React.ComponentType<P>
): React.FC<P & { user?: User }> {
  return function WithAuthComponent(props: P & { user?: User }) {
    const { user, loading } = useAuth()

    if (loading) return <Spinner />
    if (!user) return <Login />

    return <Component {...props as P} user={user} />
  }
}

// Usage
const ProtectedDashboard = withAuth(Dashboard)
// ProtectedDashboard automatically receives user prop
```

---

## 3. State Management

### Context + useReducer

```typescript
interface TodoState {
  todos: Todo[]
  filter: 'all' | 'active' | 'completed'
}

type TodoAction =
  | { type: 'ADD'; todo: Todo }
  | { type: 'TOGGLE'; id: string }
  | { type: 'DELETE'; id: string }
  | { type: 'SET_FILTER'; filter: TodoState['filter'] }

function todoReducer(state: TodoState, action: TodoAction): TodoState {
  switch (action.type) {
    case 'ADD':
      return { ...state, todos: [...state.todos, action.todo] }
    case 'TOGGLE':
      return {
        ...state,
        todos: state.todos.map(todo =>
          todo.id === action.id ? { ...todo, completed: !todo.completed } : todo
        ),
      }
    case 'DELETE':
      return { ...state, todos: state.todos.filter(t => t.id !== action.id) }
    case 'SET_FILTER':
      return { ...state, filter: action.filter }
    default:
      return state
  }
}

const TodoContext = createContext<{
  state: TodoState
  dispatch: React.Dispatch<TodoAction>
} | null>(null)

function TodoProvider({ children }: { children: React.ReactNode }) {
  const [state, dispatch] = useReducer(todoReducer, {
    todos: [],
    filter: 'all',
  })

  return (
    <TodoContext.Provider value={{ state, dispatch }}>
      {children}
    </TodoContext.Provider>
  )
}

// Usage
function TodoList() {
  const { state, dispatch } = useContext(TodoContext)!

  return (
    <ul>
      {state.todos
        .filter(todo => state.filter === 'all' || todo.completed === (state.filter === 'completed'))
        .map(todo => (
          <li key={todo.id}>
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => dispatch({ type: 'TOGGLE', id: todo.id })}
            />
            {todo.title}
            <button onClick={() => dispatch({ type: 'DELETE', id: todo.id })}>×</button>
          </li>
        ))}
    </ul>
  )
}
```

---

## 4. Performance Patterns

### Memoization

```typescript
// useMemo — expensive calculations
function TodoStats({ todos }: { todos: Todo[] }) {
  const stats = useMemo(() => ({
    total: todos.length,
    completed: todos.filter(t => t.completed).length,
    active: todos.filter(t => !t.completed).length,
  }), [todos])

  return <div>{stats.completed} / {stats.total} completed</div>
}

// useCallback — prevent unnecessary re-renders
function SearchBar({ onSearch }: { onSearch: (query: string) => void }) {
  const handleChange = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    onSearch(e.target.value)
  }, [onSearch])

  return <input onChange={handleChange} />
}

// React.memo — prevent re-renders
const TodoItem = React.memo(function TodoItem({ todo, onToggle }: { todo: Todo; onToggle: (id: string) => void }) {
  return (
    <li onClick={() => onToggle(todo.id)}>
      {todo.title}
    </li>
  )
})
```

### Virtualization (Large Lists)

```typescript
// Using react-window for large lists
import { FixedSizeList } from 'react-window'

function VirtualizedList({ items }: { items: Item[] }) {
  return (
    <FixedSizeList
      height={400}
      width="100%"
      itemCount={items.length}
      itemSize={50}
    >
      {({ index, style }) => (
        <div style={style}>
          {items[index].name}
        </div>
      )}
    </FixedSizeList>
  )
}
```

---

## 5. React 19 Features

### Server Components

```tsx
// app/products/page.tsx — Server Component
async function ProductsPage() {
  // Direct database access — no API layer needed
  const products = await db.query('SELECT * FROM products')

  return (
    <div>
      {products.map(product => (
        <ProductCard key={product.id} product={product} />
      ))}
    </div>
  )
}

// Client Component (interactive)
'use client'

function ProductCard({ product }: { product: Product }) {
  const [inCart, setInCart] = useState(false)

  return (
    <div>
      <h3>{product.name}</h3>
      <button onClick={() => setInCart(true)}>
        {inCart ? 'In Cart' : 'Add to Cart'}
      </button>
    </div>
  )
}
```

### Actions

```tsx
// app/actions.ts — Server Actions
'use server'

export async function createOrder(formData: FormData): Promise<Result<Order, Error>> {
  const items = formData.get('items') as string
  const customerId = formData.get('customerId') as string

  if (!items || !customerId) {
    return { success: false, error: new Error('Missing fields') }
  }

  const order = await db.query('INSERT INTO orders (...) VALUES (...) RETURNING *')
  return { success: true, data: order }
}

// Usage in component
'use client'

function OrderForm() {
  const [result, setResult] = useState<Result<Order, Error> | null>(null)

  return (
    <form action={createOrder} onSubmit={() => setResult(result)}>
      <input name="customerId" />
      <button type="submit">Create Order</button>
    </form>
  )
}
```

---

## 6. Error Handling

### Error Boundaries

```typescript
class ErrorBoundary extends React.Component<
  { children: React.ReactNode; fallback?: React.ReactNode },
  { hasError: boolean; error: Error | null }
> {
  constructor(props: { children: React.ReactNode; fallback?: React.ReactNode }) {
    super(props)
    this.state = { hasError: false, error: null }
  }

  static getDerivedStateFromError(error: Error) {
    return { hasError: true, error }
  }

  render() {
    if (this.state.hasError) {
      return this.props.fallback ?? <Error message={this.state.error?.message} />
    }
    return this.props.children
  }
}

// Usage
<ErrorBoundary>
  <App />
</ErrorBoundary>
```

---

## Cross-References

- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md)
- [Testing Patterns](../Testing/testing-patterns.md)
- [Coding Practices](./coding-practices.md)

---

## Integration with Other Notes

- Read [[react-performance-security]] for React performance optimization
- Read [vitest-testing](D/vitest-testing.md) for testing React components
- Read [playwright-patterns](D/playwright-patterns.md) for E2E testing
- Read [typescript-strict-mode](D/typescript-strict-mode.md) for TypeScript integration

---

## Decision Tree: React Pattern Selection

```mermaid
graph TD
    A[Need to build React component?]\n    A --> B{What type?}
    B -->|UI Element| C[Presentation Component]
    B -->|Data Flow| D[Container Component]
    B -->|State| E[Custom Hook]
    B -->|Error| F[Error Boundary]
    B -->|Form| G[Controlled Component]
    C --> H{Reusable?}
    H -->|Yes| I[Compound Component]
    H -->|No| J[Inline Component]
    E --> K{Global State?}
    K -->|Yes| L[Context/Store]
    K -->|No| M[Local State]
    G --> N{Complex Form?}
    N -->|Yes| O[React Hook Form]
    N -->|No| P[Simple controlled]
```

### When to Use Each React Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **Custom Hook** | Reusable logic | useFetch, useLocalStorage |
| **Compound Component** | Related components | Select + Option |
| **Render Props** | Share state between components | <DataFetcher /> |
| **Error Boundary** | Catch rendering errors | ErrorBoundary wrapper |
| **Controlled Component** | Form inputs | input with value/onChange |
| **Memoization** | Expensive recalculations | useMemo, useCallback |

---

## Procedural Guidance: React Component Setup

### Step 1: Create Component Structure

```typescript
// components/UserCard/UserCard.tsx
import React from 'react'
import type { User } from '@/types/user'

interface UserCardProps {
  user: User
  onEdit?: (user: User) => void
  onDelete?: (user: User) => void
  className?: string
}

export const UserCard: React.FC<UserCardProps> = ({
  user,
  onEdit,
  onDelete,
  className,
}) => {
  return (
    <div className={`user-card ${className}`}>
      <h3>{user.name}</h3>
      <p>{user.email}</p>
      <div className="actions">
        {onEdit && <button onClick={() => onEdit(user)}>Edit</button>}
        {onDelete && <button onClick={() => onDelete(user)}>Delete</button>}
      </div>
    </div>
  )
}
```

### Step 2: Create Custom Hook

```typescript
// hooks/useFetch.ts
import { useState, useEffect, useCallback } from 'react'

interface UseFetchResult<T> {
  data: T | null
  loading: boolean
  error: Error | null
  refetch: () => void
}

export function useFetch<T>(url: string, dependencies: unknown[] = []): UseFetchResult<T> {
  const [data, setData] = useState<T | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<Error | null>(null)

  const refetch = useCallback(async () => {
    setLoading(true)
    setError(null)
    try {
      const response = await fetch(url)
      if (!response.ok) throw new Error(`HTTP ${response.status}`)
      const result = await response.json()
      setData(result)
    } catch (err) {
      setError(err as Error)
    } finally {
      setLoading(false)
    }
  }, [url, ...dependencies])

  useEffect(() => {
    refetch()
  }, [refetch])

  return { data, loading, error, refetch }
}
```

### Step 3: Add Error Boundary

```typescript
// components/ErrorBoundary/ErrorBoundary.tsx
import React, { Component, ErrorInfo, ReactNode } from 'react'

interface Props {
  children: ReactNode
  fallback?: ReactNode
}

interface State {
  hasError: boolean
  error: Error | null
}

export class ErrorBoundary extends Component<Props, State> {
  constructor(props: Props) {
    super(props)
    this.state = { hasError: false, error: null }
  }

  static getDerivedStateFromError(error: Error): State {
    return { hasError: true, error }
  }

  componentDidCatch(error: Error, errorInfo: ErrorInfo): void {
    console.error('ErrorBoundary caught:', error, errorInfo)
  }

  render(): ReactNode {
    if (this.state.hasError) {
      return this.props.fallback ?? <Error message={this.state.error?.message} />
    }
    return this.props.children
  }
}
```

### Step 4: Use Context for Global State

```typescript
// contexts/AuthContext.tsx
import React, { createContext, useContext, useState, useCallback } from 'react'

interface AuthContextType {
  user: User | null
  login: (email: string, password: string) => Promise<void>
  logout: () => void
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null)

  const login = useCallback(async (email: string, password: string) => {
    const response = await fetch('/api/auth/login', {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    })
    if (!response.ok) throw new Error('Login failed')
    const data = await response.json()
    setUser(data.user)
  }, [])

  const logout = useCallback(() => {
    setUser(null)
    fetch('/api/auth/logout', { method: 'POST' })
  }, [])

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth(): AuthContextType {
  const context = useContext(AuthContext)
  if (!context) throw new Error('useAuth must be used within AuthProvider')
  return context
}
```

### Step 5: Wrap Application

```typescript
// main.tsx
import React from 'react'
import ReactDOM from 'react-dom/client'
import { AuthProvider } from './contexts/AuthContext'
import { ErrorBoundary } from './components/ErrorBoundary/ErrorBoundary'
import App from './App'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <ErrorBoundary>
      <AuthProvider>
        <App />
      </AuthProvider>
    </ErrorBoundary>
  </React.StrictMode>,
)
```

---

## Copilot Instructions

### When to Read This Note
- Building React components
- Creating custom hooks
- Managing state (local, context, global)
- Implementing error boundaries
- Optimizing React performance

### What to Do With This Information
1. **Custom hooks**: Extract reusable logic into custom hooks
2. **Compound components**: Use for related component groups
3. **Error boundaries**: Catch rendering errors gracefully
4. **Context**: Use for global state (auth, theme, locale)
5. **Controlled components**: Always use value/onChange for forms

### Tools to Use
- **VS Code Extension**: React Developer Tools — for debugging React components
- **VS Code Extension**: Error Lens — for inline React error display
- **npm Package**: `react` — for React framework
- **Terminal Command**: `pnpm dev` — start dev server
- **Terminal Command**: `pnpm test` — run component tests

### Agents to Invoke
- **Code Review Agent**: Run when reviewing PRs with React component changes
- **Performance Review Agent**: Run when optimizing React bundle size

### Integration with Other Notes
- Read [[react-performance-security]] for React performance optimization
- Read [vitest-testing](D/vitest-testing.md) for testing React components
- Read [playwright-patterns](D/playwright-patterns.md) for E2E testing
- Read [typescript-strict-mode](D/typescript-strict-mode.md) for TypeScript integration
- Read [[ShadCN/shadcn-ui-patterns]] for shadcn/ui component patterns

### Common Pitfalls
- Don't put too much logic in components (use custom hooks)
- Don't skip error boundaries (always wrap app)
- Don't overuse context (causes re-renders)
- Don't forget cleanup in useEffect (memory leaks)
- Don't mutate state directly (always use setState)

### Quick Validation Checklist
- [ ] Are custom hooks used for reusable logic?
- [ ] Are error boundaries implemented?
- [ ] Is state management appropriate (local vs global)?
- [ ] Are useEffect hooks cleaned up properly?
- [ ] Are components properly typed with TypeScript?
- [ ] Are props validated with TypeScript interfaces?


## See Also
- [[R01-modern-react-project-template]]
- [[R03-react-performance-security]]


