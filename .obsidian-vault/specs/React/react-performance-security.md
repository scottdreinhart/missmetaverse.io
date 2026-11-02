---
slug: react-performance-security
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
  - react
  - performance
  - optimization
  - security
  - concurrent
  - best-practices
---

# React: Performance, Security & Best Practices

## Overview

React 19 introduces **Concurrent React** with non-blocking rendering, Transitions, Suspense, and the React Compiler for automatic memoization. This note covers optimization, security, and best practices.

## React Compiler (Automatic Memoization)

The React Compiler automatically memoizes values and functions, reducing the need for manual `useMemo`/`useCallback` calls:

```js
// React Compiler handles this automatically
function TodoList({ todos, tab }) {
  const visibleTodos = filterTodos(todos, tab);
  return <ul>{visibleTodos.map(t => <li key={t.id}>{t.text}</li>)}</ul>;
}
```

## Performance Optimization

### useMemo — Cache Expensive Calculations

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

### useCallback — Cache Function References

```tsx
import { useCallback } from 'react';

function ProductPage({ productId, referrer }) {
  // Cached function reference — only changes when deps change
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

**Updater function pattern — remove state dependencies:**

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

### memo — Skip Re-renders

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

### useTransition — Non-Blocking Updates

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
- Interruptible — user clicks are handled immediately
- Works with Suspense to prevent loading flicker

### useDeferredValue — Lag Behind for Performance

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
3. Integrates with Suspense — shows stale content while loading

**Better than debouncing/throttling:**
- No fixed delay — adapts to device speed
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

# .env (safe to commit — only VITE_ prefix is exposed)
VITE_APP_TITLE=My App
VITE_API_URL=https://api.example.com
```

```tsx
// SAFE: Only VITE_ prefixed vars are exposed to client
console.log(import.meta.env.VITE_APP_TITLE); // "My App"
console.log(import.meta.env.DB_PASSWORD); // undefined — NOT exposed

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

### Components and Hooks Must Be Pure

```tsx
// GOOD: Pure component
function Greeting({ name }) {
  return <h1>Hello, {name}!</h1>;
}

// BAD: Impure — mutates external state
function BadGreeting({ name }) {
  externalCounter++; // Side effect in render
  return <h1>Hello, {name}!</h1>;
}
```

### React Calls Components and Hooks

- Don't call components directly — return JSX
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
    const [state, setState] = useState(0); // Conditional — breaks!
  }
  return <div></div>;
}
```

## State Management Best Practices

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

- [ ] Use React Compiler when possible (automatic memoization)
- [ ] Profile with React DevTools before optimizing
- [ ] Use `useMemo` for expensive calculations (1ms+)
- [ ] Use `useCallback` for functions passed to memo children
- [ ] Wrap slow children in `memo`
- [ ] Use `useTransition` for non-urgent updates
- [ ] Use `useDeferredValue` for search/large lists
- [ ] Prefer local state — don't lift too high
- [ ] Avoid unnecessary Effects
- [ ] Move objects/functions inside Effects
- [ ] Sanitize user content before rendering
- [ ] Use Error Boundaries for crash protection
- [ ] Never put secrets in VITE_ environment variables
- [ ] Use CSP headers for production

## Cross-References

- See [[ts-best-practices]] for TypeScript integration with React
- See [[vite-optimization-security]] for build optimization
- See [[vitest-testing]] for testing React components
- See [[playwright-patterns]] for end-to-end testing

