# Bug Fix Workflow

Use this workflow when fixing bugs. Activate with @bug-workflow or when user says "bug:".

## Phase 1: Investigation

1. Understand the reported issue
2. Ask clarifying questions if needed:
   - Steps to reproduce?
   - Expected vs actual behavior?
   - When did it start happening?
   - Any recent changes?
3. Reproduce the issue if possible
4. Search codebase for related code

## Phase 2: Root Cause Analysis

1. Identify the actual root cause (not symptoms)
2. Explain what's causing the issue
3. **GATE: Present findings and wait for confirmation before fixing**

## Phase 3: Fix Implementation

1. Implement minimal fix targeting root cause
2. NO workarounds or band-aid fixes
3. NO adding defensive code "just in case"
4. Follow existing codebase patterns

## Phase 4: Regression Test

1. Add test that would have caught this bug
2. Ensure existing tests still pass
3. Test the fix manually if applicable

## Phase 5: Documentation

1. Update CHANGELOG.md with bug fix entry
2. Add code comment explaining the fix if non-obvious

## Phase 6: Commit

1. Show diff to user
2. Propose commit message describing the fix
3. **GATE: Wait for explicit "approved" before committing**

NEVER apply band-aid fixes. NEVER commit without approval.
