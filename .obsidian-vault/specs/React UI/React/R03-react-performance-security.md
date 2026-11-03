---
slug: React/modern-react-performance
sources:
  - https://react.dev/reference/react/useMemo
  - https://react.dev/reference/react/useCallback
  - https://react.dev/reference/react/useTransition
  - https://react.dev/reference/react/useDeferredValue
  - https://react.dev/reference/react/components
  - https://react.dev/reference/react
  - https://react.dev/learn/security
date: 2025-01-15
tags:
  - maturity/deprecated
  - react
  - performance
  - optimization
  - security
  - concurrent
  - best-practices
# React: Performance, Security & Best Practices

## Overview

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
React 19 introduces **Concurrent React** with non-blocking rendering, Transitions, Suspense, and the React Compiler for automatic memoization. This note covers optimization, security, and best practices.

## React Compiler (Automatic Memoization)

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
The React Compiler automatically memoizes values and functions, reducing the need for manual `useMemo`/`useCallback` calls:

```js
// React Compiler handles this automatically
function TodoList({ todos, tab }) {
  const visibleTodos = filterTodos(todos, tab);
  return <ul>{visibleTodos.map(t => <li key={t.id}>{t.text}</li>)}</ul>;
}
```

## Performance Optimization

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
### useMemo â€” Cache Expensive Calculations

```tsx
import { useMemo } from 'react';

function TodoList({ todos, tab }) {
  // Only recalculates when todos or tab changes
  const visibleTodos = useMemo(
    () => filterTodos(todos, tab),
    [todos, tab]
  );
  return <ul>{visibleTodos.map(t => <li key={t.id}>{t.text}</li>)}</ul>;
}
```

**When to use `useMemo`:**
- Calculation is noticeably slow (1ms+)
- Passed as prop to a `memo`-wrapped component
- Used as a dependency of another Hook

**When NOT to use:**
- Simple calculations (most cases)
- Code readability is more important
- React Compiler is enabled (handles automatically)

### useCallback â€” Cache Function References

```tsx
import { useCallback } from 'react';

function ProductPage({ productId, referrer }) {
  // Cached function reference â€” only changes when deps change
  const handleSubmit = useCallback((orderDetails) => {
    post(`/product/${productId}/buy`, { referrer, orderDetails });
  }, [productId, referrer]);

  return <ShippingForm onSubmit={handleSubmit} />;
}
```

**When to use `useCallback`:**
- Passed as prop to a `memo`-wrapped component
- Used as a dependency of another Hook or Effect
- Returned from a custom Hook

**Updater function pattern â€” remove state dependencies:**

```tsx
// BAD: todos is a dependency
const handleAddTodo = useCallback((text) => {
  setTodos([...todos, { id: nextId++, text }]);
}, [todos]);

// GOOD: No dependency needed
const handleAddTodo = useCallback((text) => {
  setTodos(prev => [...prev, { id: nextId++, text }]);
}, []);
```

### memo â€” Skip Re-renders

```tsx
import { memo } from 'react';

// Child only re-renders when props change
const ExpensiveList = memo(function ExpensiveList({ items }) {
  return (
    <ul>
      {items.map(item => <li key={item.id}>{item.name}</li>)}
    </ul>
  );
});
```

### useTransition â€” Non-Blocking Updates

```tsx
import { useState, useTransition } from 'react';

function TabContainer() {
  const [isPending, startTransition] = useTransition();
  const [tab, setTab] = useState('about');

  function selectTab(nextTab) {
    startTransition(() => {
      setTab(nextTab); // Non-blocking update
    });
  }

  return (
    <>
      <button onClick={() => selectTab('about')}>About</button>
      <button onClick={() => selectTab('posts')}>Posts</button>
      {isPending && <span>Loading...</span>}
      {tab === 'about' && <AboutTab />}
      {tab === 'posts' && <PostsTab />}
    </>
  );
}
```

**Key behaviors:**
- UI stays responsive during expensive updates
- `isPending` tracks transition state
- Interruptible â€” user clicks are handled immediately
- Works with Suspense to prevent loading flicker

### useDeferredValue â€” Lag Behind for Performance

