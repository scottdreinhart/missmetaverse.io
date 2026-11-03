---
slug: atomic-design
sources:
  - https://atomicdesign.bradfrost.com/chapter-2/
  - https://bradfrost.com/blog/post/atomic-web-design/
date: 2026-11-02
tags:

  - maturity/deprecated








  - atomic-design
  - ui-composition
  - design-systems
  - react
  - components
  - frontend
---

# Atomic Design

## Overview

Atomic Design is a methodology composed of five distinct stages working together to create interface design systems in a more deliberate and hierarchical manner. It is a **mental model** for constructing UIs, not a linear process.

---

## 1. The Five Stages

```
┌─────────────────────────────────────────────────────────────────┐
│                    ATOMIC DESIGN                                │
│                                                                 │
│  Atoms ──► Molecules ──► Organisms ──► Templates ──► Pages      │
│                                                                 │
│  Basic building blocks   Simple    Complex    Layout     Real   │
│  of UI                 components  sections  structures  content│
└─────────────────────────────────────────────────────────────────┘
```

### Stage 1: Atoms

**Fundamental interface elements that cannot be broken down further.**

```typescript
// atoms/Button.tsx
interface ButtonProps {
  children: React.ReactNode
  variant?: 'primary' | 'secondary' | 'ghost'
  size?: 'sm' | 'md' | 'lg'
  disabled?: boolean
  onClick?: () => void
}

export function Button({ children, variant = 'primary', size = 'md', disabled, onClick }: ButtonProps) {
  const baseClasses = 'font-medium rounded-lg transition-colors focus:outline-none focus:ring-2'
  const variantClasses = {
    primary: 'bg-blue-600 text-white hover:bg-blue-700',
    secondary: 'bg-gray-200 text-gray-800 hover:bg-gray-300',
    ghost: 'text-gray-600 hover:bg-gray-100',
  }
  const sizeClasses = {
    sm: 'px-3 py-1.5 text-sm',
    md: 'px-4 py-2 text-base',
    lg: 'px-6 py-3 text-lg',
  }

  return (
    <button
      className={`${baseClasses} ${variantClasses[variant]} ${sizeClasses[size]}`}
      disabled={disabled}
      onClick={onClick}
    >
      {children}
    </button>
  )
}

// atoms/Input.tsx
interface InputProps {
  label?: string
  type?: string
  value: string
  placeholder?: string
  error?: string
  disabled?: boolean
  onChange: (value: string) => void
}

export function Input({ label, type = 'text', value, placeholder, error, disabled, onChange }: InputProps) {
  return (
    <div className="space-y-1">
      {label && <label className="block text-sm font-medium">{label}</label>}
      <input
        type={type}
        value={value}
        placeholder={placeholder}
        disabled={disabled}
        onChange={(e) => onChange(e.target.value)}
        className={`w-full rounded-lg border px-3 py-2 ${error ? 'border-red-500' : 'border-gray-300'}`}
      />
      {error && <p className="text-sm text-red-500">{error}</p>}
    </div>
  )
}

// atoms/Label.tsx, atoms/Icon.tsx, atoms/Avatar.tsx, etc.
```

### Stage 2: Molecules

**Small combinations of atoms performing one focused function.**

```typescript
// molecules/SearchForm.tsx
import { Input } from '../atoms/Input'
import { Button } from '../atoms/Button'

interface SearchFormProps {
  value: string
  placeholder?: string
  onSearch: (query: string) => void
}

export function SearchForm({ value, placeholder = 'Search...', onSearch }: SearchFormProps) {
  return (
    <form onSubmit={(e) => { e.preventDefault(); onSearch(value) }}>
      <Input value={value} placeholder={placeholder} onChange={() => {}} />
      <Button type="submit" variant="primary">Search</Button>
    </form>
  )
}

// molecules/FormField.tsx
import { Input } from '../atoms/Input'
import { Label } from '../atoms/Label'

interface FormFieldProps {
  label: string
  value: string
  error?: string
  onChange: (value: string) => void
}

export function FormField({ label, value, error, onChange }: FormFieldProps) {
  return (
    <Input
      label={label}
      value={value}
      error={error}
      onChange={onChange}
    />
  )
}

// molecules/UserAvatar.tsx
import { Avatar } from '../atoms/Avatar'
import { Label } from '../atoms/Label'

interface UserAvatarProps {
  src: string
  alt: string
  name: string
  size?: 'sm' | 'md' | 'lg'
}

export function UserAvatar({ src, alt, name, size = 'md' }: UserAvatarProps) {
  return (
    <div className="flex items-center space-x-2">
      <Avatar src={src} alt={alt} size={size} />
      <Label>{name}</Label>
    </div>
  )
}
```

