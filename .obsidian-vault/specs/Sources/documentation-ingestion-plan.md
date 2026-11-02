# Documentation Ingestion Plan

> **Date:** 2026-11-02
> **Goal:** Absorb authoritative documentation from official sources to improve citation quality and content depth

---

## Current State

| Metric | Value |
|--------|-------|
| Source notes in vault | 39 |
| Source notes actually referenced | 14 |
| Unused source notes | 25 |
| Concept notes | ~450 |
| Avg sources per note | 1-2 |
| Source diversity | Low (most cite fowler-patterns-2002) |

---

## Priority 1: Core Language/Framework Documentation

These are the most critical sources — they power 80%+ of the vault's concepts.

### TypeScript (microsoft-typescript-handbook)
**Current:** Single source note covering "The Basics" and "Everyday Types"
**Gap:** Only 2 of 50+ handbook sections covered

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| The Basics | https://www.typescriptlang.org/docs/handbook/2/basic-types.html | ts-fundamentals |
| Everyday Types | https://www.typescriptlang.org/docs/handbook/2/everyday-types.html | ts-fundamentals, ts-best-practices |
| Type Inference and Deduction | https://www.typescriptlang.org/docs/handbook/type-inference.html | ts-advanced-types |
| Type Compatibility | https://www.typescriptlang.org/docs/handbook/type-compatibility.html | ts-advanced-types |
| Extensible Build Configuration | https://www.typescriptlang.org/docs/handbook/tsconfig-json.html | ts-tsconfig |
| Declaration Files | https://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html | ts-decorators |
| Decorators | https://www.typescriptlang.org/docs/handbook/2/decorators.html | ts-decorators |
| Conditional Types | https://www.typescriptlang.org/docs/handbook/2/conditional-types.html | ts-advanced-types |
| Mapped Types | https://www.typescriptlang.org/docs/handbook/2/mapped-types.html | ts-advanced-types |
| Template Literal Types | https://www.typescriptlang.org/docs/handbook/2/template-literal-types.html | ts-advanced-types |
| Discriminated Unions | https://www.typescriptlang.org/docs/handbook/2/narrowing.html | discriminated-unions, ts-narrowing |
| The `never` Type | https://www.typescriptlang.org/docs/handbook/2/functions.html | exhaustive-handling |
| Generics | https://www.typescriptlang.org/docs/handbook/2/generics.html | generics-patterns |
| Advanced Types | https://www.typescriptlang.org/docs/handbook/2/types-from-types.html | ts-advanced-types |
| Utility Types | https://www.typescriptlang.org/docs/handbook/utility-types.html | ts-advanced-types |
| Tracked Project References | https://www.typescriptlang.org/docs/handbook/project-references.html | ts-tsconfig |
| Declaration Emit | https://www.typescriptlang.org/docs/handbook/declaration-files/do-s-and-don-ts.html | ts-security-best-practices |
| Security | https://www.typescriptlang.org/docs/handbook/security.html | ts-security-best-practices |
| Strict Mode | https://www.typescriptlang.org/tsconfig#strict | typescript-strict-mode |

**Action:** Create 10+ granular source notes from TypeScript handbook sections

