# Shared AI Workflow Resources

This directory contains shared resources used across multiple AI coding tools (Claude Code, Windsurf, etc.) to ensure consistent workflows, validation, and knowledge management.

## Purpose

By consolidating common resources, we ensure:
- **Consistency**: Same agents, validators, and standards across all tools
- **Knowledge Preservation**: Single knowledge base shared by all workflows
- **Maintainability**: Update once, applies everywhere
- **Collaboration**: Different tools can work on the same codebase with shared context

## Directory Structure

```
shared/
├── rules/                 # Quality guidelines (synced to all CLIs)
│   ├── FACT-VERIFICATION.md      # Standards for verifying claims
│   ├── INVESTIGATION-METHODS.md  # Exhaustive investigation checklist
│   ├── ITERATION-GATES.md        # Quality gates for iterations
│   ├── SATISFACTORY-CRITERIA.md  # Criteria for satisfactory work
│   └── WRITING-STYLE.md          # Professional writing standards
│
├── templates/             # Document templates (synced to all CLIs)
│   ├── BUG.md            # Bug investigation template
│   ├── DESIGN.md         # Technical design template
│   ├── ESTIMATION.md     # Effort estimation template
│   ├── FACT-CHECK.md     # Fact verification report
│   ├── FRD.md            # Feature request template
│   ├── RELEASE.md        # Release documentation template
│   ├── REVIEW.md         # Code review report template
│   ├── SPIKE.md          # Spike investigation template
│   ├── STYLE-GUIDE.md    # Writing style guide
│   └── TEST-PLAN.md      # Test plan template
│
├── sync-workflows.sh      # Script to sync rules/templates to all CLIs
│
├── agents/                 # Agent definitions
│   ├── *.md               # For Claude Code (markdown format)
│   ├── *.yml              # For Windsurf (YAML format)
│   ├── architect          # Requirements analysis & design
│   ├── coder              # Implementation specialist
│   ├── devops             # Branch/commit/PR management
│   ├── engineering-manager # Coordination & releases
│   ├── product-manager    # Requirements gathering
│   ├── qa / quality-engineer  # Testing & validation
│   ├── reviewer           # Code review & quality
│   └── tech-writer        # Documentation & reporting
│
├── validators/            # Executable validation scripts
│   ├── commit-validator.sh    # Validates commit message format
│   ├── branch-validator.sh    # Validates branch naming patterns
│   └── workflow-validator.sh  # Validates workflow steps
│
├── engineering/           # Working documents (NOT committed to git)
│   ├── frd/              # Feature Request Documents
│   ├── design/           # Design Proposals
│   ├── test-plans/       # Test Plans
│   ├── reviews/          # Code Review Reports
│   ├── spikes/           # Investigation Reports
│   ├── bugs/             # Bug Analysis Documents
│   ├── releases/         # Release Documents
│   ├── reports/          # Generated reports
│   │   ├── analysis/
│   │   ├── implementation/
│   │   └── testing/
│   └── presentations/    # Presentation materials
│
└── kb/                   # Knowledge Base
    ├── index.json        # Auto-maintained searchable index
    ├── template.md       # Template for new KB entries
    ├── README.md         # KB documentation
    ├── architecture/     # Architecture documentation
    ├── components/       # Component documentation
    └── decisions/        # Architecture Decision Records (ADRs)
        └── ADR-INDEX.md  # Central ADR registry
```

## How Tools Reference These Resources

Tools reference shared resources via symlinks:

### Claude Code
```
claude/.claude/
├── agents@ -> ../../shared/agents
├── validators@ -> ../../shared/validators
├── engineering@ -> ../../shared/engineering
└── kb@ -> ../../shared/kb
```

### Windsurf
```
windsurf/.cascade/
├── agents@ -> ../../shared/agents
├── validators@ -> ../../shared/validators
├── engineering@ -> ../../shared/engineering
└── kb@ -> ../../shared/kb
```

## Usage Guidelines

### Rules

Quality guidelines that ensure thorough, accurate work:
- Stored in `shared/rules/`
- Synced to all CLIs via `sync-workflows.sh`
- Markdown format (Cursor receives .mdc copies)
- Referenced by workflows for quality checks
- Guide AI assistants to produce professional-quality output

