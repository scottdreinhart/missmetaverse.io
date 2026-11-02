# Project

## Tech Stack 

| Layer | Tool |
|---|---|
| Note Vault | Obsidian (local Marddown files) |
| Editor | Visual Studio Code |
| AI Assistant | Github Copilot (Qwen 3.6 35B A3B NVFP4) |
| React+Vite+TypeScript Web App | React 19 |
| Deployment | Runs locally; |

## Current State

> Update this section every time you return from a break.

**Last Updated:** 2026-11-02

### Working
- Vault folder structure is in place (inbox, daily, specs, decisions, bugs, retro)
- AGENTS.md started - project description and tech stack written

### Broken / Blocked 
- Nothing broken yet; project is in initial setup

### Focus Right Now
- Finishing AGENTS.md so that the AI has full context before any work begins

## Key Decisions Made

These are settled. Do not reopen them without good reason.

- **Language:** TypeScript only - No JavaScript file
- **Framework:** React 19
- **Styling:** Tailwind CSS
- **Package Manager:** pnpm
- **Note Vault:** Obsidian with plain Markdown - no proprietary plugins that break portability
- **AI Tooling:** Github Copilot (Qwen) inside Visual Studio Code IDE - not stand alone chat tool

## File Map

```
project/
├── .obsidian-vault/          # Obsidian knowledge base (this folder)
│   ├── CLAUDE.md             # ← you are here; AI context file
│   ├── 00-inbox.md           # Unprocessed notes and quick captures
│   ├── daily/                # Daily notes — one file per session
│   ├── specs/                # Feature specs before coding starts
│   ├── decisions/            # Architectural decisions (ADRs)
│   ├── bugs/                 # Bug reports and investigation notes
│   └── retro/                # Retrospectives and lessons learned
└── app/                      # Next.js 16 web app (to be scaffolded)
    ├── app/                  # App Router pages and layouts
    ├── components/           # Shared UI components
    ├── lib/                  # Utilities and helpers
    └── public/               # Static assets
```

## Do Not

**Stop. Read the linked decision record before suggesting any change in these areas.**

- **Do not switch the package manager.** pnpm was chosen deliberately. Read `decisions/` before touching `package.json` scripts or lockfiles.
- **Do not convert to the Pages Router.** App Router is the foundation of the course structure. This is not negotiable.
- **Do not add a CSS-in-JS library.** Tailwind v4 is the only styling layer. No `styled-components`, no `emotion`, no `css modules` alongside Tailwind.
- **Do not add plain `.js` or `.jsx` files.** TypeScript only `.ts` or `.tsx`. If a library ships without types, add a `d.ts` shim — do not downgrade the file.
- **Do not install Obsidian plugins that store data in a proprietary format.** Notes must remain portable plain Markdown.
- **Do not refactor a file just because it looks like it could be cleaner.** Only touch code that is directly related to the current task.