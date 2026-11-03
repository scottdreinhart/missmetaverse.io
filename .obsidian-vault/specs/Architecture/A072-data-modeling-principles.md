---
slug: data-modeling-principles
sources:
  - https://docs.microsoft.com/en-us/dotnet/architecture/microservices/
  - https://www.enterpriseintegrationpatterns.com/
date: 2026-11-02
tags:
  - maturity/deprecated
  - data-modeling
  - database
  - crud
  - acid
  - normalization
  - denormalization
  - referential-integrity
  - constraints
  - transactions
  - optimistic-concurrency
  - pessimistic-concurrency
  - idempotency
  - schema-migrations
  - soft-delete
  - audit-trails
  - event-sourcing
  - materialized-views
  - --
# Data Modeling & Database Principles

## Overview

Data modeling principles govern how data is structured, stored, and accessed. These principles ensure data integrity, performance, and maintainability.

---

## 1. Core Principles

### CRUD

**Create, Read, Update, Delete â€” the four basic operations for persistent storage.**

```typescript
class UserRepository {
  // Create
  async create(user: CreateUserDto): Promise<User> {
    const id = generateId()
    await this.db.query(
      'INSERT INTO users (id, name, email, created_at) VALUES ($1, $2, $3, $4)',
      [id, user.name, user.email, new Date()]
    )
    return { id, name: user.name, email: user.email }
  }

  // Read
  async findById(id: string): Promise<User | null> {
    const result = await this.db.query(
      'SELECT * FROM users WHERE id = $1', [id]
    )
    return result?.[0] ?? null
  }

  // Update
  async update(id: string, updates: Partial<UpdateUserDto>): Promise<void> {
    await this.db.query(
      'UPDATE users SET name = $1, email = $2 WHERE id = $3',
      [updates.name, updates.email, id]
    )
  }

  // Delete
  async delete(id: string): Promise<void> {
    await this.db.query('DELETE FROM users WHERE id = $1', [id])
  }
}
```

### ACID

**Atomicity, Consistency, Isolation, Durability â€” properties that guarantee reliable database transactions.**

| Property | Description | Example |
|----------|-------------|---------|
| **Atomicity** | All or nothing | Transfer money: debit + credit both succeed or both fail |
| **Consistency** | Valid state transitions | Account balance never goes negative |
| **Isolation** | Concurrent transactions don't interfere | Two users buying last item: only one succeeds |
| **Durability** | Committed data persists | Power failure after commit: data is safe |

```typescript
// ACID transaction example
async function transferMoney(fromId: string, toId: string, amount: number): Promise<void> {
  await this.db.transaction(async (tx) => {
    // 1. Debit source (atomicity: both must succeed)
    const fromResult = await tx.query(
      'SELECT balance FROM accounts WHERE id = $1 FOR UPDATE', [fromId]
    )
    if (fromResult[0].balance < amount) {
      throw new InsufficientFundsError()
    }
    await tx.query(
      'UPDATE accounts SET balance = balance - $1 WHERE id = $2',
      [amount, fromId]
    )

    // 2. Credit destination (atomicity: both must succeed)
    await tx.query(
      'UPDATE accounts SET balance = balance + $1 WHERE id = $2',
      [amount, toId]
    )

    // 3. Log transaction (consistency: audit trail)
    await tx.query(
      'INSERT INTO transactions (from_id, to_id, amount, created_at) VALUES ($1, $2, $3, $4)',
      [fromId, toId, amount, new Date()]
    )
  })
  // Isolation: concurrent transfers don't interfere
  // Durability: committed data persists
}
```

### Normalization

**Organize data to minimize redundancy and avoid anomalies.**

| Normal Form | Rule | Example |
|-------------|------|---------|
| **1NF** | Atomic values, no repeating groups | Split `tags: ['a','b']` into separate rows |
| **2NF** | No partial dependencies | `order_items` needs both `order_id` and `item_id` |
| **3NF** | No transitive dependencies | Move `customer_address` to `customers` table |

