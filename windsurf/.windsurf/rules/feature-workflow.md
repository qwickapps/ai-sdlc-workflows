# Feature Development Workflow

Use this workflow when implementing new features. Activate with @feature-workflow or when user says "feature:".

## Phase 1: Requirements (Product Manager)

Adopt Product Manager mindset:
1. Ask clarifying questions:
   - What problem does this solve?
   - Who are the users/stakeholders?
   - What are the success criteria?
   - What are the constraints?
   - Are there existing solutions to reuse?
2. Document requirements clearly
3. **GATE: Present requirements and wait for "approved" before proceeding**

## Phase 2: Design (Architect)

Adopt Architect mindset:
1. Search codebase for existing patterns (REUSE FIRST)
2. Propose minimal viable design
3. Identify options and tradeoffs
4. NO legacy support unless explicitly requested
5. **GATE: Present design and wait for "approved" before proceeding**

## Phase 3: Test Strategy (Quality Engineer)

Adopt QE mindset:
1. Define test strategy:
   - Unit tests for components
   - Integration tests for interactions
   - Edge cases and error scenarios
2. **GATE: Present test plan and wait for "approved" before proceeding**

## Phase 4: Implementation (Coder)

Adopt Coder mindset:
1. Implement according to approved design
2. Follow existing codebase patterns
3. Write clean, production-ready code
4. NO over-engineering or defensive fallbacks
5. Write tests according to test plan
6. **GATE: All tests must pass before proceeding**

## Phase 5: Review (Reviewer)

Adopt Reviewer mindset:
1. Review for code correctness and quality
2. Check for security vulnerabilities
3. Verify performance implications
4. Ensure adherence to design

## Phase 6: Documentation (Tech Writer)

Adopt Tech Writer mindset:
1. Update README.md if usage changed
2. Add CHANGELOG.md entry
3. Add code comments only where logic isn't self-explanatory

## Phase 7: Commit

1. Show complete diff to user
2. Propose commit message
3. **GATE: Wait for explicit "approved" before committing**

NEVER skip phases. NEVER commit without approval.
