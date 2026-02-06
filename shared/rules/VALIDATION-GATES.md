# Validation Gates

**When to apply:** Before marking ANY task as complete, before committing code, before merging PRs.

---

## Core Principle

**Code that compiles and passes tests is NOT automatically complete. Validation must prove the user's actual problem is solved.**

Migration failure example:
- ❌ "Migrations load successfully" → Code runs but fails in production
- ✅ "Migrations execute successfully on clean database" → Actual problem solved

**Reference:** See COMMON-PATTERNS.md for evidence requirements, checklist usage, and gate decision logic.

---

## Mandatory Validation Checklist

Before marking work complete or creating commits, verify ALL applicable gates:

### 1. Compilation/Build Gate

**Required for:** All code changes

- [ ] Code compiles without errors (dev build)
- [ ] Production build succeeds (if different)
- [ ] TypeScript type checks pass (if applicable)
- [ ] No critical warnings

**Commands:** `npm run build`, `npm run build:prod`, `tsc --noEmit`

**Do NOT proceed if:** Build fails or critical warnings appear

---

### 2. Unit Test Gate

**Required for:** Code with testable logic

- [ ] All existing unit tests pass
- [ ] New tests written for new code/fixes
- [ ] Edge cases covered
- [ ] Test coverage maintained/improved

**Commands:** `npm run test`, `npm run test:coverage`

**Do NOT proceed if:** Tests fail or coverage drops significantly

**Note:** Passing tests prove logic works in isolation, NOT end-to-end system functionality.

---

### 3. Integration Test Gate

**Required for:** Multi-component features, database changes, API changes

- [ ] Integration tests pass
- [ ] Database migrations execute on CLEAN database
- [ ] Migrations are idempotent (can run twice safely)
- [ ] API contracts maintained or versioned

**Commands:** `npm run test:integration`, `npm run migrate`

**Critical for migrations:**
- Test on clean database (not manually-modified dev DB)
- Verify idempotency
- Test rollback if applicable

**Do NOT proceed if:** Integration tests fail or migrations fail on clean database

---

### 4. End-to-End Validation Gate

**Required for:** User-facing features, bug fixes, deployment changes

- [ ] Tested in production-like environment (Docker, staging)
- [ ] Full user workflow tested (not just happy path)
- [ ] Error scenarios tested
- [ ] Actual user problem is solved

**How to validate:**

For deployment changes:
```bash
# Use ACTUAL deployment process
.github/scripts/build-workspace-package.sh
docker build -t test .
docker run -p 3000:3000 test
```

For frontend: Test in actual browser (use Chrome automation if needed)
For backend: Test against production-like database

**Do NOT proceed if:** Feature doesn't work in production-like environment or user's actual problem isn't solved

---

### 5. User Vision Validation Gate

**Required for:** ALL work

- [ ] The ACTUAL user problem is solved (not just literal request)
- [ ] Edge cases handled
- [ ] No regressions in related functionality

**Questions to ask:**
1. What was the user trying to achieve?
2. Have I solved their actual problem or just addressed symptoms?
3. Will this work for their use case?
4. What edge cases haven't I considered?

**Do NOT proceed if:** You're not confident the user's actual problem is solved

---

## Before Creating Commit

Run full validation:
```bash
npm run build       # Compilation
npm run test        # Unit tests
npm run lint        # Code quality
```

For deployment changes, add:
```bash
.github/scripts/build-workspace-package.sh
docker build -t test .
docker run -p 3000:3000 test
# Verify startup and basic functionality
```

For database changes, add:
```bash
npm run migrate     # On CLEAN database
npm run migrate     # Again (verify idempotency)
```

---

## Common Validation Mistakes

### 1. Testing Only in Dev

❌ Works on dev machine with dev database → Ship
✅ Works in dev + production build + Docker + clean database → Ship

### 2. Testing Happy Path Only

❌ Feature works when perfect → Ship
✅ Feature works + handles errors + edge cases + recovers from failures → Ship

### 3. Fixing Symptoms vs. Root Cause

❌ Error gone → Ship
✅ Root cause fixed + error gone + tested on clean setup → Ship

### 4. Assuming Tests Cover Everything

❌ Unit tests pass → Ship
✅ Unit + integration + E2E + production-like environment → Ship

---

## When to Skip Gates

Only skip when:
1. **Explicitly not applicable** (docs-only change)
2. **Explicitly approved by user** (document why skipped)

**NEVER skip silently.**

---

## Validation Evidence Template

When presenting work:

```markdown
## Validation Results

**Build:** [Environment, command, result]
**Tests:** [Unit X/Y, Integration X/Y, Coverage %]
**E2E:** [Environment, workflow tested, result, evidence]
**User Vision:** [Original problem, how verified it's fixed, edge cases tested]
```

**See:** VALIDATION-GATES-EXAMPLES.md for detailed examples and environment-specific validation guidance.

---

## Integration with Workflows

All workflows reference this file for validation gates.

**Pattern:**
```markdown
### GATE: Validation

Complete checklist from VALIDATION-GATES.md:
1. Build/compilation: [status]
2. Unit tests: [status]
3. Integration tests: [status]
4. E2E validation: [status]
5. User vision: [status]

Document results before committing.
```

**See:** COMMON-PATTERNS.md § Workflow Integration Template
