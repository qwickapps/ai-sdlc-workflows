# Fact Verification Rules

**When to apply:** Before making any claim in spikes, reports, documentation, or JIRA comments.

---

## Core Principle

**Every factual claim must be verifiable with evidence.**

No assumptions presented as facts. No unverified claims. No "probably" or "should" without explanation.

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

### Examples:

**Requires Verification:**
- "Plugin X is compatible with Platform Y"
- "File path is /path/to/file"
- "Function Z was deprecated in version 2.0"
- "This change will break existing code"

**Does NOT Require Verification:**
- Recommendations based on verified facts ("I recommend Option A because...")
- Process descriptions ("Next, we will...")
- Explanations of verified findings

---

## Verification Methods

### Code-Based Claims

**Claim Type:** File exists, code contains X, function does Y

**Verification Methods:**
1. Read the actual file
2. Quote the relevant code
3. Provide file path and line numbers

**Example:**
```
Claim: Hook references project name variable
Verification: Read hooks/after_prepare_ios.js
Evidence: Line 4: var project = process.env.project
          Line 6: var PROJECT_HOME = platforms/ios/${project}
Status: VERIFIED
```

### Version Claims

**Claim Type:** Package version, release date, requirements

**Verification Methods:**
1. Read package.json, plugin.xml, or equivalent
2. Check official release announcements
3. Inspect package registry (npm, PyPI)

**Example:**
```
Claim: cordova-ios 8.0.0 released November 23, 2025
Verification: WebFetch https://cordova.apache.org/announcements/2025/11/23/cordova-ios-8.0.0.html
Evidence: Official release announcement states "November 23, 2025"
Status: VERIFIED
```

### Compatibility Claims

**Claim Type:** X works/doesn't work with Y

**Verification Methods:**
1. Check engine requirements (plugin.xml, package.json)
2. Read documentation for compatibility notes
3. Search issue trackers for known problems
4. Inspect source code for API usage
5. Test if necessary

**Example:**
```
Claim: Universal links plugin does not support Scene API
Verification: Read AppDelegate+CULPlugin.m
Evidence: Lines 17-29 implement only application:continueUserActivity:restorationHandler
          No scene:openURLContexts or scene:willConnectTo:options methods present
Method: Source code inspection
Status: VERIFIED
```

### API/Feature Claims

**Claim Type:** API X does Y, Feature Z requires W

**Verification Methods:**
1. Read official documentation
2. Inspect source code implementation
3. Check API reference
4. Test behavior if needed

**Example:**
```
Claim: Cordova-iOS 8 includes CDVSceneDelegate
Verification: WebFetch GitHub release notes
Evidence: RELEASENOTES.md states "Add CDVSceneDelegate class as an extension point"
Source: https://github.com/apache/cordova-ios/blob/master/RELEASENOTES.md
Status: VERIFIED
```

---

## Verification Standards

### Verified = TRUE
- Primary source confirms claim (official docs, source code, release notes)
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

---

## Evidence Requirements

### Minimum Evidence for Verification:

**1. Source Location**
- File path with line numbers: `file.js:42-45`
- URL with specific section: `https://example.com/docs#section`
- Command with output: `npm view package version` → "8.1.0"

**2. Actual Evidence**
- Code snippet showing the claim
- Quote from documentation
- Command output
- Screenshot if necessary (rare)

**3. Verification Method**
- How was this verified?
- "Code inspection", "WebFetch", "Package registry lookup", etc.

**4. Date/Version Context**
- When was this true?
- Which version does this apply to?

---

## Common Verification Failures

### Failure 1: Assuming Based on Name

**Wrong:**
```
@zeyt plugins are private packages.
```

**Right:**
```
@zeyt organization not found on public npm.
Checked: Searched npmjs.com for @zeyt scope - no results
Next: Inspect installed plugin files to determine actual source
[After inspection]
Found: @zeyt/cordova-universal-links-plugin is actually e-imaxina/cordova-plugin-deeplinks
Evidence: plugin.xml:13 shows repo: e-imaxina/cordova-plugin-deeplinks
```

### Failure 2: Outdated Documentation

**Wrong:**
```
Documentation says it's compatible.
```