**Key Rules:**
- **FACT-VERIFICATION**: Every claim must have evidence (file:line or URL)
- **INVESTIGATION-METHODS**: Exhaust all methods before concluding "unknown"
- **ITERATION-GATES**: Don't proceed with incomplete or shallow work
- **SATISFACTORY-CRITERIA**: Define when work meets quality standards
- **WRITING-STYLE**: Professional, neutral, evidence-based writing

### Templates

Document templates for SDLC artifacts:
- Stored in `shared/templates/`
- Synced to all CLIs via `sync-workflows.sh`
- Markdown format, compatible with all CLIs
- Provide consistent structure for all documentation
- Include prompts and examples for completeness

**Core Templates:** BUG, DESIGN, FRD, REVIEW, TEST-PLAN, RELEASE
**Enhanced Templates:** ESTIMATION (3-point estimates), FACT-CHECK (thoroughness assessment), SPIKE (enhanced investigation), STYLE-GUIDE (writing standards)

### Sync Script

The `sync-workflows.sh` script maintains consistency across all CLI directories:

**Usage:**
```bash
./shared/sync-workflows.sh
```

**What it does:**
- Copies rules from `shared/rules/` to all CLI directories
- Copies templates from `shared/templates/` to all CLI directories
- Handles Cursor's .mdc extension preference
- Creates missing directories automatically
- Provides colored output showing progress

**When to run:**
- After updating any file in `shared/rules/` or `shared/templates/`
- Before committing changes to ensure all CLIs are in sync
- When onboarding a new CLI to the repository

### Agents
- Each agent has a specific role and responsibility
- Agents exist in multiple formats to support different tools
- Keep agent definitions logically consistent across formats
- Update both .md and .yml when changing agent behavior

### Validators
- Validators are bash scripts that return [PASS] or [FAIL]
- Used to enforce standards for commits, branches, etc.
- Can be run locally before pushing changes
- Exit codes: 0 = pass, 1 = fail

### Engineering Artifacts
- Working documents that guide implementation
- NOT committed to git (use .gitignore)
- Organized by category for easy navigation
- Sequential IDs (FRD-001, DESIGN-001, etc.)
- Reports generated automatically by workflows

### Knowledge Base
- Structured, searchable format
- Auto-maintained index for quick lookup
- Categorized: architecture, components, decisions
- ADRs document major architectural decisions
- Use template.md for consistent entries

## Standards

### Professional Mode
- No emojis in code or documentation
- Neutral, professional tone
- Fact-based statements only
- Clear, concise writing

### Validation-First
- All steps validated before proceeding
- Stop and discuss when uncertain
- No assumptions allowed
- Explicit approval gates

### REUSE FIRST Philosophy
- Check existing solutions before designing new ones
- Reference KB and ADRs before making decisions
- Avoid duplicating functionality
- Document patterns for future reuse

### Git Worktree Workflow
- All workflows use git worktree for isolated workspaces
- Worktrees created in `../worktrees/<type>/<ISSUE>` directory
- Allows parallel work on multiple features/bugs without branch switching
- Branch patterns: `feature/ISSUE`, `bugfix/ISSUE`, `hotfix/ISSUE`, `refactor/ISSUE`, `spike/ISSUE`
- Each worktree is independent with its own working directory
- Fallback to regular branch creation if worktree fails

### Document Attachment
- Engineering documents attached to corresponding issues/tickets
- Supports GitHub (via `gh` CLI) and JIRA (via API/CLI)
- Document types and target tickets:
  - FRD → Epic or Story ticket
  - Design Document → Feature/Story ticket
  - Test Plan → Feature/Story ticket
  - Bug Analysis → Bug ticket
  - Spike Report → Research/Investigation ticket
  - Refactoring Proposal → Refactor ticket
  - Review Report → Any ticket under review
  - Completion Report → Implemented ticket
- If attachment fails, user is notified to attach manually

## Maintenance

When adding new resources:
1. Add to `shared/` directory
2. Update relevant documentation
3. Test with all tools that use the resource
4. Update KB if architectural impact

When removing resources:
1. Check all tools for references
2. Update symlinks if needed
3. Archive rather than delete (preserve history)
4. Update documentation

## Tool-Specific Resources

While shared resources ensure consistency, each tool may have:
- Tool-specific configuration files
- Tool-native workflow definitions (commands/*.md vs workflows/*.yml)
- Tool-specific templates
- Tool-specific documentation

These remain in the tool's directory and are not shared.
