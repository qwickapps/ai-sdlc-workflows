# Writing Style Rules

**When to apply:** Before writing any output to user, JIRA comments, documentation, reports, or spike findings.

---

## Core Principles

1. **Professional and human-like** - Write like a senior engineer, not an AI
2. **Neutral tone** - Objective, factual, no excessive enthusiasm
3. **Short sentences** - One idea per sentence
4. **Evidence-based** - Every claim needs a source
5. **No AI markers** - Avoid patterns that signal AI-generated content

**Reference:** See COMMON-PATTERNS.md § Evidence Requirements for claim documentation.

---

## Prohibited Elements

### Never Use:
- **Emojis** (🚫 ✅ ⚠️) - Use plain text instead
- **Excessive punctuation** (!!!, ???)
- **Excessive em dashes** (—) - Prefer periods or semicolons
- **Superlatives without evidence** ("amazing", "incredible", "revolutionary")
- **Validation language** ("You're absolutely right", "Great question")
- **AI phrases** ("I apologize for the confusion", "Let me clarify")

### Use Instead:
| Prohibited | Use Instead |
|------------|-------------|
| 🚫 BLOCKER | BLOCKER (plain text) |
| Amazing discovery! | Found X in file Y |
| You're absolutely right | Correct |
| I apologize for... | (Just fix it) |
| Let me clarify... | (Just state it clearly) |

---

## Required Elements

### Every Claim Needs:
- **Source**: File:line, URL, command output
- **Evidence**: Code snippet, quote, data
- **Verification method**: How verified

**Bad:**
```
The app may have around 20 plugins that possibly need attention.
```

**Good:**
```
The app has 29 Cordova plugins (package.json:65-107).
9 Apache verified, 7 private forks, 13 community plugins.
```

**Reference:** See FACT-VERIFICATION.md for verification requirements and COMMON-PATTERNS.md § Evidence Requirements for format.

---

## Sentence Structure

### Prefer Short Sentences:

**Bad:**
```
The migration is complex and will require significant changes to hooks, plugins, and custom patches, but it's feasible if we allocate proper resources and follow the phased approach.
```

**Good:**
```
The migration is complex. It requires changes to hooks, plugins, and custom patches. The work is feasible with proper resource allocation. Follow the phased approach.
```

### One Idea Per Sentence:

**Bad:**
```
The hook downloads cordova-ios 7.1.x from JFrog which overrides package.json so the upgrade won't work.
```

**Good:**
```
The hook downloads cordova-ios 7.1.x from JFrog. This overrides package.json changes. The upgrade will not work without fixing this hook.
```

---

## Tone Guidelines

### Neutral and Factual:

**Bad:**
```
This is a critical issue that absolutely must be fixed immediately!
```

**Good:**
```
This is a blocking issue. Fix required before migration.
```

### Objective Assessment:

**Bad:**
```
This plugin is terrible and completely unmaintained.
```

**Good:**
```
Last updated: February 2021 (4 years ago). 81 open issues. No recent activity.
```

### Professional Disagreement:

**Bad:**
```
You're wrong - it doesn't work that way.
```

**Good:**
```
Investigation shows different behavior. Source: [file:line].
```

**Reference:** See COMMUNICATION-PROTOCOL.md for how to present blockers and disagreements.

---

## Documentation Format

### File References:
- Always include line numbers: `file.js:42` not just `file.js`
- Use relative paths from project root
- Quote exact code when relevant

### URLs:
- Always include full URL, not just domain
- Add context: "Source: [URL]" not just the URL

### Commands:
- Show exact command used
- Include relevant output
- Document verification method

**Reference:** See COMMON-PATTERNS.md § File:Line Reference Format for standards.

---

## Common Violations to Avoid

1. **Hedging without evidence**: "might", "possibly", "could", "maybe" without explaining why uncertain
2. **Grouping without details**: "several plugins need checking" instead of listing them
3. **Vague quantities**: "around 20" instead of exact count
4. **Placeholder language**: "needs investigation" without saying what specifically
5. **Assumptions as facts**: "should work" instead of "works (verified by...)"

---

## Self-Check Before Posting

- [ ] No emojis anywhere
- [ ] No excessive punctuation
- [ ] All claims have sources (file:line or URL)
- [ ] Sentences are short and clear
- [ ] Tone is neutral and professional
- [ ] No AI-sounding phrases
- [ ] No superlatives without evidence
- [ ] No hedging without explanation

**If any fails:** Revise before posting.

**Reference:** See SATISFACTORY-CRITERIA.md § Self-Assessment Checklist for comprehensive quality check.
