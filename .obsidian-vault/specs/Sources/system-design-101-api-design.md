---
slug: system-design-101-api-design
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - api
  - design
  - reference
---

# API Design Patterns and Best Practices

## Overview

Reference: [[system-design-101/guides/how-do-we-design-an-api]]

This guide covers API design patterns, REST, GraphQL, gRPC, and API gateway patterns.

## API Styles

### 1. REST
- Resource-based architecture
- HTTP methods (GET, POST, PUT, DELETE)
- Stateless, cacheable
- Example: `/api/users/123`

### 2. GraphQL
- Query language for APIs
- Client specifies data shape
- Single endpoint
- Example: `query { user(id: "123") { name email } }`

### 3. gRPC
- Protocol Buffers
- HTTP/2, binary protocol
- High performance
- Example: `UserService.GetUser()`

### 4. SOAP
- XML-based protocol
- WSDL for service description
- Built-in security
- Example: Enterprise web services

## REST API Design

### Resource Naming
- Use nouns, not verbs
- Pluralize resources
- Use nested resources for relationships
- Example: `/api/users/123/posts`

### HTTP Methods
| Method | Purpose | Idempotent | Safe |
|--------|---------|------------|------|
| **GET** | Read resource | Yes | Yes |
| **POST** | Create resource | No | No |
| **PUT** | Update resource | Yes | No |
| **PATCH** | Partial update | No | No |
| **DELETE** | Remove resource | Yes | No |

### Status Codes
| Code | Meaning | Use Case |
|------|---------|----------|
| **200** | OK | Success |
| **201** | Created | Resource created |
| **204** | No Content | Delete success |
| **400** | Bad Request | Invalid input |
| **401** | Unauthorized | Authentication required |
| **403** | Forbidden | Authorization required |
| **404** | Not Found | Resource not found |
| **429** | Too Many Requests | Rate limited |
| **500** | Server Error | Internal error |

## GraphQL Design

### Schema Design
```graphql
# schema.graphql
type User {
  id: ID!
  name: String!
  email: String!
  posts: [Post!]!
}

type Post {
  id: ID!
  title: String!
  content: String!
  author: User!
  comments: [Comment!]!
}

type Comment {
  id: ID!
  text: String!
  author: User!
  post: Post!
}

type Query {
  user(id: ID!): User
  users(limit: Int, offset: Int): [User!]!
  post(id: ID!): Post
}

type Mutation {
  createUser(input: CreateUserInput!): User!
  createPost(input: CreatePostInput!): Post!
}

input CreateUserInput {
  name: String!
  email: String!
}

input CreatePostInput {
  title: String!
  content: String!
  authorId: ID!
}
```

## gRPC Design

### Protocol Buffer Definition
```protobuf
// user.proto
syntax = "proto3";

package user;

service UserService {
  rpc GetUser (GetUserRequest) returns (User);
  rpc CreateUser (CreateUserRequest) returns (User);
  rpc ListUsers (ListUsersRequest) returns (stream User);
  rpc Subscribe (SubscribeRequest) returns (stream UserEvent);
}

message User {
  string id = 1;
  string name = 2;
  string email = 3;
}

message GetUserRequest {
  string id = 1;
}

message CreateUserRequest {
  string name = 1;
  string email = 2;
}

message ListUsersRequest {
  int32 page_size = 1;
  string page_token = 2;
}

message SubscribeRequest {
  string user_id = 1;
}

message UserEvent {
  string user_id = 1;
  string event_type = 2;
  string timestamp = 3;
}
```

## API Gateway Pattern

```typescript
// api-gateway.ts
import { Request, Response } from 'express'

class APIGateway {
  private routes: Map<string, Handler> = new Map()

  register(method: string, path: string, handler: Handler): void {
    this.routes.set(`${method}:${path}`, handler)
  }

  async handle(request: Request, response: Response): Promise<void> {
    const key = `${request.method}:${request.path}`
    const handler = this.routes.get(key)

    if (!handler) {
      response.status(404).json({ error: 'Not found' })
      return
    }

    try {
      await handler(request, response)
    } catch (error) {
      response.status(500).json({ error: 'Internal server error' })
    }
  }
}

type Handler = (request: Request, response: Response) => Promise<void>
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[rest-api-design]] — REST API design patterns
- [[graphql-api-design]] — GraphQL API design
- [[grpc-design]] — gRPC design patterns
- [[api-gateway]] — API gateway patterns
- [[versioning-strategies]] — API versioning strategies

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-an-api|api-design-guide]]
