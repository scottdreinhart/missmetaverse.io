---
slug: domain-service
sources:
  - https://www.domainlanguage.com/ddd/reference/
  - https://martinfowler.com/bliki/DomainService.html
date: 2026-11-02
tags:
  - ddd
  - domain-service
  - domain-modeling
  - business-logic
# Domain Service

## Definition

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
Domain Service is **a operation between two or more entities that does not naturally belong to any single entity**.

> "A domain operation that is not a natural responsibility of an Entity or Value Object." â€” Eric Evans

## Problem Addressed

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
Without domain services:
- **Anemic domain**: Domain objects become data containers only
- **Logic placement**: Business logic has nowhere to live
- **Duplication**: Same logic duplicated across entities
- **Violation**: SRP violated when entities do too much

## Scope and Boundaries

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
- Domain Service â‰  Application Service (domain service contains domain logic, application service orchestrates application steps)
- Domain Service = Business Logic (domain service contains business rules)
- Domain Service is a **domain model building block**, not a pattern

## When to Apply

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
- When building domain models
- when business logic doesn't belong to a single entity
- when anemic domain model is a risk
- when business rules need explicit representation

## Tradeoffs and When to Avoid

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
| Cost | Description |
|------|-------------|
| **Complexity** â€” Domain services add architectural complexity |
| **Time** â€” Designing domain services takes time |
| **Over-service** â€” Not every operation needs a service |

## Common Misuses

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
- **Everything a service**: Not every operation needs a domain service
- **Transaction script**: Domain services should contain domain logic, not transaction scripts
- **Confusing with application service**: Domain services contain domain logic, application services orchestrate

## Related Concepts

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
- [Entity](DDD/entity.md) â€” Domain services operate on entities
- [Value Object](DDD/value-object.md) â€” Domain services operate on value objects
- [Application Service](DDD/application-service.md) â€” Application services orchestrate domain services

## Project Observations

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
- The project uses domain services:
  - TypeScript functions can serve as domain services
  - The project's architecture patterns note covers DDD concepts
  - No evidence of domain services in existing code (src/ is empty)
- File naming conventions support domain services:
  - `*.service.ts` â€” Service files
  - `*.use-case.ts` â€” Use case files

## Sources

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
- [[Sources/evans-ddd-2003|evans-ddd-2003]]
- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]

---

## Decision Tree: Domain Service Design

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
```mermaid
graph TD
    A[Need business logic?]\n    A --> B{Belongs to entity?}
    B -->|Yes| C[Add to entity]
    B -->|No| D[Domain service]
    C --> E{Multiple entities?}
    E -->|Yes| F[Domain service]
    E -->|No| G[Entity method]
    D --> H{Stateless?}
    H -->|Yes| I[Static method]
    H -->|No| J[Class with state]
    I --> K{Called from?}
    K -->|Application| L[Application service]
    K -->|Other domain| M[Domain service]
```

### When to Use Domain Service

| Situation | Action | Example |
|-----------|--------|---------|
| **Multiple entities** | Domain service | Transfer between accounts |
| **Entity logic missing** | Add to entity | Validation |
| **Cross-aggregate** | Domain service | Consistency checks |
| **Algorithm** | Domain service | Complex calculations |

---

## Procedural Guidance: Domain Service Implementation

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
### Step 1: Define Service Interface

```typescript
// domains/account/application/account-conversion.service.ts
import { Account } from '@/domains/account/account.entity'
import { Money } from '@/value-objects/money.vo'
import { ExchangeRate } from '@/value-objects/exchange-rate.vo'

export interface AccountConversionService {
  convertCurrency(
    sourceAccount: Account,
    targetAccount: Account,
    amount: Money,
    exchangeRate: ExchangeRate,
  ): Promise<void>
  
  calculateFees(
    amount: Money,
    sourceCurrency: string,
    targetCurrency: string,
  ): Money
}
```

### Step 2: Implement Domain Service

