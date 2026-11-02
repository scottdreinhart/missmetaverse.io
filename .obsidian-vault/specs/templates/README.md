# Templates

> **Purpose:** Reusable templates for documentation, code review, and architectural decisions.
> **When to Use:** Create a new ADR, code review, PR, or spec.

---

## Available Templates

### [Architecture Decision Record (ADR) Template](adr-template.md)
Record architectural decisions with full context, options considered, and consequences.

**When to use:** Any time a significant architectural choice is made.

**Copilot Instructions:** When Copilot suggests an architectural change, create an ADR before implementing. When reviewing code, check if existing ADRs apply.

### [Code Review Checklist](code-review-checklist.md)
Comprehensive checklist for systematic code reviews.

**When to use:** Before approving any pull request.

**Copilot Instructions:** When reviewing code, run through this checklist systematically. Flag any failed items.

### [Pull Request Template](pr-template.md)
Structured template for pull requests with context, changes, testing, and review guidance.

**When to use:** Create a PR, update PR description, add review notes.

**Copilot Instructions:** When creating a PR, help the user fill out this template. When reviewing a PR, check if all sections are complete.

### [Commit Message Template](commit-message-template.md)
Template for Conventional Commits with scope, type, and body structure.

**When to use:** Every git commit.

**Copilot Instructions:** When suggesting code changes, also suggest the commit message. Validate commit messages follow the format.

---

## How Copilot Should Use Templates

### When Creating Documentation
1. **Detect need**: When a decision, change, or review is happening
2. **Select template**: Choose the most appropriate template
3. **Fill context**: Ask clarifying questions if needed
4. **Generate content**: Fill in all sections with specific details
5. **Save file**: Create the file in the appropriate location

### When Reviewing Documentation
1. **Check completeness**: Verify all required sections are filled
2. **Validate consistency**: Check against existing ADRs and patterns
3. **Suggest improvements**: Flag missing information or inconsistencies

### When Creating New Templates
1. **Assess need**: Is there a recurring pattern that needs a template?
2. **Design structure**: Include all necessary sections
3. **Add Copilot Instructions**: Embed instructions for AI consumption
4. **Test**: Verify the template works in practice

---

*Last Updated: 2026-11-02*
