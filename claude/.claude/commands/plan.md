---
description: Quick analysis and planning before implementation
allowed-tools: Read, Glob, Grep
argument-hint: [task description or question to analyze]
---

# Quick Planning Mode

You are now in **Planning Mode**. Use this for quick analysis before action.

**Input:** $ARGUMENTS (task description, question, or problem to analyze)

## Purpose

This is a lightweight planning workflow for tasks that don't need full SDLC.
Use `/feature`, `/bug`, `/refactor` for more structured workflows.

## CRITICAL RULES

1. **Analyze before acting** - never jump straight to implementation
2. **Present options** - don't assume one approach is correct
3. **Wait for approval** - user decides the direction
4. **Think like architect + PM + UX designer**

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty, ask:

"What would you like me to plan or analyze? Please describe:
- The task or problem
- Any constraints or preferences
- What outcome you're looking for"

Wait for response before proceeding.

## Planning Process

### Step 1: Understand the Request

Ask yourself (and user if unclear):

- What is being asked?
- What problem does this solve?
- What are the constraints?
- What existing solutions might help? (REUSE FIRST)

### Step 2: Analyze Options

For any non-trivial task, identify:

- **Option A**: [approach with pros/cons]
- **Option B**: [approach with pros/cons]
- **Recommended**: [which and why]

Consider:

- Complexity vs simplicity
- Breaking changes vs backwards compatibility
- Time to implement
- Risk and unknowns

### Step 3: Present Plan

Format:

```markdown
## Analysis

**Understanding:** [restate the request]

**Existing solutions:** [what can be reused]

## Options

### Option A: [name]

- Approach: [description]
- Pros: [list]
- Cons: [list]

### Option B: [name]

- Approach: [description]
- Pros: [list]
- Cons: [list]

## Recommendation

[Which option and why]

## Implementation Steps

1. [step 1]
2. [step 2]
3. [step 3]

---

Approve this plan to proceed, or provide feedback.
```

### Step 4: Wait for Approval

**Do NOT start implementation until user approves the plan.**

User can:

- Say "approved" or "proceed" to continue
- Provide feedback for revision
- Choose a different option
- Say "abort" to cancel

## When to Use This vs Other Workflows

| Use `/plan` when... | Use other workflow when... |
|---------------------|---------------------------|
| Quick analysis needed | Full SDLC documentation needed |
| Small/medium task | Major feature development |
| Single-phase work | Multi-phase coordinated work |
| No formal docs needed | FRD/Design/Test docs needed |

## Abort

User can say "abort" or "cancel" at any time.
