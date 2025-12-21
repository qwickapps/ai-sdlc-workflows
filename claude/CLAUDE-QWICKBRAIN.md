# AI-Assisted Development Guidelines (QwickBrain Edition)

This configuration uses **QwickBrain** as the central knowledge base for all engineering documents, workflows, and project context.

---

## CRITICAL RULES - ALWAYS FOLLOW

### 1. ALWAYS Use QwickBrain MCP Tools

```
For ALL engineering documents, use QwickBrain MCP tools:

WORKFLOWS:
- mcp__qwickbrain__get_workflow     - Get workflow by name (feature, bug, spike, etc.)
- mcp__qwickbrain__list_workflows   - List all available workflows

DOCUMENTS (FRDs, designs, test plans, reviews, spikes, bugs):
- mcp__qwickbrain__create_document  - Create new document
- mcp__qwickbrain__get_document     - Retrieve document by name/type
- mcp__qwickbrain__list_documents   - List documents with filters
- mcp__qwickbrain__update_document  - Update existing document
- mcp__qwickbrain__search_documents - Semantic search across documents

MEMORIES (project context, decisions):
- mcp__qwickbrain__get_memory       - Get a memory by name
- mcp__qwickbrain__set_memory       - Create/update a memory
- mcp__qwickbrain__list_memories    - List all memories
- mcp__qwickbrain__search_memories  - Search memories semantically

CODE ANALYSIS:
- mcp__qwickbrain__analyze_repository - Analyze repo structure
- mcp__qwickbrain__analyze_file       - Analyze single file
- mcp__qwickbrain__find_functions     - Find functions by pattern
- mcp__qwickbrain__find_classes       - Find classes by pattern
- mcp__qwickbrain__search_codebase    - Semantic code search

NEVER save engineering documents to local files.
ALWAYS use QwickBrain for persistent storage.
```

### 2. NEVER Auto-Commit

```
STOP. Did the user explicitly say "approved" or "commit"?
If NO → Do NOT commit. Show diff and wait for approval.
If YES → Proceed with commit.
```

### 3. NEVER Add Legacy Support

```
NO backwards compatibility unless explicitly requested
NO defensive fallbacks "just in case"
NO workarounds - fix the actual issue
Breaking changes are OK - ask if unsure
```

### 4. ALWAYS Plan Before Acting

```
For ANY non-trivial task:
1. Analyze the request
2. Check existing solutions (REUSE FIRST)
3. Present options with tradeoffs
4. Wait for user approval
5. Then implement

Use /plan for quick planning or /feature for full SDLC
```

### 5. ALWAYS Think Critically

```
DO NOT just do what user asks without thinking
DO analyze requests like an architect/PM/UX designer
DO identify potential issues
DO discuss options
DO push back when appropriate
```

### 6. ALWAYS Update Deliverables

```
After implementation, update:
- README.md (if usage changed)
- CHANGELOG.md (new entry)
- Tests (unit, integration, e2e as appropriate)
```

---

## Document Types in QwickBrain

| Type | Description | Scope | MCP Tool |
|------|-------------|-------|----------|
| `workflow` | SDLC workflow definitions | Global | `get_workflow`, `list_workflows` |
| `rule` | Quality rules | Global | `get_document`, `search_documents` |
| `adr` | Architecture Decision Records | Project/Global | `create_document`, `get_document` |
| `frd` | Feature Request Documents | Project | `create_document`, `get_document` |
| `design` | Design proposals | Project | `create_document`, `get_document` |
| `test_plan` | Test plans and strategies | Project | `create_document`, `get_document` |
| `review` | Code review reports | Project | `create_document`, `get_document` |
| `spike` | Technical investigations | Project | `create_document`, `get_document` |
| `bug` | Bug investigations | Project | `create_document`, `get_document` |
| `memory` | Project context/memories | Project/Global | `set_memory`, `get_memory` |

---

## SDLC Workflows

Use slash commands to invoke workflows. The workflow definition is retrieved from QwickBrain:

| Command | When to Use | QwickBrain Workflow |
|---------|-------------|---------------------|
| `/feature` | New feature development (full SDLC) | `get_workflow("feature")` |
| `/bug` | Bug investigation and fix | `get_workflow("bug")` |
| `/refactor` | Code restructuring | `get_workflow("refactor")` |
| `/spike` | Technical research/investigation | `get_workflow("spike")` |
| `/release` | Version release management | `get_workflow("release")` |
| `/code-review` | Code review before commit | `get_workflow("code-review")` |
| `/commit` | Controlled commit with approval | `get_workflow("commit")` |
| `/plan` | Quick planning for smaller tasks | `get_workflow("plan")` |
| `/docs` | Documentation updates | `get_workflow("docs")` |

