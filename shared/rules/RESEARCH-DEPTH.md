# Research Depth Requirements

**When to apply:** Before making assumptions, before implementing solutions, during investigation phases.

---

## Core Principle

**Do NOT make assumptions. Use available research tools to gather evidence BEFORE acting.**

You have powerful research tools (Explore agent, Grep, Chrome automation, QwickBrain MCP). Use them. Shallow research leads to wrong assumptions and wasted effort.

**Reference:** See COMMON-PATTERNS.md for evidence requirements and research documentation patterns.

---

## Research Tools Available

### 1. Explore Agent
**Task tool with subagent_type=Explore**

**When to use:**
- Exploring unfamiliar codebase
- Finding patterns/conventions/existing implementations
- Understanding "how does X work?"
- Locating files by functionality (not exact name)

**Example prompts:**
- "Find how authentication is implemented"
- "Explore migration system and how it loads files"
- "Find error handling patterns in API endpoints"

**Do NOT:**
- Search manually with multiple Grep commands
- Make assumptions about architecture
- Guess where code might be

---

### 2. Grep (Content Search)

**When to use:**
- Finding specific code patterns, function names, strings
- Searching for exact matches
- Finding usages of function/variable

**Example patterns:**
- `pattern: "import.*PayloadConfig"`
- `pattern: "migration\.up"`
- `pattern: "class.*Migration"`

**Do NOT:**
- Use for open-ended exploration (use Explore)
- Search without specific pattern

---

### 3. Chrome Automation

**Tools:** `mcp__claude-in-chrome__*`

**When to use:**
- Testing web applications
- Verifying frontend functionality
- Capturing UI state/errors
- Recording user workflows
- Checking browser console for errors

**Key operations:**
- `tabs_context_mcp` - Get current tabs
- `tabs_create_mcp` - Create new tab
- `screenshot` - Capture state
- `read_console_messages` - Check errors
- `gif_creator` - Record interactions

**Do NOT:**
- Assume frontend works without browser check
- Skip console error checks
- Trigger JavaScript alerts (blocks extension)

---

### 4. QwickBrain MCP

**When to use:**
- Retrieving project documentation
- Finding ADRs (Architecture Decision Records)
- Accessing FRDs, design docs, spike reports
- Finding past decisions/learnings
- Getting sprint handoff documents

**Key operations:**
- `search_documents` - Semantic search
- `get_document` - Retrieve specific doc
- `list_documents` - List by type/project

**Document types:**
- `doc_type: "adr"` - Architecture decisions
- `doc_type: "design"`, `"spike"`, `"frd"` - Engineering docs
- `doc_type: "memory"` - Sprint handoffs

**Do NOT:**
- Reinvent solutions in knowledge base
- Ignore past decisions
- Make decisions without checking ADRs

---

## Research Workflow

### Step 1: Understand What You Need

**Ask:**
- What specific information do I need?
- What question am I answering?
- What decision depends on this?

**Be specific:**
- ❌ "I need to understand the codebase"
- ✅ "I need to find where migrations are defined and how they execute"

### Step 2: Choose Right Tool

| Need | Tool | Why |
|------|------|-----|
| Explore unfamiliar area | **Explore** | Systematic investigation |
| Find specific code | **Grep** | Pattern matching |
| Test web functionality | **Chrome** | Browser automation |
| Find past decisions | **QwickBrain** | Knowledge base |
| Read known file | **Read** | Direct access |

### Step 3: Execute Deep Research Pattern

```markdown
1. **Start broad** (Explore):
   - Understand overall structure
   - Find relevant areas
   - Identify patterns

2. **Narrow down** (Grep):
   - Find specific implementations
   - Locate exact code
   - Check usage patterns

3. **Deep dive** (Read):
   - Read actual code
   - Understand implementation
   - Check edge cases

4. **Verify** (Test/Chrome if applicable):
   - Test assumptions
   - Verify behavior
   - Check edge cases
```

### Step 4: Document Findings

Create evidence trail:
- What tools used?
- What found?
- What file:line references?
- What conclusions drawn?
- What assumptions remain?

