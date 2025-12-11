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
| [Claude Code](https://claude.ai/code) | ✅ Ready | `/claude` | [Setup Guide](examples/claude-setup.md) |
| [Windsurf](https://codeium.com/windsurf) | ✅ Ready | `/windsurf` | [Setup Guide](examples/windsurf-setup.md) |
| [Cursor](https://cursor.com) | Ready | `/cursor` | [Setup Guide](examples/cursor-setup.md) |
| [Aider](https://aider.chat) | Ready | `/aider` | [Setup Guide](examples/aider-setup.md) |

**New:** Claude and Windsurf workflows now use shared resources (`/shared`) for consistency across tools.

---

## Quick Start

### Claude Code

```bash
# Copy shared resources and Claude-specific files to your project
cp -r shared/ your-project/shared/
cp -r claude/.claude/ your-project/.claude/
cp claude/CLAUDE.md your-project/CLAUDE.md

# Add engineering folder to gitignore
echo "shared/engineering/" >> your-project/.gitignore
```

**Usage:** `/feature`, `/bug`, `/plan`, `/refactor`, `/commit`, `/spike`, `/release`

### Windsurf

```bash
# Copy shared resources and Windsurf-specific files to your project
cp -r shared/ your-project/shared/
cp -r windsurf/.cascade/ your-project/.cascade/

# Add engineering folder to gitignore (if not already added)
echo "shared/engineering/" >> your-project/.gitignore
```

**Usage:** Workflows are automatically triggered based on JIRA tickets, bug reports, or feature requests.

### Cursor

```bash
# Copy .cursor folder to your project
cp -r cursor/.cursor/ your-project/.cursor/

# Add engineering folder to gitignore
echo ".cursor/engineering/" >> your-project/.gitignore
```

**Usage:** `@feature-workflow`, `@bug-workflow`, `@plan-workflow`, `@refactor-workflow`

### Aider

```bash
# Copy .aider folder, conventions file and config to your project
cp -r aider/.aider/ your-project/.aider/
cp aider/CONVENTIONS.md your-project/CONVENTIONS.md
cp aider/.aider.conf.yml your-project/.aider.conf.yml

# Add engineering folder to gitignore
echo ".aider/engineering/" >> your-project/.gitignore
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

All tools share the same folder structure (rules, templates, agents, memories, engineering) but have tool-specific activation methods:

### Claude Code
- Uses slash commands: `/feature`, `/bug`, `/plan`, `/refactor`, `/commit`, `/release`, `/spike`
- Commands defined in `.claude/commands/`
- Includes `COMMAND-PATTERNS.md` guide for creating custom commands
- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)

### Windsurf
- Uses `.windsurf/rules/` directory
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

## Folder Structure

The repository uses a **shared resources** approach for consistency across tools:

```
ai-sdlc-workflows/
├── shared/                 # Shared resources (used by all tools)
│   ├── agents/            # Agent persona definitions (.md and .yml)
│   ├── validators/        # Validation scripts (bash)
│   ├── engineering/       # Working documents (NOT committed)
│   └── kb/                # Knowledge base with ADRs
│
├── claude/.claude/        # Claude Code specific
│   ├── commands/          # Slash commands
│   ├── templates/         # Document templates
│   ├── agents@ -> ../../shared/agents      # Symlink
│   ├── validators@ -> ../../shared/validators
│   ├── engineering@ -> ../../shared/engineering
│   └── kb@ -> ../../shared/kb
│
└── windsurf/.cascade/     # Windsurf specific
    ├── workflows/         # YAML workflow definitions
    ├── agents@ -> ../../shared/agents      # Symlink
    ├── validators@ -> ../../shared/validators
    ├── engineering@ -> ../../shared/engineering
    └── kb@ -> ../../shared/kb
```

**Why Shared Resources?**
- **Consistency**: Same agents, validators, and standards across all tools
- **Knowledge Preservation**: Single knowledge base shared by all workflows
- **Maintainability**: Update once, applies everywhere
- **Collaboration**: Different tools can work on the same codebase with shared context

### Folder Rationale

#### `rules/` (or `commands/`)
**Purpose:** Workflow definitions that trigger structured processes.

**Why:** AI assistants need explicit instructions to follow disciplined workflows. Without them, they jump straight to code.

#### `templates/`
**Purpose:** Standardized document formats for FRDs, Design docs, Test Plans, Reviews, etc.

**Why:** Consistent documentation ensures nothing is missed. Templates guide the AI to capture the right information at each phase.

**Contents:**
- `FRD.md` - Feature Request Document
- `DESIGN.md` - Design Proposal
- `TEST-PLAN.md` - Test Strategy
- `REVIEW.md` - Code Review Report
- `BUG.md` - Bug Analysis
- `SPIKE.md` - Investigation Report
- `RELEASE.md` - Release Document

#### `agents/`
**Purpose:** Agent persona definitions that guide behavior during different phases.

**Why:** Different phases require different mindsets. A Product Manager asks different questions than an Architect. Personas help the AI adopt the right focus for each phase.

**Personas:**
- Product Manager (requirements)
- Architect (design)
- Quality Engineer (testing)
- Coder (implementation)
- Reviewer (review)
- Tech Writer (documentation)

#### `validators/` (in shared/)
**Purpose:** Executable bash scripts that validate standards (commit messages, branch names, workflow steps).

**Why:** Automated validation ensures consistency and prevents errors. Scripts can be run locally or in CI/CD pipelines.

**Committed:** Yes - shared validation standards.

**Scripts:**
- `commit-validator.sh` - Validates commit message format
- `branch-validator.sh` - Validates branch naming patterns
- `workflow-validator.sh` - Validates workflow steps

#### `kb/` (Knowledge Base - in shared/)
**Purpose:** Structured knowledge base with Architecture Decision Records (ADRs), component docs, and architectural documentation.

**Why:** KB provides persistent project knowledge with searchable indexing. ADRs maintain decision history for consistency. Unlike ephemeral chat history, KB is committed to version control and auto-indexed.

**Committed:** Yes - permanent project documentation.

**Structure:**
```
kb/
├── index.json         # Auto-maintained searchable index
├── template.md        # Template for new KB entries
├── architecture/      # Architecture documentation
├── components/        # Component documentation
└── decisions/         # Architecture Decision Records (ADRs)
    └── ADR-INDEX.md   # Central ADR registry
```

#### `engineering/` (in shared/)
**Purpose:** Working documents created during workflows (FRDs, designs, test plans, reviews, reports, presentations).

**Why:** Workflows create artifacts that guide implementation. These documents capture decisions made during each phase but become stale immediately after implementation. The code is the source of truth, not the planning documents.

**Committed:** No - add to `.gitignore`. These are working documents, not deliverables.

**Subfolders:**
```
engineering/
├── frd/               # Feature Request Documents
├── design/            # Design Proposals
├── test-plans/        # Test Plans
├── reviews/           # Code Review Reports
├── spikes/            # Investigation Reports
├── bugs/              # Bug Analysis
├── releases/          # Release Documents
├── reports/           # Generated reports
│   ├── analysis/
│   ├── implementation/
│   └── testing/
└── presentations/     # Presentation materials
```

### What Gets Committed vs. Gitignored

| Folder | Committed? | Rationale |
|--------|------------|-----------|
| `commands/` or `workflows/` | Yes | Tool-specific workflow definitions |
| `templates/` | Yes | Shared document standards |
| `shared/agents/` | Yes | Shared persona definitions (.md and .yml) |
| `shared/validators/` | Yes | Validation scripts |
| `shared/kb/` | Yes | Knowledge base with ADRs |
| `shared/engineering/` | **No** | Working documents that go stale |

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
