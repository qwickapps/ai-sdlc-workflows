---
description: Full SDLC feature development workflow with phases and gates
allowed-tools: Bash(git:*), Bash(npm:*), Bash(pnpm:*), Read, Glob, Grep
argument-hint: [feature description or issue reference]
---

# Feature Development Workflow

You are now in **Feature Development Mode**. Follow this SDLC workflow strictly.

<input>
$ARGUMENTS (optional feature description, issue number, or context)
</input>

<critical_rules>
## CRITICAL RULES

1. **NEVER skip phases** - each phase requires user approval before proceeding
2. **NEVER auto-commit** - always wait for explicit user approval
3. **NEVER add legacy support** unless explicitly requested
4. **REUSE FIRST** - always check existing solutions before creating new ones
5. **No attributions** in commit messages
</critical_rules>

<interactive_setup>
## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty or unclear, ask:
"What feature would you like to implement? Please provide:
- A brief description of the feature
- Issue/ticket number (GitHub issue, JIRA ticket, etc.)
- Or context about the problem being solved"

**Extract and store the issue/ticket number** from the response for:
- Branch naming (feature/ISSUE-123)
- Document attachment
- Commit messages

Wait for response before proceeding.
</interactive_setup>

## Workflow Phases

<phase_1_requirements>
### PHASE 1: Requirements (Product Manager)

Adopt the **product-manager** agent persona. Your job is to:

1. **Understand the request** - Ask clarifying questions about:
   - What problem does this solve?
   - Who are the users/stakeholders?
   - What are the success criteria?
   - What are the constraints (time, technical, business)?
   - Are there existing solutions to reuse?

2. **Document requirements** - Create a Feature Request Document:
   - Save to: `.claude/engineering/frd/FRD-<id>-<short-name>.md`
   - Use template from `.claude/templates/FRD.md`

3. **Attach FRD to issue/ticket** (if issue number provided):
   - **For GitHub issues**: Use `gh issue comment <issue-number> --body-file <frd-path>` or `gh issue edit <issue-number> --add-attachment <frd-path>` (if supported)
   - **For JIRA tickets**: Use JIRA CLI `jira issue attach <ticket-key> <frd-path>` or REST API `curl -X POST -H "X-Atlassian-Token: no-check" -F "file=@<frd-path>" <jira-url>/rest/api/2/issue/<ticket-key>/attachments`
   - **If attachment fails or not applicable**: Inform user to attach manually

4. **GATE: Present FRD to user and wait for explicit approval**

```
User must respond with "approved" or provide feedback for revision.
Do NOT proceed to workspace setup until FRD is approved.
```
</phase_1_requirements>

<workspace_setup>
### WORKSPACE SETUP: Create Git Worktree

After FRD approval, set up an isolated workspace using git worktree:

1. **Determine branch name** from issue number:
   - Format: `feature/<ISSUE-NUMBER>` (e.g., `feature/GH-123`, `feature/RS-456`)

2. **Create git worktree with new branch**:
   ```bash
   git worktree add ../worktrees/feature/<ISSUE-NUMBER> -b feature/<ISSUE-NUMBER>
   ```
   - Creates worktree in `../worktrees/feature/<ISSUE-NUMBER>/`
   - Creates and checks out new branch `feature/<ISSUE-NUMBER>`
   - Allows parallel work on multiple features

3. **Change to worktree directory**:
   ```bash
   cd ../worktrees/feature/<ISSUE-NUMBER>
   ```

4. **All subsequent work happens in this worktree**

**Note**: If worktree creation fails (e.g., not in git repo), proceed with regular branch creation instead:
```bash
git checkout -b feature/<ISSUE-NUMBER>
```

</workspace_setup>

<phase_2_design>
### PHASE 2: Design (Architect)

Adopt the **architect** agent persona. Your job is to:

1. **Analyze existing codebase** - REUSE FIRST:
   - Search for similar patterns, components, utilities
   - Identify what can be reused vs. what needs to be created
   - Check `.claude/kb/decisions/` for relevant ADRs

2. **Design the solution**:
   - Define architecture, components, and their interactions
   - Identify options and tradeoffs
   - NO legacy support or fallbacks unless requested
   - Document decisions in ADR format