**Right:**
```
Documentation (dated 2020) states compatibility.
Caveat: Documentation predates current platform version.
Verification needed: Check actual source code or test
[After checking]
Found: Source code uses deprecated API (src/Plugin.m:45)
```

### Failure 3: Vague Quantities

**Wrong:**
```
Around 20 plugins need checking.
```

**Right:**
```
29 plugins installed (package.json:65-107).
Breakdown:
- 9 official Apache plugins (verified compatible via release announcements)
- 7 private forks (require source inspection)
- 13 community plugins (require individual assessment)
```

### Failure 4: Hedging Without Basis

**Wrong:**
```
This might work but could have issues.
```

**Right:**
```
Compatibility unknown - requires testing.
Known: Plugin last updated 2021 (GitHub shows no recent activity)
Unknown: Whether it works with current platform
Verification needed: Install and test with current platform version
```

---

## Documenting Verification

### Verification Table Format

| # | Claim | Source | Verification Method | Status | Notes |
|---|-------|--------|---------------------|--------|-------|
| 1 | cordova-ios 8.0.0 released Nov 23, 2025 | Official announcement | WebFetch | ✓ | https://cordova.apache.org/... |
| 2 | Plugin uses deprecated API | Source code | Code inspection | ✓ | src/Plugin.m:45 shows API usage |
| 3 | @zeyt packages are private | npm search | WebSearch | ✓ | No public npm presence found |

### For Each Claim:

1. **State the claim precisely**
2. **Identify the source** (where did this claim come from?)
3. **Document verification method** (how did you check?)
4. **Record status** (✓ verified, ✗ false, ? unknown, ⚠ partial)
5. **Add evidence notes** (supporting details)

---

## Handling Uncertainty

### When You Cannot Verify

**DO:**
- State explicitly that it's unverified
- Explain why it cannot be verified
- Document what would be needed to verify
- Provide partial information if available
- Mark as assumption/hypothesis if proceeding

**DON'T:**
- Present unverified information as fact
- Use hedging language without explanation ("might", "could")
- Silently skip verification
- Make educated guesses sound like facts

**Example:**
```
Claim: SSL patch will work with cordova-ios 8
Status: Cannot verify without testing
Reason: cordova-ios 8 project structure unknown (requires test project)
Known: Patch is Objective-C, targeting AppDelegate
Unknown: If cordova-ios 8 uses Objective-C AppDelegate or Swift
Required for verification: Create test cordova-ios 8 project, check structure
Recommendation: Investigation required (1-2 hours)
```

---

## Verification Workflow

### Before Making a Claim:

1. **Identify the claim type** (code, version, compatibility, API)
2. **Choose verification method(s)** (code inspection, docs, testing)
3. **Gather evidence** (read files, fetch docs, run commands)
4. **Document findings** (what did you find?)
5. **Assess confidence** (verified, partial, unknown)
6. **Record source and method** (how can others verify?)

### Verification Checklist:

- [ ] Claim is specific and measurable
- [ ] Evidence source is identified (file, URL, command)
- [ ] Evidence is quoted or linked
- [ ] Verification method is documented
- [ ] Version/date context is provided
- [ ] Confidence level is clear
- [ ] If uncertain, explanation provided

---

## Multiple Sources Rule

For critical claims, verify with multiple independent sources:

**Example: "Cordova-iOS 8 breaks project naming"**

Source 1: Official release announcement (primary)
Source 2: GitHub release notes (primary)
Source 3: Community reports (secondary)

All three agree → High confidence

**Example: "Plugin X is compatible"**

Source 1: Plugin documentation (may be outdated)
Source 2: Package engine requirements (definitive)
Source 3: Source code inspection (definitive)
Source 4: Issue tracker search (no reports of problems)

Sources 2-4 agree → Verified

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

Before any report, spike, or comment:

- [ ] All factual claims have verification
- [ ] No assumptions presented as facts
- [ ] Evidence includes sources (file:line or URL)
- [ ] Unverified claims clearly marked as such
- [ ] Verification methods documented
- [ ] No hedging without explanation
- [ ] Version/date context provided where relevant

If any checkbox fails, fix before publishing.
