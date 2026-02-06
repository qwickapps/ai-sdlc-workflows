# Common Patterns Reference

**When to apply:** Understanding shared concepts used across all rule files.

---

## Core Shared Concepts

This file consolidates patterns used across VALIDATION-GATES, COMMUNICATION-PROTOCOL, RESEARCH-DEPTH, WORKTREE-ENFORCEMENT, FACT-VERIFICATION, INVESTIGATION-METHODS, ITERATION-GATES, SATISFACTORY-CRITERIA, and WRITING-STYLE.

---

## 1. Evidence Requirements

### File:Line Reference Format

**Standard format:**
```
file.js:42                    # Single line
file.js:42-45                 # Line range
src/migrations/index.ts:137   # Absolute from project root
```

**When required:**
- All factual claims about code
- Bug locations
- Implementation references
- Configuration changes

**Example:**
```
✅ "Migration fails at readMigrationFiles (payload.config.ts:137)"
❌ "Migration fails in the config file"
```

### Evidence Components

Every claim needs these 4 elements:

1. **Source**: Where the information comes from
   - File path with line numbers
   - URL to documentation
   - Command output

2. **Evidence**: Actual proof
   - Code snippet
   - Documentation quote
   - Test result
   - Screenshot (rare)

3. **Verification method**: How you confirmed it
   - "Code inspection"
   - "WebFetch of documentation"
   - "Tested on clean database"
   - "Used Explore agent"

4. **Context**: Version/date when relevant
   - Package version
   - Commit hash
   - Date of check
   - Platform version

---

## 2. Checklist Usage Pattern

### Standard Checkbox Format

```markdown
- [ ] Item to verify
- [ ] Another item to check
- [ ] Third verification point
```

### How to Use Checklists

**Before proceeding:**
1. Read each checkbox item
2. Verify it's complete/true
3. Mentally check it off
4. If ANY fails, stop and fix it

**Common mistake:**
- Skipping checklist items
- Assuming items pass without checking
- Proceeding when checkboxes fail

**Correct approach:**
- Actually verify each item
- Fix failures before proceeding
- Document why skipped (if approved)

---

## 3. Gate/Stop Decision Logic

### When to STOP

Stop immediately when:
- Gate fails (compilation, tests, validation)
- Blocker encountered (tool failure, access denied)
- Uncertainty about approach (multiple options, unclear requirements)
- Quality criteria not met (shallow research, incomplete work)

### When to PROCEED

Proceed only when:
- All gates pass
- All checklists complete
- Evidence gathered
- User approval received (when required)

### Decision Template

```markdown
**Gate Status:** [PASS/FAIL]

**If PASS:**
- Verified: [what passed]
- Evidence: [file:line or proof]
- Proceed to: [next step]

**If FAIL:**
- Issue: [what failed]
- Options: [how to fix]
- Recommendation: [suggested approach]
- Wait for: [user decision/fix completion]
```

---

## 4. Example Format Standards

### Wrong/Right Pattern

