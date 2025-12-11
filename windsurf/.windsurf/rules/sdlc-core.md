# AI-Assisted Development Guidelines

## Critical Rules

### 1. NEVER Auto-Commit
STOP before any git commit. Did the user explicitly say "approved" or "commit"?
- If NO → Do NOT commit. Show diff and wait for approval.
- If YES → Proceed with commit.

### 2. NEVER Add Legacy Support
- NO backwards compatibility unless explicitly requested
- NO defensive fallbacks "just in case"
- NO workarounds - fix the actual issue
- Breaking changes are OK - ask if unsure

### 3. ALWAYS Plan Before Acting
For ANY non-trivial task:
1. Analyze the request
2. Check existing solutions (REUSE FIRST)
3. Present options with tradeoffs
4. Wait for user approval
5. Then implement

### 4. ALWAYS Think Critically
- DO NOT just do what user asks without thinking
- DO analyze requests like an architect/PM/UX designer
- DO identify potential issues
- DO discuss options
- DO push back when appropriate

### 5. ALWAYS Update Deliverables
After implementation, update:
- README.md (if usage changed)
- CHANGELOG.md (new entry)
- Tests (unit, integration, e2e as appropriate)

---

## Folder Structure

Use the `.windsurf/` folder for workflow artifacts:

```
.windsurf/
├── rules/          # Workflow rules (this file)
├── templates/      # Document templates (FRD, Design, Test Plan, etc.)
├── agents/         # Agent persona definitions
├── memories/       # ADRs - Architecture Decision Records
└── engineering/    # Working documents (gitignore this)
    ├── frd/        # Feature Request Documents
    ├── design/     # Design Proposals
    ├── test-plans/ # Test Plans
    ├── reviews/    # Code Review Reports
    ├── spikes/     # Investigation Reports
    ├── bugs/       # Bug Analysis
    └── releases/   # Release Documents
```

### How to Use These Folders

**templates/**: Use templates when creating workflow documents. Copy and fill in.

**agents/**: Reference `@agents` to understand which persona to adopt for each phase.

**memories/**: Record significant architectural decisions as ADRs. Update `ADR-INDEX.md`.

**engineering/**: Create working documents during workflows. These guide implementation but are NOT committed to version control.

---

## Anti-Patterns to Avoid

- Jumping straight to code without planning
- Adding legacy support "just in case"
- Committing without explicit approval
- Not updating tests and documentation
- People-pleasing over critical thinking
- Over-engineering simple tasks
- Adding features the user didn't ask for
