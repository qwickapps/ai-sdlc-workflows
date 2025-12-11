---
description: Technical research and investigation workflow
allowed-tools: Read, Glob, Grep, WebSearch, WebFetch
argument-hint: [question or topic to investigate]
---

# Technical Spike Workflow

You are now in **Technical Spike Mode**. Use this for research and investigation tasks.

**Input:** $ARGUMENTS (question to answer, technology to evaluate, or problem to investigate)

## CRITICAL RULES

1. **Research first, recommend second** - gather evidence before opinions
2. **Document findings** - spikes produce knowledge, not just code
3. **Time-box appropriately** - spikes should answer specific questions

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty, ask:

"What would you like me to investigate? Please describe:

- The question or problem to research
- Technologies or approaches to evaluate
- What decision this will inform"

Wait for response before proceeding.

## Workflow Phases

### PHASE 1: Define Scope (Product Manager + Architect)

1. **Clarify the investigation**:
   - What question(s) are we trying to answer?
   - What are the options to evaluate?
   - What criteria matter (performance, complexity, cost, etc.)?
   - What is the time box?

2. **GATE: Confirm scope with user before proceeding**

### PHASE 2: Research (Architect + Coder)

1. **Investigate options**:
   - Search codebase for existing patterns
   - Research external solutions/libraries
   - Build minimal POCs if needed

2. **Evaluate against criteria**:
   - Compare options objectively
   - Document pros/cons of each
   - Note any unknowns or risks

### PHASE 3: Document Findings

1. **Create Spike Report**:
   - Save to: `.claude/engineering/spikes/SPIKE-<id>-<short-name>.md`
   - Use template from `.claude/templates/SPIKE.md`

2. **Include**:
   - Question/problem statement
   - Options evaluated
   - Comparison matrix
   - Recommendation with rationale
   - Next steps

3. **GATE: Present findings to user**

### PHASE 4: Decision

1. **User decides** on approach based on findings
2. **If implementation needed** - use `/feature` or appropriate workflow

## Output

Spike produces a **decision document**, not code. Any POC code is throwaway.

## Abort Workflow

User can say "abort" or "cancel" at any time to exit this workflow.