```typescript
// domains/account/application/money-conversion.service.ts
import { Account } from '@/domains/account/account.entity'
import { Money } from '@/value-objects/money.vo'
import { ExchangeRate } from '@/value-objects/exchange-rate.vo'
import { Transaction } from '@/domains/transaction/transaction.entity'
import { TransactionRepository } from '@/domains/transaction/transaction.repository'

export class MoneyConversionService implements AccountConversionService {
  constructor(
    private transactionRepository: TransactionRepository,
    private exchangeRateProvider: ExchangeRateProvider,
  ) {}

  async convertCurrency(
    sourceAccount: Account,
    targetAccount: Account,
    amount: Money,
    exchangeRate: ExchangeRate,
  ): Promise<void> {
    // Validate accounts
    if (sourceAccount.getId() === targetAccount.getId()) {
      throw new Error('Source and target accounts must be different')
    }

    // Calculate fees
    const fees = this.calculateFees(amount, sourceAccount.getCurrency(), targetAccount.getCurrency())
    const totalDebit = amount.add(fees)

    // Debit source account
    sourceAccount.debit(totalDebit)
    
    // Credit target account
    const convertedAmount = amount.multiply(exchangeRate.rate)
    targetAccount.credit(convertedAmount)

    // Record transaction
    const transaction = Transaction.create({
      sourceAccountId: sourceAccount.getId(),
      targetAccountId: targetAccount.getId(),
      amount: convertedAmount,
      fees,
      exchangeRate,
      type: 'currency_conversion',
    })
    
    await this.transactionRepository.save(transaction)
  }

  calculateFees(
    amount: Money,
    sourceCurrency: string,
    targetCurrency: string,
  ): Money {
    if (sourceCurrency === targetCurrency) {
      return new Money(0) // No fees for same currency
    }
    
    // 0.5% fee for currency conversion
    const feeRate = new Money(0.005)
    return amount.multiply(feeRate)
  }
}
```

### Step 3: Use in Application Service

```typescript
// domains/account/application/transfer.service.ts
import { Account } from '@/domains/account/account.entity'
import { AccountRepository } from '@/domains/account/account.repository'
import { MoneyConversionService } from './money-conversion.service'
import { Money } from '@/value-objects/money.vo'

export class TransferService {
  constructor(
    private accountRepository: AccountRepository,
    private moneyConversion: MoneyConversionService,
  ) {}

  async transfer(
    sourceId: string,
    targetId: string,
    amount: Money,
    targetCurrency?: string,
  ): Promise<void> {
    // Fetch accounts
    const sourceAccount = await this.accountRepository.findById(sourceId)
    const targetAccount = await this.accountRepository.findById(targetId)

    if (!sourceAccount || !targetAccount) {
      throw new Error('Account not found')
    }

    // Convert currency if needed
    if (targetCurrency && sourceAccount.getCurrency() !== targetCurrency) {
      const exchangeRate = await this.exchangeRateProvider.getRate(
        sourceAccount.getCurrency(),
        targetCurrency,
      )
      
      await this.moneyConversion.convertCurrency(
        sourceAccount,
        targetAccount,
        amount,
        exchangeRate,
      )
    } else {
      // Same currency transfer
      sourceAccount.debit(amount)
      targetAccount.credit(amount)
      
      await this.accountRepository.save(sourceAccount)
      await this.accountRepository.save(targetAccount)
    }
  }
}
```

### Step 4: Define as Stateless Service

```typescript
// domains/shared/calculations/tax-calculation.service.ts
import { Money } from '@/value-objects/money.vo'

export class TaxCalculationService {
  // Stateless â€” static methods
  static calculateTax(amount: Money, rate: number): Money {
    if (rate < 0 || rate > 1) {
      throw new Error('Tax rate must be between 0 and 1')
    }
    return amount.multiply(new Money(rate))
  }

  static calculateTaxIncluded(amount: Money, rate: number): Money {
    if (rate < 0 || rate > 1) {
      throw new Error('Tax rate must be between 0 and 1')
    }
    return amount.multiply(new Money(rate / (1 + rate)))
  }

  static calculateTaxExclusive(amount: Money, rate: number): Money {
    if (rate < 0 || rate > 1) {
      throw new Error('Tax rate must be between 0 and 1')
    }
    return amount.multiply(new Money(1 + rate))
  }
}

// Usage
const tax = TaxCalculationService.calculateTax(new Money(100), 0.2)
```

