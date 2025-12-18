# Iteration Gates

**When to apply:** During spike investigations, feature development, and any task requiring iteration to reach satisfactory quality.

---

## Core Principle

**Loop back to improve incomplete or shallow work. Do not proceed with unsatisfactory output.**

Iteration is expected. First attempts are often incomplete. The goal is satisfactory work, not fast work.

---

## When to Iterate (Loop Back)

### Completeness Gate

Iterate if ANY of these are true:

- [ ] Identified items not individually investigated (e.g., "X plugins may need attention")
- [ ] Claims lack specific evidence (file paths, line numbers, URLs)
- [ ] "Unknown" items don't explain WHY they're unknowable
- [ ] Vague placeholder language present ("may need", "possibly", "approximately")
- [ ] Critical dependencies grouped instead of assessed individually
- [ ] Investigation methods available but not attempted

**Action:** Return to investigation phase, address gaps, re-check gate.

### Evidence Gate

Iterate if ANY of these are true:

- [ ] Claims without sources
- [ ] File references without line numbers
- [ ] Code behavior without verification
- [ ] Compatibility claims without checking actual requirements
- [ ] "Should work" or "likely compatible" without evidence
- [ ] Assumptions presented as facts

**Action:** Gather evidence for each claim, document sources, re-check gate.

### Depth Gate

Iterate if ANY of these are true:

