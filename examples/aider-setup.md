# Aider Setup Guide

This guide walks through setting up AI SDLC Workflows with Aider.

## Prerequisites

- [Aider](https://aider.chat) installed (`pip install aider-chat`)
- A project directory

## Setup Steps

### 1. Copy Conventions File

```bash
# From the ai-sdlc-workflows repository
cp aider/CONVENTIONS.md /path/to/your-project/CONVENTIONS.md
```

### 2. Copy Configuration (Recommended)

```bash
cp aider/.aider.conf.yml /path/to/your-project/.aider.conf.yml
```

This automatically loads the conventions file on every aider session.

### 3. Alternative: Manual Loading

If you don't want auto-loading, load conventions manually:

```bash
# At startup
aider --read CONVENTIONS.md

# Or during session
/read CONVENTIONS.md
```

## How It Works

Unlike Claude Code or Cursor, Aider doesn't have slash commands or rule files. Instead, `CONVENTIONS.md` provides persistent context that guides Aider's behavior.

The conventions file includes:
- Agent personas for different phases
- Critical rules (no auto-commit, no legacy support, etc.)
- Workflow patterns for features, bugs, refactoring
- Code quality standards
- Anti-patterns to avoid

## Using Workflows

### Feature Development

Start your message with context about what you're doing:

```
feature: Add user authentication with OAuth2

Please follow the feature workflow: requirements → design → test plan → implementation.
```

Aider will ask clarifying questions and proceed through phases.

### Bug Fixes

```
bug: Login fails when password contains special characters

Please investigate the root cause before implementing a fix.
```

### Quick Planning

```
plan: Refactor the database connection module

Please analyze the current code and present options before making changes.
```

### Refactoring

```
refactor: Extract validation logic into a separate module

Please show the impact analysis before proceeding.
```

## Example Session

```
You: feature: Add dark mode toggle

I want to add a dark mode toggle to the header. Please follow the feature workflow.

Aider: I'll follow the feature workflow for this.

## Phase 1: Requirements

Before I start implementing, I have some questions:

1. Where exactly in the header should the toggle appear?
2. Should the user's preference persist across sessions (localStorage)?
3. What's your current styling approach (CSS, Tailwind, styled-components)?
4. Should it default to the user's OS preference?

You: Right side of header, yes persist in localStorage, we use Tailwind, yes respect OS preference

Aider: Thank you. Here are the documented requirements:

**Feature: Dark Mode Toggle**
- Location: Right side of header
- Persistence: localStorage
- Styling: Tailwind dark mode
- Default: OS preference via prefers-color-scheme

Do these requirements look correct? Reply "approved" to proceed to design.

You: approved

Aider: ## Phase 2: Design

Let me search for existing patterns in your codebase...

I found:
- Header component at src/components/Header.tsx
- Tailwind config with dark mode class strategy
- No existing theme context

**REUSE FIRST**: I'll follow the pattern from your existing AuthContext.

**Design Proposal:**
1. Create ThemeProvider context
2. Add ThemeToggle button component
3. Integrate into Header

No legacy support or fallbacks included.

Approve this design to proceed?

You: approved

... [continues through phases] ...
```

## Configuration Options

### .aider.conf.yml

```yaml
# Load conventions automatically
read: CONVENTIONS.md

# Or load multiple files
read:
  - CONVENTIONS.md
  - PROJECT_CONTEXT.md

# Other useful options
auto-commits: false  # Prevent auto-commits
```

### Command Line Options

```bash
# Load conventions as read-only (better for caching)
aider --read CONVENTIONS.md

# Disable auto-commits
aider --no-auto-commits

# Combine options
aider --read CONVENTIONS.md --no-auto-commits
```

## Tips

### For Better Results

- Be explicit about which workflow you want to follow
- Answer clarifying questions thoroughly
- Ask for approval gates: "Wait for my approval before committing"
- Reference specific sections: "Follow the bug workflow from CONVENTIONS.md"

### Enforcing No Auto-Commit

Add to your `.aider.conf.yml`:

```yaml
auto-commits: false
```

Or always start with:

```bash
aider --no-auto-commits
```

### Read-Only for Caching

Loading conventions as read-only enables prompt caching:

```bash
aider --read CONVENTIONS.md
```

This is more efficient than adding the file to the chat.

## Customization

### Adding Project-Specific Conventions

Edit `CONVENTIONS.md` to add:
- Project-specific patterns
- Tech stack guidelines
- Team preferences
- Domain-specific rules

### Multiple Conventions Files

```yaml
# .aider.conf.yml
read:
  - CONVENTIONS.md      # SDLC workflows
  - TECH_STACK.md       # Technology guidelines
  - PATTERNS.md         # Code patterns
```

## Limitations

Aider doesn't have:
- Slash commands like `/feature`
- Rule activation via @mentions
- Automatic phase detection

You need to be more explicit about which workflow to follow compared to Claude Code or Cursor.

## Reference

- [Aider Documentation](https://aider.chat/docs/)
- [Conventions Documentation](https://aider.chat/docs/usage/conventions.html)
- [Configuration Options](https://aider.chat/docs/config.html)
