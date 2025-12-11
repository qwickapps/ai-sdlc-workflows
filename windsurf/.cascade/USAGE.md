# Cascade Workflow System - Usage Guide

## Quick Start

When you want to work on a JIRA ticket, simply provide the ticket number:
```
"Implement RS-12345"
```

The system will automatically:
1. Activate the **architect** agent to analyze requirements
2. Switch to **devops** agent to create the branch
3. Use **coder** agent to implement changes
4. Engage **reviewer** agent for code review
5. Activate **qa** agent for testing
6. Return to **devops** agent for commit and PR
7. Use **tech-writer** agent to document completion

## Agent Behaviors

### Architect
- Reads JIRA tickets thoroughly
- Searches KB for related information
- Stops to discuss if requirements are unclear
- Documents approach before proceeding
- Updates KB for architectural decisions

### DevOps
- Creates branches with correct naming
- Validates commit messages
- Creates pull requests
- Manages deployments

### Coder
- Reads existing code before making changes
- Follows existing patterns
- Adds all necessary imports
- Writes production-ready code
- Stops if uncertain about approach

### Reviewer
- Verifies requirements met
- Checks code quality
- Validates test coverage
- Ensures documentation updated

### QA
- Creates test plans
- Verifies functionality
- Documents test results
- Identifies coverage gaps

### Tech Writer
- Generates reports
- Updates knowledge base
- Maintains documentation
- Professional tone, no emojis

## Validation Gates

Every step has validation gates that must pass:
- Branch names must match patterns
- Commit messages must match regex
- Code must compile and run
- Tests must pass
- Documentation must be updated

## Stop and Discuss

The system will stop and ask for clarification when:
- Requirements are ambiguous
- Multiple valid approaches exist
- Uncertain about implementation
- Breaking changes required
- Facts cannot be verified

## Knowledge Base

The KB stores architectural knowledge in searchable format:
- Component documentation
- Architectural decisions
- System patterns
- Technical discoveries

Search KB: `grep -r "keyword" .cascade/kb/`

## Reports

All reports saved in `.cascade/engineering/reports/`:
- `analysis/` - Investigation reports
- `implementation/` - Completion reports
- `testing/` - Test plans and results

## Quality Standards

All work follows these standards:
- No emojis (except UI icons)
- Professional, neutral tone
- Fact-based statements only
- No assumptions
- Validate before proceeding

## Workflows Available

- **ticket-implementation** - Full JIRA ticket workflow
- **bug-fix** - Bug investigation and fix
- **feature-development** - New feature development
- **code-review** - Thorough code review
- **hotfix** - Emergency production fixes

## Examples

### Implement a Feature
```
"Implement feature RS-12345"
```

### Fix a Bug
```
"Fix bug RS-12346"
```

### Create Hotfix
```
"Create hotfix for RS-12347"
```

### Review Code
```
"Review the code changes for RS-12348"
```

### Respond to PR Review Comments
```
"Address review comments for PR RS-12349"
```

## Troubleshooting

If a step fails:
1. System will report the failure
2. Preserve work done so far
3. Document the issue
4. Ask for guidance

If validation fails:
1. System will explain what failed
2. Show expected vs actual
3. Wait for correction or guidance