```tsx
import { useState, useDeferredValue } from 'react';

function SearchPage() {
  const [query, setQuery] = useState('');
  const deferredQuery = useDeferredValue(query);

  return (
    <>
      <input value={query} onChange={e => setQuery(e.target.value)} />
      {/* Input updates immediately, results "lag behind" */}
      <SearchResults query={deferredQuery} />
    </>
  );
}
```

**How it works:**
1. React re-renders with old `deferredQuery` (input stays fast)
2. Background re-render with new value (interruptible)
3. Integrates with Suspense â€” shows stale content while loading

**Better than debouncing/throttling:**
- No fixed delay â€” adapts to device speed
- Interruptible by default
- Deeply integrated with React's rendering

### Concurrent Features Summary

| Hook | Purpose | Use Case |
|------|---------|----------|
| `useTransition` | Mark state updates as low priority | Tab switches, navigation |
| `useDeferredValue` | Defer part of UI rendering | Search results, large lists |
| `Suspense` | Show fallback while loading | Data fetching, code splitting |
| `startTransition` | Start non-blocking action | Form submissions, API calls |

## Security Best Practices

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
### XSS Prevention

React automatically escapes content rendered in JSX:

```tsx
// SAFE: React escapes user input
function Message({ text }) {
  return <p>{text}</p>; // Escaped automatically
}

// DANGEROUS: Only use with sanitized content
function RawHTML({ html }) {
  return <div dangerouslySetInnerHTML={{ __html: html }} />;
}
```

### Sanitizing User Content

```tsx
import DOMPurify from 'dompurify';

function UserContent({ content }) {
  const sanitized = DOMPurify.sanitize(content);
  return <div dangerouslySetInnerHTML={{ __html: sanitized }} />;
}
```

### Content Security Policy (CSP)

```html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self';
               script-src 'self' https://trusted.cdn.com;
               style-src 'self' 'unsafe-inline';
               img-src 'self' data: https:;">
```

### Protecting Secrets

```env
# .env.local (never commit)
DB_PASSWORD=secret
API_KEY=secret123

# .env (safe to commit â€” only VITE_ prefix is exposed)
VITE_APP_TITLE=My App
VITE_API_URL=https://api.example.com
```

```tsx
// SAFE: Only VITE_ prefixed vars are exposed to client
console.log(import.meta.env.VITE_APP_TITLE); // "My App"
console.log(import.meta.env.DB_PASSWORD); // undefined â€” NOT exposed

// NEVER put secrets in VITE_ variables
// They are bundled into source code at build time
```

### Error Boundaries

```tsx
import { Component } from 'react';

class ErrorBoundary extends Component {
  state = { hasError: false };

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error('Error caught:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Something went wrong.</h1>;
    }
    return this.props.children;
  }
}
```

## Rules of React

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
### Components and Hooks Must Be Pure

```tsx
// GOOD: Pure component
function Greeting({ name }) {
  return <h1>Hello, {name}!</h1>;
}

// BAD: Impure â€” mutates external state
function BadGreeting({ name }) {
  externalCounter++; // Side effect in render
  return <h1>Hello, {name}!</h1>;
}
```

### React Calls Components and Hooks

- Don't call components directly â€” return JSX
- Don't call hooks conditionally
- Follow the Rules of Hooks

### Rules of Hooks

1. Only call hooks at the **top level** of components
2. Only call hooks from **React functions** (components, custom hooks)

```tsx
// GOOD
function Component() {
  const [state, setState] = useState(0); // Top level
  useEffect(() => { ... }, []); // Top level
  return <div>{state}</div>;
}

// BAD
function Component() {
  if (condition) {
    const [state, setState] = useState(0); // Conditional â€” breaks!
  }
  return <div></div>;
}
```

## State Management Best Practices

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
### Prefer Local State

```tsx
// GOOD: Local state
function Form() {
  const [value, setValue] = useState('');
  return <input value={value} onChange={e => setValue(e.target.value)} />;
}

// BAD: Lifting state too high
function App() {
  const [hoveredItem, setHoveredItem] = useState(null); // Too high!
  return <Child hoveredItem={hoveredItem} setHoveredItem={setHoveredItem} />;
}
```

