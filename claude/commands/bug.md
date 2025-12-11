---
description: Bug investigation and fix workflow with root cause analysis
allowed-tools: Bash(git:*), Bash(npm:*), Bash(pnpm:*), Read, Glob, Grep
argument-hint: [bug description, error message, or issue reference]
---

# Bug Fix Workflow

You are now in **Bug Fix Mode**. Follow this workflow strictly.

**Input:** $ARGUMENTS (bug description, error message, issue number, or reproduction steps)

## CRITICAL RULES

1. **Understand before fixing** - investigate root cause first
2. **NEVER auto-commit** - always wait for explicit user approval
3. **NEVER add legacy support** or workarounds - fix the actual issue
4. **No attributions** in commit messages

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty or unclear, ask:

"What bug would you like me to investigate? Please provide:
- Error message or unexpected behavior
- Steps to reproduce (if known)
- Expected vs actual behavior
- GitHub issue number or URL (if applicable)"

Wait for response before proceeding.

## Workflow Phases

### PHASE 1: Investigation (Quality Engineer + Coder)

1. **Reproduce the bug**:
   - Understand the expected vs actual behavior
   - Identify steps to reproduce
   - Ask clarifying questions if unclear

2. **Root cause analysis**:
   - Search codebase for relevant code
   - Identify the source of the bug
   - Document findings

3. **Classify the issue**:
   - Is it actually a bug we can fix?
   - Is it expected behavior needing clarification?
   - Is it a third-party limitation?
   - Is it a configuration issue?

   If NOT a bug we can fix, skip to explaining the situation to user.

4. **Create Bug Analysis**:
   - Save to: `.claude/engineering/bugs/BUG-<id>-<short-name>.md`
   - Include: reproduction steps, root cause, proposed fix

5. **GATE: Present analysis to user and wait for approval**

Present in this format:

```text
## Bug Summary
[Brief description]

## Reproduction Steps
1. [step]
2. [step]

## Root Cause
[What's actually causing the bug]

## Proposed Fix
[Detailed approach]

## Files to Modify
- file.ts: [what changes]

## Alternative Approaches
[Other options if applicable]

Approve to proceed with fix, or provide feedback.
```

### PHASE 2: Fix Implementation (Coder)

1. **Implement the fix**:
   - Fix the root cause, not symptoms
   - NO workarounds or defensive code unless necessary
   - Follow existing codebase patterns

2. **Write regression test**:
   - Test that reproduces the original bug
   - Test passes after fix is applied

3. **GATE: All tests must pass**

### PHASE 3: Review (Reviewer)

1. **Review the fix**:
   - Does it address root cause?
   - Any unintended side effects?
   - Regression test adequate?

2. **GATE: Address any issues before proceeding**

### PHASE 4: Documentation

1. **Update CHANGELOG.md** with bug fix entry
2. **Update other docs if behavior changed**

### PHASE 5: Commit (Controlled)

1. **Show diff to user**

2. **Propose commit message**:

   ```text
   fix(<scope>): short description of fix

   - root cause explanation
   - what was changed
   ```

3. **Wait for explicit "approved" before committing**

## Abort Workflow

User can say "abort" or "cancel" at any time to exit this workflow.
