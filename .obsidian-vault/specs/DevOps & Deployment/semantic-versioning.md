# Semantic Versioning

> **Purpose:** Manage version numbers with Semantic Versioning.
> **Last Updated:** 2026-11-03

---

## concept_id
`semantic-versioning`

## title
Semantic Versioning

## aliases
- SemVer
- Semantic Versioning
- Semantic Versioning Specification
- Version Numbering

## category
devops-deployment

## concept_type
versioning-convention

## research_status
verified

## project_adoption
declared

## applicability
- Software projects
- Version number management
- API versioning
- Dependency management

## tags
- type/convention
- domain/versioning
- status/verified
- priority/high

## source_ids
- semver-specification
- martinfowler-patterns

## related_concept_ids
- conventional-commits
- api-versioning
- dependency-management
- release-management

---

## Definition

Semantic Versioning is a versioning specification for software that uses a MAJOR.MINOR.PATCH format to communicate changes to consumers.

## Problem Addressed

Without Semantic Versioning:
- Version numbers are inconsistent
- Changes are unclear
- Dependencies are difficult
- Breaking changes are hidden

## Scope of Boundaries

Semantic Versioning applies to:
- Version number management
- API versioning
- Dependency management
- Release management

Semantic Versioning does not apply to:
- Commit messages
- Branch naming
- Code review
- Testing

## When to Apply

- Managing software versions
- Versioning APIs
- Managing dependencies
- Release management

## Tradeoffs and When to Avoid

- **Complexity**: Semantic Versioning can be complex
- **Not for simple projects**: Simple projects don't need Semantic Versioning
- **Not for internal tools**: Internal tools don't need Semantic Versioning
- **Not for CI/CD**: Semantic Versioning doesn't affect CI/CD

## Implementation Guidance

1. **Install versioning**: Install versioning tools
2. **Configure versioning**: Configure versioning rules
3. **Version releases**: Version releases correctly
4. **Update dependencies**: Update dependencies correctly
5. **Generate changelog**: Generate changelog automatically

## Verification

- [ ] Versioning is installed
- [ ] Rules are configured
- [ ] Releases are versioned
- [ ] Dependencies are updated
- [ ] Changelog is generated

## Common Misuses

- **Not installing**: Not installing versioning tools
- **Not configuring**: Not configuring rules
- **Not versioning releases**: Not versioning releases correctly
- **Not updating dependencies**: Not updating dependencies correctly

## Related Concepts

- [[Commit Management/conventional-commits]] — Conventional Commits
- [[APIs Distributed Systems/api-versioning]] — API Versioning
- [[DevOps & Deployment/dependency-management]] — Dependency Management
- [[DevOps & Deployment/release-management]] — Release Management

## Project Observations

The project uses Semantic Versioning through:
- Version number management
- API versioning
- Dependency management
- Release management

## Sources

- [[Sources/semver-specification|Semantic Versioning Specification]]
- [[Sources/martin-fowler-patterns|Martin Fowler — Patterns of Enterprise Application Architecture]]

---

**End of Semantic Versioning Note**
