---
description: Code restructuring workflow with impact analysis
allowed-tools: Bash(git:*), Bash(npm:*), Bash(pnpm:*), Read, Glob, Grep
argument-hint: [code/component to refactor]
---

# Refactoring Workflow

You are now in **Refactoring Mode**. Follow this workflow strictly.

**Input:** $ARGUMENTS (code, component, or pattern to refactor)

## CRITICAL RULES

1. **Plan before refactoring** - understand scope and impact
2. **NEVER auto-commit** - always wait for explicit user approval
3. **NEVER add legacy support** - clean breaks are OK
4. **Preserve behavior** - refactoring should not change functionality
5. **No attributions** in commit messages

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty, ask:

"What would you like to refactor? Please describe:

- The code, component, or pattern to restructure
- Why refactoring is needed
- The desired end state
- Issue/ticket number (if this refactoring is tracked)"

**Extract and store the issue/ticket number** (if provided) for:
- Branch naming (refactor/ISSUE-123)
- Document attachment
- Commit messages

Wait for response before proceeding.

## Workflow Phases

### PHASE 1: Analysis (Architect)

1. **Understand current state**:
   - What code is being refactored?
   - Why is refactoring needed?
   - What is the desired end state?

2. **Impact analysis**:
   - What files/components are affected?
   - What depends on this code?
   - Are there breaking changes?

3. **Create Refactoring Proposal**:
   - Save to: `.claude/engineering/refactors/REFACTOR-<id>-<short-name>.md`
   - Include: current state, proposed state, migration steps, risks

4. **Attach Refactoring Proposal to issue/ticket** (if issue number provided):
   - **For GitHub issues**: Use `gh issue comment <issue-number> --body-file <refactor-proposal-path>`
   - **For JIRA tickets**: Use JIRA CLI or REST API to attach document
   - **If attachment fails or not applicable**: Inform user to attach manually

5. **GATE: Present proposal to user and wait for approval**

```text
User must approve the refactoring approach before proceeding.
Breaking changes require explicit acknowledgment.
```

### WORKSPACE SETUP: Create Git Worktree

After refactoring proposal approval, set up an isolated workspace:

1. **Determine branch name** from issue number or refactoring name:
   - Format: `refactor/<ISSUE-NUMBER>` or `refactor/<short-name>`

2. **Create git worktree with new branch**:
   ```bash
   git worktree add ../worktrees/refactor/<ISSUE-OR-NAME> -b refactor/<ISSUE-OR-NAME>
   cd ../worktrees/refactor/<ISSUE-OR-NAME>
   ```

3. **All subsequent work happens in this worktree**

**Note**: If worktree creation fails, proceed with regular branch creation:
```bash
git checkout -b refactor/<ISSUE-OR-NAME>
```

### PHASE 2: Phased Implementation (Coder)

Refactoring should be done in phases to minimize risk:

1. **Phase A: Preparation**
   - Add any needed tests to verify current behavior
   - Ensure test coverage before making changes

2. **Phase B: Refactor**
   - Make the structural changes
   - Update imports/references
   - NO functionality changes

3. **Phase C: Cleanup**
   - Remove old code (no legacy support)
   - Update documentation

4. **GATE: All existing tests must pass after each phase**

### PHASE 3: Review (Reviewer)

1. **Review the refactoring**:
   - Behavior preserved?
   - Code quality improved?
   - No regressions?

2. **GATE: Address any issues**

### PHASE 4: Documentation

1. **Update affected documentation**:
   - ARCHITECTURE.md if structure changed
   - README.md if usage changed
   - CHANGELOG.md with refactoring entry

### PHASE 5: Commit (Controlled)

1. **Show diff to user**

2. **Propose commit message**:

   ```text
   refactor(<scope>): short description

   - what was refactored
   - why (improved X, simplified Y)
   ```

3. **Wait for explicit "approved" before committing**

## Abort Workflow

User can say "abort" or "cancel" at any time to exit this workflow.
