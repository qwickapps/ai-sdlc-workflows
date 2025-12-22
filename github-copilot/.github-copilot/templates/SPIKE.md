# Spike Report

## SPIKE-{ID}: {Investigation Topic}

| Field | Value |
|-------|-------|
| Status | In Progress / Completed |
| Author | {name} |
| Date | {YYYY-MM-DD} |
| Time Box | {X hours/days} |

---

## 1. Problem Statement

### Question(s) to Answer
- {Primary question}
- {Secondary question}

### Context
{Why this investigation is needed}

### Success Criteria
{What constitutes a successful spike - what knowledge do we need?}

## 2. Options Evaluated

### Option A: {Name}

**Description**: {What this option entails}

**Pros**:
- {Pro 1}
- {Pro 2}

**Cons**:
- {Con 1}
- {Con 2}

**Risk Level**: {Low/Medium/High}

**NOTE**: Effort estimates should be in a separate ESTIMATION.md document, not embedded in spike reports.

### Option B: {Name}

**Description**: {What this option entails}

**Pros**:
- {Pro 1}
- {Pro 2}

**Cons**:
- {Con 1}
- {Con 2}

**Risk Level**: {Low/Medium/High}

**NOTE**: Effort estimates should be in a separate ESTIMATION.md document, not embedded in spike reports.

### Option C: {Name} (if applicable)

{Same structure}

## 3. Comparison Matrix

| Criteria | Weight | Option A | Option B | Option C |
|----------|--------|----------|----------|----------|
| {Criterion 1} | {1-5} | {score} | {score} | {score} |
| {Criterion 2} | {1-5} | {score} | {score} | {score} |
| {Criterion 3} | {1-5} | {score} | {score} | {score} |
| **Weighted Total** | | {total} | {total} | {total} |

### Scoring Key
- 5: Excellent
- 4: Good
- 3: Acceptable
- 2: Poor
- 1: Unacceptable

## 4. POC Findings (if applicable)

### What was built
{Description of prototype/POC}

### Results
{What we learned from the POC}

### Code location
{Path to POC code, if any - note: POC code is throwaway}

## 5. Recommendation

### Recommended Option: {Option X}

### Rationale
{Why this option is recommended}

### Risks & Mitigations
| Risk | Mitigation |
|------|------------|
| {risk} | {mitigation} |

## 6. Unknowns & Assumptions

### Remaining Unknowns
- {Unknown 1 - with WHY it's unknowable}
- {Unknown 2 - with WHY it's unknowable}

### Assumptions Made
- {Assumption 1}
- {Assumption 2}

## 7. Satisfactory Criteria Check

This spike is considered satisfactory when it meets all the following criteria:

### Specificity
- [ ] No vague statements like "may need", "possibly", "approximately" without specific evidence
- [ ] All components/dependencies individually identified (not grouped as "X items need checking")
- [ ] Concrete examples provided for all claims

**Evidence**:
{How this criterion was met - point to specific sections with concrete findings}

### Evidence-Based Claims
- [ ] All claims backed by file paths, line numbers, URLs, or test results
- [ ] All code references include actual file locations
- [ ] All external claims include version numbers and sources
- [ ] No assumptions presented as facts

**Evidence**:
{List key claims and their supporting evidence}

### Actionability
- [ ] Clear, specific next steps based on actual findings
- [ ] Recommendations include concrete actions (not "investigate more")
- [ ] Decision criteria clearly defined
- [ ] No placeholder recommendations

**Evidence**:
{Point to Next Steps section showing concrete actions}

### Completeness
- [ ] All identified areas investigated or gaps explicitly documented
- [ ] All options evaluated against stated criteria
- [ ] All risks identified with specific evidence
- [ ] Comparison matrix includes actual data (not estimates or guesses)

**Evidence**:
{List areas covered and any documented gaps}

### Investigation Depth
- [ ] Critical dependencies checked individually (repos, changelogs, issues, code)
- [ ] Integration points traced through actual code
- [ ] Options validated with actual data (not theoretical assessment)
- [ ] At least {Medium/Deep} thoroughness rating in fact-check report

**Evidence**:
{Reference to fact-check report thoroughness assessment}

---

**Overall Satisfactory Assessment**: {YES / NO / PARTIAL}

**If NO or PARTIAL**: {What needs to be addressed before spike is complete}

## 8. Next Steps

If recommendation is approved:

1. {Next step 1}
2. {Next step 2}
3. {Next step 3}

### Related Documents
- **Fact Check Report**: `.claude/engineering/fact-checks/FACT-{ID}.md` (REQUIRED)
- **Estimation**: `.claude/engineering/estimates/ESTIMATE-{ID}.md` (if requested - separate from spike)
- FRD: {if this leads to a feature}
- Design: {if design work needed}

---

## Decision Record

| Date | Decision Maker | Decision |
|------|----------------|----------|
| {date} | {name} | {Approved Option X / Rejected / More investigation needed} |

---

## Important Notes

1. **Estimation is separate**: Do NOT embed time/effort estimates in this spike report. Create a separate ESTIMATION.md document with confidence levels and three-point estimates.

2. **Fact verification required**: Every spike MUST have an accompanying FACT-{ID}.md report that verifies all claims and assesses investigation thoroughness.

3. **Satisfactory criteria must be met**: The spike is not complete until all satisfactory criteria are checked and verified.

4. **POC code is throwaway**: Any proof-of-concept code created during the spike should not be used in production. Implementation should follow the feature workflow.
