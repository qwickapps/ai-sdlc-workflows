---
description: Controlled commit workflow with verification and approval
allowed-tools: Bash(git:*), Bash(npm:*), Bash(pnpm:*), Bash(pip:*), Bash(cargo:*), Bash(gem:*)
argument-hint: [optional commit message or scope]
---

# Controlled Commit Workflow

You are now in **Commit Mode**. Use this for controlled, approved commits.

**Input:** $ARGUMENTS (optional suggested commit message or scope)

## CRITICAL RULES

1. **NEVER auto-commit** - always wait for explicit "approved"
2. **NO attributions** - no "Generated with Claude Code", no "Co-Authored-By"
3. **Verify deliverables** - tests, docs must be in order
4. **Check version bumps** - verify against registry before committing

## Commit Process

### Step 1: Pre-Commit Verification

Run these checks before proposing commit:

```bash
# Check for uncommitted changes
git status

# Run tests (adjust command as needed)
npm run test

# Run linting (if applicable)
npm run lint
```

**GATE: Do not proceed if tests or lint fail**

### Step 2: Review Changes

1. **Show diff summary**:
   - Files added/modified/deleted
   - Key changes in each file

2. **Verify completeness**:
   - [ ] Implementation complete
   - [ ] Tests written and passing
   - [ ] README updated (if needed)
   - [ ] CHANGELOG updated (if needed)
   - [ ] ARCHITECTURE updated (if needed)

### Step 3: Version Check (if version file changed)

**If any version file is modified** (package.json, pyproject.toml, Cargo.toml, *.gemspec, etc.):

1. **Detect project type and check registry**:

   ```bash
   # Node/npm
   npm view <package-name> version 2>/dev/null || echo "NOT_PUBLISHED"

   # Python/PyPI
   pip index versions <package-name> 2>/dev/null || echo "NOT_PUBLISHED"

   # Rust/crates.io
   cargo search <package-name> --limit 1 2>/dev/null || echo "NOT_PUBLISHED"

   # Ruby/RubyGems
   gem list <package-name> --remote 2>/dev/null || echo "NOT_PUBLISHED"
   ```

2. **If NOT_PUBLISHED (private package)**:
   - Ask user: "Package is private. Version bump from X → Y detected. Keep or revert?"
   - Revert version change unless user confirms

3. **If PUBLISHED (public package)**:
   - Compare: Published version vs Local version
   - If local > published: OK, changes roll into pending release
   - If local = published: Analyze changes and suggest appropriate bump

4. **Analyze change severity**:
   - Breaking changes (removed APIs, changed signatures)? → MAJOR
   - New features (new APIs, new options)? → MINOR
   - Bug fixes only? → PATCH

5. **If bump seems insufficient**:
   - "Changes include [breaking changes/new features] but version only bumped patch."
   - "Suggest updating X.Y.Z → A.B.C. Adjust?"

**GATE: Resolve version issues before proceeding**

### Step 4: Propose Commit Message

Format (NO attributions):

```text
<type>(<scope>): <short description>

- bullet point of change 1
- bullet point of change 2
```

Types:

- `feat` - new feature
- `fix` - bug fix
- `refactor` - code restructuring
- `docs` - documentation only
- `test` - adding tests
- `chore` - maintenance tasks

### Step 5: Wait for Approval

Present the following to user:

```markdown
## Ready to Commit

**Files to commit:**

- [list of files]

**Proposed message:**

[commit message]

**Verification:**

- [ ] Tests passing
- [ ] Docs updated
- [ ] Version check passed (if applicable)

Type "approved" to proceed with commit.
```

### Step 6: Execute Commit (only after approval)

```bash
git add [files]
git commit -m "[message]"
```

**Do NOT push unless explicitly requested**

## Important Reminders

- If user hasn't said "approved", DO NOT commit
- If tests are failing, DO NOT commit
- If unsure about scope, ASK before committing
- NEVER include attributions or AI signatures
- NEVER bump private package versions without asking
- NEVER bump versions without checking the registry first

## Abort

User can say "abort" or "cancel" to exit without committing.
