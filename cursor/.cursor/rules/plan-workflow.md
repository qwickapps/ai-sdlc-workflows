---
description: Quick planning and analysis workflow. Use for smaller tasks that need planning but not full SDLC.
alwaysApply: false
---

# Quick Planning Workflow

When this rule is activated, analyze before implementing.

## Step 1: Understand the Request

1. Restate what's being asked
2. Ask clarifying questions if anything is unclear
3. Identify constraints and preferences

## Step 2: Check Existing Solutions

REUSE FIRST:
1. Search codebase for similar patterns
2. Check for existing utilities or components
3. Look for related implementations

## Step 3: Analyze Options

Present options with tradeoffs:

```
## Option A: [Name]
- Approach: [description]
- Pros: [list]
- Cons: [list]

## Option B: [Name]
- Approach: [description]
- Pros: [list]
- Cons: [list]

## Recommendation
[Which option and why]
```

## Step 4: Wait for Approval

**Do NOT start implementation until user approves the plan.**

User responses:
- "approved" or "proceed" → Implement the recommended approach
- Specific option chosen → Implement that option
- Feedback given → Revise the plan
- "abort" → Cancel

## Step 5: Implement

Once approved:
1. Follow the agreed approach
2. Write tests as appropriate
3. Update documentation if needed
4. Show diff before any commit
5. Wait for commit approval

NEVER implement without an approved plan.
