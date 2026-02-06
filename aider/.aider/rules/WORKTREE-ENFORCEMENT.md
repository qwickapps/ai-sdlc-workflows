# Worktree Enforcement

**When to apply:** Before creating ANY branch for feature/bug work. ALWAYS.

---

## Core Principle

**ALWAYS use the create-worktree script. NEVER use `git worktree add` or `git checkout -b` directly.**

The script copies .env files, settings, and runs pnpm install. Skipping it breaks your development environment.

**Reference:** See COMMON-PATTERNS.md for checklist usage and stop/proceed logic.

---

## The Problem

### ❌ What Keeps Happening (WRONG):

```bash
# Wrong approach 1
git checkout -b feature-auth

# Wrong approach 2
git worktree add ../qwickapps-wt-feature-auth -b feature-auth

# Result: Missing .env files, broken environment, wasted time debugging
```

### ✅ What Should Happen (RIGHT):

```bash
# Use the approved script
.claude/scripts/create-worktree.sh feature-auth

# OR from repo root
/Users/raajkumars/Projects/qwickapps/.claude/scripts/create-worktree.sh feature-auth

# Result: Worktree created, .env copied, pnpm install done, ready to work
```

---

## Mandatory Worktree Checklist

Before creating ANY branch or worktree:

- [ ] **STOP** - Do not create branch/worktree yet
- [ ] **FIND** the create-worktree.sh script location
- [ ] **USE** the script (never git commands directly)
- [ ] **VERIFY** the script completed successfully
- [ ] **CHANGE** to the new worktree directory

**If ANY unchecked:** You're doing it wrong.

---

## How to Find the Script

### Option 1: Search from Current Directory
```bash
find ../.. -name "create-worktree.sh" -type f | head -1
# Likely: ../../.claude/scripts/create-worktree.sh
```

### Option 2: From Repo Root
```bash
ls .claude/scripts/create-worktree.sh
```

### Option 3: Known Path (QwickApps)
```bash
/Users/raajkumars/Projects/qwickapps/.claude/scripts/create-worktree.sh
```

---

## When to Create Worktrees

**Required for:**
1. New feature development (`/feature` workflow)
2. Bug fixes (`/bug` workflow)
3. Refactoring (`/refactor` workflow)
4. Experimental spikes (`/spike` workflow)

**Every workflow mentioning "create worktree" MUST reference this file.**

---

## What the Script Does

**Why you MUST use it:**

```bash
1. Creates worktree in ../qwickapps-wt-<name>
2. Copies ALL .env files (preserving directory structure)
3. Copies .claude/settings.local.json (personal settings)
4. Runs pnpm install (installs dependencies)
5. Handles both new and existing branches
```

**If you skip the script:**
- ❌ No .env files → Environment variables missing
- ❌ No settings.local.json → Wrong permissions
- ❌ No pnpm install → Dependencies missing
- ❌ Manual work to fix → Wasted time

---

## Usage Patterns

### New Feature Branch
```bash
# Locate script
SCRIPT=$(find . -name "create-worktree.sh" -type f | head -1)

# Use script
$SCRIPT feature-auth

# Change to worktree
cd ../qwickapps-wt-feature-auth
```

### Bug Fix Branch
```bash
.claude/scripts/create-worktree.sh bug-917
cd ../qwickapps-wt-bug-917
```

### Using Existing Branch
```bash
.claude/scripts/create-worktree.sh my-feature dev
cd ../qwickapps-wt-my-feature
```

**See:** WORKTREE-REFERENCE.md for additional usage examples and advanced scenarios.

---

## Verification Steps

After running script, verify:

```bash
# Check 1: .env files copied
ls clients/*/client/.env*
ls clients/*/control-panel/.env*

# Check 2: settings copied
ls .claude/settings.local.json

# Check 3: dependencies installed
ls node_modules

# Check 4: On correct branch
git branch --show-current
```

---

## If You Forgot

### Already Created Branch/Worktree Manually:

```bash
# Delete and recreate properly
git worktree remove ../qwickapps-wt-feature-auth
git branch -D feature-auth
.claude/scripts/create-worktree.sh feature-auth
```

**Don't try to manually fix - just recreate properly.**

---

## Common Mistakes

### "This is just a quick test"
❌ Skip script → Spend 20 min debugging env issues
✅ Use script (30 sec) → Test works in 5 min

### "I know what I'm doing"
❌ Manual worktree → Forget some .env file
✅ Use script → No issues

### "I can't find the script"
❌ Use git commands → Make mess
✅ Search properly: `find . -name "create-worktree.sh"` → Find and use it

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────┐
│         WORKTREE CREATION QUICK GUIDE          │
├─────────────────────────────────────────────────┤
│                                                 │
│  NEVER use:                                     │
│    ❌ git worktree add                          │
│    ❌ git checkout -b                           │
│    ❌ git branch                                │
│                                                 │
│  ALWAYS use:                                    │
│    ✅ .claude/scripts/create-worktree.sh <name>│
│                                                 │
│  Script location:                               │
│    .claude/scripts/create-worktree.sh          │
│                                                 │
│  Usage:                                         │
│    ./script <worktree-name> [branch]           │
│                                                 │
│  Examples:                                      │
│    ./script feature-auth                       │
│    ./script bug-917                            │
│    ./script wt-1 dev                           │
│                                                 │
│  After running:                                 │
│    cd ../qwickapps-wt-<name>                   │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## Integration with Workflows

**In ALL workflows mentioning worktree:**

```markdown
### Create git worktree (REQUIRED):

**STOP:** Follow WORKTREE-ENFORCEMENT.md

1. **Locate script:**
   find . -name "create-worktree.sh" -type f | head -1

2. **Run script:**
   .claude/scripts/create-worktree.sh <name>

3. **Verify and change directory:**
   cd ../qwickapps-wt-<name>

**NEVER use git worktree add or git checkout -b directly.**
```

**Reference:** See COMMON-PATTERNS.md § Workflow Integration Template

---

## Remember

**The script exists to save time and prevent bugs.**

Every time you think "I'll just create a branch quickly":
1. Stop
2. Find the script
3. Use the script
4. Save debugging time

**Make it a habit. Not an exception.**