```sql
-- âŒ Not normalized (redundant data)
CREATE TABLE orders (
  id INT,
  customer_name VARCHAR(100),
  customer_email VARCHAR(100),
  customer_address VARCHAR(200),
  product_name VARCHAR(100),
  product_price DECIMAL(10,2)
);

-- âœ… Normalized (no redundancy)
CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  address VARCHAR(200)
);

CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(id),
  order_date DATE
);

CREATE TABLE order_items (
  order_id INT REFERENCES orders(id),
  product_id INT REFERENCES products(id),
  quantity INT,
  price DECIMAL(10,2)
);
```

### Denormalization

**Intentionally add redundancy for read performance.**

```sql
-- Denormalized read model (optimized for queries)
CREATE TABLE order_summary (
  order_id INT PRIMARY KEY,
  customer_name VARCHAR(100),  -- Redundant: from customers
  customer_email VARCHAR(100), -- Redundant: from customers
  total_amount DECIMAL(10,2),  -- Redundant: calculated from items
  item_count INT,              -- Redundant: count of items
  created_at TIMESTAMP
);

-- Update via trigger or application logic
CREATE TRIGGER update_order_summary AFTER UPDATE ON order_items
FOR EACH ROW
BEGIN
  UPDATE order_summary
  SET total_amount = (SELECT SUM(price * quantity) FROM order_items WHERE order_id = NEW.order_id),
      item_count = (SELECT COUNT(*) FROM order_items WHERE order_id = NEW.order_id)
  WHERE order_id = NEW.order_id;
END;
```

---

## 2. Data Integrity

### Referential Integrity

**Ensure relationships between tables remain valid.**

```sql
-- Foreign key constraints enforce referential integrity
CREATE TABLE orders (
  id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

-- CASCADE: When customer is deleted, their orders are deleted too
-- SET NULL: Set customer_id to NULL when customer is deleted
-- RESTRICT: Prevent deletion if orders exist
```

### Constraints

**Enforce data rules at the database level.**

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL CHECK (LENGTH(name) >= 2),
  age INT CHECK (age >= 0 AND age <= 150),
  status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'banned')),
  metadata JSONB DEFAULT '{}'::jsonb,
  created_at TIMESTAMP DEFAULT NOW()
);
```

### Idempotency

**Ensure repeated operations produce the same result.**

```typescript
class PaymentService {
  async charge(params: ChargeParams): Promise<PaymentResult> {
    // Idempotency key prevents duplicate charges
    const result = await this.db.transaction(async (tx) => {
      // Check for existing payment with same idempotency key
      const existing = await tx.query(
        'SELECT * FROM payments WHERE idempotency_key = $1',
        [params.idempotencyKey]
      )

      if (existing[0]) {
        return existing[0] as PaymentResult  // Return cached result
      }

      // Process new payment
      const payment = await this.gateway.charge(params)

      // Store with idempotency key
      await tx.query(
        'INSERT INTO payments (id, idempotency_key, amount, status) VALUES ($1, $2, $3, $4)',
        [payment.id, params.idempotencyKey, payment.amount, payment.status]
      )

      return payment
    })

    return result
  }
}
```

---

## 3. Concurrency Control

### Optimistic Concurrency

**Check for conflicts at write time using a version number or timestamp.**

```typescript
class OrderService {
  async updateStatus(orderId: string, newStatus: string, version: number): Promise<void> {
    const result = await this.db.query(
      `UPDATE orders 
       SET status = $1, version = version + 1 
       WHERE id = $2 AND version = $3`,
      [newStatus, orderId, version]
    )

    if (result.affectedRows === 0) {
      throw new ConcurrencyError('Order was modified by another user')
    }
  }
}

// Usage
await orderService.updateStatus('order-123', 'shipped', 5) // version 5 â†’ 6
```

### Pessimistic Concurrency

**Lock rows during transaction to prevent concurrent modifications.**

```sql
-- SELECT FOR UPDATE locks rows for the transaction
BEGIN;
  SELECT * FROM accounts WHERE id = 123 FOR UPDATE;
  -- Only this transaction can modify this row
  UPDATE accounts SET balance = balance - 100 WHERE id = 123;
