---
description: Code review workflow for quality assessment
allowed-tools: Read, Glob, Grep, Bash(git diff:*), Bash(git log:*)
argument-hint: [files, PR number, or branch to review]
---

# Code Review Workflow

You are now in **Code Review Mode**. Use this to review code before committing.

**Input:** $ARGUMENTS (files to review, PR number, branch name, or "staged" for staged changes)

## CRITICAL RULES

1. **Be thorough but practical** - focus on meaningful issues
2. **Prioritize by severity** - critical > important > minor
3. **Include positive feedback** - acknowledge good patterns

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty, ask:

"What would you like me to review? Please specify:

- Specific files or directories
- A PR number or branch name
- 'staged' for currently staged changes
- 'recent' for recent commits"

Wait for response before proceeding.

## Review Process

### Step 1: Understand Context

1. **What is being reviewed?**
   - New feature, bug fix, refactoring?
   - What are the requirements/acceptance criteria?
   - What files are affected?

2. **Gather context**:
   - Read relevant design docs in `.claude/engineering/`
   - Understand the expected behavior

### Step 2: Review Code

Evaluate against these criteria:

**Critical (must fix)**:

- Security vulnerabilities
- Data corruption risks
- Breaking changes without acknowledgment

**Important (should fix)**:

- Performance issues
- Error handling gaps
- Missing tests for critical paths
- Logic errors

**Minor (consider fixing)**:

- Code style inconsistencies
- Minor optimizations
- Documentation gaps

**Positive (acknowledge)**:

- Good patterns used
- Clean implementations
- Effective testing

### Step 3: Create Review Report

1. **Save to**: `.claude/engineering/reviews/REVIEW-<id>-<context>.md`
2. **Use template** from `.claude/templates/REVIEW.md`

### Step 4: Present Findings

Format:

```markdown
## Review Summary

**Overall**: APPROVED / APPROVED WITH CHANGES / NEEDS WORK

### Critical Issues (must fix)

- [issue description and recommendation]

### Important Issues (should fix)

- [issue description and recommendation]

### Minor Issues (consider)

- [issue description]

### Positive Notes

- [good patterns observed]

### Verification Checklist

- [ ] Tests pass
- [ ] No security issues
- [ ] Error handling adequate
- [ ] Documentation updated
```

### Step 5: Resolution

1. **If issues found** - user decides which to address
2. **Re-review if needed** after fixes
3. **Approve** when ready for commit

## Abort Workflow

User can say "abort" or "cancel" at any time to exit this workflow.