### React (react-docs-2026)
**Current:** Single source note, generic coverage
**Gap:** React 19 has 20+ major sections

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| React Compiler | https://react.dev/reference/react/compiler | react-performance-security |
| Concurrent React | https://react.dev/reference/react/concurrent | react-performance-security |
| render | https://react.dev/reference/react/render | react-patterns |
| createElement | https://react.dev/reference/react/createElement | react-patterns |
| Component | https://react.dev/reference/react/Component | react-patterns |
| Function Components | https://react.dev/reference/react/components | react-patterns |
| Props | https://react.dev/reference/react/components#function-components | react-patterns |
| State: State Variable | https://react.dev/reference/react/useState | react-patterns |
| State: setState | https://react.dev/reference/react/useState | react-patterns |
| State: Stateful Logic with Hooks | https://react.dev/reference/react/hooks | react-patterns |
| Effect: useEffect | https://react.dev/reference/react/useEffect | react-patterns |
| Effect: useLayoutEffect | https://react.dev/reference/react/useLayoutEffect | react-patterns |
| Effect: useInsertionEffect | https://react.dev/reference/react/useInsertionEffect | react-patterns |
| Refs: useRef | https://react.dev/reference/react/useRef | react-patterns |
| Refs: useImperativeHandle | https://react.dev/reference/react/useImperativeHandle | react-patterns |
| Context: useContext | https://react.dev/reference/react/useContext | react-patterns |
| Context: createContext | https://react.dev/reference/react/createContext | react-patterns |
| Memo: useMemo | https://react.dev/reference/react/useMemo | react-performance-security |
| Memo: useCallback | https://react.dev/reference/react/useCallback | react-performance-security |
| Memo: React.memo | https://react.dev/reference/react/memo | react-performance-security |
| Transition: useTransition | https://react.dev/reference/react/useTransition | react-performance-security |
| Deferred: useDeferredValue | https://react.dev/reference/react/useDeferredValue | react-performance-security |
| Suspense | https://react.dev/reference/react/Suspense | react-patterns |
| Error Boundaries | https://react.dev/reference/react/Component#catching-rendering-errors-with-error-boundaries | react-security |
| Security | https://react.dev/learn/security | react-security |
| Server Components | https://react.dev/reference/rsc | react-patterns |
| Server Actions | https://react.dev/reference/react/server-components | react-patterns |
| Hooks API | https://react.dev/reference/react | react-patterns |
| Performance | https://react.dev/learn/react-and-the-dom | react-performance-security |
| Rendering | https://react.dev/learn/render-and-commit | react-performance-security |
| Components and Props | https://react.dev/learn/components-and-props | react-patterns |
| State Management | https://react.dev/learn/state-a-components-memory | react-patterns |
| Managing State | https://react.dev/learn/managing-state | react-patterns |
| Escaping Constraints | https://react.dev/learn/escaping-constraints-with-refs | react-patterns |
| Refs and the DOM | https://react.dev/learn/referencing-values-with-refs | react-patterns |
| Form Data | https://react.dev/reference/react-dom/components/forms | react-patterns |
| HTML Forms | https://react.dev/reference/react-dom/components/input | react-patterns |
| Text Inputs | https://react.dev/learn/add-interactivity | react-patterns |
| Adding Interactivity | https://react.dev/learn/responding-to-events | react-patterns |
| Lifting State Up | https://react.dev/learn/sharing-state-between-components | react-patterns |
| Passing Deeply Nested Data | https://react.dev/learn/passing-props-to-a-component-from-a-parent | react-patterns |
| Composition | https://react.dev/learn/passing-props-to-components | react-patterns |
| JSX in Depth | https://react.dev/learn/jsx-in-depth | react-patterns |
| React as a UI Library | https://react.dev/learn/react-as-a-ui-library | react-patterns |
| Data Flow | https://react.dev/learn/data-flow | react-patterns |
| One Source of Truth | https://react.dev/learn/you-dont-need-an-extra-state-management-library | react-patterns |

**Action:** Create 15+ granular source notes from React docs

### Tailwind CSS (tailwind-docs-2024)
**Current:** Single source note
**Gap:** Tailwind v4 has extensive documentation

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| Installation | https://tailwindcss.com/docs/installation | tailwind-css-patterns |
| Core Concepts | https://tailwindcss.com/docs/installation/running-without-dependencies | tailwind-css-patterns |
| Configuration | https://tailwindcss.com/docs/configuration | tailwind-css-patterns |
| Themes | https://tailwindcss.com/docs/theme | tailwind-css-patterns |
| Responsive Design | https://tailwindcss.com/docs/responsive-design | tailwind-css-patterns |
| Dark Mode | https://tailwindcss.com/docs/dark-mode | tailwind-css-patterns |
| Pseudo-Class Variants | https://tailwindcss.com/docs/hover-focus-and-other-states | tailwind-css-patterns |
| Pseudo-Element Variants | https://tailwindcss.com/docs/using-before-and-after | tailwind-css-patterns |
| Content Configuration | https://tailwindcss.com/docs/content-configuration | tailwind-css-patterns |
| Functions | https://tailwindcss.com/docs/functions | tailwind-css-patterns |
| Plugins | https://tailwindcss.com/docs/adding-custom-styles | tailwind-css-patterns |
| CSS Directives | https://tailwindcss.com/docs/functions-and-directives | tailwind-css-patterns |
| Using Tailwind | https://tailwindcss.com/docs/adding-custom-styles | tailwind-css-patterns |
| Form Plugin | https://github.com/tailwindlabs/tailwindcss-forms | tailwind-css-patterns |
| Typography Plugin | https://github.com/tailwindlabs/tailwindcss-typography | tailwind-css-patterns |