**Reference:** See COMMON-PATTERNS.md § Evidence Requirements

---

## Research Depth Levels

### Shallow (NOT ACCEPTABLE for critical)
- Only one source
- No verification
- Guessed based on limited info
- No code inspection

### Medium (ACCEPTABLE for non-critical)
- Multiple sources checked
- Read configuration files
- Verified with documentation
- Some code inspection

### Deep (REQUIRED for critical)
- Used Explore for systematic investigation
- Read actual implementation code
- Verified through testing
- Checked edge cases
- Documented with file:line refs

**See:** RESEARCH-EXAMPLES.md for detailed examples of each depth level.

---

## When to Use Each Tool

### Use Explore When:
- [ ] Entering unfamiliar codebase area
- [ ] Need to understand system architecture
- [ ] Looking for patterns/conventions
- [ ] Question is "how does X work?"
- [ ] Don't know exact file/function names

### Use Grep When:
- [ ] Know exact string/pattern to find
- [ ] Looking for specific function/class usage
- [ ] Finding imports of a module
- [ ] Searching for error messages

### Use Chrome When:
- [ ] Testing web application
- [ ] Verifying UI functionality
- [ ] Checking for console errors
- [ ] Recording user workflows
- [ ] Validating frontend changes

### Use QwickBrain When:
- [ ] Looking for past decisions (ADRs)
- [ ] Finding existing designs/spikes
- [ ] Getting sprint context/handoffs
- [ ] Checking if problem already solved

---

## Common Research Mistakes

### 1. Assuming Without Checking

❌ "This probably uses React Router"
   [Implements based on assumption]

✅ "Let me explore the routing system"
   [Uses Explore agent]
   "Found: Uses Next.js App Router (app directory)"

### 2. Stopping After First Search

❌ "Grepped for 'migration' - found files"
   [Proceeds without understanding]

✅ "Grepped for 'migration' - found 15 files"
   "Used Explore to understand architecture"
   "Read key files and tested execution"

### 3. Not Using Available Tools

❌ "Not sure how auth works, I'll implement basic version"
   [Reinvents wheel]

✅ "Let me explore existing auth system"
   [Uses Explore]
   "Found Auth0 implementation, reusing pattern"

### 4. No Evidence Trail

❌ "Migrations work with Drizzle"
   [No evidence]

✅ "Migrations use Drizzle ORM"
   "Evidence: package.json:67, payload.config.ts:137"
   "Verified: src/migrations/20260131_131219.ts:1-3"

---

## Research Checklist

Before implementation:
- [ ] Used appropriate research tools
- [ ] Gathered evidence (file:line refs)
- [ ] Verified assumptions via code inspection
- [ ] Tested understanding where applicable
- [ ] Documented findings with references
- [ ] No critical unknowns remain

**If fails:** Do more research.

---

## Research Evidence Template

```markdown
## Research Findings

**Question:** [What you researched]

**Tools Used:**
- Explore: [what explored]
- Grep: [patterns searched]
- Chrome: [what tested]
- QwickBrain: [documents retrieved]

**Findings:**
1. [Finding with file:line evidence]
2. [Finding with file:line evidence]

**Verification:**
- How verified
- What tested
- Edge cases checked

**Remaining Unknowns:**
- [What's unclear and why]

**Conclusion:**
[What learned and how it informs approach]
```

**Reference:** See COMMON-PATTERNS.md § Evidence Requirements for detailed template.

---

## Integration with Workflows

All workflows enforce research depth:

```markdown
### Research Phase

**Apply:** RESEARCH-DEPTH.md

**Requirements:**
1. Choose appropriate tools (Explore, Grep, Chrome, QwickBrain)
2. Document findings with evidence
3. Verify assumptions via code inspection

**GATE:** No assumptions without evidence.
```

---

## Remember

**Research is mandatory, not optional.**

Before implementing:
1. Research thoroughly using appropriate tools
2. Gather evidence (file:line refs)
3. Verify assumptions via code inspection
4. Document findings
5. THEN implement

**Never implement based on unverified assumptions.**