### Stage 3: Organisms

**Larger interface sections composed from molecules and atoms.**

```typescript
// organisms/Header.tsx
import { Button } from '../atoms/Button'
import { SearchForm } from '../molecules/SearchForm'
import { UserAvatar } from '../molecules/UserAvatar'
import { Navigation } from '../molecules/Navigation'

interface HeaderProps {
  user?: { name: string; avatar: string }
  searchQuery: string
  onSearch: (query: string) => void
}

export function Header({ user, searchQuery, onSearch }: HeaderProps) {
  return (
    <header className="bg-white border-b">
      <div className="max-w-7xl mx-auto px-4 py-3">
        <div className="flex items-center justify-between">
          <Navigation />
          <SearchForm value={searchQuery} onSearch={onSearch} />
          {user && <UserAvatar src={user.avatar} alt={user.name} name={user.name} />}
        </div>
      </div>
    </header>
  )
}

// organisms/ProductCard.tsx
import { Button } from '../atoms/Button'
import { UserAvatar } from '../molecules/UserAvatar'

interface ProductCardProps {
  image: string
  title: string
  price: string
  seller: { name: string; avatar: string }
  onAddToCart: () => void
}

export function ProductCard({ image, title, price, seller, onAddToCart }: ProductCardProps) {
  return (
    <div className="border rounded-lg overflow-hidden">
      <img src={image} alt={title} className="w-full h-48 object-cover" />
      <div className="p-4">
        <h3 className="font-medium">{title}</h3>
        <p className="text-gray-600">{price}</p>
        <UserAvatar src={seller.avatar} alt={seller.name} name={seller.name} size="sm" />
        <Button onClick={onAddToCart} variant="primary" className="w-full mt-2">
          Add to Cart
        </Button>
      </div>
    </div>
  )
}

// organisms/ProductGrid.tsx — Repeats ProductCard molecule
interface ProductGridProps {
  products: Product[]
  onAddToCart: (id: string) => void
}

export function ProductGrid({ products, onAddToCart }: ProductGridProps) {
  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
      {products.map(product => (
        <ProductCard
          key={product.id}
          {...product}
          onAddToCart={() => onAddToCart(product.id)}
        />
      ))}
    </div>
  )
}
```

### Stage 4: Templates

**Page-level layout structures with defined content regions.**

```typescript
// templates/PageTemplate.tsx
import { Header } from '../organisms/Header'
import { Footer } from '../organisms/Footer'
import { Sidebar } from '../organisms/Sidebar'

interface PageTemplateProps {
  user?: { name: string; avatar: string }
  searchQuery: string
  onSearch: (query: string) => void
  sidebar?: React.ReactNode
  children: React.ReactNode
}

export function PageTemplate({ user, searchQuery, onSearch, sidebar, children }: PageTemplateProps) {
  return (
    <div className="min-h-screen flex flex-col">
      <Header user={user} searchQuery={searchQuery} onSearch={onSearch} />
      <div className="flex flex-1">
        {sidebar && <Sidebar>{sidebar}</Sidebar>}
        <main className="flex-1 p-6">
          {children}
        </main>
      </div>
      <Footer />
    </div>
  )
}

// templates/DashboardTemplate.tsx
export function DashboardTemplate({ children }: { children: React.ReactNode }) {
  return (
    <div className="space-y-6">
      <h1 className="text-2xl font-bold">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {children}
      </div>
    </div>
  )
}
```

### Stage 5: Pages

**Concrete screens using templates and real application content.**

