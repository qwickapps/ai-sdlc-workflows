# Satisfactory Criteria

**When to apply:** Before marking any task as complete or presenting final deliverables.

---

## Core Principle

**Work is satisfactory when it meets all quality criteria, not just when the task is done.**

Completion is not satisfaction. Satisfactory means:
- Specific and actionable
- Evidence-based
- Sufficiently deep
- Complete or gaps documented

---

## Universal Satisfactory Criteria

ALL work must meet these five criteria:

### 1. Specificity

Work is specific when:
- No vague statements ("may need", "possibly", "approximately")
- Quantities are exact ("29 plugins" not "around 20-30")
- Items are individually identified, not grouped
- Concrete examples provided for all claims
- Recommendations are actionable, not theoretical

**Check:**
- [ ] No hedging language without explanation
- [ ] All quantities are exact counts
- [ ] All items enumerated or documented why not
- [ ] Examples are concrete with file:line references

**Examples:**

**Not Specific:**
```
Several plugins may need attention. The hooks might break.
Approximately 20-30 items to check.
```

**Specific:**
```
29 plugins installed (package.json:65-107).
2 critical risk: cordova-universal-links (no Scene API), safariviewcontroller (unmaintained).
Hook breaks at after_prepare_ios.js:4,6,10,45 (references undefined project variable).
```

---

### 2. Evidence-Based Claims

All claims must have:
- Source (file path with line number, URL, command output)
- Evidence (code quote, documentation quote, test result)
- Verification method (how was this checked?)
- Version/date context when relevant

**Check:**
- [ ] Every factual claim has a source
- [ ] File references include line numbers
- [ ] URLs are complete and accessible
- [ ] Verification method is documented
- [ ] No assumptions presented as facts

**Examples:**

**Not Evidence-Based:**
```
Universal links probably won't work. The plugin is old.
```

**Evidence-Based:**
```
Universal links will not work with cordova-ios 8.
Source: AppDelegate+CULPlugin.m:17-29
Evidence: Implements only application:continueUserActivity:restorationHandler
Missing: No scene:openURLContexts or scene:willConnectTo:options methods
Verification: Source code inspection of installed plugin
Plugin age: Last updated 2018 (GitHub repository archived Oct 1, 2018)
Source: https://github.com/nordnet/cordova-universal-links-plugin
```

---

### 3. Actionability

Work is actionable when:
- Clear next steps based on actual findings
- Recommendations are concrete (not "investigate more")
- Decisions can be made from the information
- No placeholder recommendations

**Check:**
- [ ] Next steps are specific actions
- [ ] Each action has estimated effort
- [ ] Decisions are supported by findings
- [ ] No "TBD" or "requires investigation" without specifics

**Examples:**

**Not Actionable:**
```
Further investigation needed. Test the plugins.
Address compatibility issues.
```

**Actionable:**
```
Required actions:
1. Update hooks/postinstall.js:13 - change 7.1.x to 8.0.x (5 minutes)
2. Update hooks/after_prepare_ios.js:4,6,10,45 - hardcode project='App' (1 hour)
3. Rewrite universal links plugin to support Scene API (5-8 days)
4. Test 7 @zeyt plugins individually (3-5 days, checklist in test plan)

Decision point: Proceed with migration or defer?
Required for decision: Review findings, confirm resource availability (2 developers, 6-7 weeks)
```

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

**Examples:**

**Not Complete:**
```
Checked most plugins. Some issues found.
```

**Complete:**
```
All 29 plugins assessed:
- 9 Apache: Verified compatible (release announcements)
- 7 @zeyt: Verified from local source (plugin.xml inspection)
- 13 community: Individual assessment (see matrix)

Gaps: None - all plugins individually verified or tested

OR if incomplete:

18 of 29 plugins assessed (time-boxed to 4 hours).
Remaining 11 plugins: Need 3 additional hours
Reason incomplete: Time constraint
Impact: Medium confidence in overall assessment
Next step: Investigate remaining 11 plugins
```

---

### 5. Investigation Depth

Work has sufficient depth when:
- Critical areas: Deep investigation (code inspection, tracing)
- Medium areas: Medium investigation (docs, configs)
- Low priority: Shallow acceptable if documented
- No dead-ends without alternative attempts

**Check:**
- [ ] Critical items: Inspected actual code, not just file names
- [ ] Dependencies: Checked repos, changelogs, issues, compatibility
- [ ] Integration points: Traced through actual code
- [ ] Alternatives attempted when initial approach failed

**Examples:**

**Insufficient Depth:**
```
Found 29 plugins in package.json.
@zeyt plugins not on public npm - cannot verify.
```

