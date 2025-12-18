# Writing Style Rules

**When to apply:** Before writing any output to user, JIRA comments, documentation, reports, or spike findings.

---

## Core Principles

1. **Professional and human-like** - Write like a senior engineer, not an AI
2. **Neutral tone** - Objective, factual, no excessive enthusiasm
3. **Short sentences** - One idea per sentence
4. **Evidence-based** - Every claim needs a source
5. **No AI markers** - Avoid patterns that signal AI-generated content

---

## Prohibited Elements

### Never Use:
- **Emojis** (🚫 ✅ ⚠️ etc.) - Use plain text labels instead
- **Excessive punctuation** (!!!, ???, multiple exclamation marks)
- **Excessive em dashes** (—) - Use sparingly, prefer periods or semicolons
- **Superlatives without evidence** ("amazing", "incredible", "revolutionary")
- **Validation language** ("You're absolutely right", "Great question")
- **AI phrases** ("I apologize for the confusion", "Let me clarify")

### Use Instead:
| Prohibited | Use Instead |
|------------|-------------|
| 🚫 BLOCKER | BLOCKER (plain text) |
| Amazing discovery! | Found X in file Y |
| You're absolutely right | Correct |
| I apologize for... | (Just fix it, no apology needed) |
| Let me clarify... | (Just state it clearly) |

---

## Required Elements

### Every Claim Needs:
- **Source**: File path with line number, URL, or command output
- **Evidence**: Actual code snippet, quote, or data
- **Verification method**: How the claim was verified

### Examples:

**Bad:**
```
The app may have around 20 plugins that possibly need attention.
```

**Good:**
```
The app has 29 Cordova plugins (package.json:65-107).
9 are official Apache plugins (verified compatible via release announcements).
7 are private forks (cannot verify - no public repos found).
13 are community plugins (require individual testing).
```

**Bad:**
```
Universal links might not work with iOS 8.
```

**Good:**
```
Universal links will not work with cordova-ios 8.
Source: AppDelegate+CULPlugin.m:17-29 implements only application:continueUserActivity:restorationHandler.
Evidence: No scene:openURLContexts or scene:willConnectTo:options methods present.
Verification: Inspected installed plugin source code.
```

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

---

## Common Violations to Avoid

1. **Hedging without evidence**: "might", "possibly", "could", "maybe" without explaining why uncertain
2. **Grouping without details**: "several plugins need checking" instead of listing them
3. **Vague quantities**: "around 20" instead of exact count
4. **Placeholder language**: "needs investigation" without saying what specifically
5. **Assumptions as facts**: "should work" instead of "works (verified by...)"

---

## Self-Check Before Posting

Before any output, verify:
- [ ] No emojis anywhere
- [ ] No excessive punctuation
- [ ] All claims have sources (file:line or URL)
- [ ] Sentences are short and clear
- [ ] Tone is neutral and professional
- [ ] No AI-sounding phrases
- [ ] No superlatives without evidence
- [ ] No hedging without explanation

---

## Examples of Good vs Bad Writing

### Example 1: Spike Findings

**Bad:**
```
🚨 CRITICAL ISSUE! 🚨

You're absolutely right - we have a major problem here! The universal links plugin is super old (from way back in 2018!!!) and it's completely unmaintained. This is really concerning and needs immediate attention!!!
```

**Good:**
```
CRITICAL: Universal Links Plugin Incompatible

Plugin: cordova-universal-links-plugin@1.2.4
Last updated: 2018 (archived)
Source: GitHub repository inspection
Impact: Will not work with cordova-ios 8 Scene API
Evidence: No scene:openURLContexts method (AppDelegate+CULPlugin.m:17-29)
```

### Example 2: JIRA Comment

**Bad:**
```
Hey team! 👋

I've done some amazing research and discovered some incredible findings! This is a game-changer for our migration strategy!!!
```

**Good:**
```
Cordova-iOS 8 Migration Findings

Date: 2025-12-17
Investigation: 29 plugins individually assessed

Critical findings:
1. Postinstall hook blocks upgrade (hooks/postinstall.js:13)
2. Universal links incompatible (no Scene API support)
3. 2 hooks require fixes (specific line numbers documented)

Timeline: 6-7 weeks
Recommendation: Proceed with migration
```

### Example 3: Unknown Items

**Bad:**
```
Not sure if this works or not, might need testing.
```

**Good:**
```
Compatibility unknown - requires testing.
Reason: Plugin is private (no public repository found).
Verification method: Install and test with cordova-ios 8.
```
