# Claude Command Patterns Guide

A comprehensive guide to creating effective slash commands for Claude Code.

## Command File Structure

Commands are markdown files in `.claude/commands/` that define workflows Claude follows when invoked via `/command-name`.

### Basic Structure

```markdown
---
# YAML Frontmatter (optional but recommended)
description: Brief description shown in command list
allowed-tools: Tool1, Tool2, Bash(pattern:*)
argument-hint: <required-arg> [optional-arg]
---

# Command Title

Instructions for Claude to follow...
```

## Frontmatter Options

| Field | Purpose | Example |
|-------|---------|---------|
| `description` | Shown in `/` menu | `"Implement GitHub issue with testing"` |
| `allowed-tools` | Tools auto-approved for this command | `Bash(git:*), Bash(npm:*)` |
| `argument-hint` | Shows usage hint | `<issue-number> [context]` |

### Tool Permission Patterns

```yaml
allowed-tools:
  # Specific commands
  Bash(git status)
  Bash(npm test)

  # Wildcard patterns
  Bash(git:*)           # Any git command
  Bash(npm run:*)       # Any npm run script
  Bash(./scripts/*:*)   # Any script in scripts/
```

## Arguments via $ARGUMENTS

Commands can accept arguments passed after the command name:

```markdown
# In command file
The user wants to implement: $ARGUMENTS

## If $ARGUMENTS is empty
Ask user: "What would you like me to implement?"
```

**Usage:** `/implement fix the login bug` → `$ARGUMENTS = "fix the login bug"`

## Workflow Patterns

### Pattern 1: Simple Sequential

Best for: Quick tasks, single-phase work

```markdown
# Command Title

## Steps

1. Do first thing
2. Do second thing
3. Present results
```

### Pattern 2: Gated Phases

Best for: Multi-phase work requiring approval checkpoints

```markdown
# Command Title

## PHASE 1: Analysis

1. Analyze the situation
2. Document findings

**GATE: Present analysis and wait for approval before proceeding**

## PHASE 2: Implementation

1. Implement solution
2. Write tests

**GATE: All tests must pass**

## PHASE 3: Review

1. Self-review changes
2. Present for user approval
```

### Pattern 3: XML-Structured Workflows

Best for: Complex workflows with many subsections

```markdown
<input>
$ARGUMENTS (description of what this represents)
</input>

<instructions>
## Setup

<argument_parsing>
1. Extract ticket/issue ID from $ARGUMENTS
2. Handle URL vs number formats
</argument_parsing>

<api_integration>
3. Fetch details via API
</api_integration>
</instructions>

<implementation>
## Implementation Steps

<code_changes>
4. Make code changes following patterns
</code_changes>

<testing>
5. Run tests and verify
</testing>
</implementation>
```

**Benefits of XML tags:**
- Clear section boundaries
- Easy to reference specific sections
- Self-documenting structure

### Pattern 4: Conditional Workflows

Best for: Branching logic based on analysis

```markdown
## Analysis

Determine issue type:
- Is it a bug? → Proceed to Bug Fix section
- Is it a feature request? → Redirect to /feature
- Is it configuration? → Provide instructions only

<bug_workflow>
## Bug Fix Path
[steps for bugs]
</bug_workflow>

<config_workflow>
## Configuration Path
[steps for config issues]
</config_workflow>
```

### Pattern 5: Agent Delegation

Best for: Specialized subtasks

```markdown
## Git Operations

Use the **coder** agent for implementation:
> Implement the feature according to the approved design, following
> patterns in CLAUDE.md. Write tests for all new functionality.

## Code Quality

Use the **reviewer** agent for review:
> Review the implementation for security issues, performance problems,
> and adherence to project patterns. Create review report.
```

## Best Practices

### 1. Interactive Setup

Always handle empty arguments gracefully:

```markdown
## Interactive Setup

**IMPORTANT**: Check if $ARGUMENTS is empty.

If empty, STOP and ask:
"What would you like me to [action]? Please provide:
- Option A (e.g., issue number)
- Option B (e.g., URL)
- Option C (e.g., description)"

Wait for response before proceeding.
```

### 2. Clear Gates

Make approval points explicit:

```markdown
**GATE: Present findings to user**

User must respond with "approved" or provide feedback.
Do NOT proceed to next phase until approved.
```

### 3. Behavior Change Warnings

When changes affect existing functionality:

```markdown
<behavior_change_check>
If implementation modifies existing behavior, STOP and ask:

"This will change existing behavior:
- Current: [describe]
- New: [describe]
- Impact: [who is affected]

Should I proceed? (y/n)"
</behavior_change_check>
```

### 4. Solution Review Before Implementation

Present plans before coding:

```markdown
## Solution Review

STOP before implementing and present:

## Issue Summary
[Brief description]

## Root Cause
[What's causing it]

## Proposed Solution
[Detailed plan]

## Files to Modify
- file1.ts: [what changes]
- file2.ts: [what changes]

Approve to proceed, or provide feedback.
```

### 5. Abort Capability

Always provide escape hatch:

```markdown
## Abort Workflow

User can say "abort" or "cancel" at any time to exit this workflow.
```

## Command Categories

### SDLC Workflows
| Command | Purpose | Pattern |
|---------|---------|---------|
| `/feature` | Full feature development | Gated Phases |
| `/bug` | Bug investigation and fix | Gated Phases |
| `/refactor` | Code restructuring | Gated Phases |
| `/spike` | Technical research | Simple Sequential |

### Quick Actions
| Command | Purpose | Pattern |
|---------|---------|---------|
| `/plan` | Quick analysis | Simple Sequential |
| `/code-review` | Code review | Simple Sequential |
| `/commit` | Controlled commit | Simple Sequential |
| `/docs` | Documentation update | Simple Sequential |

## Creating New Commands

1. **Determine complexity** → Choose pattern
2. **Define inputs** → What arguments needed?
3. **Map phases** → What checkpoints?
4. **Add tool permissions** → What needs auto-approval?
5. **Include gates** → Where to pause for approval?
6. **Add escape hatch** → Abort capability

## Anti-Patterns

### Don't: Skip error handling
```markdown
# Bad
1. Run command
2. Continue
```

```markdown
# Good
1. Run command
2. If error, stop and report
3. Continue only on success
```

### Don't: Assume context
```markdown
# Bad
Fix the bug.
```

```markdown
# Good
## Understand the Bug
- What is the expected behavior?
- What is the actual behavior?
- Steps to reproduce?
```

### Don't: Auto-proceed without gates
```markdown
# Bad
## Phase 1
[do stuff]
## Phase 2
[do more stuff]
```

```markdown
# Good
## Phase 1
[do stuff]
**GATE: Wait for approval**

## Phase 2
[do more stuff]
```