- [ ] Only checked public sources (didn't check local code)
- [ ] Read file names but not file contents
- [ ] Listed packages but didn't inspect configuration
- [ ] Found plugin name but didn't check implementation
- [ ] Saw error but didn't trace root cause
- [ ] Shallow investigation rated for critical areas

**Action:** Perform deeper investigation, read actual code, trace paths, re-check gate.

---

## When to Proceed (Don't Iterate)

Proceed if ALL of these are true:

- [x] All identified items individually investigated or gaps documented with reason
- [x] All claims have specific evidence (file:line or URL)
- [x] All "unknown" items explain WHY unknowable and what's needed to know
- [x] No vague language - all statements specific and concrete
- [x] Critical areas investigated deeply (code inspection, not just listings)
- [x] All available investigation methods attempted or documented why not

---

## Maximum Iterations

**Limit: 3 iterations per task**

This prevents infinite loops while ensuring quality.

### Iteration Counter

Track which iteration you're on:

- **Iteration 1:** Initial investigation
- **Iteration 2:** Address gaps from first pass
- **Iteration 3:** Final refinement

### After 3 Iterations

If still incomplete after 3 iterations:

1. **Document limitations explicitly**
   - What remains incomplete
   - Why it's incomplete
   - What would be needed to complete it

2. **Mark investigation confidence as LOW**
   - Clear statement: "Investigation confidence: LOW"
   - Explain impact of unknowns

3. **Proceed with documented gaps**
   - User is aware of limitations
   - Can make informed decision

4. **Ask user for guidance**
   - Should we continue investigating?
   - Should we proceed despite gaps?
   - Should we defer this task?

**Do NOT:**
- Silently proceed with low quality
- Iterate beyond 3 times without user input
- Fill gaps with assumptions

---

## Iteration Triggers

### Automatic Triggers (MUST Iterate)

These trigger immediate iteration:

1. **Vague quantities without verification**
   - "Around 20 items" → Count exactly
   - "Several files" → List each file
   - "Multiple plugins" → Enumerate all plugins

2. **Grouped items not individually assessed**
   - "20 plugins may need checking" → Check each one
   - "Files in this directory" → Inspect each file
   - "Dependencies need updating" → Check each dependency

3. **Claims without evidence**
   - "This will break" → Show why (code, docs, testing)
   - "Plugin is compatible" → Verify (engine requirements, source)
   - "Last updated 2020" → Provide source (GitHub, npm)

4. **Investigation dead-end without pivot**
   - "Not found on npm" → Check local installation
   - "Documentation unavailable" → Read source code
   - "GitHub search failed" → Try alternative searches

### User-Triggered Iteration

User may request iteration:

- "Investigate more deeply"
- "Check those plugins individually"
- "Provide more specific information"
- "Verify that claim"

**Response:** Iterate immediately, thank user for feedback.

---

## Iteration Process

### Step 1: Identify Gaps

Review your work against gates:
- What's incomplete?
- What lacks evidence?
- What's too shallow?
- What's vague?

Document specific gaps:
```
Gaps identified:
1. Listed 29 plugins but didn't check individual compatibility
2. Said "@zeyt plugins cannot verify" without checking local source
3. No line numbers for hook breakages
4. "May need testing" without specific test plan
```

### Step 2: Plan Iteration

For each gap, plan how to address:
```
Iteration plan:
1. Read each plugin's plugin.xml for engine requirements
2. Check installed @zeyt plugin source code
3. Re-read hook files, document exact line numbers
4. Define specific tests for each "may need testing" item
```

### Step 3: Execute Iteration

- Go back to investigation phase
- Use deeper investigation methods
- Gather missing evidence
- Document findings with sources

### Step 4: Re-Check Gates

After iteration, check gates again:
- Are gaps addressed?
- Is evidence complete?
- Is depth sufficient?
- Is language specific?

If gates still fail, iterate again (up to max 3).

---

## Iteration Documentation

Track iterations in your work:

```
## Investigation History

**Iteration 1:**
- Initial investigation: Checked public npm, found 29 plugins
- Gaps: Didn't check individual plugin compatibility
- Outcome: Incomplete - iterate

**Iteration 2:**
- Deep dive: Read all plugin.xml files, checked engine requirements
- Gaps: @zeyt plugins marked "unknown" without checking local source
- Outcome: Partial - iterate

**Iteration 3:**
- Source inspection: Read installed @zeyt plugin files
- Gaps: None - all items investigated or documented why unknowable
- Outcome: Complete - proceed
```

---

## Examples

### Example 1: Plugin Assessment

**Iteration 1 (Incomplete):**
```
Found 29 plugins. About 20 may need compatibility checking.
```

**Gate Check:** FAIL - Vague quantity, not individually assessed

**Iteration 2 (Better):**
```
29 plugins total:
- 9 official Apache (need verification)
- 20 others (need checking)
```

**Gate Check:** FAIL - Still not individually assessed, no evidence

**Iteration 3 (Satisfactory):**
```
29 plugins individually assessed:
- 9 Apache plugins: Verified compatible (release announcements dated Nov 2024)
- 7 @zeyt plugins: Verified from local source (plugin.xml engine tags)
- 13 community: Each checked individually (details in matrix)

Evidence: See plugin matrix with source references for each.
```

**Gate Check:** PASS - All plugins individually verified with evidence

---

### Example 2: Hook Analysis

**Iteration 1 (Incomplete):**
```
Hooks reference project name and will break.
```

**Gate Check:** FAIL - No file paths, no line numbers, vague

**Iteration 2 (Better):**
```
File: hooks/after_prepare_ios.js
Problem: References project variable
```

**Gate Check:** FAIL - No line numbers, no evidence of what breaks

**Iteration 3 (Satisfactory):**
```
File: hooks/after_prepare_ios.js
Line 4: var project = process.env.project (will be undefined)
Line 6: var PROJECT_HOME = platforms/ios/${project} (wrong path)
Line 10: var xml = fs.readFileSync(${PROJECT_HOME}/${project}-Info.plist) (file not found)
Line 45: fs.writeFileSync(${PROJECT_HOME}/${project}-Info.plist) (file not found)

Evidence: Read entire file, identified 4 breakage points
Impact: Hook fails, plist not updated
Fix required: Hardcode project = 'App'
```

**Gate Check:** PASS - Specific lines, evidence, impact documented

---

## Completeness Checklist

Before claiming work is complete:

### Investigation Completeness
- [ ] All items from scope individually addressed
- [ ] No vague quantities ("around X", "several", "multiple")
- [ ] No grouped assessments ("20 items need checking")
- [ ] All available investigation methods tried
- [ ] All dead-ends pivoted to alternatives

### Evidence Completeness
- [ ] Every claim has a source (file:line or URL)
- [ ] File references include line numbers
- [ ] Version numbers include dates
- [ ] Code quotes include context
- [ ] Verification methods documented

### Depth Completeness
- [ ] Critical areas: Deep investigation (code inspection)
- [ ] Medium areas: Medium investigation (docs + configs)
- [ ] Low priority: Shallow acceptable if documented
- [ ] No "may need" without specific verification plan

### Documentation Completeness
- [ ] Unknowns explain WHY unknowable
- [ ] Limitations clearly stated
- [ ] Next steps are specific and actionable
- [ ] Assumptions explicitly marked

**If ANY checkbox fails:** Iterate to address the gap.

---

## Time-Boxing vs Iteration

### When to Time-Box

Time-boxing is appropriate when:
- Investigation scope is unbounded
- Diminishing returns on further research
- User needs preliminary findings quickly

**How to time-box:**
1. Set time limit upfront (e.g., "4 hours max")
2. Investigate as deeply as possible within limit
3. Document what was covered and what wasn't
4. Mark confidence level based on coverage
5. Provide specific "next steps" for continued investigation

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
Next steps: Investigate remaining 12 plugins (4 hours estimated)
```

### Time-Box vs Quality Gate

**Time-boxing does NOT override quality gates.**

Even within time limit:
- Items covered must be investigated deeply
- Evidence still required
- No vague statements for covered items
- Document what wasn't covered (don't hide it)

**It's better to deeply investigate 10 items than shallowly investigate 20.**

---

## Self-Check Before Moving On

Before proceeding from investigation to documentation:

- [ ] Attempted iteration at least once
- [ ] All completeness gates pass OR gaps documented
- [ ] Evidence gathered for all claims
- [ ] Deep investigation for critical areas
- [ ] Iteration count tracked (≤3)
- [ ] If 3 iterations reached, limitations documented

If any fails, iterate or document why proceeding anyway.