**Action:** Create 8+ granular source notes from Tailwind docs

---

## Priority 2: Build Tool & Package Manager Documentation

### Vite (vite-docs-2024)
**Current:** Single source note
**Gap:** Vite has 30+ guide sections

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| Guide: Overview | https://vite.dev/guide/ | vite-configuration |
| Guide: Using Plugins | https://vite.dev/guide/using-plugins | vite-configuration |
| Guide: Backend Proxy | https://vite.dev/guide/backend-proxy-server | vite-configuration |
| Guide: Building for Production | https://vite.dev/guide/build | vite-optimization |
| Guide: Static Asset Handling | https://vite.dev/guide/assets | vite-configuration |
| Guide: Environment Variables | https://vite.dev/guide/env-and-mode | vite-configuration |
| Guide: SSR | https://vite.dev/guide/ssr | vite-configuration |
| Guide: Deploying a Static Site | https://vite.dev/guide/static-deploy | vite-configuration |
| Guide: ESM Config | https://vite.dev/guide/migration.html#configuration-file | vite-configuration |
| Guide: CLI | https://vite.dev/guide/cli | vite-configuration |
| Config: Build Options | https://vite.dev/config/ | vite-configuration |
| Config: Shared Options | https://vite.dev/config/ | vite-configuration |
| Config: Server Options | https://vite.dev/config/server-options.html | vite-configuration |
| Config: Preview Options | https://vite.dev/config/preview-options.html | vite-configuration |
| Features: CSS | https://vite.dev/guide/features#css | vite-configuration |
| Features: CSS Pre-processors | https://vite.dev/guide/features#css-pre-processors | vite-configuration |
| Features: PostCSS | https://vite.dev/guide/features#postcss | vite-configuration |
| Features: WebAssembly | https://vite.dev/guide/features#wasm | vite-configuration |
| Features: Rust Plugins | https://vite.dev/guide/features.html#using-plugins-in-rust | vite-configuration |
| Features: Fast Refresh | https://vite.dev/guide/features.html#fast-refresh | vite-configuration |
| Features: JSON | https://vite.dev/guide/features.html#json | vite-configuration |
| Features: File Watching | https://vite.dev/guide/features.html#file-watching | vite-configuration |
| Features: Legacy Browser Support | https://vite.dev/guide/migration.html#legacy-browser-support | vite-configuration |
| Features: Library Mode | https://vite.dev/guide/library-mode | vite-configuration |
| Features: Optimizing Deps | https://vite.dev/guide/optimizations | vite-optimization |
| Features: Worker Bundling | https://vite.dev/guide/features.html#web-workers | vite-configuration |
| Features: SSE | https://vite.dev/guide/features.html#server-sent-events | vite-configuration |
| Features: Vue SSR | https://vite.dev/guide/ssr.html#vue-ssr | vite-configuration |
| API: JS | https://vite.dev/API/js | vite-configuration |
| API: Plugin Dev | https://vite.dev/API/plugin | vite-configuration |
| API: Util | https://vite.dev/API/util | vite-configuration |

**Action:** Create 10+ granular source notes from Vite docs

