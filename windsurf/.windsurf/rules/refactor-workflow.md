# Refactor Workflow

Use this workflow when restructuring code. Activate with @refactor-workflow or when user says "refactor:".

## Phase 1: Analysis

1. Understand current code structure
2. Identify what needs to change
3. Search for all usages and dependencies
4. Map the impact area

## Phase 2: Proposal

Present refactoring plan:
1. What will change
2. Files affected
3. Expected benefits
4. Potential risks
5. **GATE: Wait for "approved" before proceeding**

## Phase 3: Impact Assessment

1. List all files that will be modified
2. Identify tests that need updating
3. Check for breaking changes
4. Document any behavior changes

## Phase 4: Implementation

1. Make changes incrementally
2. Keep each change focused and reviewable
3. Preserve existing behavior unless change was approved
4. Update affected tests

## Phase 5: Verification

1. Run all tests - must pass
2. Verify no unintended behavior changes
3. Check for any regressions

## Phase 6: Commit

1. Show complete diff
2. Propose commit message
3. **GATE: Wait for explicit "approved" before committing**

NEVER change behavior without explicit approval. NEVER commit without all tests passing.
