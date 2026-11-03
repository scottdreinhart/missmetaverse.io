---
slug: system-design-101-message-queue
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - messaging
  - queue
  - reference
---

# Message Queue and Event-Driven Architecture

## Overview

Reference: [[system-design-101/guides/how-do-we-design-a-message-queue]]

This guide covers message queues, event-driven architecture, and messaging patterns.

## Messaging Patterns

### 1. Point-to-Point (Queue)
- One producer, one consumer
- Message consumed once
- Example: Job queue

### 2. Publish-Subscribe (Topic)
- One producer, many consumers
- Message delivered to all subscribers
- Example: Event notifications

### 3. Request-Reply
- Client sends request, waits for response
- Synchronous or asynchronous
- Example: RPC over messaging

### 4. Competing Consumers
- Multiple consumers for same queue
- Load balancing
- Example: Worker pool

## Message Queue vs Event Streaming

| Feature | Message Queue | Event Streaming |
|---------|---------------|-----------------|
| **Message Lifetime** | Consumed and deleted | Retained for duration |
| **Consumers** | Each message consumed once | Multiple reads possible |
| **Use Case** | Task distribution | Event sourcing, analytics |
| **Examples** | RabbitMQ, SQS | Kafka, Pulsar |
| **Ordering** | Usually ordered | Strictly ordered |
| **Throughput** | Medium | Very high |

## Implementation Example

### RabbitMQ Producer/Consumer

```typescript
// messaging/rabbitmq.ts
import * as amqp from 'amqplib'

class MessageQueue {
  private connection: amqp.Connection
  private channel: amqp.Channel

  async connect(): Promise<void> {
    this.connection = await amqp.connect('amqp://localhost')
    this.channel = await this.connection.createChannel()
  }

  async publish(exchange: string, routingKey: string, message: any): Promise<void> {
    this.channel.assertExchange(exchange, 'topic', { durable: true })
    this.channel.sendToQueue(
      exchange,
      Buffer.from(JSON.stringify(message)),
      { persistent: true }
    )
  }

  async consume(queue: string, handler: (msg: any) => Promise<void>): Promise<void> {
    await this.channel.assertQueue(queue, { durable: true })
    this.channel.consume(queue, async (msg) => {
      if (msg) {
        await handler(JSON.parse(msg.content.toString()))
        this.channel.ack(msg)
      }
    })
  }
}
```

### Kafka Producer/Consumer

```typescript
// messaging/kafka.ts
import { Kafka, Partitioners } from 'kafkajs'

class KafkaService {
  private kafka: Kafka
  private producer: any
  private consumer: any

  constructor() {
    this.kafka = new Kafka({
      clientId: 'my-app',
      brokers: ['kafka-1:9092', 'kafka-2:9092'],
    })

    this.producer = this.kafka.producer()
    this.consumer = this.kafka.consumer({
      groupId: 'my-group',
    })
  }

  async connect(): Promise<void> {
    await this.producer.connect()
    await this.consumer.connect()
  }

  async publish(topic: string, messages: Array<{ key: string; value: any }>): Promise<void> {
    await this.producer.send({
      topic,
      messages: messages.map((m) => ({
        key: m.key,
        value: JSON.stringify(m.value),
      })),
    })
  }

  async consume(topic: string, handler: (msg: any) => Promise<void>): Promise<void> {
    await this.consumer.subscribe({ topic, fromBeginning: false })

    await this.consumer.run({
      eachMessage: async ({ topic, partition, message }) => {
        const value = JSON.parse(message.value.toString())
        await handler(value)
      },
    })
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[event-driven-architecture]] — Event-driven patterns
- [[message-queues]] — Message queue patterns
- [[event-sourcing]] — Event sourcing pattern
- [[cqrs]] — CQRS pattern
- [[microservices]] — Microservices communication

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-a-message-queue|message-queue-guide]]
