# Iteration Gates

**When to apply:** During spike investigations, feature development, and any task requiring iteration to reach satisfactory quality.

---

## Core Principle

**Loop back to improve incomplete or shallow work. Do not proceed with unsatisfactory output.**

Iteration is expected. First attempts are often incomplete. The goal is satisfactory work, not fast work.

**Reference:** See COMMON-PATTERNS.md for gate decision logic and SATISFACTORY-CRITERIA.md for quality standards.

---

## When to Iterate (Loop Back)

### Completeness Gate

Iterate if ANY true:
- [ ] Items not individually investigated ("X plugins may need attention")
- [ ] Claims lack specific evidence (file:line, URLs)
- [ ] "Unknown" items don't explain WHY unknowable
- [ ] Vague placeholder language ("may need", "possibly", "approximately")
- [ ] Critical dependencies grouped not assessed individually
- [ ] Investigation methods available but not attempted

**Action:** Return to investigation, address gaps, re-check gate.

### Evidence Gate

Iterate if ANY true:
- [ ] Claims without sources
- [ ] File refs without line numbers
- [ ] Code behavior without verification
- [ ] Compatibility claims without checking requirements
- [ ] "Should work" without evidence
- [ ] Assumptions presented as facts

**Action:** Gather evidence, document sources, re-check gate.

**Reference:** See FACT-VERIFICATION.md for verification standards.

### Depth Gate

Iterate if ANY true:
- [ ] Only checked public sources (didn't check local)
- [ ] Read file names not contents
- [ ] Listed packages didn't inspect configuration
- [ ] Found plugin name didn't check implementation
- [ ] Saw error didn't trace root cause
- [ ] Shallow investigation for critical areas

**Action:** Deeper investigation, read code, trace paths, re-check gate.

**Reference:** See RESEARCH-DEPTH.md for depth levels and INVESTIGATION-METHODS.md for method hierarchy.

---

## When to Proceed (Don't Iterate)

Proceed if ALL true:
- [x] All items individually investigated or gaps documented with reason
- [x] All claims have specific evidence (file:line or URL)
- [x] All "unknown" items explain WHY unknowable and what's needed
- [x] No vague language - all statements specific
- [x] Critical areas deeply investigated (code inspection)
- [x] All available methods attempted or documented why not

---

## Maximum Iterations

**Limit: 3 iterations per task**

Prevents infinite loops while ensuring quality.

### Iteration Counter

- **Iteration 1:** Initial investigation
- **Iteration 2:** Address gaps from first pass
- **Iteration 3:** Final refinement

### After 3 Iterations

If still incomplete:

1. **Document limitations explicitly**
   - What remains incomplete
   - Why it's incomplete
   - What would complete it

2. **Mark confidence as LOW**
   - Statement: "Investigation confidence: LOW"
   - Explain impact of unknowns

3. **Proceed with documented gaps**
   - User aware of limitations
   - Can make informed decision

4. **Ask user for guidance**
   - Continue investigating?
   - Proceed despite gaps?
   - Defer this task?

**Do NOT:**
- Silently proceed with low quality
- Iterate beyond 3 without user input
- Fill gaps with assumptions

**Reference:** See COMMUNICATION-PROTOCOL.md for how to present blockers.

---

## Iteration Triggers

### Automatic Triggers (MUST Iterate)

1. **Vague quantities without verification**
   - "Around 20 items" → Count exactly
   - "Several files" → List each
   - "Multiple plugins" → Enumerate all

2. **Grouped items not individually assessed**
   - "20 plugins may need checking" → Check each
   - "Files in directory" → Inspect each
   - "Dependencies need updating" → Check each

3. **Claims without evidence**
   - "This will break" → Show why (code, docs, testing)
   - "Plugin compatible" → Verify (engine requirements, source)
   - "Last updated 2020" → Provide source

4. **Investigation dead-end without pivot**
   - "Not found on npm" → Check local installation
   - "Documentation unavailable" → Read source code
   - "GitHub search failed" → Try alternative searches

**Reference:** See INVESTIGATION-METHODS.md for exhaustiveness checklist.

### User-Triggered Iteration

User may request:
- "Investigate more deeply"
- "Check those plugins individually"
- "Provide more specific information"
- "Verify that claim"

**Response:** Iterate immediately, thank user for feedback.

---

## Iteration Process

### Step 1: Identify Gaps

Review work against gates:
- What's incomplete?
- What lacks evidence?
- What's too shallow?
- What's vague?

### Step 2: Plan Iteration

For each gap, plan how to address it.

### Step 3: Execute Iteration

- Go back to investigation
- Use deeper methods
- Gather missing evidence
- Document findings with sources

### Step 4: Re-Check Gates

After iteration, check gates again. If still fail, iterate again (up to max 3).

---

## Iteration Documentation

Track iterations in work:

```markdown
## Investigation History

**Iteration 1:**
- Initial investigation: [what done]
- Gaps: [what missing]
- Outcome: Incomplete - iterate

**Iteration 2:**
- Deep dive: [what done]
- Gaps: [what still missing]
- Outcome: Partial - iterate

**Iteration 3:**
- Source inspection: [what done]
- Gaps: None - all investigated
- Outcome: Complete - proceed
```

---

## Time-Boxing vs. Iteration

### When to Time-Box

Appropriate when:
- Investigation scope unbounded
- Diminishing returns
- User needs preliminary findings quickly

**How to time-box:**
1. Set limit upfront ("4 hours max")
2. Investigate deeply within limit
3. Document what covered
4. Document what not covered
5. Mark confidence based on coverage
6. Provide specific next steps

**Example:**
```
Time-boxed to 4 hours. Covered:
- All 9 Apache plugins (complete)
- 5 of 7 @zeyt plugins (complete for these)
- 3 of 13 community plugins (complete for these)

Not covered:
- 2 @zeyt plugins (estimated 1 hour)
- 10 community plugins (estimated 3 hours)

Confidence: Medium (covered 17 of 29 plugins)
Next steps: Investigate remaining 12 plugins (4 hours)
```

### Time-Box vs. Quality Gate

**Time-boxing does NOT override quality gates.**

Even within time limit:
- Items covered must be deeply investigated
- Evidence still required
- No vague statements for covered items
- Document what wasn't covered (don't hide it)

**Better to deeply investigate 10 items than shallowly investigate 20.**

**Reference:** See COMMON-PATTERNS.md § Time-Boxing Pattern for template.

---

## Self-Check Before Moving On

Before proceeding from investigation:

- [ ] Attempted iteration at least once
- [ ] All completeness gates pass OR gaps documented
- [ ] Evidence gathered for all claims
- [ ] Deep investigation for critical areas
- [ ] Iteration count tracked (≤3)
- [ ] If 3 iterations reached, limitations documented

**If any fails:** Iterate or document why proceeding anyway.

**Reference:** See COMMON-PATTERNS.md § Iteration vs. Escalation for decision logic.
