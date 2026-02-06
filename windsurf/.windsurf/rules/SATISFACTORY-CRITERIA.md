# Satisfactory Criteria

**When to apply:** Before marking any task as complete or presenting final deliverables.

---

## Core Principle

**Work is satisfactory when it meets all quality criteria, not just when the task is done.**

Completion ≠ Satisfaction. Satisfactory means:
- Specific and actionable
- Evidence-based
- Sufficiently deep
- Complete or gaps documented

**Reference:** See COMMON-PATTERNS.md for evidence requirements, confidence levels, and checklist usage.

---

## Universal Satisfactory Criteria

ALL work must meet these five criteria:

### 1. Specificity

Work is specific when:
- No vague statements ("may need", "possibly", "approximately")
- Quantities are exact ("29 plugins" not "around 20-30")
- Items individually identified, not grouped
- Concrete examples with file:line references
- Recommendations actionable, not theoretical

**Check:**
- [ ] No hedging language without explanation
- [ ] All quantities are exact counts
- [ ] All items enumerated or documented why not
- [ ] Examples are concrete with file:line refs

**Example:**
❌ "Several plugins may need attention. Approximately 20-30 items."
✅ "29 plugins installed (package.json:65-107). 2 critical risk: cordova-universal-links, safariviewcontroller."

---

### 2. Evidence-Based Claims

All claims must have:
- Source (file:line, URL, command output)
- Evidence (code quote, documentation quote, test result)
- Verification method (how checked)
- Version/date context when relevant

**Check:**
- [ ] Every factual claim has a source
- [ ] File references include line numbers
- [ ] URLs complete and accessible
- [ ] Verification method documented
- [ ] No assumptions as facts

**Reference:** See COMMON-PATTERNS.md § Evidence Requirements for detailed standards and FACT-VERIFICATION.md for verification methods.

---

### 3. Actionability

Work is actionable when:
- Clear next steps based on actual findings
- Recommendations concrete (not "investigate more")
- Decisions can be made from information
- No placeholder recommendations

**Check:**
- [ ] Next steps are specific actions
- [ ] Each action has effort estimate
- [ ] Decisions supported by findings
- [ ] No "TBD" without specifics

**Example:**
❌ "Further investigation needed. Test the plugins."
✅ "Required: 1) Update postinstall.js:13 (5 min), 2) Rewrite universal links plugin (5-8 days), 3) Test @zeyt plugins (3-5 days)"

---

### 4. Completeness

Work is complete when:
- All identified areas investigated OR gaps documented
- All options evaluated OR constraints documented
- All risks identified with evidence
- No important items left as "TBD"

**Check:**
- [ ] Scope fully covered or gaps explicitly stated
- [ ] Each gap explains why incomplete
- [ ] Each gap includes what's needed to complete
- [ ] No silent omissions

**Example:**
❌ "Checked most plugins. Some issues found."
✅ "All 29 plugins assessed. 9 Apache verified, 7 @zeyt verified from local source, 13 community individually assessed. Gaps: None."

---

### 5. Investigation Depth

Work has sufficient depth when:
- Critical areas: Deep investigation (code inspection, tracing)
- Medium areas: Medium investigation (docs, configs)
- Low priority: Shallow acceptable if documented
- No dead-ends without alternative attempts

**Check:**
- [ ] Critical items: Inspected actual code, not just file names
- [ ] Dependencies: Checked repos, changelogs, compatibility
- [ ] Integration points: Traced through actual code
- [ ] Alternatives attempted when initial approach failed

**Reference:** See RESEARCH-DEPTH.md for depth level definitions and INVESTIGATION-METHODS.md for method checklist.

---

## Task-Specific Criteria

### Spike Reports

- [ ] Original question clearly stated
- [ ] Answer definitive or qualified with evidence
- [ ] Options evaluated with concrete data
- [ ] Recommendation supported by findings
- [ ] All claims verified with sources
- [ ] All code refs include file:line
- [ ] Unknowns explain WHY unknowable
- [ ] Decision criteria clearly defined
- [ ] Next steps specific and estimated
- [ ] No placeholders or "TBD"

