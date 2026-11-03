---
slug: shadcn-best-practices
sources:
  - https://ui.shadcn.com/docs
  - https://ui.shadcn.com/docs/components
  - https://ui.shadcn.com/docs/accessibility
  - https://ui.shadcn.com
date: 2025-01-15
tags:
  - shadcn
  - ui
  - accessibility
  - components
  - best-practices
  - open-source
---

# shadcn/ui: Best Practices & Optimization

## Overview

shadcn/ui is **not a component library** — it's a collection of **reusable components** you can copy and paste into your apps. It follows five core principles.

## Core Principles

### 1. Open Code

All components are free to use and customize. Source code is fully transparent and available on GitHub.

```bash
# Install via CLI
npx shadcn@latest add button
npx shadcn@latest add card
npx shadcn@latest add dialog
```

### 2. Composition

Components are built to be composed together. Each component is a building block:

```tsx
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Button } from "@/components/ui/button"

function ProductCard() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Product Name</CardTitle>
      </CardHeader>
      <CardContent>
        <p>Product description goes here.</p>
      </CardContent>
      <CardFooter>
        <Button>Purchase</Button>
      </CardFooter>
    </Card>
  )
}
```

### 3. Distribution

Components are distributed via the CLI and npm, but you own the code in your project:

```bash
# Initialize shadcn/ui in your project
npx shadcn@latest init

# Add a component
npx shadcn@latest add <component>

# Update all components
npx shadcn@latest update
```

### 4. Beautiful Defaults

Components ship with sensible default styles using Tailwind CSS:

```tsx
// Default button appearance
<Button variant="default">Click me</Button>

// Variants available
<Button variant="destructive">Delete</Button>
<Button variant="outline">Outline</Button>
<Button variant="secondary">Secondary</Button>
<Button variant="ghost">Ghost</Button>
<Button variant="link">Link</Button>
```

### 5. AI-Ready

Components are designed to work well with AI coding assistants:
- Clear component structure
- Well-documented props
- Consistent naming conventions
- Copy-paste friendly

## Component Architecture

### Flat File Schema

shadcn/ui uses a flat file structure for easy navigation:

```
src/components/ui/
├── button.tsx
├── card.tsx
├── dialog.tsx
├── input.tsx
├── select.tsx
├── table.tsx
└── ...
```

### Available Components (50+)

| Category | Components |
|----------|-----------|
| **Layout** | Card, Separator, Skeleton, ScrollArea |
| **Form** | Button, Input, Textarea, Select, Checkbox, Switch, RadioGroup |
| **Overlay** | Dialog, DropdownMenu, Popover, Tooltip, Sheet, Toast |
| **Navigation** | Tabs, Breadcrumb, Pagination, Accordion |
| **Data Display** | Table, Badge, Avatar, Calendar, Chart |
| **Feedback** | Alert, AlertDialog, Progress, Skeleton, Toast |
| **Media** | Carousel, AspectRatio |

## Customization Best Practices

### Theme Customization

Customize via CSS variables in `globals.css`:

```css
/* src/app/globals.css */
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --primary: 222.2 47.4% 11.2%;
    --primary-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    --card: 222.2 84% 4.9%;
    --card-foreground: 210 40% 98%;
    --primary: 210 40% 98%;
    --primary-foreground: 222.2 47.4% 11.2%;
    --border: 217.2 32.6% 17.5%;
  }
}
```

### Custom Component Variants

Use `cva` (Class Variance Authority) for component variants:

```tsx
import { cva, type VariantProps } from "class-variance-authority"
import { cn } from "@/lib/utils"

const buttonVariants = cva(
  "inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:opacity-50 disabled:pointer-events-none",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        destructive: "bg-destructive text-destructive-foreground hover:bg-destructive/90",
        outline: "border border-input bg-background hover:bg-accent hover:text-accent-foreground",
        secondary: "bg-secondary text-secondary-foreground hover:bg-secondary/80",
        ghost: "hover:bg-accent hover:text-accent-foreground",
        link: "underline-offset-4 hover:underline text-primary",
      },
      size: {
        default: "h-10 py-2 px-4",
        sm: "h-9 px-3 rounded-md",
        lg: "h-11 px-8 rounded-md",
        icon: "h-10 w-10",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  }
)

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {}

const Button = ({ className, variant, size, ...props }: ButtonProps) => {
  return (
    <button
      className={cn(buttonVariants({ variant, size, className }))}
      {...props}
    />
  )
}
```

## Accessibility (a11y) Best Practices

### Built-in Accessibility

shadcn/ui components are built on top of **Radix UI** primitives, which provide:
- Proper ARIA attributes
- Keyboard navigation
- Focus management
- Screen reader support
- WAI-ARIA composition model

### Accessibility Checklist