**Structure:**
```markdown
### Mistake: [Name of Mistake]

**❌ Wrong:**
```
[Bad approach example]
[Why it's wrong]
```

**✅ Right:**
```
[Correct approach example]
[Why it's correct]
```
```

**Usage guidelines:**
- Keep examples concise (3-5 lines)
- Show clear contrast
- Explain why one is better
- Use realistic scenarios

---

## 5. Confidence Levels

### Stating Confidence

**High Confidence (80-100%):**
- Multiple sources verify claim
- Tested and confirmed
- Code inspected
- Few/no unknowns

**Medium Confidence (50-80%):**
- Some verification done
- Documented limitations
- Some unknowns remain
- Time-boxed research

**Low Confidence (<50%):**
- Limited verification
- Many unknowns
- Cannot test key aspects
- Needs more research

**Template:**
```markdown
**Confidence:** [High/Medium/Low]
**Reason:** [Why this confidence level]
**Limitations:** [What's uncertain]
**Next steps:** [How to increase confidence]
```

---

## 6. Tool Call Pattern

### When to Call Tools in Parallel

**Parallel (single message, multiple tools):**
```markdown
When tools are independent:
- Read file A + Read file B
- Grep pattern X + Glob pattern Y
- Multiple git status checks
```

**Sequential (separate messages):**
```markdown
When tools depend on previous results:
- Explore to find files → then Read those files
- Grep to find pattern → then Read context around matches
- Create worktree → then change directory
```

---

## 7. Workflow Integration Template

### Standard Integration Pattern

**In workflow files (bug.md, feature.md, etc.):**

```markdown
### [Phase Name]

**Apply rule:** [RULE-FILE.md]

**Key requirements:**
- [Requirement 1 from rule]
- [Requirement 2 from rule]

**GATE:** [What must pass to proceed]

**If gate fails:** [Reference to COMMUNICATION-PROTOCOL.md or ITERATION-GATES.md]
```

---

## 8. Communication Templates

### Blocker Communication

**When blocked, use this structure:**

```markdown
I'm blocked: [What's blocking progress]

**What I tried:**
- [Approach 1] → [Result]
- [Approach 2] → [Result]

**Available options:**
1. **[Option A]**: [Description]
   - Pros: [List]
   - Cons: [List]
   - Effort: [Estimate]

2. **[Option B]**: [Description]
   - Pros: [List]
   - Cons: [List]
   - Effort: [Estimate]

**Recommendation:** [Which option and why]

**Question:** [What you need from user]
```

### Clarification Questions

**For minor clarifications:**
```markdown
Quick question: [Clear yes/no or A/B choice]
```

**For major decisions:**
```markdown
This requires a decision on [topic].

**Context:** [Background]
**Options:** [List with tradeoffs]
**Recommendation:** [Your suggestion]
**Question:** [What you need to know]
```

---

## 9. Time-Boxing Pattern

### When to Time-Box

**Appropriate for:**
- Unbounded research
- Diminishing returns scenarios
- Preliminary investigation

**How to time-box:**
1. Set limit upfront ("4 hours max")
2. Investigate deeply within limit
3. Document what was covered
4. Document what wasn't covered
5. Mark confidence level
6. Provide next steps

**Template:**
```markdown
**Time-boxed:** [Duration]

**Covered:**
- [Area 1]: [Status]
- [Area 2]: [Status]

**Not covered:**
- [Area]: [Estimated time needed]

**Confidence:** [Based on coverage]
**Next steps:** [How to continue if needed]
```

---

## 10. Quality Self-Check

### Before Proceeding from Any Phase

**Ask yourself:**
- [ ] Is this specific? (No vague language)
- [ ] Is this evidence-based? (Sources cited)
- [ ] Is this actionable? (Clear next steps)
- [ ] Is this complete? (All scope covered or gaps documented)
- [ ] Is this deep enough? (Appropriate investigation level)

**If ANY answer is "no":** Address the issue before proceeding.

---

## 11. Unknown/Gap Documentation

### How to Document Unknowns

**Never say just "unknown" - always explain WHY:**

```markdown
**Unknown:** [What's not known]
**Reason unknowable:** [Why you can't verify it]
**What's needed:** [What would make it knowable]
**Impact:** [How this affects work]
**Recommendation:** [How to proceed despite unknown]
```

**Example:**
```
❌ "Plugin compatibility is unknown"

✅ "Plugin compatibility cannot be verified from public sources.
   Reason: Plugin is private (no public npm, no GitHub repo found).
   What's needed: Install plugin and test with cordova-ios 8 (1-2 hours).
   Impact: Medium risk - plugin may fail at runtime.
   Recommendation: Test in isolated worktree before committing."
```

---

## 12. Iteration vs. Escalation

### When to Iterate (Fix Yourself)

- Shallow research → Do deeper research
- Missing evidence → Gather evidence
- Incomplete coverage → Complete coverage
- Vague language → Make specific

### When to Escalate (Ask User)

- Tool failure → Present options
- Access denied → Request access or present alternatives
- Multiple valid approaches → Get user preference
- Requirement ambiguity → Ask for clarification

**Decision:**
```
Can I fix this myself with available tools? → Iterate
Do I need user input/decision? → Escalate (use COMMUNICATION-PROTOCOL)
```

---

## Usage in Rule Files

Each rule file references specific patterns from this file instead of repeating them.

**Reference format in other files:**
```markdown
**Evidence requirements:** See COMMON-PATTERNS.md § Evidence Requirements
**Checklist usage:** See COMMON-PATTERNS.md § Checklist Usage Pattern
**Stop/Proceed logic:** See COMMON-PATTERNS.md § Gate/Stop Decision Logic
```

This reduces redundancy while maintaining clarity.
