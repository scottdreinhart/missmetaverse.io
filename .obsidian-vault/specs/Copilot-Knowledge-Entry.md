# Copilot Knowledge Entry

> **Purpose:** Guide for Copilot to consume the architecture and engineering knowledge base.
> **Last Updated:** 2026-11-03

---

## How to Use This Knowledge Base

When working on any task, follow these steps:

### 1. Identify the Domain
- Determine the task's domain (architecture, frontend, testing, security, etc.)
- Identify relevant layers, tools, and concepts

### 2. Retrieve Relevant Notes
- Read the appropriate index note for the domain
- Retrieve concept notes for specific patterns or principles
- Check source notes for authoritative citations

### 3. Check Project Context
- Review project requirements and implementation evidence
- Check resolved versions and unresolved findings
- Distinguish between general guidance and verified implementation

### 4. Apply Guidance
- Use only concepts relevant to the current task
- Apply documented canonical commands
- Confirm command scope matches the task

### 5. Cite Sources
- Use source slugs when explaining architectural decisions
- Distinguish researched guidance from verified implementation
- Record unresolved assumptions

### 6. Report Results
- Document actual execution results
- Report unavailable retrieval honestly
- Revalidate version-sensitive recommendations

---

## Key Indexes

| Index | Path | Purpose |
|-------|------|---------|
| Architecture & Patterns | `specs/00-architecture-index.md` | Main architecture index |
| Web Frontend | `specs/Web Frontend/00-index.md` | Frontend concepts |
| Quality & Testing | `specs/Quality & Testing/00-index.md` | Testing concepts |
| DevOps & Deployment | `specs/DevOps & Deployment/00-index.md` | DevOps concepts |
| React UI | `specs/React UI/00-index.md` | React concepts |
| Sources | `specs/Sources/00-index.md` | Source citations |

---

## Important Distinctions

- Atomic Design is UI composition; ACID atomicity is a transaction property
- Clean Architecture and clean code are distinct concepts
- Dependency Inversion and Dependency Injection differ
- Command-Query Separation and CQRS differ
- Event-Driven Architecture does not require Event Sourcing
- CQRS does not require separate databases
- DDD does not require microservices
- REST is more than HTTP CRUD endpoints
- Static TypeScript types do not validate runtime inputs
- DRY targets duplicated knowledge rather than every repeated-looking expression
- Singleton can introduce hidden global state
- Saga compensation is not equivalent to database rollback
- Outbox alone does not guarantee exactly-once delivery
- Database consistency and distributed consistency have different meanings
- ORM entities are not automatically domain entities
- Folder structure and suffixes alone do not prove compliance
- Coverage percentages alone do not prove correctness

---

## Evidence Model

Track these independently:

- **Declared**: present in a manifest or configuration
- **Implemented**: confirmed in referenced scripts or source
- **Wired**: connected to the intended command, hook, or workflow
- **Executed**: actually run during investigation
- **Verified**: specific expected behavior demonstrated

For each, distinguish:
- Confirmed
- Partial
- Not assessed
- Not found
- Blocked
- Not applicable

---

## Limitations

Creating a reference note does not prove that the project implements the concept.
External documentation cannot prove that a local integration is implemented or wired correctly.
A dependency declaration does not prove usage.
A command name does not prove behavior.
An installed tool does not prove enforcement.

---

**End of Copilot Knowledge Entry**
