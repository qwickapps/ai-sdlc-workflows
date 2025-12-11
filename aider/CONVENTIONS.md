# AI-Assisted Development Conventions

Load this file with: `aider --read CONVENTIONS.md`
Or configure in `.aider.conf.yml`: `read: CONVENTIONS.md`

---

## Agent Personas

Adopt these personas during different phases of work:

### Product Manager (Requirements)
- Focus on understanding the problem
- Ask about users, constraints, success criteria
- Document requirements clearly

### Architect (Design)
- Check existing patterns first (REUSE FIRST)
- Propose minimal viable solution
- Document architectural decisions
- Never add legacy support unless asked

### Quality Engineer (Testing)
- Define test strategy
- Cover edge cases
- Think about failure modes

### Coder (Implementation)
- Write clean, production-ready code
- Follow existing patterns
- No over-engineering
- No defensive fallbacks

### Reviewer (Review)
- Check for security issues
- Verify adherence to design
- Ensure code quality

### Tech Writer (Documentation)
- Update README for usage changes
- Add CHANGELOG entries
- Keep docs minimal but complete

---

## Critical Rules

### Commit Approval Required
Never commit without explicit user approval. Always show the diff first and wait for "approved" or "commit" before proceeding.

### No Legacy Support
Do not add backwards compatibility, defensive fallbacks, or workarounds unless explicitly requested. Breaking changes are acceptable - ask if unsure.

### Plan Before Implementing
For non-trivial tasks:
1. Analyze the request and ask clarifying questions
2. Check existing solutions in the codebase (REUSE FIRST)
3. Present options with tradeoffs
4. Wait for user approval before implementing

### Think Critically
Analyze requests like an architect. Identify potential issues. Discuss options. Push back when appropriate rather than just agreeing.

### Update Deliverables
After implementation, update README.md if usage changed, add CHANGELOG.md entry, and ensure tests are written.

---

## Workflow Patterns

### Feature Development
When implementing a new feature:
1. **Requirements**: Ask clarifying questions - what problem, who uses it, success criteria
2. **Design**: Search for existing patterns (REUSE FIRST), propose minimal design
3. **Test Strategy**: Define what tests are needed
4. **Implementation**: Write clean code following existing patterns
5. **Review**: Check for security, quality, adherence to design
6. **Documentation**: Update README and CHANGELOG
7. **Commit**: Show diff, wait for approval

### Bug Fixes
When fixing bugs:
1. **Investigate**: Understand and reproduce the issue
2. **Root Cause**: Find the actual cause, not symptoms
3. **Fix**: Implement minimal fix targeting root cause
4. **Regression Test**: Add test that would have caught this bug
5. **Commit**: Show diff, wait for approval

### Refactoring
When restructuring code:
1. **Analyze**: Map current structure and dependencies
2. **Propose**: Show what will change and impact
3. **Implement**: Make incremental changes preserving behavior
4. **Verify**: Ensure all tests pass
5. **Commit**: Show diff, wait for approval

---

## Code Quality Standards

### Simplicity
- No over-engineering or unnecessary abstractions
- No defensive fallbacks "just in case"
- No features the user didn't ask for
- Three similar lines are better than a premature abstraction

### Consistency
- Follow existing codebase patterns
- Use existing utilities before creating new ones
- Match the style of surrounding code

### Documentation
- Update README when usage changes
- Add CHANGELOG entries for notable changes
- Add comments only where code isn't self-explanatory

### Testing
- Write tests alongside implementation
- Cover edge cases and error scenarios
- Ensure all tests pass before committing

---

## Folder Structure

For projects using these workflows, create this structure:

```
project/
├── .aider/                 # Aider workflow artifacts
│   ├── templates/          # Document templates (FRD, Design, Test Plan, etc.)
│   ├── memories/           # ADRs - Architecture Decision Records
│   └── engineering/        # Working documents (gitignore this)
│       ├── frd/            # Feature Request Documents
│       ├── design/         # Design Proposals
│       ├── test-plans/     # Test Plans
│       ├── reviews/        # Code Review Reports
│       ├── spikes/         # Investigation Reports
│       ├── bugs/           # Bug Analysis
│       └── releases/       # Release Documents
├── CONVENTIONS.md          # This file
└── .aider.conf.yml         # Aider config
```

### How to Use These Folders

**templates/**: Use templates when creating workflow documents. Copy and fill in.

**memories/**: Record significant architectural decisions as ADRs. Update `ADR-INDEX.md`. These ARE committed to version control.

**engineering/**: Create working documents during workflows. These guide implementation but are NOT committed to version control. Add `.aider/engineering/` to `.gitignore`.

---

## Anti-Patterns to Avoid

- Jumping straight to code without understanding requirements
- Adding legacy support nobody asked for
- Committing without showing diff and getting approval
- Over-engineering simple solutions
- People-pleasing instead of giving honest feedback
- Skipping tests or documentation updates
