---
slug: infrastructure-as-code
---

# Infrastructure as Code

> **Purpose:** Manage infrastructure with IaC.
> **Last Updated:** 2026-11-03

## concept_id
`infrastructure-as-code`

## title
Infrastructure as Code

## aliases
- IaC
- Infrastructure as Code
- Terraform
- CloudFormation

## category
devops-deployment

## concept_type
devops-concept

## research_status
verified

## project_adoption
declared

## applicability
- Cloud infrastructure
- Environment consistency
- Version control
- Automation

## tags
- type/concept
- domain/devops
- status/verified
- priority/high

## source_ids
- iac-best-practices
- martinfowler-patterns

## related_concept_ids
- infrastructure-as-code
- terraform
- cloudformation
- ansible

## Definition

Infrastructure as Code is the practice of managing and provisioning infrastructure through code rather than manual configuration, enabling version control and automation.

## Problem Addressed

Without IaC:
- Infrastructure is manual
- Environments are inconsistent
- Changes are undocumented
- Rollback is difficult

## Scope of Boundaries

IaC applies to:
- Cloud infrastructure
- Environment consistency
- Version control
- Automation

IaC does not apply to:
- Application code
- Testing
- Deployment
- CI/CD

## When to Apply

- Managing cloud infrastructure
- Needing environment consistency
- Wanting version control
- Automating provisioning

## Tradeoffs and When to Avoid

- **Learning curve**: IaC has learning curve
- **Not for simple apps**: Simple apps don't need IaC
- **Not for manual**: Manual infrastructure doesn't need IaC
- **Not for on-prem**: On-prem may not support IaC

## Implementation Guidance

1. **Choose tool**: Choose IaC tool (Terraform, CloudFormation)
2. **Define infrastructure**: Define infrastructure code
3. **Version control**: Store in version control
4. **Automate**: Automate provisioning
5. **Test**: Test infrastructure changes

## Verification

- [ ] Tool chosen
- [ ] Infrastructure defined
- [ ] Code versioned
- [ ] Provisioning automated
- [ ] Changes tested

## Common Misuses

- **Not versioning**: Not storing code in version control
- **Not testing**: Not testing infrastructure changes
- **Not automating**: Not automating provisioning
- **Manual changes**: Making manual changes

## Related Concepts

- [[DevOps & Deployment/infrastructure-as-code]] â€” Infrastructure as Code
- [[DevOps & Deployment/infrastructure-as-code]] â€” Terraform
- [[DevOps & Deployment/infrastructure-as-code]] â€” CloudFormation
- [[DevOps & Deployment/infrastructure-as-code]] â€” Ansible

## Project Observations

The project uses Infrastructure as Code through:
- Cloud infrastructure definition
- Version-controlled infrastructure code
- Automated provisioning
- Infrastructure testing

## Sources

- [[Sources/iac-best-practices|Infrastructure as Code Best Practices]]
- [[Sources/martin-fowler-patterns|Martin Fowler â€” Patterns of Enterprise Application Architecture]]

**End of Infrastructure as Code Note**