### Step 5: Test Domain Service

```typescript
// tests/money-conversion.service.test.ts
import { describe, it, expect, vi } from 'vitest'
import { MoneyConversionService } from '@/domains/account/application/money-conversion.service'
import { Account } from '@/domains/account/account.entity'
import { Money } from '@/value-objects/money.vo'
import { ExchangeRate } from '@/value-objects/exchange-rate.vo'
import type { TransactionRepository } from '@/domains/transaction/transaction.repository'
import type { ExchangeRateProvider } from '@/ports/exchange-rate.provider.port'

describe('MoneyConversionService', () => {
  const mockTxRepo = {
    save: vi.fn(),
  } as unknown as TransactionRepository

  const mockRateProvider = {
    getRate: vi.fn().mockResolvedValue(new ExchangeRate('USD', 'EUR', 0.85)),
  } as unknown as ExchangeRateProvider

  const service = new MoneyConversionService(mockTxRepo, mockRateProvider)

  it('should calculate fees correctly', () => {
    const fees = service.calculateFees(new Money(100), 'USD', 'EUR')
    expect(fees.value).toBe(0.5) // 0.5% of 100
  })

  it('should not charge fees for same currency', () => {
    const fees = service.calculateFees(new Money(100), 'USD', 'USD')
    expect(fees.value).toBe(0)
  })

  it('should throw error for same account', async () => {
    const account = Account.create('acc-1', 'USD', new Money(1000))
    
    await expect(
      service.convertCurrency(account, account, new Money(100), new ExchangeRate('USD', 'EUR', 0.85)),
    ).rejects.toThrow('Source and target accounts must be different')
  })
})
```

---

## Copilot Instructions

## concept_id
c09-domain-service

## title
Domain Service

## aliases
- C09-Domain-Service

## category
domain-modeling

## concept_type
tactical-pattern

## research_status
verified

## project_adoption
recommended
### When to Read This Note
- Implementing domain services
- Identifying where business logic belongs
- Creating stateless calculation services
- Using domain services in application services
- Testing domain services

### What to Do With This Information
1. **Multiple entities**: Use domain services when logic involves multiple entities
2. **Stateless services**: Use static methods for pure calculations
3. **Application services**: Call domain services from application services
4. **Domain logic**: Keep business rules in domain services, not application services
5. **Testing**: Test domain services in isolation with mocked dependencies

### Tools to Use
- **VS Code Extension**: TypeScript Hero â€” for TypeScript shortcuts
- **VS Code Extension**: Error Lens â€” for inline error display
- **npm Package**: `vitest` â€” for testing services
- **Terminal Command**: `pnpm test` â€” run tests
- **Terminal Command**: `pnpm tsc --noEmit` â€” type check

### Agents to Invoke
- **Architecture Validation Agent**: Run when designing new domain services
- **Code Review Agent**: Run when reviewing PRs with domain logic changes

### Integration with Other Notes
- read [[application-service]] for application service patterns
- read [[entity]] for entity patterns
- read [[value-object]] for value object patterns
- read [[aggregate]] for aggregate patterns
- read [[domain-invariant]] for domain invariant patterns
- read [Application Architecture/domain-driven-design](D/Application Architecture/domain-driven-design.md) for domain-driven design patterns

### Common Pitfalls
- Don't put domain logic in application services (use domain services)
- Don't create a service for every operation (only when needed)
- Don't make services stateful unless necessary (prefer stateless)
- Don't couple services to infrastructure (use ports/interfaces)
- Don't ignore testing (test domain logic thoroughly)

### Quick Validation Checklist
- [ ] Does the service contain domain logic (not orchestration)?
- [ ] Are static methods used for pure calculations?
- [ ] Are dependencies injected via constructor?
- [ ] Is the service tested in isolation?
- [ ] Are ports/interfaces used for external dependencies?
- [ ] Is the service called from application services?



