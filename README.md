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

| Tool | Status | Folder | Documentation |
|------|--------|--------|---------------|
| [Claude Code](https://claude.ai/code) | Ready | `/claude` | [Setup Guide](examples/claude-setup.md) |
| [Windsurf](https://codeium.com/windsurf) | Ready | `/windsurf` | [Setup Guide](examples/windsurf-setup.md) |
| [Cursor](https://cursor.com) | Ready | `/cursor` | [Setup Guide](examples/cursor-setup.md) |
| [Aider](https://aider.chat) | Ready | `/aider` | [Setup Guide](examples/aider-setup.md) |

---

## Quick Start

### Claude Code

```bash
# Copy .claude folder to your project
cp -r claude/ your-project/.claude/

# Copy CLAUDE.md to project root
cp claude/CLAUDE.md your-project/CLAUDE.md

# Create engineering folder (gitignore this)
mkdir -p your-project/.claude/engineering/{frd,design,test-plans,reviews}
echo ".claude/engineering/" >> your-project/.gitignore
```

**Usage:** `/feature`, `/bug`, `/plan`, `/refactor`, `/commit`

### Windsurf

```bash
# Copy .windsurf folder to your project
cp -r windsurf/.windsurf/ your-project/.windsurf/
```

**Usage:** `@feature-workflow`, `@bug-workflow`, `@plan-workflow`, or prefix with `feature:`, `bug:`, `plan:`

### Cursor

```bash
# Copy .cursor folder to your project
cp -r cursor/.cursor/ your-project/.cursor/
```

**Usage:** `@feature-workflow`, `@bug-workflow`, `@plan-workflow`, `@refactor-workflow`

### Aider

```bash
# Copy conventions file and config to your project
cp aider/CONVENTIONS.md your-project/CONVENTIONS.md
cp aider/.aider.conf.yml your-project/.aider.conf.yml
```

**Usage:** Conventions are automatically loaded. Use workflow keywords like `feature:`, `bug:`, `plan:` in prompts.

---

## Available Workflows

### Feature - Full SDLC
For new features requiring complete development lifecycle.

**Phases:** Requirements → Design → Test Plan → Implementation → Review → Docs → Commit

### Bug Fix
For investigating and fixing issues.

**Phases:** Investigation → Root Cause → Fix → Regression Test → Commit

### Plan - Quick Analysis
For smaller tasks that need planning but not full SDLC.

**Phases:** Understand → Options → Recommend → Approve → Implement

### Refactor - Code Restructuring
For improving code structure without changing behavior.

**Phases:** Analyze → Propose → Impact Assessment → Implement → Verify → Commit

---

## Tool-Specific Details

### Claude Code
- Uses slash commands: `/feature`, `/bug`, `/plan`, `/refactor`, `/commit`, `/release`, `/spike`
- Agents defined in `.claude/agents/`
- Document templates in `.claude/templates/`
- Working docs in `.claude/engineering/` (gitignored)

### Windsurf
- Uses `.windsurf/rules/` directory (recommended)
- Rules activated via `@mention` or automatically based on context
- Character limit: 6000 per rule, 12000 total
- [Official docs](https://docs.windsurf.com/windsurf/cascade/memories)

### Cursor
- Uses `.cursor/rules/` directory with YAML frontmatter
- `alwaysApply: true` for core rules, `false` for workflow rules
- Reference rules with `@rule-name` in chat
- [Official docs](https://cursor.com/docs/context/rules)

### Aider
- Uses `CONVENTIONS.md` loaded via `--read` flag
- Configure in `.aider.conf.yml` for automatic loading
- Mark as read-only for prompt caching benefits
- [Official docs](https://aider.chat/docs/usage/conventions.html)

---

## Customization

### Adding New Workflows

Each tool has its own format:

**Claude Code:** Create markdown file in `.claude/commands/` with frontmatter
**Windsurf:** Create markdown file in `.windsurf/rules/`
**Cursor:** Create markdown file in `.cursor/rules/` with YAML frontmatter
**Aider:** Add section to `CONVENTIONS.md`

### Modifying Agent Behavior

Edit the agent definitions in each tool's folder to customize personas.

### Adding Templates

Templates in `/templates` folders provide standardized document formats for FRDs, Design docs, Test Plans, etc.

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

See the `/examples` folder for detailed setup guides:
- [Claude Code Setup](examples/claude-setup.md)
- [Windsurf Setup](examples/windsurf-setup.md)
- [Cursor Setup](examples/cursor-setup.md)
- [Aider Setup](examples/aider-setup.md)

---

## Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Add your improvements
4. Submit a pull request

Especially welcome:
- Support for additional AI tools
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

---

## Sources

- [Cursor Rules Documentation](https://cursor.com/docs/context/rules)
- [Aider Conventions Documentation](https://aider.chat/docs/usage/conventions.html)
- [Windsurf Cascade Memories](https://docs.windsurf.com/windsurf/cascade/memories)
- [Awesome Cursorrules](https://github.com/PatrickJS/awesome-cursorrules)