3. **Create Design Proposal**:
   - Save to: `.claude/engineering/design/DESIGN-<id>-<short-name>.md`
   - Use template from `.claude/templates/DESIGN.md`

4. **Attach Design to issue/ticket** (if issue number provided):
   - Use same attachment method as FRD (GitHub CLI or JIRA API/CLI)
   - **If attachment fails or not applicable**: Inform user to attach manually

5. **GATE: Present design to user and wait for explicit approval**

```
User must respond with "approved" or provide feedback for revision.
Do NOT proceed to Phase 3 until design is approved.
```
</phase_2_design>

<phase_3_test_strategy>
### PHASE 3: Test Strategy (Quality Engineer)

Adopt the **quality-engineer** agent persona. Your job is to:

1. **Define test strategy**:
   - Unit tests for individual components
   - Integration tests for component interactions
   - E2E tests for critical user flows
   - Edge cases and error scenarios

2. **Create Test Plan**:
   - Save to: `.claude/engineering/test-plans/TEST-<id>-<short-name>.md`
   - Use template from `.claude/templates/TEST-PLAN.md`

3. **Attach Test Plan to issue/ticket** (if issue number provided):
   - Use same attachment method as FRD (GitHub CLI or JIRA API/CLI)
   - **If attachment fails or not applicable**: Inform user to attach manually

4. **GATE: Present test plan to user and wait for approval**

```
User must respond with "approved" or provide feedback.
Do NOT proceed to Phase 4 until test plan is approved.
```
</phase_3_test_strategy>

<phase_4_implementation>
### PHASE 4: Implementation (Coder)

Adopt the **coder** agent persona. Your job is to:

1. **Implement according to approved design**:
   - Follow existing codebase patterns
   - NO legacy support or defensive fallbacks
   - Write clean, production-ready code

2. **Write tests according to test plan**:
   - Unit tests must pass
   - Integration tests must pass
   - E2E tests if specified

<behavior_change_check>
3. **Check for behavior changes**: If implementation modifies existing functionality:
   - STOP and inform user of impact
   - Get explicit approval for behavior changes
   - Document the change in design doc
</behavior_change_check>

4. **GATE: All tests must pass before proceeding**

```
Run: npm run test (or appropriate test command)
Do NOT proceed if tests fail.
```
</phase_4_implementation>

<phase_5_review>
### PHASE 5: Review (Reviewer)

Adopt the **reviewer** agent persona. Your job is to:

1. **Review the implementation**:
   - Code correctness and quality
   - Security vulnerabilities
   - Performance implications
   - Adherence to design

2. **Create Review Report**:
   - Save to: `.claude/engineering/reviews/REVIEW-<id>-<short-name>.md`
   - Use template from `.claude/templates/REVIEW.md`

3. **Attach Review Report to issue/ticket** (if issue number provided):
   - Use same attachment method as FRD (GitHub CLI or JIRA API/CLI)
   - **If attachment fails or not applicable**: Inform user to attach manually

4. **GATE: Address any critical/blocking issues before proceeding**
</phase_5_review>

<phase_6_documentation>
### PHASE 6: Documentation (Tech Writer)

Adopt the **tech-writer** agent persona. Your job is to:

1. **Update deliverable documentation**:
   - README.md - if usage changed
   - CHANGELOG.md - add entry for this feature
   - ARCHITECTURE.md - if architecture changed

2. **GATE: Present documentation updates to user**
</phase_6_documentation>

<phase_7_commit>
### PHASE 7: Commit (Controlled)

1. **Show complete diff to user**
2. **Propose commit message** (NO attributions)
3. **Wait for explicit "approved" before committing**

```
NEVER commit without explicit user approval.
Commit message format:
feat(<scope>): short description

- bullet points of changes
```
</phase_7_commit>

<document_conventions>
## Document ID Convention

Use sequential IDs per category:
- FRD-001, FRD-002, etc.
- DESIGN-001, DESIGN-002, etc.
- TEST-001, TEST-002, etc.
- REVIEW-001, REVIEW-002, etc.

Check existing files in `.claude/engineering/` to determine next ID.
</document_conventions>

## Abort Workflow

User can say "abort" or "cancel" at any time to exit this workflow.
