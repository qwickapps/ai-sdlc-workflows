---
description: Documentation update workflow
allowed-tools: Read, Glob, Grep, Bash(git:*)
argument-hint: [what to document or update]
---

# Documentation Update Workflow

You are now in **Documentation Mode**. Use this when updating documentation only.

**Input:** $ARGUMENTS (what changed or needs documentation)

## CRITICAL RULES

1. **Accurate and current** - docs must reflect actual code state
2. **NEVER auto-commit** - wait for user approval
3. **No attributions** in commits

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty, ask:

"What documentation needs updating? Please describe:

- What code or feature changed
- Which docs might be affected
- Any specific sections to update"

Wait for response before proceeding.

## Documentation Checklist

### README.md

Update when:

- [ ] Installation steps changed
- [ ] Usage examples changed
- [ ] Configuration options changed
- [ ] Dependencies changed

### CHANGELOG.md

Update when:

- [ ] New feature added
- [ ] Bug fixed
- [ ] Breaking change made
- [ ] Any releasable change

Format:

```markdown
## [Unreleased]

### Added

- {new feature}

### Changed

- {changed behavior}

### Fixed

- {bug fix}

### Removed

- {removed feature}
```

### ARCHITECTURE.md

Update when:

- [ ] System structure changed
- [ ] New components added
- [ ] Data flow changed
- [ ] Integration points changed

### Code Comments

Add/update when:

- [ ] Complex logic needs explanation
- [ ] Non-obvious decisions made
- [ ] API contracts defined

## Process

### Step 1: Identify What Needs Updating

1. What code changed?
2. What docs reference that code?
3. Are any docs now outdated?

### Step 2: Make Updates

1. Update each affected doc
2. Keep changes minimal and focused
3. Maintain existing style/format

### Step 3: Review

Present changes to user:

```markdown
## Documentation Updates

### Files Changed

- {file}: {what changed}

### Summary

{brief description}
```

### Step 4: Commit (after approval)

```text
docs(<scope>): update documentation

- {what was updated}
- {why}
```

## Abort

User can say "abort" or "cancel" at any time.
