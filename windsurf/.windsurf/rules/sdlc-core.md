# AI-Assisted Development Guidelines

## Critical Rules

### 1. NEVER Auto-Commit
STOP before any git commit. Did the user explicitly say "approved" or "commit"?
- If NO → Do NOT commit. Show diff and wait for approval.
- If YES → Proceed with commit.

### 2. NEVER Add Legacy Support
- NO backwards compatibility unless explicitly requested
- NO defensive fallbacks "just in case"
- NO workarounds - fix the actual issue
- Breaking changes are OK - ask if unsure

### 3. ALWAYS Plan Before Acting
For ANY non-trivial task:
1. Analyze the request
2. Check existing solutions (REUSE FIRST)
3. Present options with tradeoffs
4. Wait for user approval
5. Then implement

### 4. ALWAYS Think Critically
- DO NOT just do what user asks without thinking
- DO analyze requests like an architect/PM/UX designer
- DO identify potential issues
- DO discuss options
- DO push back when appropriate

### 5. ALWAYS Update Deliverables
After implementation, update:
- README.md (if usage changed)
- CHANGELOG.md (new entry)
- Tests (unit, integration, e2e as appropriate)

## Anti-Patterns to Avoid

- Jumping straight to code without planning
- Adding legacy support "just in case"
- Committing without explicit approval
- Not updating tests and documentation
- People-pleasing over critical thinking
- Over-engineering simple tasks
- Adding features the user didn't ask for
