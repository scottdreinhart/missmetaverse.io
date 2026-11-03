---
slug: system-design-101-ml-systems
sources:
  - https://github.com/donnemartin/system-design-primer
date: 2026-11-02
tags:
  - priority/medium
  - maturity/stable
  - domain/backend
  - type/reference
  - domain/frontend
  - type/guide
  - domain/architecture
  - type/concept
  - domain/optimization
  - system-design
  - machine-learning
  - ml-systems
  - reference
---

# Machine Learning System Design

## Overview

Reference: [Guide: how-do-we-design-ml-systems](https://bytebytego.com/guides/how-do-we-design-ml-systems)

This guide covers ML system architecture, training pipelines, and model serving.

## ML System Components

### 1. Data Collection
- Data sources
- Data labeling
- Data storage

### 2. Feature Engineering
- Feature extraction
- Feature store
- Feature transformation

### 3. Model Training
- Model selection
- Training pipeline
- Hyperparameter tuning

### 4. Model Serving
- Real-time inference
- Batch inference
- Model versioning

### 5. Monitoring
- Model drift detection
- Performance monitoring
- Data quality checks

## ML Pipeline Architecture

```
┌─────────────┐    ┌──────────────┐    ┌─────────────┐
│  Data Source │───▶│  Data Pipeline│───▶│ Feature Store│
└─────────────┘    └──────────────┘    └─────────────┘
                                             │
                                             ▼
┌─────────────┐    ┌──────────────┐    ┌─────────────┐
│  Monitoring  │◀───│  Model Serving│◀───│  Model Store │
└─────────────┘    └──────────────┘    └─────────────┘
                             │
                             ▼
                      ┌──────────────┐
                      │  Training Pipeline │
                      └──────────────┘
```

## Implementation Example

### Feature Store

```typescript
// ml/feature-store.ts
export class FeatureStore {
  private features: Map<string, Map<string, number>> = new Map()

  async getFeatures(userId: string): Promise<Map<string, number>> {
    if (this.features.has(userId)) {
      return this.features.get(userId)!
    }

    // Fetch from data source
    const features = await this.fetchFeatures(userId)
    this.features.set(userId, features)
    return features
  }

  async updateFeatures(userId: string, features: Map<string, number>): Promise<void> {
    this.features.set(userId, features)
  }

  private async fetchFeatures(userId: string): Promise<Map<string, number>> {
    // Fetch from data warehouse
    return new Map()
  }
}
```

### Model Serving

```typescript
// ml/model-serving.ts
import * as tf from '@tensorflow/tfjs'

export class ModelServer {
  private model: tf.LayersModel

  async loadModel(path: string): Promise<void> {
    this.model = await tf.loadLayersModel(path)
  }

  async predict(features: number[]): Promise<number[]> {
    const input = tf.tensor2d([features], [1, features.length])
    const prediction = this.model.predict(input) as tf.Tensor
    return Array.from(prediction.dataSync())
  }
}
```

## Integration with Vault

Read these vault notes for deeper understanding:

- [[ml-systems]] — ML system design
- [[feature-engineering]] — Feature engineering patterns
- [[model-serving]] — Model serving patterns

## Sources

- [[Sources/system-design-101-index|system-design-101-index]]
- [ml-systems-guide](https://bytebytego.com/guides/how-do-we-design-ml-systems)


## See Also
- [[aws-api-gateway]]
- [[aws-elasticache]]
- [[bogard-vertical-slice]]
- [[documentation-ingestion-plan]]
- [[evans-ddd-2003]]


