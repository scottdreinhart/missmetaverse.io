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

---

## Decision Tree: ShadCN Best Practices

```mermaid
graph TD
    A[Need to customize component?]\n    A --> B{Simple change?}
    B -->|Yes| C[Use cn() for classes]
    B -->|No| D[Modify component source]
    C --> E{Variant?}
    E -->|Yes| F[Use cva]
    E -->|No| G[Inline className]
    D --> H{Accessibility?}
    H -->|Yes| I[Verify ARIA]
    H -->|No| J[Add tests]
    I --> K[Test with screen reader]
    J --> K
```

### When to Use Each Best Practice

| Practice | When to Use | Example |
|----------|-------------|---------|
| **cn() utility** | Always merge Tailwind classes | cn('class1', 'class2') |
| **cva** | Component variants | buttonVariants() |
| **CSS variables** | Theming/dark mode | --primary-color |
| **Composition** | Building complex UIs | Card + CardHeader |
| **Accessibility** | All interactive components | ARIA, keyboard nav |

---

## Procedural Guidance: ShadCN Optimization

### Step 1: Configure Theme

```css
/* globals.css */
@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 240 10% 3.9%;
    --primary: 240 5.9% 10%;
    --primary-foreground: 0 0% 98%;
    --secondary: 240 4.8% 95.9%;
    --secondary-foreground: 240 5.9% 10%;
    --accent: 240 4.8% 95.9%;
    --accent-foreground: 240 5.9% 10%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 0 0% 98%;
    --border: 240 5.9% 90%;
    --ring: 240 5.9% 10%;
    --radius: 0.5rem;
  }

  .dark {
    --background: 240 10% 3.9%;
    --foreground: 0 0% 98%;
    --primary: 0 0% 98%;
    --primary-foreground: 240 5.9% 10%;
    --secondary: 240 3.7% 15.9%;
    --secondary-foreground: 0 0% 98%;
    --accent: 240 3.7% 15.9%;
    --accent-foreground: 0 0% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 0 0% 98%;
    --border: 240 3.7% 15.9%;
    --ring: 240 4.9% 83.9%;
  }
}
```

### Step 2: Create Custom Variants

```typescript
// lib/utils.ts
import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'
import { cva, type VariantProps } from 'class-variance-authority'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export const cardVariants = cva('rounded-lg border bg-card text-card-foreground shadow-sm', {
  variants: {
    variant: {
      default: 'border-border',
      elevated: 'border-border shadow-lg',
      ghost: 'border-transparent bg-transparent',
    },
    size: {
      default: 'p-6',
      sm: 'p-4',
      lg: 'p-8',
    },
  },
  defaultVariants: {
    variant: 'default',
    size: 'default',
  },
})
```

### Step 3: Implement Accessibility

```typescript
// components/AccessibleDialog.tsx
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
import { Button } from '@/components/ui/button'

interface AccessibleDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  title: string
  description: string
  children: React.ReactNode
  onConfirm: () => void
  confirmLabel?: string
}

export function AccessibleDialog({
  open,
  onOpenChange,
  title,
  description,
  children,
  onConfirm,
  confirmLabel = 'Confirm',
}: AccessibleDialogProps) {
  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent aria-describedby="dialog-description">
        <DialogHeader>
          <DialogTitle>{title}</DialogTitle>
          <DialogDescription id="dialog-description">
            {description}
          </DialogDescription>
        </DialogHeader>
        {children}
        <DialogFooter>
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          <Button onClick={onConfirm}>
            {confirmLabel}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}
```

### Step 4: Security Sanitization

```typescript
// utils/sanitize.ts
import DOMPurify from 'dompurify'

export function sanitizeHTML(html: string): string {
  return DOMPurify.sanitize(html, {
    ALLOWED_TAGS: ['b', 'i', 'em', 'strong', 'a', 'p', 'ul', 'li'],
    ALLOWED_ATTR: ['href', 'target', 'rel'],
  })
}

// Usage
function UserContent({ content }: { content: string }) {
  const sanitized = sanitizeHTML(content)
  return <div dangerouslySetInnerHTML={{ __html: sanitized }} />
}
```

### Step 5: Performance Optimization

```typescript
// components/MemoizedList.tsx
import { memo } from 'react'
import { Card } from '@/components/ui/card'

interface ListItem {
  id: string
  title: string
  description: string
}

interface ListItemProps {
  item: ListItem
}

// Memoize individual list items
const MemoizedListItem = memo(function ListItem({ item }: ListItemProps) {
  return (
    <Card>
      <h3>{item.title}</h3>
      <p>{item.description}</p>
    </Card>
  )
})

// Parent component
export function MemoizedList({ items }: { items: ListItem[] }) {
  return (
    <div className="space-y-4">
      {items.map(item => (
        <MemoizedListItem key={item.id} item={item} />
      ))}
    </div>
  )
}
```

---

## Copilot Instructions

### When to Read This Note
- Customizing shadcn/ui components
- Implementing accessibility best practices
- Optimizing shadcn/ui performance
- Adding dark mode support
- Securing user-generated content

### What to Do With This Information
1. **Use cn()**: Always merge Tailwind classes with cn()
2. **cva for variants**: Use class-variance-authority for component variants
3. **CSS variables**: Use CSS variables for theming
4. **Accessibility**: Verify ARIA attributes and keyboard navigation
5. **Security**: Sanitize user-generated content with DOMPurify

### Tools to Use
- **VS Code Extension**: Tailwind CSS IntelliSense — for Tailwind autocomplete
- **VS Code Extension**: Error Lens — for inline CSS error display
- **npm Package**: `class-variance-authority` — for component variants
- **npm Package**: `dompurify` — for HTML sanitization
- **Terminal Command**: `npx shadcn@latest add <component>` — add component

### Agents to Invoke
- **Code Review Agent**: Run when reviewing PRs with UI changes
- **Security Review Agent**: Run when adding form components
- **Accessibility Agent**: Run when adding interactive components

### Integration with Other Notes
- Read [[tailwind-css-patterns]] for Tailwind CSS integration
- Read [[css3-performance-security]] for CSS3 performance fundamentals
- Read [[html5-best-practices]] for HTML5 accessibility patterns
- Read [[react-patterns]] for React component integration
- Read [[accessibility-a11y]] for accessibility best practices
- Read [[shadcn-ui-patterns]] for shadcn/ui component patterns

### Common Pitfalls
- Don't modify component source directly (use cn() for customization)
- Don't skip accessibility testing (verify with screen readers)
- Don't ignore dark mode (test with prefers-color-scheme)
- Don't sanitize user content (always use DOMPurify)
- Don't memoize everything (only expensive components)

### Quick Validation Checklist
- [ ] Are cn() and cva used for customization?
- [ ] Is accessibility verified (ARIA, keyboard)?
- [ ] Is dark mode tested?
- [ ] Is user content sanitized?
- [ ] Are expensive components memoized?
- [ ] Are CSS variables used for theming?