### pnpm (pnpm-docs-2024)
**Current:** Single source note
**Gap:** pnpm has extensive documentation

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| Command Line Interface | https://pnpm.io/cli | pnpm-workspace |
| Configuration | https://pnpm.io/config | pnpm-workspace |
| Resolutions | https://pnpm.io/package.json#resolutions | pnpm-workspace |
| Workspaces | https://pnpm.io/workspaces | pnpm-workspace |
| Selective Version Resolutions | https://pnpm.io/package.json#pnpmselectivesversionresolutions | pnpm-workspace |
| Why pnpm? | https://pnpm.io/why-pnpm | pnpm-workspace |
| How pnpm Works | https://pnpm.io/how-pnpm-works | pnpm-workspace |
| Migration from npm | https://pnpm.io/migration-from-npm | pnpm-workspace |
| Migration from Yarn | https://pnpm.io/migration-from-yarn | pnpm-workspace |
| Autocleanup | https://pnpm.io/auto-cleanup | pnpm-workspace |
| Content Addressability | https://pnpm.io/stores | pnpm-workspace |
| Sync | https://pnpm.io/cli#sync | pnpm-workspace |
| Import | https://pnpm.io/cli#import | pnpm-workspace |
| Dedupe | https://pnpm.io/cli#dedupe | pnpm-workspace |
| Why Not Symlink? | https://pnpm.io/why-pnpm | pnpm-workspace |

**Action:** Create 6+ granular source notes from pnpm docs

---

## Priority 3: Testing Documentation

### Vitest (vitest-docs-2024)
**Current:** Single source note
**Gap:** Vitest has 20+ guide sections

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| Guide: Getting Started | https://vitest.dev/guide/ | vitest-patterns |
| Guide: Configuration | https://vitest.dev/config/ | vitest-patterns |
| Guide: Using Test Runners | https://vitest.dev/guide/using/test-runners.html | vitest-patterns |
| Guide: Mocking | https://vitest.dev/guide/mocking | vitest-patterns |
| Guide: Mocking Timers | https://vitest.dev/guide/mocking.html#timers | vitest-patterns |
| Guide: Coverage | https://vitest.dev/guide/coverage | vitest-patterns |
| Guide: CLI | https://vitest.dev/guide/cli | vitest-patterns |
| Guide: CLI Options | https://vitest.dev/config/ | vitest-patterns |
| Guide: Incremental | https://vitest.dev/guide/incremental | vitest-patterns |
| Guide: Web Workers | https://vitest.dev/guide/workers | vitest-patterns |
| Guide: ESM | https://vitest.dev/guide/esm | vitest-patterns |
| Guide: Fast Mode | https://vitest.dev/guide/fast-mode | vitest-patterns |
| Guide: TypeScript | https://vitest.dev/guide/typescript | vitest-patterns |
| Guide: React | https://vitest.dev/guide/visual-ui-testing | vitest-patterns |
| Guide: Visual UI Testing | https://vitest.dev/guide/visual-ui-testing | vitest-patterns |
| API: Test Function | https://vitest.dev/api/#using-test | vitest-patterns |
| API: Describe Function | https://vitest.dev/api/#using-describe | vitest-patterns |
| API: Expect | https://vitest.dev/api/#expect | vitest-patterns |
| API: Vi | https://vitest.dev/api/vi.html | vitest-patterns |
| API: Mock | https://vitest.dev/api/vi.html#mock | vitest-patterns |

**Action:** Create 8+ granular source notes from Vitest docs

