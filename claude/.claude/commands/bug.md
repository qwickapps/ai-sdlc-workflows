---
description: Bug investigation and fix workflow with root cause analysis
allowed-tools: Bash(git:*), Bash(npm:*), Bash(pnpm:*), Read, Glob, Grep
argument-hint: [bug description, error message, or issue reference]
---

# Bug Fix Workflow

You are now in **Bug Fix Mode**. Follow this workflow strictly.

**Input:** $ARGUMENTS (bug description, error message, issue number, or reproduction steps)

## CRITICAL RULES

1. **Understand before fixing** - investigate root cause first (see RESEARCH-DEPTH.md)
2. **NEVER auto-commit** - always wait for explicit user approval
3. **NEVER add legacy support** or workarounds - fix the actual issue
4. **No attributions** in commit messages
5. **When blocked** - STOP and discuss (see COMMUNICATION-PROTOCOL.md)
6. **Validate thoroughly** - build, test, E2E (see VALIDATION-GATES.md)
7. **Use worktree script** - NEVER use git commands directly (see WORKTREE-ENFORCEMENT.md)

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty or unclear, ask:

"What bug would you like me to investigate? Please provide:
- Error message or unexpected behavior
- Steps to reproduce (if known)
- Expected vs actual behavior
- Issue/ticket number (GitHub issue, JIRA ticket, etc.)"

**Extract and store the issue/ticket number** from the response for:
- Branch naming (bugfix/ISSUE-123)
- Document attachment
- Commit messages

Wait for response before proceeding.

## Workflow Phases

### PHASE 1: Investigation (Quality Engineer + Coder)

**Research Requirements:** Follow RESEARCH-DEPTH.md guidelines:
- Use Explore agent for unfamiliar code areas
- Use Grep for specific code patterns
- Use Chrome automation to verify frontend bugs
- Use QwickBrain MCP to check for similar past bugs
- Gather evidence with file:line references
- No assumptions without verification

1. **Reproduce the bug**:
   - Understand the expected vs actual behavior
   - Identify steps to reproduce
   - Ask clarifying questions if unclear

2. **Root cause analysis**:
   - Use Explore agent to understand affected system
   - Use Grep to find relevant code
   - Read actual code, don't assume behavior
   - Trace execution path
   - Identify the source of the bug
   - Document findings with file:line evidence

3. **Classify the issue**:
   - Is it actually a bug we can fix?
   - Is it expected behavior needing clarification?
   - Is it a third-party limitation?
   - Is it a configuration issue?

   If NOT a bug we can fix, skip to explaining the situation to user.

4. **If blocked during investigation:**
   - STOP immediately
   - Follow COMMUNICATION-PROTOCOL.md
   - Present options to user
   - Wait for decision before proceeding

4. **Create Bug Analysis**:
   - Save to: `.claude/engineering/bugs/BUG-<id>-<short-name>.md`
   - Include: reproduction steps, root cause, proposed fix

5. **Attach Bug Analysis to issue/ticket** (if issue number provided):
   - **For GitHub issues**: Use `gh issue comment <issue-number> --body-file <bug-analysis-path>`
   - **For JIRA tickets**: Use JIRA CLI or REST API to attach document
   - **If attachment fails or not applicable**: Inform user to attach manually

6. **GATE: Present analysis to user and wait for approval**

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

### WORKSPACE SETUP: Create Git Worktree

**STOP:** Follow WORKTREE-ENFORCEMENT.md - NEVER use git commands directly.

After bug analysis approval, set up an isolated workspace:

1. **Determine worktree name** from issue number:
   - Format: `bugfix-<ISSUE-NUMBER>` (e.g., `bugfix-GH-123`, `bugfix-RS-456`)

2. **Locate the create-worktree.sh script:**
   ```bash
   find . -name "create-worktree.sh" -type f | head -1
   # OR use known path: .claude/scripts/create-worktree.sh
   ```

3. **Run the script (MANDATORY):**
   ```bash
   .claude/scripts/create-worktree.sh bugfix-<ISSUE-NUMBER>
   ```

   This script:
   - Creates worktree in ../qwickapps-wt-bugfix-<ISSUE-NUMBER>
   - Copies all .env files
   - Copies .claude/settings.local.json
   - Runs pnpm install

4. **Change to worktree directory:**
   ```bash
   cd ../qwickapps-wt-bugfix-<ISSUE-NUMBER>
   ```

5. **All subsequent work happens in this worktree**

**CRITICAL:** Never use `git worktree add` or `git checkout -b` directly.
Always use the create-worktree.sh script.

### PHASE 2: Fix Implementation (Coder)

1. **Implement the fix**:
   - Fix the root cause, not symptoms
   - NO workarounds or defensive code unless necessary
   - Follow existing codebase patterns

2. **Write regression test**:
   - Test that reproduces the original bug
   - Test passes after fix is applied

3. **GATE: Validation (MANDATORY - see VALIDATION-GATES.md)**

   Complete ALL applicable validation steps:

   **Build/Compilation:**
   ```bash
   npm run build          # or pnpm build, yarn build
   npm run build:prod     # if different production build exists
   ```
   - [ ] Code compiles without errors
   - [ ] No critical warnings
   - [ ] TypeScript type checks pass

   **Unit Tests:**
   ```bash
   npm run test
   npm run test:coverage
   ```
   - [ ] All existing tests pass
   - [ ] New regression test passes
   - [ ] Test coverage maintained or improved

   **Integration Tests (if applicable):**
   ```bash
   npm run test:integration
   ```
   - [ ] Integration tests pass
   - [ ] No side effects on other components

   **E2E Validation (CRITICAL):**
   ```bash
   # Use ACTUAL deployment build process
   .github/scripts/build-workspace-package.sh   # or equivalent

   # For Docker deployments
   docker build -t test-fix .
   docker run -p 3000:3000 test-fix

   # For database changes
   npm run migrate   # on CLEAN database, not dev database
   ```
   - [ ] Tested in production-like environment
   - [ ] Bug is actually fixed (not just error message gone)
   - [ ] No regressions in related functionality
   - [ ] User's actual problem is solved

   **For frontend bugs:**
   - [ ] Tested in actual browser (use Chrome automation)
   - [ ] No console errors
   - [ ] User workflow works end-to-end

   **User Vision Validation:**
   - [ ] Original problem solved (not just symptoms)
   - [ ] Edge cases tested
   - [ ] No workarounds that could fail

   **Document validation results:**
   ```markdown
   ## Validation Results

   Build: ✓ Compiled successfully
   Unit Tests: ✓ 45/45 passing, coverage 87%
   Integration Tests: ✓ 12/12 passing
   E2E: ✓ Tested in Docker, bug fixed, no regressions
   User Vision: ✓ Original issue (migrations failing) now works on clean database

   Evidence: [logs, screenshots, specific behaviors verified]
   ```

   **GATE: Do NOT proceed if any validation fails. Fix issues first.**

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
