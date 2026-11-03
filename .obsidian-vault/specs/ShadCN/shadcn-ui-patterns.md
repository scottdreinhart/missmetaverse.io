---
slug: shadcn-ui-patterns
sources:
  - https://ui.shadcn.com/docs
  - https://github.com/shadcn-ui/ui
date: 2026-11-02
tags:
  - shadcn
  - ui
  - radix-ui
  - components
  - design-system
  - accessibility
---

## Sources

- [[Sources/radix-ui-docs-2024|radix-ui-docs-2024]]
- [[Sources/wcag-21|wcag-21]]

# ShadCN UI Patterns

## Overview

shadcn/ui is a collection of re-usable components built on Radix UI and Tailwind CSS. Unlike other component libraries, it's not installed as a dependency — components are copied into your project and fully customizable.

---

## 1. Installation

```bash
# Initialize shadcn/ui
npx shadcn-ui@latest init

# Select options:
# - Style: New York
# - Color: Zinc
# - Base color: Zinc
# - CSS variables: Yes

# Add components
npx shadcn-ui@latest add button
npx shadcn-ui@latest add card
npx shadcn-ui@latest add input
npx shadcn-ui@latest add dialog
npx shadcn-ui@latest add dropdown-menu
npx shadcn-ui@latest add table
npx shadcn-ui@latest add toast
npx shadcn-ui@latest add avatar
npx shadcn-ui@latest add badge
npx shadcn-ui@latest add tabs
npx shadcn-ui@latest add select
npx shadcn-ui@latest add checkbox
npx shadcn-ui@latest add switch
npx shadcn-ui@latest add tooltip
npx shadcn-ui@latest add skeleton
npx shadcn-ui@latest add separator
npx shadcn-ui@latest add scroll-area
```

---

## 2. Configuration

```typescript
// components.json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "new-york",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.js",
    "css": "src/index.css",
    "baseColor": "zinc",
    "cssVariables": true
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  }
}
```

```typescript
// lib/utils.ts
import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

```css
/* index.css */
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 240 10% 3.9%;
    --card: 0 0% 100%;
    --card-foreground: 240 10% 3.9%;
    --primary: 240 5.9% 10%;
    --primary-foreground: 0 0% 98%;
    --secondary: 240 4.8% 95.9%;
    --secondary-foreground: 240 5.9% 10%;
    --muted: 240 4.8% 95.9%;
    --muted-foreground: 240 3.8% 46.1%;
    --accent: 240 4.8% 95.9%;
    --accent-foreground: 240 5.9% 10%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 0 0% 98%;
    --border: 240 5.9% 90%;
    --input: 240 5.9% 90%;
    --ring: 240 5.9% 10%;
    --radius: 0.5rem;
  }

  .dark {
    --background: 240 10% 3.9%;
    --foreground: 0 0% 98%;
    --card: 240 10% 3.9%;
    --card-foreground: 0 0% 98%;
    --primary: 0 0% 98%;
    --primary-foreground: 240 5.9% 10%;
    --secondary: 240 3.7% 15.9%;
    --secondary-foreground: 0 0% 98%;
    --muted: 240 3.7% 15.9%;
    --muted-foreground: 240 5% 64.9%;
    --accent: 240 3.7% 15.9%;
    --accent-foreground: 0 0% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 0 0% 98%;
    --border: 240 3.7% 15.9%;
    --input: 240 3.7% 15.9%;
    --ring: 240 4.9% 83.9%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}
```

---

## 3. Component Patterns

### Button with Variants

```tsx
// components/ui/button.tsx (auto-generated)
import * as React from 'react'
import { Slot } from '@radix-ui/react-slot'
import { cva, type VariantProps } from 'class-variance-authority'
import { cn } from '@/lib/utils'

const buttonVariants = cva(
  'inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline: 'border border-input bg-background hover:bg-accent hover:text-accent-foreground',
        secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'text-primary underline-offset-4 hover:underline',
      },
      size: {
        default: 'h-10 px-4 py-2',
        sm: 'h-9 rounded-md px-3',
        lg: 'h-11 rounded-md px-8',
        icon: 'h-10 w-10',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
    },
  }
)

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, ...props }, ref) => {
    const Comp = asChild ? Slot : 'button'
    return (
      <Comp
        className={cn(buttonVariants({ variant, size, className }))}
        ref={ref}
        {...props}
      />
    )
  }
)
Button.displayName = 'Button'