```typescript
// pages/HomePage.tsx
import { PageTemplate } from '../templates/PageTemplate'
import { ProductGrid } from '../organisms/ProductGrid'
import { SearchForm } from '../molecules/SearchForm'
import { useState } from 'react'

interface HomePageProps {
  user?: { name: string; avatar: string }
  products: Product[]
  onAddToCart: (id: string) => void
}

export function HomePage({ user, products, onAddToCart }: HomePageProps) {
  const [searchQuery, setSearchQuery] = useState('')

  return (
    <PageTemplate user={user} searchQuery={searchQuery} onSearch={setSearchQuery}>
      <div className="space-y-8">
        <SearchForm value={searchQuery} onSearch={setSearchQuery} />
        <ProductGrid products={products} onAddToCart={onAddToCart} />
      </div>
    </PageTemplate>
  )
}

// pages/ProductDetailPage.tsx
export function ProductDetailPage({ product }: { product: Product }) {
  return (
    <PageTemplate>
      <div className="max-w-4xl mx-auto">
        <img src={product.image} alt={product.title} className="w-full h-96 object-cover rounded-lg" />
        <h1 className="text-3xl font-bold mt-4">{product.title}</h1>
        <p className="text-2xl text-gray-600 mt-2">{product.price}</p>
        <p className="mt-4">{product.description}</p>
      </div>
    </PageTemplate>
  )
}
```

---

## 2. Key Insights

### Atomic Design is NOT Linear

```
❌ WRONG: Step 1 → Step 2 → Step 3 → Step 4 → Step 5
✅ RIGHT: All stages work concurrently as a mental model
```

Atomic design allows you to **shift between abstract and concrete** — seeing components in isolation and in context simultaneously.

### Separation of Structure and Content

| Stage         | Focus                        |
| ------------- | ---------------------------- |
| **Templates** | Content structure (skeleton) |
| **Pages**     | Real content in structure    |

> "You can create good experiences without knowing the content. What you can't do is create good experiences without knowing your content structure." — Mark Boulton

### Hierarchy Language

| Term                        | Implies                       |
| --------------------------- | ----------------------------- |
| Atoms, Molecules, Organisms | Hierarchy (chemistry analogy) |
| Components, Modules         | No inherent hierarchy         |

---

## 3. Advantages

| Advantage                | Description                                        |
| ------------------------ | -------------------------------------------------- |
| **Part and Whole**       | Shift between abstract components and concrete UIs |
| **Structure vs Content** | Clean separation between layout and data           |
| **Reusability**          | Small components compose into larger ones          |
| **Consistency**          | Design system enforces uniform patterns            |
| **Testing**              | Test atoms/molecules in isolation                  |

---

## 4. File Organization

```
src/components/
├── atoms/
│   ├── Button.tsx
│   ├── Input.tsx
│   ├── Label.tsx
│   └── Avatar.tsx
├── molecules/
│   ├── SearchForm.tsx
│   ├── FormField.tsx
│   └── UserAvatar.tsx
├── organisms/
│   ├── Header.tsx
│   ├── ProductCard.tsx
│   └── ProductGrid.tsx
├── templates/
│   ├── PageTemplate.tsx
│   └── DashboardTemplate.tsx
└── pages/
    ├── HomePage.tsx
    └── ProductDetailPage.tsx
```

---

## 5. When to Use Atomic Design

- ✅ Building a **design system** with reusable components
- ✅ Large teams needing **consistent UI patterns**
- ✅ Complex interfaces with **many component variations**
- ✅ Need to **test components in isolation**

- ❌ Simple pages with few components (overkill)
- ❌ Prototyping (start simpler)
- ❌ Small projects (use basic component structure)

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./ddd-patterns.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./coding-practices.md)

---

## Integration with Other Notes

- Read [clean-architecture](https://martinfowler.com/bliki/CleanArchitecture.html) for clean architecture patterns
- Read [solid-principles](https://en.wikipedia.org/wiki/SOLID) for SOLID design principles
- Read [[ddd-patterns]] for domain-driven design patterns
- Read [architecture-patterns](https://en.wikipedia.org/wiki/Software_architecture_pattern) for architecture patterns
- Read [tailwind-css-patterns](D/tailwind-css-patterns.md) for Tailwind CSS patterns
- Read [shadcn-ui-patterns](D/shadcn-ui-patterns.md) for shadcn/ui component patterns
- Read [design-tokens](https://design-tokens.github.io/) for design token patterns


## See Also
- [[A001-abstract-factory-pattern]]
- [[A002-abstract-factory-patterns]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


