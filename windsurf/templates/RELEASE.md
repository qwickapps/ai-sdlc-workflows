# Release Document

## RELEASE: v{X.Y.Z}

| Field | Value |
|-------|-------|
| Status | Planning / Ready / Released |
| Release Date | {YYYY-MM-DD} |
| Release Manager | {name} |

---

## 1. Release Overview

### Version
- **Current**: v{X.Y.Z}
- **Previous**: v{X.Y.Z}
- **Type**: Major / Minor / Patch

### Summary
{2-3 sentence summary of this release}

## 2. Changes Included

### Features
- {FRD-XXX}: {Feature name} - {brief description}
- {FRD-XXX}: {Feature name} - {brief description}

### Bug Fixes
- {BUG-XXX}: {Bug description} - {brief fix description}

### Improvements
- {description}

### Breaking Changes
- **{Change}**: {Description and migration path}

## 3. Pre-Release Checklist

### Code Quality
- [ ] All features merged to release branch
- [ ] All tests passing
- [ ] No critical bugs outstanding
- [ ] Code review completed for all changes

### Documentation
- [ ] CHANGELOG.md updated
- [ ] README.md updated (if needed)
- [ ] ARCHITECTURE.md updated (if needed)
- [ ] Migration guide written (if breaking changes)

### Version Updates
- [ ] package.json version bumped
- [ ] Other version references updated

### Testing
- [ ] Unit tests passing
- [ ] Integration tests passing
- [ ] E2E tests passing
- [ ] Manual smoke test completed

## 4. Deployment Plan

### Environments
| Environment | Deploy Date | Status |
|-------------|-------------|--------|
| Staging | {date} | Pending |
| Production | {date} | Pending |

### Rollback Plan
{How to rollback if issues are found}

### Monitoring
{What to monitor post-deployment}

## 5. Release Notes (External)

```markdown
## v{X.Y.Z} - {YYYY-MM-DD}

### New Features
- {Feature description}

### Improvements
- {Improvement description}

### Bug Fixes
- {Bug fix description}

### Breaking Changes
- {Breaking change with migration instructions}
```

## 6. Communication Plan

### Internal
- [ ] Engineering team notified
- [ ] Support team briefed

### External (if applicable)
- [ ] Release notes published
- [ ] Blog post (if major release)
- [ ] Customer notification (if breaking changes)

## 7. Post-Release

### Verification
- [ ] Deployment successful
- [ ] Smoke tests passing in production
- [ ] No error spikes in monitoring

### Issues Found
| Issue | Severity | Status |
|-------|----------|--------|
| {issue} | {severity} | {status} |

---

## Approval

| Role | Name | Date | Status |
|------|------|------|--------|
| Release Manager | | | Pending |
| Tech Lead | | | Pending |