export { Button, buttonVariants }
```

### Card Component

```tsx
// Usage
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from '@/components/ui/card'

function ProductCard({ product }: { product: Product }) {
  return (
    <Card className="w-full max-w-sm">
      <CardHeader>
        <CardTitle>{product.name}</CardTitle>
        <CardDescription>{product.description}</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="flex items-center justify-between">
          <span className="text-2xl font-bold">${product.price}</span>
          <Button>Add to Cart</Button>
        </div>
      </CardContent>
    </Card>
  )
}
```

### Dialog / Modal

```tsx
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

function EditProfileDialog() {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button variant="outline">Edit Profile</Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[425px]">
        <DialogHeader>
          <DialogTitle>Edit profile</DialogTitle>
          <DialogDescription>
            Make changes to your profile here. Click save when you're done.
          </DialogDescription>
        </DialogHeader>
        <div className="grid gap-4 py-4">
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="name" className="text-right">Name</Label>
            <Input id="name" value="John Doe" className="col-span-3" />
          </div>
          <div className="grid grid-cols-4 items-center gap-4">
            <Label htmlFor="email" className="text-right">Email</Label>
            <Input id="email" value="john@example.com" className="col-span-3" />
          </div>
        </div>
        <DialogFooter>
          <Button type="submit">Save changes</Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  )
}
```

### Dropdown Menu

```tsx
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { Button } from '@/components/ui/button'

function UserMenu() {
  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="ghost" className="h-8 w-8 rounded-full">
          JD
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent align="end">
        <DropdownMenuLabel>My Account</DropdownMenuLabel>
        <DropdownMenuSeparator />
        <DropdownMenuItem>Profile</DropdownMenuItem>
        <DropdownMenuItem>Billing</DropdownMenuItem>
        <DropdownMenuItem>Settings</DropdownMenuItem>
        <DropdownMenuSeparator />
        <DropdownMenuItem>Log out</DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )
}
```

### Table

```tsx
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'