### Playwright (playwright-docs-2024)
**Current:** Single source note
**Gap:** Playwright has 40+ guide sections

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| Intro | https://playwright.dev/docs/intro | playwright-patterns |
| Installation | https://playwright.dev/docs/installation | playwright-patterns |
| API Test | https://playwright.dev/docs/api-testing | playwright-patterns |
| Auto-Waiting | https://playwright.dev/docs/actionability | playwright-patterns |
| Best Practices | https://playwright.dev/docs/best-practices | playwright-patterns |
| Browser Contexts | https://playwright.dev/docs/browser-contexts | playwright-patterns |
| Capturing Troubleshooting Data | https://playwright.dev/docs/debug | playwright-patterns |
| Codegen | https://playwright.dev/docs/codegen | playwright-patterns |
| Continuous Integration | https://playwright.dev/docs/ci | playwright-patterns |
| Debugging Tests | https://playwright.dev/docs/debug | playwright-patterns |
| Debugging Browser Tests | https://playwright.dev/docs/debugger | playwright-patterns |
| Dialogs | https://playwright.dev/docs/dialogs | playwright-patterns |
| DOM Events | https://playwright.dev/docs/events | playwright-patterns |
| Emulation | https://playwright.dev/docs/emulation | playwright-patterns |
| Evaluating | https://playwright.dev/docs/evaluation | playwright-patterns |
| Extending Playwright API | https://playwright.dev/docs/api/class-fixtures | playwright-patterns |
| Firefox | https://playwright.dev/docs/browser-support | playwright-patterns |
| Frames | https://playwright.dev/docs/frames | playwright-patterns |
| Generating Tests | https://playwright.dev/docs/codegen | playwright-patterns |
| Global Test Setup | https://playwright.dev/docs/test-global-setup-teardown | playwright-patterns |
| GraphQL | https://playwright.dev/docs/graphql | playwright-patterns |
| Handling Tests | https://playwright.dev/docs/test-runners | playwright-patterns |
| HTML Reporter | https://playwright.dev/docs/test-reporters | playwright-patterns |
| Intellij Plugin | https://playwright.dev/docs/intellij | playwright-patterns |
| Launching Browser | https://playwright.dev/docs/api/class-browser | playwright-patterns |
| Locators | https://playwright.dev/docs/locators | playwright-patterns |
| Mocking | https://playwright.dev/docs/mock | playwright-patterns |
| Network | https://playwright.dev/docs/network | playwright-patterns |
| Other Browser Contexts | https://playwright.dev/docs/browser-contexts | playwright-patterns |
| Parallel Execution | https://playwright.dev/docs/test-parallel | playwright-patterns |
| Policy | https://playwright.dev/docs/policy | playwright-patterns |
| Progress Bar | https://playwright.dev/docs/progress-bar | playwright-patterns |
| Remotely | https://playwright.dev/docs/remote | playwright-patterns |
| Retries | https://playwright.dev/docs/test-retries | playwright-patterns |
| Running Tests | https://playwright.dev/docs/runnings-tests | playwright-patterns |
| Screenshots | https://playwright.dev/docs/screenshots | playwright-patterns |
| Selecting Text | https://playwright.dev/docs/selecting-text | playwright-patterns |
| Signals | https://playwright.dev/docs/signals | playwright-patterns |
| Tracing | https://playwright.dev/docs/trace | playwright-patterns |
| Timeouts | https://playwright.dev/docs/timeout | playwright-patterns |
| Testing Types | https://playwright.dev/docs/testing-types | playwright-patterns |
| Test Fixtures | https://playwright.dev/docs/test-fixtures | playwright-patterns |
| Test Annotations | https://playwright.dev/docs/test-annotations | playwright-patterns |
| Test Config | https://playwright.dev/docs/test-configuration | playwright-patterns |
| Test Fast | https://playwright.dev/docs/test-timeouts | playwright-patterns |
| Test UI Mode | https://playwright.dev/docs/test-ui-mode | playwright-patterns |
| Test Parallel | https://playwright.dev/docs/test-parallel | playwright-patterns |
| Test Report | https://playwright.dev/docs/test-reporters | playwright-patterns |
| Test Timeout | https://playwright.dev/docs/test-timeouts | playwright-patterns |
| Trace Viewer | https://playwright.dev/docs/trace-viewer | playwright-patterns |
| TypeScript | https://playwright.dev/docs/typescript | playwright-patterns |
| Video | https://playwright.dev/docs/video | playwright-patterns |
| Webview2 | https://playwright.dev/docs/webview2 | playwright-patterns |
| Workers | https://playwright.dev/docs/workers | playwright-patterns |

**Action:** Create 15+ granular source notes from Playwright docs

---

## Priority 4: Security Documentation

