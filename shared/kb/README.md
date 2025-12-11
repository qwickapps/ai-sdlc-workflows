# Knowledge Base

This directory contains architectural knowledge, component documentation, and technical decisions.

## Structure

```
kb/
├── index.json              # Searchable index (auto-generated)
├── architecture/           # System architecture documentation
├── components/            # Individual component documentation
└── decisions/             # Architectural decision records
```

## Format

All KB entries use a concise, searchable format:

```markdown
# Component: [Name]
**Type**: [API/UI/Service/Database/Library]
**Location**: [file paths]
**Purpose**: [one-line description]
**Dependencies**: [list]
**Key Facts**:
- [fact 1]
- [fact 2]
- [fact 3]
**Related Components**: [list]
**Last Updated**: [YYYY-MM-DD]
```

## Usage

- Search using grep: `grep -r "keyword" .cascade/kb/`
- Index search: Check `index.json` for quick lookup
- Update entries when architectural changes occur
- Keep entries concise and factual
- No emojis, professional tone only

## Maintenance

- Update entries when code changes affect architecture
- Add new entries for significant components
- Archive outdated entries (move to archive/ subdirectory)
- Rebuild index after changes