function OrdersTable({ orders }: { orders: Order[] }) {
  return (
    <div className="rounded-md border">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>Order ID</TableHead>
            <TableHead>Status</TableHead>
            <TableHead>Total</TableHead>
            <TableHead>Date</TableHead>
            <TableHead className="text-right">Actions</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {orders.map(order => (
            <TableRow key={order.id}>
              <TableCell className="font-medium">{order.id}</TableCell>
              <TableCell>
                <Badge variant={order.status === 'completed' ? 'default' : 'secondary'}>
                  {order.status}
                </Badge>
              </TableCell>
              <TableCell>${order.total}</TableCell>
              <TableCell>{order.date}</TableCell>
              <TableCell className="text-right">
                <Button variant="ghost" size="sm">View</Button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  )
}
```

### Toast Notifications

```tsx
import { useToast } from '@/hooks/use-toast'
import { Button } from '@/components/ui/button'

function ToastDemo() {
  const { toast } = useToast()

  return (
    <Button
      onClick={() => {
        toast({
          title: 'Saved!',
          description: 'Your changes have been saved.',
        })
      }}
    >
      Show Toast
    </Button>
  )
}

// Error toast
toast({
  title: 'Error',
  description: 'Something went wrong.',
  variant: 'destructive',
})

// Success toast with action
toast({
  title: 'Undo complete?',
  description: 'The file has been deleted.',
  action: (
    <Button onClick={() => undo()}>Undo</Button>
  ),
})
```

### Tabs

```tsx
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'

function SettingsTabs() {
  return (
    <Tabs defaultValue="account" className="w-full">
      <TabsList>
        <TabsTrigger value="account">Account</TabsTrigger>
        <TabsTrigger value="billing">Billing</TabsTrigger>
        <TabsTrigger value="settings">Settings</TabsTrigger>
      </TabsList>
      <TabsContent value="account">
        <Card>
          <CardContent>Account settings content</CardContent>
        </Card>
      </TabsContent>
      <TabsContent value="billing">
        <Card>
          <CardContent>Billing content</CardContent>
        </Card>
      </TabsContent>
    </Tabs>
  )
}
```

---

## 4. Form Patterns (with React Hook Form)

```tsx
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import * as z from 'zod'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Checkbox } from '@/components/ui/checkbox'

const profileSchema = z.object({
  name: z.string().min(2, 'Name must be at least 2 characters'),
  email: z.string().email('Invalid email address'),
  age: z.string().transform(val => parseInt(val)).refine(val => val >= 0, {
    message: 'Age must be positive',
  }),
  acceptTerms: z.boolean().refine(val => val === true, {
    message: 'You must accept the terms',
  }),
})

type ProfileForm = z.infer<typeof profileSchema>

function ProfileForm() {
  const form = useForm<ProfileForm>({
    resolver: zodResolver(profileSchema),
    defaultValues: {
      name: '',
      email: '',
      age: '',
      acceptTerms: false,
    },
  })

  function onSubmit(data: ProfileForm) {
    console.log(data)
  }

  return (
    <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
      <div>
        <Label htmlFor="name">Name</Label>
        <Input id="name" {...form.register('name')} />
        {form.formState.errors.name && (
          <p className="text-sm text-destructive">{form.formState.errors.name.message}</p>
        )}
      </div>
      <div>
        <Label htmlFor="email">Email</Label>
        <Input id="email" type="email" {...form.register('email')} />
        {form.formState.errors.email && (
          <p className="text-sm text-destructive">{form.formState.errors.email.message}</p>
        )}
      </div>
      <div className="flex items-center space-x-2">
        <Checkbox id="terms" {...form.register('acceptTerms')} />
        <Label htmlFor="terms">Accept terms</Label>
      </div>
      <Button type="submit" disabled={form.formState.isSubmitting}>
        {form.formState.isSubmitting ? 'Saving...' : 'Save'}
      </Button>
    </form>
  )
}
```

---

## 5. Customizing Components

### Override Styles

```tsx
// Customize a shadcn component by extending classes
function CustomButton() {
  return (
    <Button
      variant="default"
      className="
        rounded-full
        bg-gradient-to-r from-blue-500 to-purple-500
        hover:from-blue-600 hover:to-purple-600
        shadow-lg
        transition-all
        duration-300
      "
    >
      Custom Button
    </Button>
  )
}
```

### Create Custom Components

```tsx
// components/ui/custom-card.tsx
import { cn } from '@/lib/utils'

interface CustomCardProps {
  title: string
  subtitle?: string
  image?: string
  children: React.ReactNode
  className?: string
}

export function CustomCard({ title, subtitle, image, children, className }: CustomCardProps) {
  return (
    <div className={cn('rounded-xl border bg-card text-card-foreground shadow-sm', className)}>
      {image && <img src={image} alt={title} className="w-full h-48 object-cover rounded-t-xl" />}
      <div className="p-6 space-y-2">
        <h3 className="text-lg font-semibold">{title}</h3>
        {subtitle && <p className="text-sm text-muted-foreground">{subtitle}</p>}
        {children}
      </div>
    </div>
  )
}
```

---

## 6. Best Practices

| Practice | Description |
|----------|-------------|
| **Use `cn()` utility** | Always use `cn()` for merging Tailwind classes |
| **Copy-paste model** | Components are yours — modify freely |
| **TypeScript first** | All components are fully typed |
| **Radix UI primitives** | Built on accessible Radix UI components |
| **CSS variables** | Use CSS variables for theming |
| **Dark mode** | Use `dark:` prefix for dark mode styles |
| **Responsive** | Mobile-first with Tailwind breakpoints |
| **Accessibility** | All components are WCAG compliant |

---

## Cross-References

- [React Patterns](../React/react-patterns)
- [Tailwind CSS](../TailwindsCSS/tailwind-css-patterns.md)
- [TypeScript Strict Mode](../TypeScript/typescript-strict-mode.md)
- [CSS Fundamentals](../Cascading%20Stylesheets/css-fundamentals.md)
- [Accessibility](../Architecture/accessibility-a11y.md)

---

## Integration with Other Notes

- Read [[react-patterns]] for React component patterns
- Read [[tailwind-css-patterns]] for Tailwind CSS patterns
- Read [[css-fundamentals]] for CSS fundamentals
- Read [[accessibility-a11y]] for accessibility best practices
- Read [[shadcn-best-practices]] for shadcn/ui best practices