**Sufficient Depth:**
```
Found 29 plugins in package.json:65-107 (deep: read file, counted exact lines).

@zeyt plugins investigation:
- Public npm search: Not found (initial dead-end)
- Alternative: Read installed plugin files
- Found: Plugins installed in .hybrid/kronos/plugins/
- Inspected: Each plugin.xml for origin and engine requirements
- Result: @zeyt/cordova-universal-links is actually e-imaxina/cordova-plugin-deeplinks
Evidence: plugin.xml:13 shows repo URL
```

---

## Task-Specific Satisfactory Criteria

### Spike Reports

Spike is satisfactory when:

1. **Question Answered:**
   - [ ] Original question clearly stated
   - [ ] Answer is definitive or qualified with evidence
   - [ ] Options evaluated with concrete data
   - [ ] Recommendation supported by findings

2. **Evidence Complete:**
   - [ ] All claims verified with sources
   - [ ] All code references include file:line
   - [ ] All unknowns explain WHY unknowable
   - [ ] Fact-check report included

3. **Actionable Output:**
   - [ ] Decision criteria clearly defined
   - [ ] Next steps are specific and estimated
   - [ ] Risks identified with mitigation
   - [ ] No placeholders or "TBD"

4. **Satisfactory Criteria Met:**
   - [ ] All five universal criteria pass
   - [ ] Thoroughness assessment: Medium or Deep
   - [ ] Iteration gate checks passed
   - [ ] User can make informed decision

**Related:** See SPIKE.md template section 7 for detailed criteria.

---

### Feature Designs

Design is satisfactory when:

1. **Specificity:**
   - [ ] Components identified with actual file paths
   - [ ] APIs defined with signatures and data types
   - [ ] Integration points traced through code
   - [ ] Examples are concrete, not theoretical

2. **Evidence-Based:**
   - [ ] Existing patterns verified in codebase
   - [ ] Dependency compatibility checked
   - [ ] Performance claims have benchmarks or citations
   - [ ] All architectural decisions supported by facts

3. **Completeness:**
   - [ ] All identified components designed
   - [ ] All integration points documented
   - [ ] All edge cases considered
   - [ ] All dependencies checked

---

### Code Reviews

Review is satisfactory when:

1. **Specific Findings:**
   - [ ] Issues cite exact file:line locations
   - [ ] Suggested fixes are concrete
   - [ ] Examples of good/bad code provided
   - [ ] Impact assessment for each issue

2. **Evidence-Based:**
   - [ ] Security claims verified with actual code
   - [ ] Performance issues demonstrated
   - [ ] Best practice violations cited with references
   - [ ] Patterns verified in codebase

3. **Actionable:**
   - [ ] Each issue has fix recommendation
   - [ ] Prioritized (blocking, high, medium, low)
   - [ ] Examples of correct implementation provided
   - [ ] No vague "needs improvement"

---

### Bug Investigations

Bug investigation is satisfactory when:

1. **Root Cause Identified:**
   - [ ] Specific line causing bug (file:line)
   - [ ] Why it happens (mechanism explained)
   - [ ] When it happens (reproduction steps)
   - [ ] Evidence from logs/tests

2. **Fix Defined:**
   - [ ] Concrete fix proposed
   - [ ] Why fix works (explanation)
   - [ ] Edge cases considered
   - [ ] Testing plan included

3. **Impact Assessed:**
   - [ ] Affected users/scenarios identified
   - [ ] Workarounds documented if applicable
   - [ ] Regression risk evaluated
   - [ ] Related bugs checked

---

## Self-Assessment Checklist

Before marking work as complete, check:

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

---

## When Work is NOT Satisfactory

Red flags indicating unsatisfactory work:

**Vague Language:**
- "Several items need checking"
- "Around 20 plugins"
- "May need updates"
- "Possibly incompatible"

**Lack of Evidence:**
- Claims without sources
- File names without line numbers
- "Should work" without verification
- Assumptions as facts

**Not Actionable:**
- "Requires further investigation" (what specifically?)
- "Test the components" (which? how?)
- "Address issues" (what issues? how?)

**Incomplete:**
- "Checked most plugins" (which? what about rest?)
- "Some problems found" (what? where?)
- Gaps not documented

**Shallow:**
- Only checked file names, not contents
- Only searched public, not local
- Only read docs, not code
- Dead-end without pivot

**If any red flags present:** Iterate to fix before proceeding.

---

## Confidence Levels

Work can be satisfactory even with unknowns, if confidence is documented:

**High Confidence (80-100%):**
- Critical areas deeply investigated
- Multiple sources verify findings
- Testing confirms claims
- Few/no unknowns

**Medium Confidence (50-80%):**
- Most areas investigated
- Some items time-boxed
- Documented limitations
- Moderate unknowns

**Low Confidence (<50%):**
- Limited investigation
- Many unknowns
- Cannot verify key claims
- Requires significant additional work

**Document confidence level and justify it.**

Even low confidence can be satisfactory if:
- Limitations clearly stated
- User aware of constraints
- Next steps to increase confidence defined

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