### Workflow Agents

Each workflow phase uses the appropriate agent persona:

| Phase | Agent | Focus |
|-------|-------|-------|
| Requirements | product-manager | Gather needs, define scope |
| Design | architect | Technical design, REUSE FIRST |
| Test Strategy | quality-engineer | Test planning, edge cases |
| Implementation | coder | Clean code, no legacy support |
| Review | reviewer | Quality, security, patterns |
| Documentation | tech-writer | README, CHANGELOG, docs |
| Coordination | engineering-manager | Multi-team, releases |

---

## Creating Documents with QwickBrain

### Feature Request Document (FRD)

```
Use: mcp__qwickbrain__create_document
Arguments:
  doc_type: "frd"
  name: "FRD-001-feature-name"
  project: "<project-name>"
  content: "<markdown content>"
```

### Design Proposal

```
Use: mcp__qwickbrain__create_document
Arguments:
  doc_type: "design"
  name: "DESIGN-001-feature-name"
  project: "<project-name>"
  content: "<markdown content>"
```

### Test Plan

```
Use: mcp__qwickbrain__create_document
Arguments:
  doc_type: "test_plan"
  name: "TEST-001-feature-name"
  project: "<project-name>"
  content: "<markdown content>"
```

### Bug Analysis

```
Use: mcp__qwickbrain__create_document
Arguments:
  doc_type: "bug"
  name: "BUG-001-issue-description"
  project: "<project-name>"
  content: "<markdown content>"
```

### Spike Report

```
Use: mcp__qwickbrain__create_document
Arguments:
  doc_type: "spike"
  name: "SPIKE-001-investigation-topic"
  project: "<project-name>"
  content: "<markdown content>"
```

---

## Searching Documents

### Find Related Documents

```
Use: mcp__qwickbrain__search_documents
Arguments:
  query: "authentication architecture"
  project: "my-project"
  limit: 5
```

### Find by Type

```
Use: mcp__qwickbrain__list_documents
Arguments:
  doc_type: "adr"
  project: "my-project"
```

---

## Project Context with Memories

### Store Project Context

```
Use: mcp__qwickbrain__set_memory
Arguments:
  name: "project-patterns"
  project: "my-project"
  content: "# Patterns\n\n- Use factory pattern for..."
```

### Retrieve Context

```
Use: mcp__qwickbrain__get_memory
Arguments:
  name: "project-patterns"
  project: "my-project"
```

---

## Code Analysis

Before implementing features, use QwickBrain to understand the codebase:

### Analyze Repository Structure

```
Use: mcp__qwickbrain__analyze_repository
Arguments:
  path: "/path/to/repo"
```

### Search for Existing Solutions

```
Use: mcp__qwickbrain__search_codebase
Arguments:
  query: "function to handle authentication"
  limit: 10
```

### Find Similar Patterns

```
Use: mcp__qwickbrain__find_functions
Arguments:
  path: "/path/to/repo"
  pattern: "auth"
```

---

## Quick Reference

### Before Starting Any Task

1. Is this trivial (< 3 steps)? → Just do it
2. Is this non-trivial? → Use `/plan` or appropriate workflow
3. Does it need full SDLC? → Use `/feature`
4. Need existing context? → `search_documents` or `search_memories`

### Before Any Commit

1. Tests passing?
2. Docs updated?
3. User approved?

### When Creating Documents

1. Use `create_document` with appropriate `doc_type`
2. Include `project` parameter for project-scoped docs
3. Use semantic naming: `TYPE-NNN-short-description`

### When User Asks for Something

1. Understand the actual need
2. Search QwickBrain for existing solutions (REUSE FIRST)
3. Consider if request makes sense
4. Discuss options if multiple approaches
5. Get approval before implementing

---

## Anti-Patterns to Avoid

- Saving engineering documents to local `.claude/engineering/` files
- Not using QwickBrain MCP tools for document storage
- Jumping straight to code without planning
- Adding legacy support "just in case"
- Committing without explicit approval
- Not updating tests and documentation
- People-pleasing over critical thinking
