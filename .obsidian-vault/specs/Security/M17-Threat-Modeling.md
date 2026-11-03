---
slug: threat-modeling
sources:
  - https://owasp.org/
  - https://cwe.mitre.org/
date: 2026-11-02
tags:












  - threat-modeling
  - security
  - design
  - risk
---

# Threat Modeling

## Definition

Threat Modeling is **a security practice that identifies, quantifies, and addresses security risks in a system before it is built**.

> "Threat modeling is an exercise intended to help you identify and prioritize the security risks your application faces, and define and prioritize the countermeasures you want to put in place to deal with those risks." — Microsoft

## Problem Addressed

Without threat modeling:
- **Unknown threats**: Threats are not identified until it's too late
- **Security holes**: Security holes are introduced during development
- **Cost**: Security fixes are expensive
- **Risk**: System is insecure

## Scope and Boundaries

- Threat Modeling ≠ Security Testing (threat modeling identifies threats before building, security testing finds issues after building)
- Threat Modeling = Prevention (threat modeling prevents security issues)
- Threat Modeling is a **security practice**, not a pattern

## When to Apply

- When designing secure systems
- when security is critical
- when building new systems or features
- when compliance requires threat modeling

## Tradeoffs and When to Avoid

| Cost | Description |
|------|-------------|
| **Time** — Threat modeling takes time |
| **Complexity** — Threat modeling adds process complexity |
| **Expertise**: Requires security expertise |

## Common Misuses

- **Everything threat modeled**: Not every system needs formal threat modeling
- **One-time effort**: Threat modeling should be repeated as the system evolves
- **Confusing with security testing**: Threat modeling identifies threats before building, security testing finds issues after building

## Related Concepts

- [Secure by Design](Security/secure-by-design.md) — Secure by design includes threat modeling
- [Security Principles](Security/security-principles.md) — Security principles include threat modeling
- [Trust Boundaries](Security/trust-boundaries.md) — Trust boundaries are identified through threat modeling

## Project Observations

- The project uses threat modeling:
  - TypeScript supports threat modeling through type system
  - The project's architecture patterns note covers security concepts
  - No evidence of threat modeling in existing code (src/ is empty)
- File naming conventions support threat modeling:
  - `*.security.ts` — Security files
  - `*.guard.ts` — Guard files

## Sources

- [[Sources/martin-fowler-patterns|martin-fowler-patterns]]
- [[Sources/react-docs-2026|react-docs-2026]]

---

## Decision Tree: Threat Modeling

```mermaid
graph TD
    A[Designing new feature?]\n    A --> B{Handles sensitive data?}\n    B -->|Yes| C[STRIDE analysis]\n    B -->|No| D{New architecture?}\n    D -->|Yes| E[Data flow diagram]\n    D -->|No| F[Simple review]\n    C --> G{Trust boundary crossing?}\n    G -->|Yes| H[Authentication check]\n    G -->|No| I[Input validation]\n    E --> J[Identify components]\n    J --> K[Identify data flows]\n    K --> L[Identify threats]\n    L --> M[Mitigate threats]\n```\n\n### Threat Analysis Method Selection\n\n| Method | When to Use | Complexity | Example |\n|--------|-------------|------------|---------|\n| **STRIDE** | All new features | Low | Spoofing, Tampering, Repudiation |\n| **PASTA** | Critical systems | High | Process for Attack Simulation |\n| **OWASP** | Web applications | Medium | OWASP Top 10 |\n| **Attack Trees** | Complex threats | High | Root cause analysis |\n\n---

## Procedural Guidance: Threat Modeling Implementation

### Step 1: Create Data Flow Diagram

```typescript
// security/threat-model.ts
export interface DataFlow {
  id: string
  name: string
  source: string
  destination: string
  protocol: string
  dataTypes: string[]
  trustLevel: 'trusted' | 'untrusted' | 'semi-trusted'
}

export interface Component {
  id: string
  name: string
  type: 'web-app' | 'api' | 'database' | 'external' | 'user'
  trustLevel: 'trusted' | 'untrusted' | 'semi-trusted'
  handlesSensitiveData: boolean
}

export interface ThreatModel {
  id: string
  name: string
  version: string
  components: Component[]
  dataFlows: DataFlow[]
  threats: Threat[]
  mitigations: Mitigation[]
}

export interface Threat {
  id: string
  name: string
  category: 'spoofing' | 'tampering' | 'repudiation' | 'information-disclosure' | 'dos' | 'elevation-of-privilege'
  description: string
  severity: 'critical' | 'high' | 'medium' | 'low'
  status: 'open' | 'mitigated' | 'accepted' | 'rejected'
}

export interface Mitigation {
  id: string
  threatId: string
  description: string
  type: 'preventive' | 'detective' | 'corrective'
  status: 'implemented' | 'planned' | 'rejected'
}
```

### Step 2: Perform STRIDE Analysis

