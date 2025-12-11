---
description: Version release management workflow
allowed-tools: Bash(git:*), Bash(npm:*), Bash(pnpm:*), Read, Glob, Grep
argument-hint: [version number, e.g., 1.2.0]
---

# Release Management Workflow

You are now in **Release Mode**. Follow this workflow for version releases.

**Input:** $ARGUMENTS (version number like 1.2.0, or "patch"/"minor"/"major")

## CRITICAL RULES

1. **Coordinate all aspects** - code, docs, deployment
2. **NEVER auto-push** - always wait for explicit approval
3. **No attributions** in commit messages or release notes

## Interactive Setup

**Check if $ARGUMENTS is provided.**

If $ARGUMENTS is empty, ask:

"What version would you like to release? Please provide:

- Version number (e.g., 1.2.0) or type (patch/minor/major)
- Confirm what features/fixes are included
- Any special release notes needed"

Wait for response before proceeding.

## Workflow Phases

### PHASE 1: Release Planning (Engineering Manager)

1. **Define release scope**:
   - What version number? (semver)
   - What features/fixes are included?
   - Any breaking changes?
   - What needs documentation?

2. **Pre-release checklist**:
   - [ ] All features merged and tested
   - [ ] All tests passing
   - [ ] No critical bugs outstanding
   - [ ] Documentation updated

3. **GATE: Confirm release scope with user**

### PHASE 2: Prepare Release (DevOps + Tech Writer)

1. **Update version numbers**:
   - package.json (if applicable)
   - Other version references

2. **Finalize CHANGELOG.md**:
   - Add release date
   - Organize entries by category
   - Note breaking changes prominently

3. **Update documentation**:
   - README.md - version badges, new features
   - ARCHITECTURE.md - if architecture changed
   - Migration guide if breaking changes

4. **Create Release Document**:
   - Save to: `.claude/engineering/releases/RELEASE-<version>.md`
   - Use template from `.claude/templates/RELEASE.md`

5. **GATE: Present release preparation to user**

### PHASE 3: Create Release (DevOps)

1. **Commit release changes**:

   ```text
   chore(release): v<version>

   - list of notable changes
   ```

2. **Create git tag** (if requested)

3. **GATE: Wait for user approval before pushing**

### PHASE 4: Deploy (DevOps)

1. **Deploy according to project procedures**
2. **Verify deployment**
3. **Report status to user**

### PHASE 5: Announce (Tech Writer)

1. **Prepare release notes** for external communication (if needed)
2. **Coordinate announcements** (if applicable)

## Abort Workflow

User can say "abort" or "cancel" at any time to exit this workflow.
