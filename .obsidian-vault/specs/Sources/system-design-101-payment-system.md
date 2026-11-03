---
slug: system-design-101-payment-system
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/security
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - system-design
  - payments
  - financial-systems
  - reference
---

# Payment System Design

## Overview

Reference: [Guide: how-do-we-design-a-payment-system](https://bytebytego.com/guides/how-do-we-design-a-payment-system)

This guide covers payment system architecture, transaction processing, and security.

## Payment System Components

### 1. Payment Gateway
- Route payments to processors
- Validate payment methods
- Handle responses

### 2. Payment Processor
- Communicate with banks
- Authorize transactions
- Settle funds

### 3. Fraud Detection
- Risk scoring
- Pattern detection
- Manual review

### 4. Accounting
- Transaction ledger
- Reconciliation
- Reporting

## Payment Flow

```
┌──────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────┐
│  Merchant│───▶│  Payment     │───▶│  Payment     │───▶│  Bank    │
│  System  │    │  Gateway     │    │  Processor   │    │  Network │
└──────────┘    └──────────────┘    └──────────────┘    └──────────┘
                     │                                       │
                     ▼                                       ▼
              ┌──────────────┐                      ┌──────────────┐
              │  Fraud       │                      │  Settlement  │
              │  Detection   │                      │  System      │
              └──────────────┘                      └──────────────┘
```

## Implementation Example

### Payment Transaction

```typescript
// payments/transaction.ts
export enum TransactionStatus {
  PENDING = 'pending',
  AUTHORIZED = 'authorized',
  CAPTURED = 'captured',
  FAILED = 'failed',
  REFUNDED = 'refunded',
}

export interface PaymentTransaction {
  id: string
  amount: number
  currency: string
  status: TransactionStatus
  paymentMethodId: string
  createdAt: Date
  updatedAt: Date
}

export class PaymentService {
  private transactions: Map<string, PaymentTransaction> = new Map()

  async createTransaction(
    amount: number,
    currency: string,
    paymentMethodId: string,
  ): Promise<PaymentTransaction> {
    const transaction: PaymentTransaction = {
      id: `txn_${Date.now()}`,
      amount,
      currency,
      status: TransactionStatus.PENDING,
      paymentMethodId,
      createdAt: new Date(),
      updatedAt: new Date(),
    }

    this.transactions.set(transaction.id, transaction)
    await this.authorize(transaction)
    return transaction
  }

  private async authorize(transaction: PaymentTransaction): Promise<void> {
    // Call payment gateway
    const response = await this.gateway.authorize(transaction)

    if (response.approved) {
      transaction.status = TransactionStatus.AUTHORIZED
    } else {
      transaction.status = TransactionStatus.FAILED
    }

    transaction.updatedAt = new Date()
  }

  async capture(transactionId: string): Promise<void> {
    const transaction = this.transactions.get(transactionId)
    if (transaction?.status === TransactionStatus.AUTHORIZED) {
      transaction.status = TransactionStatus.CAPTURED
      transaction.updatedAt = new Date()
      await this.settle(transaction)
    }
  }

  private async settle(_transaction: PaymentTransaction): Promise<void> {
    // Settlement logic
  }

  private gateway = {
    authorize: async () => ({ approved: true }),
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[payment-systems]] — Payment system patterns
- [[transaction-processing]] — Transaction patterns
- [[financial-systems]] — Financial system design

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [payment-system-guide](https://bytebytego.com/guides/how-do-we-design-a-payment-system)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