### OWASP (owasp-top-ten-2021)
**Current:** Single source note
**Gap:** OWASP has extensive documentation

**Sections to ingest:**
| Section | URL | Concepts Covered |
|---------|-----|------------------|
| OWASP Top 10 2021 | https://owasp.org/www-project-top-ten/ | security-principles |
| A01: Broken Access Control | https://owasp.org/Top10/A01_Broken_Access_Control/ | authorization |
| A02: Cryptographic Failures | https://owasp.org/Top10/A02_Cryptographic_Failures/ | data-encryption, hashing-patterns |
| A03: Injection | https://owasp.org/Top10/A03_Injection/ | input-validation, parameterized-queries |
| A04: Insecure Design | https://owasp.org/Top10/A04_Insecure_Design/ | secure-by-design |
| A05: Security Misconfiguration | https://owasp.org/Top10/A05_Security_Misconfiguration/ | secure-defaults |
| A06: Vulnerable Components | https://owasp.org/Top10/A06_Vulnerable_Components/ | dependency-management |
| A07: Auth Failures | https://owasp.org/Top10/A07_2021_Broken_Authentication/ | authentication |
| A08: Software Data Integrity | https://owasp.org/Top10/A08_2021_Software_and_Data_Integrity_Failures/ | reproducible-builds |
| A09: Security Logging | https://owasp.org/Top10/A09_2021_Security_Logging_and_Monitoring_Failures/ | logging, monitoring, alerting |
| A10: SSRF | https://owasp.org/Top10/A10_2021_Server-Side_Request_Forgery_%28SSRF%29/ | api-gateway |
| OWASP Cheat Sheet Series | https://cheatsheetseries.owasp.org/ | security-principles |
| XSS Prevention | https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html | content-security-policy |
| CSRF Prevention | https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html | cors-patterns |
| SQL Injection Prevention | https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html | parameterized-queries |
| Password Storage | https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html | hashing-patterns |
| Authentication | https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html | authentication |
| Session Management | https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html | authentication |
| CORS | https://cheatsheetseries.owasp.org/cheatsheets/Cross-Origin_Resource_Sharing_Cheat_Sheet.html | cors-patterns |
| CSP | https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html | content-security-policy |

**Action:** Create 10+ granular source notes from OWASP docs

---

## Priority 5: Additional Framework Documentation

### Zod (zod-docs)
**Create:** Granular source notes for validation patterns
- https://zod.dev/ — Core API
- https://zod.dev/advanced — Advanced patterns
- https://zod.dev/concepts — Concepts

### Radix UI (radix-ui-docs-2024)
**Create:** Granular source notes for headless components
- https://www.radix-ui.com/primitives/docs/overview/introduction — Overview
- https://www.radix-ui.com/primitives/docs/utilities/visually-hidden — Accessibility

### shadcn/ui (shadcn-ui-docs-2024)
**Create:** Granular source notes for component patterns
- https://ui.shadcn.com/docs — Documentation
- https://ui.shadcn.com/docs/components/accordion — Component examples

---

## Implementation Strategy

### Phase 1: Create Source Note Templates
1. Create a consistent source note template
2. Define required fields for each source_type
3. Create 50+ source notes from Priority 1 sources

### Phase 2: Update Concept Notes
1. Update all TypeScript notes to cite specific TypeScript handbook sections
2. Update all React notes to cite specific React docs sections
3. Update all testing notes to cite specific Vitest/Playwright sections

### Phase 3: Cross-Reference Enhancement
1. Add related concept links between source notes
2. Create a "source hierarchy" showing which sources support which concepts
3. Identify concepts that need additional source coverage

### Phase 4: Validation
1. Run citation validation script
2. Ensure every concept note has 2-3 diverse source citations
3. Verify all source notes have verified claims

---

## Expected Outcomes

| Metric | Current | Target |
|--------|---------|--------|
| Source notes | 39 | 100+ |
| Avg sources per note | 1-2 | 3-5 |
| Source diversity | Low | High |
| Broken citations | 0 | 0 |
| Documentation coverage | ~10% | ~60% |
