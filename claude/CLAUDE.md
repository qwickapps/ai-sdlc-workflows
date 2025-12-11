# AI-Assisted Development Guidelines

## CRITICAL RULES - ALWAYS FOLLOW

### 1. NEVER Auto-Commit
```
STOP. Did the user explicitly say "approved" or "commit"?
If NO → Do NOT commit. Show diff and wait for approval.
If YES → Proceed with commit.
```

### 2. NEVER Add Legacy Support
```
NO backwards compatibility unless explicitly requested
NO defensive fallbacks "just in case"
NO workarounds - fix the actual issue
Breaking changes are OK - ask if unsure
```

### 3. ALWAYS Plan Before Acting
```
For ANY non-trivial task:
1. Analyze the request
2. Check existing solutions (REUSE FIRST)
3. Present options with tradeoffs
4. Wait for user approval
5. Then implement

Use /plan for quick planning or /feature for full SDLC
```

### 4. ALWAYS Think Critically
```
DO NOT just do what user asks without thinking
DO analyze requests like an architect/PM/UX designer
DO identify potential issues
DO discuss options
DO push back when appropriate
```

### 5. ALWAYS Update Deliverables
```
After implementation, update:
- README.md (if usage changed)
- CHANGELOG.md (new entry)
- Tests (unit, integration, e2e as appropriate)
```

---

## SDLC Workflows

Use slash commands to enforce proper workflows:

| Command | When to Use |
|---------|-------------|
| `/feature` | New feature development (full SDLC) |
| `/bug` | Bug investigation and fix |
| `/refactor` | Code restructuring |
| `/spike` | Technical research/investigation |
| `/release` | Version release management |
| `/code-review` | Code review before commit |
| `/commit` | Controlled commit with approval |
| `/plan` | Quick planning for smaller tasks |

### Workflow Agents

Each workflow phase uses the appropriate agent persona:

| Phase | Agent | Focus |
|-------|-------|-------|
| Requirements | product-manager | Gather needs, define scope |
| Design | architect | Technical design, REUSE FIRST |
| Test Strategy | quality-engineer | Test planning, edge cases |
| Implementation | coder | Clean code, no legacy support |
| Review | reviewer | Quality, security, patterns |
| Documentation | tech-writer | README, CHANGELOG, docs |
| Coordination | engineering-manager | Multi-team, releases |

---

## Folder Structure

```
.claude/
├── commands/           # SDLC workflow commands
├── templates/          # Document templates
├── agents@ -> ../../shared/agents         # Agent persona definitions (symlink)
├── validators@ -> ../../shared/validators # Validation scripts (symlink)
├── engineering@ -> ../../shared/engineering  # Working documents (symlink)
├── kb@ -> ../../shared/kb                 # Knowledge base (symlink)
└── settings.json       # Permissions

shared/ (Cross-tool resources)
├── agents/             # Agent definitions (.md for Claude, .yml for Windsurf)
├── validators/         # Bash validation scripts
│   ├── commit-validator.sh    # Validates commit message format
│   ├── branch-validator.sh    # Validates branch naming
│   └── workflow-validator.sh  # Validates workflow steps
├── engineering/        # Working documents (NOT committed)
│   ├── frd/            # Feature Request Documents
│   ├── design/         # Design Proposals
│   ├── test-plans/     # Test Plans
│   ├── reviews/        # Code Review Reports
│   ├── spikes/         # Investigation Reports
│   ├── bugs/           # Bug Analysis
│   ├── releases/       # Release Documents
│   ├── reports/        # Generated reports
│   │   ├── analysis/
│   │   ├── implementation/
│   │   └── testing/
│   └── presentations/  # Presentation materials
└── kb/                 # Knowledge Base
    ├── index.json      # Auto-maintained searchable index
    ├── template.md     # KB entry template
    ├── architecture/   # Architecture documentation
    ├── components/     # Component documentation
    └── decisions/      # Architecture Decision Records (ADRs)
        └── ADR-INDEX.md
```

**Shared Resources**: The `.claude/` folder uses symlinks to reference shared resources in `../shared/`. This allows multiple AI coding tools (Claude, Windsurf, etc.) to use the same agents, validators, knowledge base, and engineering artifacts.

**Engineering artifacts** are working documents that guide implementation. They are NOT committed - only the resulting code and deliverables are committed.

**Knowledge Base** (kb) replaces the old memories folder and uses a structured, searchable format with auto-indexing. Architecture Decision Records (ADRs) are stored in `kb/decisions/`.

---

## Quick Reference

### Before Starting Any Task
1. Is this trivial (< 3 steps)? → Just do it
2. Is this non-trivial? → Use `/plan` or appropriate workflow
3. Does it need full SDLC? → Use `/feature`

### Before Any Commit
1. Tests passing?
2. Docs updated?
3. User approved?

### When User Asks for Something
1. Understand the actual need
2. Check what exists (REUSE FIRST)
3. Consider if request makes sense
4. Discuss options if multiple approaches
5. Get approval before implementing

---

## Anti-Patterns to Avoid

- Jumping straight to code without planning
- Adding legacy support "just in case"
- Committing without explicit approval
- Not updating tests and documentation
- People-pleasing over critical thinking
