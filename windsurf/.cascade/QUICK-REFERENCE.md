# Cascade Workflow System - Quick Reference

## Agent Roles

| Agent | Role | When Active |
|-------|------|-------------|
| **architect** | Analyze requirements, design solutions | Start of any task, when design needed |
| **devops** | Manage branches, commits, PRs | Branch creation, commit, deployment |
| **coder** | Implement code changes | During implementation |
| **reviewer** | Review code quality | After implementation |
| **qa** | Test and validate | After code review |
| **tech-writer** | Document and report | End of task, documentation needs |

## Workflows

| Workflow | Trigger | Steps | Duration |
|----------|---------|-------|----------|
| **ticket-implementation** | JIRA ticket number | 8 steps | Full cycle |
| **bug-fix** | Bug report | 7 steps | Investigation + fix |
| **feature-development** | Feature request | 7 steps | Design + implement |
| **code-review** | Code ready | 5 steps | Review only |
| **hotfix** | Critical issue | 7 steps | Expedited |
| **pr-review-response** | PR comments received | 7 steps | Address feedback |

## Validation Rules

### Branch Names
```
bugfix/RS-XXXXX    - For bugs
feature/RS-XXXXX   - For features/stories
hotfix/RS-XXXXX    - For hotfixes
```

### Commit Messages
```
type(scope): description

Types: build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test
Scope: deps or RS-XXXXX

Examples:
  feat(RS-12345): Add user authentication
  fix(RS-12346): Resolve navigation bug
  docs(RS-12347): Update API documentation
```

## Stop Conditions

System will STOP and discuss when:
- Requirements unclear or ambiguous
- Multiple valid approaches exist
- Uncertain about implementation
- Breaking changes required
- Facts cannot be verified
- Security concerns identified
- Significant architectural impact

## Quality Standards

All work must follow:
- [PASS] No emojis in code/docs (UI icons OK)
- [PASS] Professional, neutral tone
- [PASS] Fact-based statements only
- [PASS] No assumptions without verification
- [PASS] Validate before proceeding
- [PASS] Stop when uncertain

## Knowledge Base

### Search KB
```bash
grep -r "keyword" .cascade/kb/
```

### Add KB Entry
Use template: `.cascade/kb/template.md`

### KB Structure
```
kb/
├── architecture/    - System architecture
├── components/      - Component docs
└── decisions/       - Decision records
```

## Reports

All reports saved in `.cascade/engineering/reports/`:
```
engineering/reports/
├── analysis/         - Investigation reports
├── implementation/   - Completion reports
└── testing/          - Test plans & results
```

## Validation Commands

```bash
# Validate commit message
.cascade/validators/commit-validator.sh "feat(RS-12345): Add feature"

# Validate branch name
.cascade/validators/branch-validator.sh "feature/RS-12345"

# Validate workflow step
.cascade/validators/workflow-validator.sh "ticket-implementation" "step-name"
```

## Common Tasks

### Implement JIRA Ticket
```
"Implement RS-12345"
```
System will: analyze → branch → code → review → test → commit → PR → report

### Fix Bug
```
"Fix bug RS-12346"
```
System will: analyze → bugfix branch → fix → review → test → commit → PR → report

### Create Hotfix
```
"Create hotfix for RS-12347"
```
System will: assess → hotfix branch → fix → expedited review → test → commit → PR → report

### Review Code
```
"Review code for RS-12348"
```
System will: requirements check → quality check → test coverage → documentation → approval

## Agent Handoffs

```
User Request
    ↓
Architect (analyze)
    ↓
DevOps (create branch)
    ↓
Coder (implement)
    ↓
Reviewer (review)
    ↓
QA (test)
    ↓
DevOps (commit & PR)
    ↓
Tech Writer (document)
    ↓
Complete
```

## Validation Gates

Every step must pass:
1. Pre-action validation (before starting)
2. Action execution (the work)
3. Post-action validation (after completing)
4. Gate check (can proceed?)
5. Handoff (to next agent)

If any gate fails:
- Work preserved
- Issue documented
- User notified
- Guidance requested

## File Locations

| Type | Location |
|------|----------|
| Config | `.cascade/config.yml` |
| Agents | `.cascade/agents/*.yml` (symlink to shared) |
| Workflows | `.cascade/workflows/*.yml` |
| Validators | `.cascade/validators/*.sh` (symlink to shared) |
| KB | `.cascade/kb/` (symlink to shared) |
| Engineering | `.cascade/engineering/` (symlink to shared) |
| Reports | `.cascade/engineering/reports/` |
| Docs | `.cascade/*.md` |

## Customization

### Add New Agent
1. Create `.cascade/agents/new-agent.yml`
2. Define role, responsibilities, validations
3. Specify handoff criteria

### Add New Workflow
1. Create `.cascade/workflows/new-workflow.yml`
2. Define steps with agents
3. Add validation gates
4. Specify stop conditions

### Add Validator
1. Create `.cascade/validators/new-validator.sh`
2. Make executable: `chmod +x`
3. Follow [PASS]/[FAIL] format

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Validator fails | Check format against examples |
| Agent uncertain | Provide clarification |
| Gate blocks | Fix issue, retry step |
| Workflow stuck | Check validation output |
| KB not found | Create entry using template |

## Best Practices

1. Always provide JIRA ticket number
2. Let system follow workflow
3. Answer clarification questions
4. Review agent outputs
5. Verify validation passes
6. Check reports generated
7. Update KB when learning
8. Use validators before commit

## System Behavior

The system will:
- [PASS] Read code before changing
- [PASS] Search KB before implementing
- [PASS] Validate at every step
- [PASS] Stop when uncertain
- [PASS] Document all work
- [PASS] Generate professional reports
- [PASS] Maintain audit trail
- [PASS] Follow existing patterns
