---
slug: system-design-101-notification-system
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - notifications
  - messaging
  - reference
---

# Notification System Design

## Overview

Reference: [[system-design-101/guides/how-do-we-design-a-notification-system]]

This guide covers notification system architecture, delivery channels, and reliability.

## Notification Channels

### 1. Email
- Asynchronous delivery
- High deliverability
- Slow delivery time

### 2. SMS
- Mobile delivery
- High open rate
- Cost per message

### 3. Push Notification
- Real-time delivery
- Requires app installed
- Platform-specific (APNs, FCM)

### 4. In-App Notification
- Real-time delivery
- No external dependency
- Requires active session

### 5. Webhook
- Server-to-server
- Custom delivery
- Requires endpoint

## Notification System Architecture

```
┌─────────────┐    ┌──────────────┐    ┌─────────────┐
│  Application │───▶│  Notification │───▶│  Message    │
│  Service     │    │  Service     │    │  Queue      │
└─────────────┘    └──────────────┘    └─────────────┘
                                             │
                    ┌────────────────────────┼────────────────────────┐
                    │                        │                        │
                    ▼                        ▼                        ▼
              ┌──────────┐            ┌──────────┐            ┌──────────┐
              │  Email   │            │   SMS    │            │   Push   │
              │ Provider │            │ Provider │            │ Provider │
              └──────────┘            └──────────┘            └──────────┘
```

## Implementation Example

### Notification Service

```typescript
// notifications/notification-service.ts
export enum Channel {
  EMAIL = 'email',
  SMS = 'sms',
  PUSH = 'push',
  IN_APP = 'in_app',
}

export interface Notification {
  userId: string
  channel: Channel
  subject: string
  body: string
  data?: Record<string, any>
}

export class NotificationService {
  private queues: Map<Channel, MessageQueue> = new Map()

  async send(notification: Notification): Promise<void> {
    const queue = this.queues.get(notification.channel)
    if (!queue) {
      throw new Error(`Unsupported channel: ${notification.channel}`)
    }

    await queue.enqueue(notification)
  }

  async sendMultiple(notifications: Notification[]): Promise<void> {
    const promises = notifications.map((n) => this.send(n))
    await Promise.all(promises)
  }
}
```

### Email Notification Provider

```typescript
// notifications/email-provider.ts
import { Resend } from 'resend'

export class EmailProvider {
  private resend: Resend

  constructor(apiKey: string) {
    this.resend = new Resend(apiKey)
  }

  async send(to: string, subject: string, html: string): Promise<void> {
    await this.resend.emails.send({
      from: 'app@example.com',
      to,
      subject,
      html,
    })
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[notification-systems]] — Notification patterns
- [[event-driven-architecture]] — Event-driven patterns
- [[message-queues]] — Message queue patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-a-notification-system|notification-system-guide]]
