# AI SDLC Workflows — Codex Configuration

This directory provides OpenAI Codex CLI integration for the ai-sdlc-workflows framework.

## Setup

For the full Codex plugin ecosystem with skills, prompts, and agent personas, use [codex-plugins](https://github.com/qwickapps/codex-plugins).

This directory provides a minimal configuration that works with the shared rules, agents, and templates in this repository.

## What's Here

- `AGENTS.md` — This file. Session guidance for Codex.
- `.agents/skills/` — Symlinks to shared SDLC skills.

## Quality Gates

All work must pass validation gates before completion:

1. **Build Gate**: Production build succeeds
2. **Unit Test Gate**: All unit tests pass
3. **Integration Test Gate**: If touching DB/API, integration tests pass
4. **E2E Gate**: If user-facing, validate in production-like environment

## Rules

The following rules from `shared/rules/` apply:

- **VALIDATION-GATES.md** — Mandatory validation before completion
- **COMMUNICATION-PROTOCOL.md** — Stop and discuss blockers
- **WRITING-STYLE.md** — Professional, evidence-based communication
- **FACT-VERIFICATION.md** — Every claim needs a source
- **RESEARCH-DEPTH.md** — Use all available investigation tools
- **INVESTIGATION-METHODS.md** — Exhaust all methods before concluding

## Templates

Document templates are available in `shared/templates/`:

| Template | Purpose |
|----------|---------|
| FRD.md | Feature Request Document |
| DESIGN.md | Design Proposal |
| SPIKE.md | Investigation Report |
| BUG.md | Bug Analysis |
| REVIEW.md | Code Review Report |
| TEST-PLAN.md | Test Plan |
| ESTIMATION.md | Effort Estimation |
| RELEASE.md | Release Documentation |

## Full Setup

For the complete experience with 38 skills, 11 prompts, 8 agent personas, and Starlark rules:

```bash
gh repo clone qwickapps/codex-plugins -- --recurse-submodules
cd codex-plugins
bash install.sh
```