```typescript
// security/stride-analysis.ts
import { Threat, ThreatModel } from './threat-model'

export class StrideAnalysis {
  // Analyze data flow for STRIDE threats
  analyzeDataFlow(dataFlow: any): Threat[] {
    const threats: Threat[] = []

    // Spoofing: Can someone impersonate the source?
    if (dataFlow.trustLevel !== 'trusted') {
      threats.push({
        id: crypto.randomUUID(),
        name: 'Spoofing',
        category: 'spoofing',
        description: `Data from ${dataFlow.source} can be spoofed`,
        severity: 'high',
        status: 'open',
      })
    }

    // Tampering: Can data be modified in transit?
    if (!dataFlow.encrypted) {
      threats.push({
        id: crypto.randomUUID(),
        name: 'Tampering',
        category: 'tampering',
        description: `Data can be modified in transit`,
        severity: 'critical',
        status: 'open',
      })
    }

    // Repudiation: Can someone deny an action?
    if (!dataFlow.audited) {
      threats.push({
        id: crypto.randomUUID(),
        name: 'Repudiation',
        category: 'repudiation',
        description: `Actions cannot be audited`,
        severity: 'medium',
        status: 'open',
      })
    }

    // Information Disclosure: Can data be exposed?
    if (dataFlow.handlesSensitiveData && !dataFlow.encrypted) {
      threats.push({
        id: crypto.randomUUID(),
        name: 'Information Disclosure',
        category: 'information-disclosure',
        description: `Sensitive data can be exposed`,
        severity: 'critical',
        status: 'open',
      })
    }

    // Denial of Service: Can the flow be disrupted?
    threats.push({
      id: crypto.randomUUID(),
      name: 'Denial of Service',
      category: 'dos',
      description: `Flow can be disrupted`,
      severity: 'medium',
      status: 'open',
    })

    // Elevation of Privilege: Can access be elevated?
    if (dataFlow.trustLevel === 'semi-trusted') {
      threats.push({
        id: crypto.randomUUID(),
        name: 'Elevation of Privilege',
        category: 'elevation-of-privilege',
        description: `Access can be elevated from semi-trusted source`,
        severity: 'high',
        status: 'open',
      })
    }

    return threats
  }
}
```

### Step 3: Document Threat Model

```typescript
// security/threat-model-document.ts
import { ThreatModel } from './threat-model'

export function generateThreatModelReport(model: ThreatModel): string {
  let report = `# Threat Model: ${model.name}\n\n`
  report += `Version: ${model.version}\n\n`
  report += `## Components\n\n`

  for (const component of model.components) {
    report += `- ${component.name} (${component.type})\n`
  }

  report += `\n## Threats\n\n`

  for (const threat of model.threats) {
    report += `### ${threat.name}\n\n`
    report += `- **Category**: ${threat.category}\n`
    report += `- **Severity**: ${threat.severity}\n`
    report += `- **Status**: ${threat.status}\n`
    report += `- **Description**: ${threat.description}\n\n`
  }

  report += `\n## Mitigations\n\n`

  for (const mitigation of model.mitigations) {
    report += `- **${mitigation.type}**: ${mitigation.description}\n`
  }

  return report
}
```

### Step 4: Implement Threat Monitoring

```typescript
// security/threat-monitoring.ts
export class ThreatMonitor {
  private threats: Map<string, boolean> = new Map()

  // Check for threat indicators
  checkThreatIndicator(indicator: string): boolean {
    // Check for SQL injection
    if (indicator.includes("' OR '1'='1")) {
      this.threats.set('sql-injection', true)
      return true
    }

    // Check for XSS
    if (indicator.includes("<script>")) {
      this.threats.set('xss', true)
      return true
    }

    // Check for path traversal
    if (indicator.includes("../")) {
      this.threats.set('path-traversal', true)
      return true
    }

    return false
  }

  // Get active threats
  getActiveThreats(): string[] {
    return Array.from(this.threats.entries())
      .filter(([, active]) => active)
      .map(([threat]) => threat)
  }

  // Clear threats
  clearThreats(): void {
    this.threats.clear()
  }
}
```

---

## Copilot Instructions

### When to Read This Note
- Designing new features
- Identifying security threats
- Creating data flow diagrams
- Performing STRIDE analysis
- Documenting threat models

### What to Do With This Information
1. **Create data flow diagram**: Map components and data flows
2. **Perform STRIDE**: Analyze each data flow for threats
3. **Document threats**: Record threats and severity
4. **Implement mitigations**: Address critical threats
5. **Monitor threats**: Set up threat monitoring

### Tools to Use
- **VS Code Extension**: Error Lens — for inline error display
- **npm Package**: `winston` — for threat logging
- **npm Package**: `express-rate-limit` — for DoS prevention
- **npm Package**: `helmet` — for security headers
- **Terminal Command**: `pnpm test` — run tests
- **Terminal Command**: `pnpm audit` — check vulnerabilities

### Agents to Invoke
- **Security Review Agent**: Run when designing new features
- **Architecture Review Agent**: Run when creating data flow diagrams

### Integration with Other Notes
- read [[secure-by-design]] for security principles
- read [[trust-boundaries]] for trust boundary analysis
- read [input-validation](D/input-validation.md) for input validation
- read [security-principles](D/security-principles.md) for security principles

### Common Pitfalls
- Don't skip threat modeling (do it early)
- Don't ignore low-severity threats (document them)
- Don't forget to update (review regularly)
- Don't skip mitigations (address critical threats)
- Don't forget monitoring (set up threat detection)

### Quick Validation Checklist
- [ ] Is data flow diagram created?
- [ ] Is STRIDE analysis performed?
- [ ] Are threats documented?
- [ ] Are mitigations implemented?
- [ ] Is threat monitoring set up?
- [ ] Is threat model reviewed regularly?