COMMIT;
```

---

## 4. Schema Management

### Schema Migrations

**Version-controlled database schema changes.**

```typescript
// Migration: 001_create_users.sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

// Migration: 002_add_user_status.sql
ALTER TABLE users ADD COLUMN status VARCHAR(20) DEFAULT 'active';

// Migration: 003_create_orders.sql
CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  total DECIMAL(10,2),
  status VARCHAR(20) DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW()
);

// Rollback (down migration)
// Migration: 003_drop_orders.sql
DROP TABLE IF EXISTS orders;
```

### Soft Delete

**Mark records as deleted without removing them.**

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR(255),
  deleted_at TIMESTAMP NULL,
  is_deleted BOOLEAN GENERATED ALWAYS AS (deleted_at IS NOT NULL) STORED
);

-- Query only active records
SELECT * FROM users WHERE deleted_at IS NULL;

-- Soft delete
UPDATE users SET deleted_at = NOW() WHERE id = 'user-123';
```

### Audit Trails

**Track all changes to data for compliance and debugging.**

```sql
CREATE TABLE audit_log (
  id BIGSERIAL PRIMARY KEY,
  table_name VARCHAR(100) NOT NULL,
  record_id UUID NOT NULL,
  operation VARCHAR(10) NOT NULL,  -- INSERT, UPDATE, DELETE
  old_data JSONB,
  new_data JSONB,
  changed_by UUID,
  changed_at TIMESTAMP DEFAULT NOW()
);

-- Trigger to log all changes
CREATE TRIGGER log_user_changes
AFTER INSERT OR UPDATE OR DELETE ON users
FOR EACH ROW
EXECUTE FUNCTION log_changes();
```

---

## 5. Advanced Patterns

### Event Sourcing

**Store state changes as a sequence of events instead of current state.**

```typescript
class OrderAggregate {
  private events: DomainEvent[] = []
  private state: OrderState = { status: 'pending', items: [] }

  constructor(events: DomainEvent[]) {
    // Rebuild state from events
    for (const event of events) {
      this.applyEvent(event)
    }
  }

  addItem(item: OrderItem): void {
    const event: OrderItemAddedEvent = {
      type: 'ITEM_ADDED',
      orderId: this.state.id,
      item,
      timestamp: new Date(),
    }
    this.events.push(event)
    this.applyEvent(event)
  }

  private applyEvent(event: DomainEvent): void {
    switch (event.type) {
      case 'ITEM_ADDED':
        this.state.items.push(event.item)
        break
      case 'ORDER_CONFIRMED':
        this.state.status = 'confirmed'
        break
    }
  }

  getEvents(): DomainEvent[] {
    return [...this.events]
  }
}

// Usage â€” replay events to reconstruct state
const events = await eventStore.getEvents('order-123')
const order = new OrderAggregate(events)
```

### Materialized Views

**Pre-computed queries for fast reads.**

```sql
-- Create materialized view for fast reporting
CREATE MATERIALIZED VIEW daily_sales AS
SELECT
  DATE(order_date) as sale_date,
  COUNT(*) as order_count,
  SUM(total) as total_revenue,
  AVG(total) as avg_order_value
FROM orders
WHERE status = 'confirmed'
GROUP BY DATE(order_date);

-- Refresh when needed
REFRESH MATERIALIZED VIEW daily_sales;

-- Query is instant
SELECT * FROM daily_sales WHERE sale_date > '2026-01-01';
```

---

## Cross-References

- [Clean Architecture](./clean-architecture.md)
- [SOLID Principles](./solid-principles.md)
- [DDD Patterns](./Application Architecture/domain-driven-design.md)
- [Architecture Patterns](./architecture-patterns.md)
- [Coding Practices](./Architecture/clean-architecture.md)


## See Also
- [[A001-abstract-factory-pattern]]
- [[Architecture/abstract-factory-pattern]]
- [[A003-accessibility-a11y]]
- [[A004-accessibility-by-design]]
- [[A005-active-record-pattern]]


