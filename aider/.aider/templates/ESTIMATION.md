# Estimation Document

## ESTIMATE-{ID}: {Feature/Task Name}

| Field | Value |
|-------|-------|
| Status | Draft / Final |
| Estimator | {name} |
| Date | {YYYY-MM-DD} |
| Related Artifact | {SPIKE-XXX, FRD-XXX, DESIGN-XXX, etc.} |

---

## 1. Estimation Summary

### What is Being Estimated
{Brief description of the work to be estimated}

### Estimation Method
{Method used: Three-point estimation, T-shirt sizing, story points, hours/days}

### Overall Confidence Level
**{High / Medium / Low}**

**Justification**:
{Why this confidence level? What factors contribute to certainty or uncertainty?}

## 2. Component Breakdown

### Component 1: {Name}

**Description**: {What needs to be done}

**Three-Point Estimate**:
| Estimate Type | Value | Justification |
|---------------|-------|---------------|
| Optimistic (Best Case) | {X hours/days/SP} | {Why this is the best-case scenario} |
| Realistic (Most Likely) | {Y hours/days/SP} | {Why this is most likely} |
| Pessimistic (Worst Case) | {Z hours/days/SP} | {Why this is the worst-case scenario} |

**Expected Value**: {(Optimistic + 4×Realistic + Pessimistic) / 6}

**Confidence**: {High / Medium / Low}

**Dependencies**:
- {Dependency 1}
- {Dependency 2}

**Risks**:
- {Risk 1}
- {Risk 2}

---

### Component 2: {Name}

{Same structure as Component 1}

---

### Component 3: {Name}

{Same structure as Component 1}

---

## 3. Total Estimate

### Summary Table

| Component | Optimistic | Realistic | Pessimistic | Expected | Confidence |
|-----------|------------|-----------|-------------|----------|------------|
| {Component 1} | {X} | {Y} | {Z} | {EV} | {H/M/L} |
| {Component 2} | {X} | {Y} | {Z} | {EV} | {H/M/L} |
| {Component 3} | {X} | {Y} | {Z} | {EV} | {H/M/L} |
| **TOTAL** | **{sum}** | **{sum}** | **{sum}** | **{sum}** | **{overall}** |

### Range
- **Best Case**: {Total Optimistic}
- **Most Likely**: {Total Realistic}
- **Worst Case**: {Total Pessimistic}
- **Expected Duration**: {Total Expected Value}

### Confidence Breakdown
- **High Confidence Components**: {count} ({percentage}%)
- **Medium Confidence Components**: {count} ({percentage}%)
- **Low Confidence Components**: {count} ({percentage}%)

## 4. Risk Factors

### High Impact Risks
| Risk | Probability | Impact | Mitigation | Contingency |
|------|-------------|--------|------------|-------------|
| {risk} | {H/M/L} | {H/M/L} | {mitigation strategy} | {+ X days/hours if occurs} |

### Medium Impact Risks
| Risk | Probability | Impact | Mitigation | Contingency |
|------|-------------|--------|------------|-------------|
| {risk} | {H/M/L} | {H/M/L} | {mitigation strategy} | {+ X days/hours if occurs} |

## 5. Assumptions

### Technical Assumptions
- {Assumption 1: e.g., "Existing API can handle additional load without modifications"}
- {Assumption 2: e.g., "Third-party library version X.Y.Z is compatible"}
- {Assumption 3}

### Resource Assumptions
- {Assumption 1: e.g., "Developer has access to staging environment"}
- {Assumption 2: e.g., "Design assets will be ready by milestone date"}
- {Assumption 3}

### Process Assumptions
- {Assumption 1: e.g., "Code reviews will be completed within 1 business day"}
- {Assumption 2: e.g., "No major architectural changes during implementation"}
- {Assumption 3}

**If assumptions prove incorrect**: {Impact on estimate}

## 6. Dependencies

### External Dependencies
| Dependency | Owner | Required By | Status | Risk |
|------------|-------|-------------|--------|------|
| {dependency} | {team/person} | {date/milestone} | {status} | {H/M/L} |

### Internal Dependencies
| Dependency | Owner | Required By | Status | Risk |
|------------|-------|-------------|--------|------|
| {dependency} | {team/person} | {date/milestone} | {status} | {H/M/L} |

## 7. Exclusions

What is **NOT** included in this estimate:
- {Exclusion 1}
- {Exclusion 2}
- {Exclusion 3}

## 8. Historical Context (if applicable)

### Similar Past Work
| Task | Estimated | Actual | Variance | Lessons Learned |
|------|-----------|--------|----------|-----------------|
| {task} | {est} | {actual} | {+/- %} | {lesson} |

### Velocity Data (if using story points)
- **Team Velocity**: {X SP per sprint (average of last N sprints)}
- **Estimated Sprints**: {Y sprints}

## 9. Confidence Drivers

### Factors Increasing Confidence
- {Factor 1: e.g., "Similar work completed recently"}
- {Factor 2: e.g., "Well-understood technology stack"}
- {Factor 3}

### Factors Decreasing Confidence
- {Factor 1: e.g., "New technology not used before"}
- {Factor 2: e.g., "Multiple unknown dependencies"}
- {Factor 3}

## 10. Recommendation

### Suggested Buffer
**{X% of expected value}** based on confidence level and risk profile.

**Total Estimate with Buffer**: {Expected + Buffer}

### When to Re-estimate
Re-estimate if:
- {Condition 1: e.g., "Assumptions prove incorrect"}
- {Condition 2: e.g., "Major technical blocker discovered"}
- {Condition 3: e.g., "Scope changes significantly"}

---

## Approval

| Date | Approver | Status | Notes |
|------|----------|--------|-------|
| {date} | {name/role} | {Approved/Rejected/Needs Revision} | {notes} |

---

## Estimate Accuracy Tracking (post-completion)

**To be filled after work is completed**:

| Component | Estimated | Actual | Variance | Reason for Variance |
|-----------|-----------|--------|----------|---------------------|
| {component} | {est} | {actual} | {+/- %} | {reason} |
| **TOTAL** | **{est}** | **{actual}** | **{+/- %}** | |

**Lessons Learned**: {What can improve future estimates?}
