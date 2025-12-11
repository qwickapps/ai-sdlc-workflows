# Cascade Workflow System

Agent-based workflow system for consistent, validated, professional software development.

## Overview

This system uses specialized agents to handle different aspects of the SDLC:
- **Architect**: Analyze requirements and design solutions
- **DevOps**: Manage branches, commits, and deployments
- **Coder**: Implement code changes
- **Reviewer**: Review code quality and compliance
- **QA**: Verify functionality and test coverage
- **Tech Writer**: Create documentation and reports

## Directory Structure

```
.cascade/
├── config.yml              # System configuration
├── workflows/              # Workflow definitions
│   ├── ticket-implementation.yml
│   ├── bug-fix.yml
│   ├── feature-development.yml
│   ├── code-review.yml
│   ├── hotfix.yml
│   └── pr-review-response.yml
├── agents@ -> ../../shared/agents         # Agent definitions (symlink)
├── validators@ -> ../../shared/validators # Validation scripts (symlink)
├── engineering@ -> ../../shared/engineering  # Working documents (symlink)
└── kb@ -> ../../shared/kb                 # Knowledge base (symlink)

shared/ (Cross-tool resources)
├── agents/                 # Agent definitions (.yml for Windsurf, .md for Claude)
│   ├── architect.yml
│   ├── coder.yml
│   ├── devops.yml
│   ├── qa.yml
│   ├── reviewer.yml
│   └── tech-writer.yml
├── validators/             # Validation scripts
│   ├── branch-validator.sh
│   ├── commit-validator.sh
│   └── workflow-validator.sh
├── engineering/            # Working documents
│   ├── frd/
│   ├── design/
│   ├── test-plans/
│   ├── reviews/
│   ├── spikes/
│   ├── bugs/
│   ├── releases/
│   ├── reports/            # Generated reports
│   │   ├── analysis/
│   │   ├── implementation/
│   │   └── testing/
│   └── presentations/
└── kb/                     # Knowledge base
    ├── README.md
    ├── index.json
    ├── template.md
    ├── architecture/
    ├── components/
    └── decisions/          # Architecture Decision Records (ADRs)
        └── ADR-INDEX.md
```

**Shared Resources**: The `.cascade/` folder uses symlinks to reference shared resources in `../shared/`. This allows multiple AI coding tools (Claude, Windsurf, etc.) to use the same agents, validators, knowledge base, and engineering artifacts.

## Usage

### JIRA Ticket Implementation

When you provide a JIRA ticket number (e.g., RS-12345), the system will:
1. **Architect** reads and analyzes the ticket
2. **DevOps** creates the appropriate branch
3. **Coder** implements the changes
4. **Reviewer** validates the code
5. **QA** verifies functionality
6. **DevOps** commits and creates PR
7. **Tech Writer** generates completion report

### Bug Fixing

For bug reports, the system will:
1. **Architect** analyzes the bug and identifies root cause
2. **DevOps** creates bugfix branch
3. **Coder** implements minimal fix with regression test
4. **Reviewer** validates the fix
5. **QA** verifies bug is resolved
6. **DevOps** commits and creates PR
7. **Tech Writer** documents the fix

## Quality Standards

All agents follow these standards:
- No emojis in code or documentation
- Professional, neutral tone
- Fact-based statements only
- Stop and discuss when uncertain
- Validate before proceeding
- No assumptions

## Validation

The system enforces:
- Branch naming conventions
- Commit message format
- Code quality standards
- Test coverage requirements
- Documentation completeness

## Knowledge Base

The KB stores:
- Component documentation
- Architectural decisions
- System patterns
- Technical discoveries

Format is concise and searchable for quick reference.

## Reports

All reports are saved in `shared/engineering/reports/`:
- **analysis/**: Investigation and analysis reports
- **implementation/**: Completion reports for tickets
- **testing/**: Test plans and results
