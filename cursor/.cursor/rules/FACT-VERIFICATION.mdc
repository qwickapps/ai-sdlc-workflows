# Fact Verification Rules

**When to apply:** Before making any claim in spikes, reports, documentation, or JIRA comments.

---

## Core Principle

**Every factual claim must be verifiable with evidence.**

No assumptions presented as facts. No unverified claims. No "probably" or "should" without explanation.

**Reference:** See COMMON-PATTERNS.md § Evidence Requirements for detailed standards.

---

## What Requires Verification

### All Claims About:
- Version numbers and release dates
- File locations and line numbers
- API behavior and requirements
- Compatibility and incompatibility
- Breaking changes
- Plugin/library features
- Performance characteristics
- Security implications

**Requires Verification:**
- "Plugin X is compatible with Platform Y"
- "File path is /path/to/file"
- "Function Z was deprecated in version 2.0"
- "This change will break existing code"

**Does NOT Require Verification:**
- Recommendations based on verified facts
- Process descriptions
- Explanations of verified findings

---

## Verification Methods

### Code-Based Claims

**Claim Type:** File exists, code contains X, function does Y

**Methods:**
1. Read the actual file
2. Quote the relevant code
3. Provide file path and line numbers

**Example:**
```
Claim: Hook references project name variable
Verification: Read hooks/after_prepare_ios.js
Evidence: Line 4: var project = process.env.project
Status: VERIFIED
```

### Version Claims

**Claim Type:** Package version, release date, requirements

**Methods:**
1. Read package.json, plugin.xml, or equivalent
2. Check official release announcements
3. Inspect package registry (npm, PyPI)

### Compatibility Claims

**Claim Type:** X works/doesn't work with Y

**Methods:**
1. Check engine requirements (plugin.xml, package.json)
2. Read documentation for compatibility notes
3. Search issue trackers for known problems
4. Inspect source code for API usage
5. Test if necessary

### API/Feature Claims

**Claim Type:** API X does Y, Feature Z requires W

**Methods:**
1. Read official documentation
2. Inspect source code implementation
3. Check API reference
4. Test behavior if needed

**Reference:** See INVESTIGATION-METHODS.md for exhaustive method hierarchy.

---

## Verification Standards

### Verified = TRUE
- Primary source confirms claim
- Multiple independent sources agree
- Direct observation via code inspection or testing
- Evidence is current and applicable

### Partially Verified
- Some aspects confirmed, others unknown
- Evidence exists but is indirect
- Old documentation may not reflect current state
- Requires additional testing to fully confirm

**Document what is verified and what remains uncertain**

### Cannot Verify = UNKNOWN
- No available evidence
- Contradictory sources
- Information is proprietary/private
- Would require testing but cannot test yet

**Document WHY it cannot be verified and what would be needed**

### Verified = FALSE
- Evidence contradicts the claim
- Primary source shows opposite
- Testing reveals different behavior
- Multiple sources disagree with claim

**Document the contradicting evidence**

**Reference:** See COMMON-PATTERNS.md § Confidence Levels for how to document verification confidence.

---

## Evidence Requirements

**Minimum Evidence for Verification:**

1. **Source Location**: file:line, URL with section, command with output
2. **Actual Evidence**: Code snippet, quote, command output
3. **Verification Method**: How was this verified?
4. **Date/Version Context**: When true? Which version?

---

## Common Verification Failures

### Failure 1: Assuming Based on Name

❌ @zeyt plugins are private packages.
✅ @zeyt organization not found on public npm. Checked installed files. Found: @zeyt/cordova-universal-links is actually e-imaxina/cordova-plugin-deeplinks (plugin.xml:13).

### Failure 2: Outdated Documentation

❌ Documentation says it's compatible.
✅ Documentation (dated 2020) states compatibility. Caveat: Predates current platform version. Verified: Source code uses deprecated API (src/Plugin.m:45).

### Failure 3: Vague Quantities

❌ Around 20 plugins need checking.
✅ 29 plugins installed (package.json:65-107). 9 Apache verified, 7 private forks verified from local source, 13 community individually assessed.

### Failure 4: Hedging Without Basis

❌ This might work but could have issues.
✅ Compatibility unknown - requires testing. Known: Plugin last updated 2021. Unknown: Whether works with current platform. Verification needed: Install and test.

---

## Multiple Sources Rule

For critical claims, verify with multiple independent sources.

**Example: "Cordova-iOS 8 breaks project naming"**

- Source 1: Official release announcement (primary)
- Source 2: GitHub release notes (primary)
- Source 3: Community reports (secondary)

All three agree → High confidence

---

## Special Cases

### Deprecated/Archived Projects

Verify:
- [ ] Archive/deprecation date
- [ ] Final version available
- [ ] Maintained forks exist
- [ ] Last known compatibility

Source: Repository status, last commit date, README notices

### Private/Proprietary Code

Verify what you can:
- [ ] Package metadata (if accessible)
- [ ] Installed source code
- [ ] Configuration files
- [ ] Public documentation (if any)

Document: "Cannot verify from public sources - verified from installed files"

### Breaking Changes

Verify:
- [ ] Official announcement or release notes
- [ ] Migration guide mentions it
- [ ] Source code comparison
- [ ] Issue tracker discussions

Document: Exact change, version introduced, migration path

---

## Self-Check Before Publishing

- [ ] All factual claims have verification
- [ ] No assumptions presented as facts
- [ ] Evidence includes sources (file:line or URL)
- [ ] Unverified claims clearly marked as such
- [ ] Verification methods documented
- [ ] No hedging without explanation
- [ ] Version/date context provided where relevant

**If any fails:** Fix before publishing.

**Reference:** See SATISFACTORY-CRITERIA.md § Evidence-Based Claims for quality checklist.
