---
slug: system-design-101-chat-system
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
  - chat
  - messaging
  - reference
---

# Chat System Design

## Overview

Reference: [Guide: how-do-we-design-a-chat-system](https://bytebytego.com/guides/how-do-we-design-a-chat-system)

This guide covers chat system architecture, real-time messaging, and message delivery.

## Chat System Components

### 1. Message Client
- User interface
- Message composition
- Presence indicators

### 2. Message Server
- Connection management
- Message routing
- Presence management

### 3. Message Storage
- Message persistence
- Search functionality
- Media storage

### 4. Presence Service
- Online/offline status
- Typing indicators
- Read receipts

## Message Delivery Flow

```
┌──────────┐    ┌──────────────┐    ┌──────────────┐    ┌──────────┐
│  Sender  │───▶│  Message     │───▶│  Message     │───▶│  Recipient│
│  Client  │    │  Server      │    │  Queue       │    │  Client  │
└──────────┘    └──────────────┘    └──────────────┘    └──────────┘
                     │                                       │
                     ▼                                       ▼
              ┌──────────────┐                      ┌──────────────┐
              │  Message     │                      │  Acknowled-  │
              │  Storage     │                      │  ement       │
              └──────────────┘                      └──────────────┘
```

## Implementation Example

### WebSocket Chat Server

```typescript
// chat/websocket-server.ts
import { WebSocketServer, WebSocket } from 'ws'

interface User {
  id: string
  ws: WebSocket
  presence: 'online' | 'offline' | 'typing'
}

export class ChatServer {
  private users: Map<string, User> = new Map()
  private wss: WebSocketServer

  constructor(port: number) {
    this.wss = new WebSocketServer({ port })
    this.setupHandlers()
  }

  private setupHandlers(): void {
    this.wss.on('connection', (ws: WebSocket) => {
      const userId = this.authenticate(ws)
      this.users.set(userId, { id: userId, ws, presence: 'online' })

      ws.on('message', (data) => this.handleMessage(userId, data))
      ws.on('close', () => this.handleDisconnect(userId))
    })
  }

  private handleMessage(userId: string, data: Buffer): void {
    const message = JSON.parse(data.toString())

    switch (message.type) {
      case 'chat':
        this.broadcastMessage(userId, message.content)
        break
      case 'typing':
        this.broadcastTyping(userId, message.isTyping)
        break
    }
  }

  private broadcastMessage(senderId: string, content: string): void {
    const message = JSON.stringify({
      type: 'chat',
      senderId,
      content,
      timestamp: Date.now(),
    })

    for (const user of this.users.values()) {
      if (user.ws.readyState === WebSocket.OPEN) {
        user.ws.send(message)
      }
    }
  }

  private handleDisconnect(userId: string): void {
    this.users.delete(userId)
    this.broadcastPresence(userId, 'offline')
  }

  private authenticate(_ws: WebSocket): string {
    return 'user_123'
  }

  private broadcastPresence(_userId: string, _presence: string): void {
    // Broadcast presence changes
  }

  private broadcastTyping(_userId: string, _isTyping: boolean): void {
    // Broadcast typing indicators
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[chat-systems]] — Chat system patterns
- [[websockets]] — WebSocket patterns
- [[real-time-systems]] — Real-time system design

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [chat-system-guide](https://bytebytego.com/guides/how-do-we-design-a-chat-system)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


