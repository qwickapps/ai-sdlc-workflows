# ADR-001: SDLC Workflow Adoption

**Date**: YYYY-MM-DD
**Status**: Accepted
**Decision**: Adopt phase-gated SDLC workflows for AI-assisted development

## Context

AI coding assistants tend to jump straight to implementation without proper requirements gathering, design consideration, or approval checkpoints. This leads to:
- Code that doesn't meet actual requirements
- Over-engineered solutions
- Unnecessary legacy support
- Poor documentation
- Commits without proper review

## Decision

Implement structured SDLC workflows that enforce:
1. Phase gates requiring explicit approval
2. Agent personas for different development phases
3. Mandatory documentation updates
4. Controlled commits with human approval

## Rationale

- **Quality**: Phase gates catch issues early
- **Control**: Human stays in the loop
- **Consistency**: Same process for all features
- **Documentation**: Built into the workflow
- **Discipline**: Prevents AI over-eagerness

## Impact

- All non-trivial features use `/feature` workflow
- Bug fixes use `/bug` workflow
- Quick tasks use `/plan` workflow
- Commits require explicit approval

## Implementation

- Slash commands in `.claude/commands/`
- Agent personas in `.claude/agents/`
- Document templates in `.claude/templates/`
- Working docs in `.claude/engineering/`