### Avoid Unnecessary Effects

```tsx
// BAD: Effect that could be derived
useEffect(() => {
  setFilteredItems(items.filter(item => item.active));
}, [items]);

// GOOD: Derived value
const filteredItems = items.filter(item => item.active);
```

### Move Objects Inside Effects

```tsx
// BAD: Object dependency causes constant re-fires
const options = { serverUrl: 'https://api.com', roomId };
useEffect(() => {
  const conn = createConnection(options);
  return () => conn.disconnect();
}, [options]); // Re-fires every render!

// GOOD: Object inside effect
useEffect(() => {
  const options = { serverUrl: 'https://api.com', roomId };
  const conn = createConnection(options);
  return () => conn.disconnect();
}, [roomId]); // Only re-fires when roomId changes
```

## Performance Checklist

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
- [ ] Use React Compiler when possible (automatic memoization)
- [ ] Profile with React DevTools before optimizing
- [ ] Use `useMemo` for expensive calculations (1ms+)
- [ ] Use `useCallback` for functions passed to memo children
- [ ] Wrap slow children in `memo`
- [ ] Use `useTransition` for non-urgent updates
- [ ] Use `useDeferredValue` for search/large lists
- [ ] Prefer local state â€” don't lift too high
- [ ] Avoid unnecessary Effects
- [ ] Move objects/functions inside Effects
- [ ] Sanitize user content before rendering
- [ ] Use Error Boundaries for crash protection
- [ ] Never put secrets in VITE_ environment variables
- [ ] Use CSP headers for production

## Cross-References

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
- See [TypeScript/typescript-strict-mode](D/TypeScript/typescript-strict-mode.md) for TypeScript integration with React
- See [vite-optimization-security](D/vite-optimization-security.md) for build optimization
- See [vitest-testing](D/vitest-testing.md) for testing React components
- See [playwright-patterns](D/playwright-patterns.md) for end-to-end testing

---

## Decision Tree: React Performance Optimization

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
```mermaid
graph TD
    A[Need to optimize React?]\n    A --> B{What type?}
    B -->|Re-renders| C[React.memo/useMemo]
    B -->|Large Lists| D[Virtualization]
    B -->|Code Split| E[React.lazy/Suspense]
    B -->|State| F[State Colocation]
    C --> G{Expensive calc?}
    G -->|Yes| H[useMemo]
    G -->|No| I[Plain render]
    D --> J{100+ items?}
    J -->|Yes| K[react-window]
    J -->|No| L[Plain list]
    E --> M{Route or Component?}
    M -->|Route| N[React Router lazy]
    M -->|Component| O[React.lazy]
```

### When to Use Each Performance Pattern

| Pattern | When to Use | Example |
|---------|-------------|---------|
| **React.memo** | Prevent re-renders | List items, buttons |
| **useMemo** | Expensive calculations | Filtered lists, sort |
| **useCallback** | Function references | Event handlers, props |
| **Virtualization** | Large lists (100+) | Tables, feeds |
| **Code Splitting** | Large bundles | Routes, modals |
| **State Colocation** | Unnecessary prop drilling | Local state |

---

## Procedural Guidance: React Performance Optimization

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
### Step 1: Add React.memo

```tsx
// src/components/TodoItem.tsx
import { memo } from 'react'

interface TodoItemProps {
  todo: { id: string; text: string; completed: boolean }
  onToggle: (id: string) => void
}

// Memoize to prevent re-renders when parent re-renders
export const TodoItem = memo(function TodoItem({ todo, onToggle }: TodoItemProps) {
  return (
    <li onClick={() => onToggle(todo.id)}>
      <input type="checkbox" checked={todo.completed} readOnly />
      <span>{todo.text}</span>
    </li>
  )
})
```

### Step 2: Add useMemo

```tsx
// src/components/TodoList.tsx
import { useMemo } from 'react'

interface TodoListProps {
  todos: { id: string; text: string; completed: boolean }[]
  filter: 'all' | 'active' | 'completed'
}

export function TodoList({ todos, filter }: TodoListProps) {
  // Memoize filtered list
  const filteredTodos = useMemo(() => {
    console.log('Filtering todos...')
    if (filter === 'all') return todos
    if (filter === 'active') return todos.filter(t => !t.completed)
    return todos.filter(t => t.completed)
  }, [todos, filter])

  return (
    <ul>
      {filteredTodos.map(todo => (
        <TodoItem key={todo.id} todo={todo} onToggle={() => {}} />
      ))}
    </ul>
  )
}
```

