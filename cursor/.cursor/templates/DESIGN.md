# Design Proposal

## DESIGN-{ID}: {Feature Name}

| Field | Value |
|-------|-------|
| Status | Draft / In Review / Approved |
| Author | {name} |
| Date | {YYYY-MM-DD} |
| FRD Reference | FRD-{ID} |

---

## 1. Overview

### Summary
{Brief description of the design approach}

### Goals
- {Goal 1}
- {Goal 2}

### Non-Goals
- {What this design explicitly does NOT address}

## 2. Existing Solutions Analysis

### What exists today
{Analysis of current codebase - REUSE FIRST}

| Component | Can Reuse? | Notes |
|-----------|------------|-------|
| {component} | Yes/No/Partial | {notes} |

### Patterns to follow
- {Pattern from existing codebase}

## 3. Proposed Design

### Architecture Overview

```
┌─────────────────────────────────────────────┐
│                                             │
│   [Component diagram or ASCII art]          │
│                                             │
└─────────────────────────────────────────────┘
```

### Components

#### {Component 1}
- **Purpose**: {what it does}
- **Responsibilities**: {list}
- **Interfaces**: {inputs/outputs}

#### {Component 2}
- **Purpose**: {what it does}
- **Responsibilities**: {list}
- **Interfaces**: {inputs/outputs}

### Data Flow

```
[Source] → [Process] → [Destination]
```

### API Design (if applicable)

```typescript
// Interface definitions
interface {Name} {
  // ...
}
```

## 4. Options Considered

### Option A: {Name} (Recommended)
- **Approach**: {description}
- **Pros**:
  - {pro 1}
  - {pro 2}
- **Cons**:
  - {con 1}

### Option B: {Name}
- **Approach**: {description}
- **Pros**:
  - {pro 1}
- **Cons**:
  - {con 1}
  - {con 2}

### Decision Rationale
{Why Option A was chosen}

## 5. Implementation Plan

### Files to create/modify

| File | Action | Description |
|------|--------|-------------|
| {path} | Create/Modify | {what changes} |

### Implementation phases

1. **Phase 1**: {description}
   - [ ] Task 1
   - [ ] Task 2

2. **Phase 2**: {description}
   - [ ] Task 1
   - [ ] Task 2

### Breaking changes
{None / List of breaking changes with migration path}

## 6. Technical Decisions

### ADR: {Decision Title}
```
Status: Proposed
Date: {YYYY-MM-DD}
Context: {1-3 sentences}
Decision: {concise paragraph}
Consequences:
  + {positive}
  - {tradeoff}
```

## 7. Security Considerations

- {Security aspect 1}
- {Security aspect 2}

## 8. Performance Considerations

- {Performance aspect 1}
- {Performance aspect 2}

## 9. Testing Strategy

{Brief overview - details in TEST-{ID}.md}

- Unit tests for: {components}
- Integration tests for: {interactions}
- E2E tests for: {flows}

## 10. Open Questions

- [ ] {Question 1}
- [ ] {Question 2}

---

## Approval

| Role | Name | Date | Status |
|------|------|------|--------|
| Architect | | | Pending |
| Tech Lead | | | Pending |
