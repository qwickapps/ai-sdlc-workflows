# Engineering Working Documents

This folder contains working documents created during SDLC workflows.

## Folder Structure

```
engineering/
├── frd/           # Feature Request Documents
├── design/        # Design Proposals
├── test-plans/    # Test Plans
├── reviews/       # Code Review Reports
├── spikes/        # Investigation Reports
├── bugs/          # Bug Analysis Documents
└── releases/      # Release Documents
```

## Document Lifecycle

1. **Created** during workflow phases
2. **Guide** implementation decisions
3. **Archived** after feature completion
4. **Not committed** to version control (gitignore this folder)

## Why Not Commit These?

- They go stale immediately after implementation
- The code is the source of truth
- Tests document behavior better than prose
- Less maintenance burden

## What Gets Committed Instead

- Source code
- Tests
- README.md updates
- CHANGELOG.md entries
- ADRs for significant decisions (in `memories/`)
