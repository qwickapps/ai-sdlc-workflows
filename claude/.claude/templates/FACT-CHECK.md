# Fact Verification Report: {ID}

**Date:** {DATE}
**Artifact:** {DOCUMENT/REPORT BEING VERIFIED}
**Verifier:** {AGENT TYPE}

## Claims Verified

| # | Claim | Source | Verification Method | Status | Notes |
|---|-------|--------|---------------------|--------|-------|
| 1 | {Statement of fact} | {File/Doc/External} | {Code search/API check/Test run} | ✓/✗ | {Details} |

## Verification Methods Used

- [ ] Code search and inspection
- [ ] API documentation review
- [ ] Test execution
- [ ] External documentation verification
- [ ] Codebase pattern analysis

## Unverified Claims

List any claims that could not be verified with available methods:

1. {Claim} - Reason: {Why it couldn't be verified}

## Investigation Thoroughness Assessment

This section evaluates the depth of investigation performed, not just factual accuracy.

### Thoroughness by Area

| Area | Thoroughness Rating | Evidence of Investigation | Gaps Identified |
|------|---------------------|--------------------------|-----------------|
| {Area 1: e.g., "Plugin Ecosystem"} | {Shallow/Medium/Deep} | {What was actually checked: repos, changelogs, code, issues} | {What was missing} |
| {Area 2: e.g., "Integration Points"} | {Shallow/Medium/Deep} | {What was actually checked} | {What was missing} |
| {Area 3} | {Shallow/Medium/Deep} | {What was actually checked} | {What was missing} |

### Thoroughness Definitions

- **Deep**: Inspected actual source code, checked repositories/changelogs, traced data flows, verified with specific file paths/line numbers/URLs
- **Medium**: Checked some sources (e.g., package versions, documentation) but didn't inspect actual code or trace flows
- **Shallow**: Relied on file/package listings, made assumptions without verification, used vague language ("may need", "possibly")

### Overall Thoroughness Assessment

**Rating**: {Shallow / Medium / Deep}

**Critical Areas Needing Deeper Investigation**:
- {Area 1}: {Why deeper investigation needed}
- {Area 2}: {Why deeper investigation needed}

**Satisfactory Investigation Areas**:
- {Area 1}: {Why investigation was sufficient}
- {Area 2}: {Why investigation was sufficient}

## Recommendations

### Must Fix
- {Critical inaccuracies requiring correction}

### Should Clarify
- {Ambiguous statements needing qualification}

## Sign-off

**Verification Complete:** {YES/NO}
**Approved for use:** {YES/NO/CONDITIONAL}
**Conditions:** {Any conditions if conditional approval}

---

## Verification Checklist

### Factual Accuracy
- [ ] All factual claims have supporting evidence
- [ ] No assumptions presented as facts
- [ ] All code references include file paths and line numbers
- [ ] All external references include URLs or version numbers
- [ ] Ambiguities are explicitly noted as such

### Investigation Thoroughness
- [ ] Critical areas investigated deeply (actual code inspection, not just listings)
- [ ] Dependencies checked for compatibility (repos, changelogs, issues)
- [ ] Integration points traced through actual code
- [ ] No vague placeholder language without evidence ("may need", "approximately X items")
- [ ] Unknowns documented with WHY they're unknowable (not just marked "unknown")
