---
slug: TypeScript/typescript-configuration
sources:
  - https://www.typescriptlang.org/tsconfig
date: 2026-11-02
tags:
  - typescript-javascript-type-system

  - maturity-experimental

  - typescript
  - tsconfig
  - configuration
  - compiler-options
# TypeScript tsconfig.json Reference


## Top-Level Fields

## concept_id
t09-ts-tsconfig

## title
TypeScript tsconfig.json Reference

## aliases
- T09-ts-tsconfig

## category
type-system

## concept_type
coding-standards

## research_status
verified

## project_adoption
required
| Field | Description |
|-------|-------------|
| `files` | Explicit list of files to include |
| `include` | Glob patterns for files to include |
| `exclude` | Glob patterns to exclude from `include` |
| `extends` | Base configuration(s) to inherit from |
| `references` | Project references for multi-project builds |

## Recommended tsconfig for React + Vite + TypeScript