### Feature Designs

- [ ] Components identified with actual file paths
- [ ] APIs defined with signatures and types
- [ ] Integration points traced through code
- [ ] Examples concrete, not theoretical
- [ ] Existing patterns verified in codebase
- [ ] Dependency compatibility checked
- [ ] All identified components designed
- [ ] All edge cases considered

### Code Reviews

- [ ] Issues cite exact file:line locations
- [ ] Suggested fixes are concrete
- [ ] Examples of good/bad code provided
- [ ] Impact assessment for each issue
- [ ] Security claims verified with code
- [ ] Each issue has fix recommendation
- [ ] Prioritized (blocking, high, medium, low)

### Bug Investigations

- [ ] Specific line causing bug (file:line)
- [ ] Why it happens (mechanism explained)
- [ ] When it happens (reproduction steps)
- [ ] Evidence from logs/tests
- [ ] Concrete fix proposed
- [ ] Why fix works explained
- [ ] Edge cases considered
- [ ] Testing plan included

---

## When Work is NOT Satisfactory

**Red flags:**

**Vague Language:**
- "Several items need checking"
- "Around 20 plugins"
- "May need updates"

**Lack of Evidence:**
- Claims without sources
- File names without line numbers
- "Should work" without verification

**Not Actionable:**
- "Requires further investigation" (what specifically?)
- "Test the components" (which? how?)

**Incomplete:**
- "Checked most plugins" (which? what about rest?)
- Gaps not documented

**Shallow:**
- Only checked file names, not contents
- Only searched public, not local
- Dead-end without pivot

**If any red flags present:** Iterate to fix before proceeding.

**Reference:** See ITERATION-GATES.md for when to iterate vs. proceed.

---

## Confidence Levels

Work can be satisfactory with unknowns if confidence is documented:

**High (80-100%):** Critical areas deeply investigated, testing confirms, few unknowns
**Medium (50-80%):** Most areas investigated, documented limitations, moderate unknowns
**Low (<50%):** Limited investigation, many unknowns, needs significant work

**Document confidence level and justify it.**

Even low confidence can be satisfactory if:
- Limitations clearly stated
- User aware of constraints
- Next steps to increase confidence defined

**Reference:** See COMMON-PATTERNS.md § Confidence Levels for templates.

---

## Self-Assessment Checklist

Before marking work complete:

### Specificity Check
- [ ] Searched for hedging words: "may", "might", "could", "possibly"
- [ ] Replaced with specific findings or "unknown because..."
- [ ] All quantities are exact counts
- [ ] All items individually identified

### Evidence Check
- [ ] Every claim has file:line or URL
- [ ] Code snippets included where relevant
- [ ] Verification method documented
- [ ] No assumptions as facts

### Actionability Check
- [ ] Next steps are concrete actions
- [ ] Each has effort estimate
- [ ] No "investigate more" without specifics
- [ ] User can make decision

### Completeness Check
- [ ] All scope items addressed
- [ ] Gaps explicitly documented with reason
- [ ] Unknowns explain why unknowable
- [ ] No silent omissions

### Depth Check
- [ ] Critical areas deeply investigated
- [ ] Not just file listings - actual code read
- [ ] Dead-ends pivoted to alternatives
- [ ] Thoroughness rated and justified

**If any fails:** Iterate before proceeding.

**Reference:** See COMMON-PATTERNS.md § Quality Self-Check for comprehensive checklist.

---

## Final Self-Check

Before presenting any deliverable:

1. **Read your own work** - Would you be satisfied receiving this?
2. **Check each criterion** - Specificity, evidence, actionability, completeness, depth
3. **Verify sources** - Can you find each file:line, URL?
4. **Test actions** - Are next steps clear enough to execute?
5. **Count unknowns** - Documented with WHY unknowable?

**If you wouldn't be satisfied receiving this work, it's not satisfactory.**

Iterate until you would be proud to receive it.
