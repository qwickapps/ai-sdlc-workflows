# AI SDLC Workflows

**Make your AI coding assistant work like a senior engineer:**
Plan before coding. Ask before assuming. Review before committing.

---

## The Problem

AI coding assistants are powerful but undisciplined. Without guardrails, they:

- **Jump straight to code** without understanding requirements
- **Auto-commit** without review or approval
- **Add legacy support** "just in case" that nobody asked for
- **Over-engineer** simple tasks with unnecessary abstractions
- **Skip documentation** and tests
- **People-please** instead of thinking critically

The result? You spend more time fixing AI mistakes than you saved.

---

## The Solution

This repository provides **workflow prompts** that transform AI assistants into disciplined software engineers. Your AI will:

| Before | After |
|--------|-------|
| Jumps to code | Asks clarifying questions first |
| Assumes requirements | Presents options with tradeoffs |
| Auto-commits everything | Waits for explicit approval |
| Adds defensive fallbacks | Writes clean, minimal code |
| Skips tests | Follows test-driven workflow |
| Ignores docs | Updates README, CHANGELOG |

---

## How It Works

### Phase-Gated Development

Every non-trivial task follows an SDLC workflow with **approval gates**:

```
┌─────────────┐     ┌─────────┐     ┌───────────┐     ┌────────────────┐
│ Requirements│────▶│ Design  │────▶│ Test Plan │────▶│ Implementation │
│   (PM)      │     │(Architect)    │   (QE)    │     │    (Coder)     │
└─────────────┘     └─────────┘     └───────────┘     └────────────────┘
       │                 │                │                    │
       ▼                 ▼                ▼                    ▼
   [APPROVE]         [APPROVE]       [APPROVE]            [TESTS PASS]
                                                               │
                                                               ▼
                    ┌─────────┐     ┌───────┐     ┌────────────────┐
                    │  Docs   │◀────│Review │◀────│    Commit      │
                    │(Writer) │     │       │     │  [APPROVE]     │
                    └─────────┘     └───────┘     └────────────────┘
```

**The AI cannot proceed to the next phase without your approval.**

### Agent Personas

Different phases activate different "agent personas" with specialized focus:

| Agent | Phase | Focus |
|-------|-------|-------|
| Product Manager | Requirements | Understanding needs, asking questions |
| Architect | Design | Reusing patterns, minimal design |
| Quality Engineer | Test Strategy | Edge cases, failure modes |
| Coder | Implementation | Clean code, no over-engineering |
| Reviewer | Review | Security, quality, patterns |
| Tech Writer | Documentation | README, CHANGELOG updates |

### Critical Rules Enforced

1. **NEVER auto-commit** - Always waits for explicit "approved"
2. **NEVER add legacy support** - No backwards compatibility unless asked
3. **ALWAYS plan first** - Options and tradeoffs before code
4. **ALWAYS think critically** - Push back when appropriate
5. **ALWAYS update docs** - README, CHANGELOG, tests

---

## Supported Tools

| Tool | Status | Folder |
|------|--------|--------|
| [Claude Code](https://claude.ai/code) | Ready | `/claude` |
| [Windsurf Cascade](https://codeium.com/windsurf) | Ready | `/cascade` |
| Cursor | Coming | - |
| Aider | Coming | - |

---

## Quick Start

### Claude Code

1. **Copy the `.claude` folder** to your project root:
   ```bash
   cp -r claude/ your-project/.claude/
   ```

2. **Copy `CLAUDE.md`** to your project root:
   ```bash
   cp claude/CLAUDE.md your-project/CLAUDE.md
   ```

3. **Create engineering folder** (gitignored working docs):
   ```bash
   mkdir -p your-project/.claude/engineering/{frd,design,test-plans,reviews,spikes,bugs,releases}
   echo ".claude/engineering/" >> your-project/.gitignore
   ```

4. **Use workflows**:
   ```
   /feature Add user authentication
   /bug Login fails with special characters
   /plan Refactor the database module
   /commit
   ```

### Windsurf Cascade

1. **Copy `.windsurfrules`** to your project root:
   ```bash
   cp cascade/.windsurfrules your-project/.windsurfrules
   ```

2. **Use workflow triggers** in your prompts:
   ```
   feature: Add user authentication
   bug: Login fails with special characters
   plan: Refactor the database module
   ```

---

## Available Workflows

### `/feature` - Full SDLC
For new features requiring complete development lifecycle.

**Phases:** Requirements → Design → Test Plan → Implementation → Review → Docs → Commit

### `/bug` - Bug Fix
For investigating and fixing issues.

**Phases:** Investigation → Root Cause → Fix → Regression Test → Commit

### `/plan` - Quick Analysis
For smaller tasks that need planning but not full SDLC.

**Phases:** Understand → Options → Recommend → Approve → Implement

### `/refactor` - Code Restructuring
For improving code structure without changing behavior.

**Phases:** Analyze → Propose → Impact Assessment → Implement → Verify → Commit

### `/spike` - Technical Research
For investigating technical questions or unknowns.

**Output:** Investigation report with findings and recommendations

### `/commit` - Controlled Commit
For committing with proper review.

**Checks:** Tests pass → Docs updated → User approves → Commit

### `/release` - Version Management
For managing version releases.

**Phases:** Version bump → Changelog → Tag → Release notes

---

## Customization

### Adding New Commands

Create a markdown file in `commands/`:

```markdown
---
description: My custom workflow
argument-hint: [what to pass]
---

# My Workflow

Instructions for the AI...
```

### Modifying Agent Behavior

Edit files in `agents/` to customize how each persona behaves.

### Adding Templates

Add document templates to `templates/` for standardized outputs.

---

## Philosophy

### Why This Works

Traditional prompt engineering focuses on *what* the AI should do. These workflows focus on *how* the AI should work - as a disciplined team member who:

1. **Asks before assuming** - Requirements gathering prevents wasted work
2. **Plans before coding** - Design phase catches issues early
3. **Tests before shipping** - Quality built in, not bolted on
4. **Reviews before committing** - Human stays in control

### The "REUSE FIRST" Principle

Before creating anything new, the AI must check for existing:
- Patterns in the codebase
- Components that can be extended
- Utilities that already exist

This prevents code duplication and maintains consistency.

### No Legacy Support by Default

AI assistants love adding fallbacks and backwards compatibility "just in case." This creates technical debt. Our workflows explicitly forbid this unless the user requests it.

---

## Examples

See the `/examples` folder for:
- Monorepo setup guide
- Single project setup guide
- Sample workflow sessions

---

## Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Add your improvements
4. Submit a pull request

Especially welcome:
- Support for additional AI tools (Cursor, Aider, etc.)
- Improved workflow definitions
- Better templates
- Documentation improvements

---

## License

MIT License - See [LICENSE](LICENSE)

---

## Credits

Created by [QwickApps](https://github.com/qwickapps)

Inspired by the frustration of cleaning up after overeager AI assistants.
