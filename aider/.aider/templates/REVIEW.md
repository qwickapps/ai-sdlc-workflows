# Code Review Report

## REVIEW-{ID}: {Context/Feature Name}

| Field | Value |
|-------|-------|
| Date | {YYYY-MM-DD} |
| Reviewer | {name} |
| FRD Reference | FRD-{ID} (if applicable) |
| Design Reference | DESIGN-{ID} (if applicable) |

---

## 1. Review Summary

### Overall Assessment

**Verdict**: APPROVED / APPROVED WITH CHANGES / NEEDS WORK

**Summary**: {1-2 sentence summary}

### Files Reviewed

| File | Changes | Assessment |
|------|---------|------------|
| {path} | {Added/Modified/Deleted} | {OK/Issues} |

## 2. Critical Issues (Must Fix)

Issues that block approval - security vulnerabilities, data corruption risks, breaking changes.

| ID | Location | Issue | Recommendation |
|----|----------|-------|----------------|
| C-001 | {file:line} | {description} | {fix} |

## 3. Important Issues (Should Fix)

Issues that should be addressed - performance, error handling, test coverage.

| ID | Location | Issue | Recommendation |
|----|----------|-------|----------------|
| I-001 | {file:line} | {description} | {fix} |

## 4. Minor Issues (Consider)

Style, minor optimizations, nice-to-haves.

| ID | Location | Issue | Recommendation |
|----|----------|-------|----------------|
| M-001 | {file:line} | {description} | {suggestion} |

## 5. Positive Notes

Good patterns and practices observed.

- {Positive observation 1}
- {Positive observation 2}

## 6. Verification Checklist

### Functionality
- [ ] Code implements requirements correctly
- [ ] Edge cases handled
- [ ] Error handling appropriate

### Quality
- [ ] Code follows project patterns
- [ ] No code smells or anti-patterns
- [ ] DRY principle followed

### Security
- [ ] No hardcoded secrets
- [ ] Input validation present
- [ ] No injection vulnerabilities

### Testing
- [ ] Unit tests present and passing
- [ ] Integration tests present (if needed)
- [ ] Test coverage adequate

### Documentation
- [ ] Code comments where needed
- [ ] README updated (if applicable)
- [ ] CHANGELOG updated (if applicable)
- [ ] ARCHITECTURE updated (if applicable)

## 7. Required Actions

Prioritized list of actions before approval:

1. {Action 1 - Critical}
2. {Action 2 - Important}
3. {Action 3 - Minor}

## 8. Questions for Author

- {Question 1}
- {Question 2}

---

## Review History

| Version | Date | Reviewer | Verdict |
|---------|------|----------|---------|
| v1 | {date} | {name} | {verdict} |
