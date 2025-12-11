# Core Concepts

This document explains the philosophy and methodology behind AI SDLC Workflows.

---

## The Problem with AI Coding Assistants

Modern AI coding assistants (Claude, Copilot, Cursor, etc.) are remarkably capable but share common failure modes:

### 1. Premature Implementation

AI assistants jump to code immediately. Ask "add user authentication" and you'll get code before any clarifying questions about:
- What authentication method?
- What user data to store?
- What existing patterns exist in the codebase?

**Result:** Code that doesn't fit the actual requirements.

### 2. Over-Engineering

AI loves to be helpful, which manifests as:
- Adding features nobody asked for
- Creating abstractions for one-time operations
- Building in configurability that won't be used
- Adding error handling for impossible scenarios

**Result:** Code that's harder to maintain than necessary.

### 3. Legacy Support Addiction

AI assistants are trained on codebases full of backwards compatibility. They reflexively add:
- Fallbacks for old APIs
- Support for deprecated patterns
- Defensive checks "just in case"

**Result:** Technical debt from day one.

### 4. Auto-Commit Syndrome

Without guardrails, AI will commit changes immediately, often with:
- AI attribution signatures
- Incomplete implementations
- Untested code

**Result:** Messy git history and broken builds.

### 5. Documentation Neglect

AI focuses on the code and forgets:
- README updates
- CHANGELOG entries
- Test coverage

**Result:** Code that works but nobody knows how to use.

---

## The Solution: Structured Workflows

Instead of letting AI work freestyle, we impose structure through **phase-gated workflows**.

### Phase Gates

Each phase requires explicit approval before proceeding:

```
Phase 1: Requirements
    │
    └──▶ [USER APPROVES]
            │
            ▼
Phase 2: Design
    │
    └──▶ [USER APPROVES]
            │
            ▼
Phase 3: Test Strategy
    │
    └──▶ [USER APPROVES]
            │
            ▼
Phase 4: Implementation
    │
    └──▶ [TESTS PASS]
            │
            ▼
Phase 5: Review
    │
    └──▶ [ISSUES ADDRESSED]
            │
            ▼
Phase 6: Documentation
    │
    └──▶ [DOCS UPDATED]
            │
            ▼
Phase 7: Commit
    │
    └──▶ [USER APPROVES]
            │
            ▼
        COMPLETE
```

**The AI cannot skip phases.** This prevents the common failure modes:
- Can't implement without approved requirements
- Can't commit without passing tests
- Can't finish without updating docs

### Agent Personas

Different phases require different mindsets. We define "agent personas" that the AI adopts:

| Persona | Mindset | Focus |
|---------|---------|-------|
| Product Manager | "What problem are we solving?" | Requirements, constraints, success criteria |
| Architect | "What's the simplest design?" | Patterns, reuse, minimal complexity |
| Quality Engineer | "How could this break?" | Edge cases, failure modes, test coverage |
| Coder | "Clean and minimal" | Working code, no extras |
| Reviewer | "Is this production-ready?" | Security, quality, patterns |
| Tech Writer | "How do users use this?" | Documentation, examples |

---

## Key Principles

### 1. REUSE FIRST

Before creating anything new, check for:
- Existing patterns in the codebase
- Components that can be extended
- Utilities that already exist
- Previous architectural decisions (ADRs)

**Why:** Consistency matters more than perfection. Using existing patterns, even imperfect ones, is better than introducing new ones.

### 2. No Legacy Support by Default

Never add backwards compatibility unless explicitly requested:
- No fallback code paths
- No support for deprecated APIs
- No "just in case" defensive code

**Why:** Legacy support is a decision with maintenance costs. The human should make that decision, not the AI.

### 3. Explicit Approval Required

The AI must wait for explicit approval:
- "approved" to proceed to next phase
- "commit" to create git commits
- "proceed" to continue after warnings

**Why:** The human stays in control. No surprises.

### 4. Critical Thinking Over People-Pleasing

The AI should:
- Push back on unclear requirements
- Point out potential issues
- Suggest alternatives
- Disagree when appropriate

**Why:** A good team member doesn't just say yes. They contribute their expertise.

### 5. Minimal Documentation

Only update documentation that matters:
- README.md for usage changes
- CHANGELOG.md for notable changes
- Comments only where code isn't self-explanatory

**Why:** Documentation debt is real. Better to have less, accurate docs than more, outdated ones.

---

## Engineering Artifacts

During workflows, the AI creates working documents:

| Document | Purpose | Committed? |
|----------|---------|------------|
| FRD (Feature Request Document) | Captures requirements | No |
| Design Proposal | Architecture and approach | No |
| Test Plan | Test strategy and cases | No |
| Code Review Report | Quality assessment | No |
| Spike Report | Investigation findings | No |

**These are working documents, not deliverables.** They guide implementation but aren't committed to the repository. Only the resulting code, tests, and user-facing documentation are committed.

### Why Not Commit Engineering Docs?

1. **They go stale instantly** - The FRD becomes outdated the moment requirements change
2. **The code is the truth** - Tests document behavior better than prose
3. **Less to maintain** - Fewer docs means fewer things to keep updated
4. **They served their purpose** - Once code is written, the design doc is historical

---

## Workflow Selection Guide

Choose the right workflow for the task:

| Situation | Workflow | Why |
|-----------|----------|-----|
| New feature | `/feature` | Full SDLC ensures quality |
| Bug report | `/bug` | Investigation prevents band-aid fixes |
| Code cleanup | `/refactor` | Impact analysis prevents breakage |
| Technical question | `/spike` | Research before committing to approach |
| Small task | `/plan` | Light planning, quick approval |
| Ready to commit | `/commit` | Ensures tests pass and docs updated |

---

## Anti-Patterns

Behaviors explicitly forbidden by these workflows:

### 1. Jumping to Code
```
User: "Add user auth"
BAD: [immediately writes authentication code]
GOOD: "What authentication method? OAuth, JWT, session-based?"
```

### 2. Adding Unrequested Features
```
User: "Add a save button"
BAD: [adds save button with auto-save, undo, cloud sync]
GOOD: [adds save button]
```

### 3. Legacy Fallbacks
```
User: "Update the API to use v2 format"
BAD: [adds v2 support while keeping v1 fallback]
GOOD: [updates to v2, removes v1]
```

### 4. Silent Commits
```
BAD: [makes changes and commits without showing diff]
GOOD: "Here's the diff. Approve to commit?"
```

### 5. Skipping Tests
```
BAD: [implements feature without tests]
GOOD: "Test plan: unit tests for X, integration test for Y. Approve?"
```

---

## Customization

### Adapting for Your Team

These workflows are starting points. Modify them for your needs:

- **Smaller teams:** Combine phases (e.g., merge Design + Test Plan)
- **Regulated industries:** Add compliance phase
- **Rapid prototyping:** Use `/plan` more, `/feature` less
- **Open source:** Add contributor guidelines to commit phase

### Adding Domain-Specific Agents

Create new agent personas for your domain:

- **Data Engineer:** Focus on pipelines, schemas, data quality
- **ML Engineer:** Focus on models, training, evaluation
- **Security Engineer:** Focus on threats, vulnerabilities, compliance

---

## Measuring Success

How do you know the workflows are working?

### Positive Signals
- Fewer "that's not what I meant" moments
- Cleaner git history
- Tests written alongside code
- Documentation stays current
- AI pushes back on bad ideas

### Warning Signs
- Constantly overriding approval gates
- Workflows feel too slow for the task
- AI still auto-committing
- Documentation getting skipped

If warning signs appear, adjust the workflows rather than abandoning them.
