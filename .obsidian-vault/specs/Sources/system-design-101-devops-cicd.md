---
slug: system-design-101-devops-cicd
sources:
  - https://github.com/donnemartin/system-design-cheat-sheet
date: 2026-11-02
tags:
  - system-design
  - devops
  - cicd
  - reference
---

# DevOps and CI/CD Design

## Overview

Reference: [[system-design-101/guides/how-do-we-design-devops-and-cicd]]

This guide covers DevOps practices, CI/CD pipelines, and infrastructure as code.

## CI/CD Pipeline Stages

### 1. Source
- Version control (Git)
- Branching strategies
- Code review process

### 2. Build
- Compile code
- Run linters
- Generate artifacts

### 3. Test
- Unit tests
- Integration tests
- E2E tests
- Security scans

### 4. Deploy
- Staging environment
- Production deployment
- Rollback capability

### 5. Monitor
- Application monitoring
- Log aggregation
- Alerting

## Deployment Strategies

### 1. Blue-Green Deployment
- Two identical environments
- Switch traffic between them
- Fast rollback

### 2. Canary Deployment
- Deploy to small subset
- Gradually increase traffic
- Monitor for issues

### 3. Rolling Deployment
- Update instances one by one
- No downtime
- Simple implementation

### 4. Feature Flags
- Toggle features without deployment
- Gradual rollout
- A/B testing

## Infrastructure as Code

### Terraform Example

```hcl
# infrastructure/main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"

  tags = {
    Name        = "web-server"
    Environment = "production"
  }
}

resource "aws_lb" "main" {
  name               = "main-lb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.lb.id]
  subnets         = aws_subnet.public.*.id

  tags = {
    Name = "main-load-balancer"
  }
}
```

### Kubernetes Deployment

```yaml
# k8s/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: web
        image: registry/web-app:1.0.0
        ports:
        - containerPort: 8080
        resources:
          requests:
            memory: "128Mi"
            cpu: "250m"
          limits:
            memory: "256Mi"
            cpu: "500m"
        livenessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[devops-practices]] — DevOps best practices
- [[cicd-pipeline]] — CI/CD pipeline design
- [[infrastructure-as-code]] — IaC patterns
- [[container-orchestration]] — Container orchestration

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [[system-design-101/guides/how-do-we-design-devops-and-cicd|devops-guide]]