- [ ] All interactive elements have **accessible names** (labels, aria-label)
- [ ] Forms have **associated labels** (`<label htmlFor="id">`)
- [ ] Color contrast meets **WCAG AA** (4.5:1 for text, 3:1 for large text)
- [ ] Focus order is **logical and visible**
- [ ] Error messages are **programmatically associated** with inputs
- [ ] Dynamic content announces changes via **aria-live**
- [ ] Images have **alt text** (or `alt=""` for decorative)
- [ ] Keyboard navigation works for **all interactive elements**
- [ ] `prefers-reduced-motion` is **respected**
- [ ] Touch targets are **at least 44x44px**

### Example: Accessible Form

```tsx
import { Label } from "@/components/ui/label"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

function AccessibleForm() {
  return (
    <form>
      <div className="grid w-full items-center gap-4">
        <div className="flex flex-col space-y-1.5">
          <Label htmlFor="email">Email</Label>
          <Input id="email" name="email" type="email" placeholder="name@example.com" />
        </div>
        <div className="flex flex-col space-y-1.5">
          <Label htmlFor="password">Password</Label>
          <Input id="password" name="password" type="password" />
        </div>
      </div>
      <Button type="submit">Sign In</Button>
    </form>
  )
}
```

### Using aria Attributes

```tsx
// Error state with aria-describedby
<Input
  id="email"
  aria-invalid="true"
  aria-describedby="email-error"
/>
<p id="email-error" className="text-sm text-red-500">
  Please enter a valid email address.
</p>

// Live region for dynamic updates
<div aria-live="polite" aria-atomic="true">
  {notification}
</div>

// Skip link for keyboard users
<a href="#main-content" className="sr-only focus:not-sr-only">
  Skip to main content
</a>
```

## Performance Optimization

### Bundle Size

shadcn/ui components are **tree-shakeable** when used with Vite:

```tsx
// Only import what you need
import { Button } from "@/components/ui/button"
import { Card } from "@/components/ui/card"
```

### Code Splitting

Lazy-load heavy components:

```tsx
import { lazy, Suspense } from 'react'

const ChartComponent = lazy(() => import('@/components/ui/chart'))

function Page() {
  return (
    <Suspense fallback={<Skeleton className="w-full h-64" />}>
      <ChartComponent />
    </Suspense>
  )
}
```

### Avoid Over-Rendering

- Use `React.memo()` for expensive component renders
- Avoid unnecessary state updates
- Use `useCallback` and `useMemo` for derived values

## Integration with React

### Project Structure

```
src/
├── app/
│   ├── layout.tsx
│   └── page.tsx
├── components/
│   ├── ui/          # shadcn/ui components
│   └── layout/      # Custom layout components
├── lib/
│   └── utils.ts     # cn() utility
└── styles/
    └── globals.css
```

### Utility Function (cn)

```tsx
// lib/utils.ts
import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

## AI Integration Best Practices

### Prompting for shadcn/ui

When using AI assistants, reference shadcn/ui explicitly:

```
Create a dashboard card using shadcn/ui Card component
with a Badge for status, Avatar for user, and Button for action.
```

### Component Documentation

Keep component docs updated:

```tsx
/**
 * Card component for displaying content in a container.
 * 
 * @example
 * <Card>
 *   <CardHeader>
 *     <CardTitle>Title</CardTitle>
 *   </CardHeader>
 *   <CardContent>Content</CardContent>
 * </Card>
 */
```

## Security Best Practices

### Content Security Policy

shadcn/ui components don't inject inline scripts that would break CSP:

```html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline';">
```

### Sanitizing User Input

Always sanitize user-generated content before rendering:

```tsx
import DOMPurify from 'dompurify'

function UserContent({ content }: { content: string }) {
  const sanitized = DOMPurify.sanitize(content)
  return <div dangerouslySetInnerHTML={{ __html: sanitized }} />
}
```

## Recommended Setup Checklist

- [x] **Initialize with CLI** (`npx shadcn@latest init`)
- [x] **Configure theme colors** in `globals.css`
- [x] **Add components via CLI** (`npx shadcn@latest add <component>`)
- [x] **Customize variants** using `cva`
- [x] **Implement accessibility** checklist
- [x] **Set up dark mode** with CSS variables
- [x] **Enable tree-shaking** in build config
- [x] **Add CSP headers** for production
- [x] **Test with screen readers** (NVDA, VoiceOver)
- [x] **Validate keyboard navigation**

## Cross-References

- See [[tailwind-css-patterns]] for Tailwind CSS integration
- See [[css3-performance-security]] for CSS3 performance fundamentals
- See [[html5-best-practices]] for HTML5 accessibility patterns
- See [[react-patterns]] for React component integration
- See [[accessibility-a11y]] for accessibility best practices
- See [[shadcn-ui-patterns]] for shadcn/ui component patterns