### Step 3: Add useCallback

```tsx
// src/components/TodoList.tsx
import { useMemo, useCallback } from 'react'

export function TodoList({ todos, filter }: TodoListProps) {
  const filteredTodos = useMemo(() => {
    // ... filtering logic
  }, [todos, filter])

  // Memoize function reference
  const handleToggle = useCallback((id: string) => {
    console.log('Toggling todo:', id)
    // Toggle logic
  }, [])

  return (
    <ul>
      {filteredTodos.map(todo => (
        <TodoItem key={todo.id} todo={todo} onToggle={handleToggle} />
      ))}
    </ul>
  )
}
```

### Step 4: Add Virtualization

```tsx
// src/components/VirtualizedList.tsx
import { FixedSizeList } from 'react-window'

interface VirtualizedListProps {
  items: { id: string; text: string }[]
  height: number
}

export function VirtualizedList({ items, height }: VirtualizedListProps) {
  const Row = ({ index, style }: { index: number; style: React.CSSProperties }) => (
    <div style={style}>
      {items[index].text}
    </div>
  )

  return (
    <FixedSizeList
      height={height}
      width="100%"
      itemCount={items.length}
      itemSize={50}
    >
      {Row}
    </FixedSizeList>
  )
}
```

### Step 5: Add Code Splitting

```tsx
// src/App.tsx
import { lazy, Suspense } from 'react'

const Dashboard = lazy(() => import('./pages/Dashboard'))
const Settings = lazy(() => import('./pages/Settings'))

export function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <Dashboard />
      <Settings />
    </Suspense>
  )
}
```

---

## Copilot Instructions

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required
### When to Read This Note
- Optimizing React performance
- Preventing unnecessary re-renders
- Implementing code splitting
- Virtualizing large lists
- Adding security best practices

### What to Do With This Information
1. **Use React.memo**: Memoize components to prevent unnecessary re-renders
2. **Use useMemo**: Cache expensive calculations
3. **Use useCallback**: Memoize function references
4. **Virtualize lists**: Use react-window for large lists (100+ items)
5. **Code split**: Use React.lazy for route/component splitting

### Tools to Use
- **VS Code Extension**: React Developer Tools â€” for performance profiling
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `react-window` â€” for virtualized lists
- **npm Package**: `react-virtualized` â€” alternative for virtualization
- **Terminal Command**: `pnpm test` â€” run tests after optimization
- **Terminal Command**: `pnpm build --mode production` â€” build for production

### Agents to Invoke
- **Performance Review Agent**: Run when optimizing React performance
- **Security Review Agent**: Run when adding security best practices

### Integration with Other Notes
- Read [[Architecture/react-pattern]] for React component patterns
- read [vitest-testing](D/vitest-testing.md) for testing React components
- Read [vite-optimization](D/vite-optimization.md) for build optimization
- Read [playwright-patterns](D/playwright-patterns.md) for E2E testing

### Common Pitfalls
- Don't over-optimize (measure before optimizing)
- Don't use React.memo for everything (only when parent re-renders often)
- Don't forget dependency arrays (use all referenced variables)
- Don't virtualize small lists (only 100+ items)
- Don't skip Suspense fallback (always show loading state)

### Quick Validation Checklist
- [ ] Are components memoized where needed?
- [ ] Are expensive calculations cached with useMemo?
- [ ] Are function references memoized with useCallback?
- [ ] Are large lists virtualized?
- [ ] Is code splitting implemented?
- [ ] Is performance measured before/after optimization?




## See Also

## concept_id
r03-react-performance-security

## title
React: Performance, Security & Best Practices

## aliases
- R03-react-performance-security

## category
frontend-framework

## concept_type
ui-pattern

## research_status
verified

## project_adoption
required- [[R01-modern-react-project-template]]
- [[R02-Architecture/react-patterns]]


