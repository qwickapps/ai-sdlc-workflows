# Investigation Methods Checklist

**When to apply:** During any research, spike, or investigation task - especially before concluding "cannot verify" or "unknown".

---

## Core Principle

**Exhaust all available investigation methods before concluding something is unknowable.**

Do not give up after hitting a dead end. Pivot to alternative methods.

**Reference:** See RESEARCH-DEPTH.md for tool selection and COMMON-PATTERNS.md for evidence requirements.

---

## Investigation Methods Hierarchy

Try methods in order. Document which attempted and why others cannot be used.

### Level 1: Local Codebase (ALWAYS TRY FIRST)

Before searching externally, check what exists locally:

- [ ] **Search for files**: Glob, find, ls
- [ ] **Read source code**: node_modules, plugins, vendor, lib directories
- [ ] **Inspect configuration**: plugin.xml, package.json, *.config files
- [ ] **Check installed files**: platforms/, www/, hooks/ directories
- [ ] **Grep codebase**: Search for usage, imports, references

**Why this first:** Source code is ground truth. Public docs may be outdated.

### Level 2: Public Package Registries

If Level 1 insufficient:

- [ ] **npm/yarn**: npmjs.com for version history, dependencies, engine requirements
- [ ] **PyPI**: For Python packages
- [ ] **Maven/Gradle**: For Java packages
- [ ] **RubyGems**: For Ruby packages
- [ ] **Other registries**: Based on technology stack

**What to check:** Latest version, publish date, engine requirements, dependencies, download statistics.

### Level 3: Code Repositories

- [ ] **GitHub/GitLab/Bitbucket**: Last commit, open issues, PRs, contributors
- [ ] **README, CHANGELOG**: Compatibility mentions, breaking changes, deprecation
- [ ] **Issue Trackers**: Search "[package] [platform version]"
- [ ] **Pull Requests**: Check for pending compatibility fixes

**Why repositories:** Shows maintenance status, community activity, known problems.

### Level 4: Official Documentation

- [ ] **Official docs**: Product documentation, API references (WebFetch)
- [ ] **Release announcements**: Breaking changes, new features, deprecations
- [ ] **Migration guides**: Compatibility requirements

### Level 5: Community Sources

- [ ] **Stack Overflow**: Specific errors or compatibility questions
- [ ] **Forums/Discussions**: Reddit, Discord, Slack communities
- [ ] **Blog posts**: Developer upgrade experiences
- [ ] **Social media**: Recent reports

**Caution:** Community sources may be outdated or incorrect. Verify with primary sources.

### Level 6: Testing/Experimentation

When documentation unavailable or contradictory:

- [ ] **Create test project**: Minimal reproduction
- [ ] **Run commands**: Check actual behavior
- [ ] **Inspect output**: Build logs, error messages
- [ ] **Compare versions**: Side-by-side comparison

**When to test:** Documentation unclear/missing, claims contradict, need to verify compatibility.

---

## Before Concluding "Cannot Verify"

### Exhaustiveness Checklist

- [ ] Searched for files locally (Glob, find)
- [ ] Read available source code (node_modules, plugins)
- [ ] Inspected configuration files (plugin.xml, package.json)
- [ ] Checked package registries (npm, etc.)
- [ ] Searched code repositories (GitHub)
- [ ] Read official documentation (if available)
- [ ] Searched community sources (if needed)

**If ANY unchecked AND that method is available:** Do NOT conclude "cannot verify"

Instead:
1. Document which methods tried
2. Identify next available method
3. Try that method
4. Update findings

---

## Documenting Investigation Attempts

When you hit a dead end, document what tried:

**Bad:**
```
Cannot verify @zeyt plugin compatibility.
```

**Good:**
```
@zeyt plugin compatibility: Cannot verify from public sources.

Investigation attempts:
1. Searched npmjs.com for @zeyt organization - not found
2. Searched GitHub for @zeyt repositories - not found
3. WebSearch for "@zeyt cordova plugins" - no results

Available methods not yet tried:
1. Read local plugin source code from installed files
   Location: node_modules/@zeyt/ or plugins/
   Can verify: engine requirements, implementation details
2. Check plugin.xml for engine tags
3. Inspect iOS/Android source for compatibility issues

Next step: Read installed plugin files.
```

---

## Common Investigation Failures

### Failure 1: Stopping After Public Search Fails

❌ Searched npm, not found. Cannot verify.
✅ Not on public npm. Checking local installation... [Read node_modules/@zeyt/plugin-name/plugin.xml]

### Failure 2: Not Checking Installed Files

❌ Plugin source unknown, cannot assess compatibility.
✅ [Check if plugin installed] [Read plugin.xml] [Inspect source in src/] Found: Engine requirements, implementation language, API usage

### Failure 3: Assuming Without Verifying

❌ Old plugin, probably incompatible.
✅ [Read plugin source] [Check for specific API usage] Found: Uses deprecated API X (src/ios/Plugin.m:45)

### Failure 4: Not Pivoting After Dead End

❌ GitHub search found nothing. Unknown.
✅ GitHub search found nothing. Trying alternative: [Search for plugin functionality keywords] [Read local source if installed]

---

## Special Cases

### Private/Internal Packages

If package not publicly available:

1. **Check local installation** (they must be installed if in use)
2. **Read source code** from installed location
3. **Check package.json** for actual package name (may differ from @scope)
4. **Inspect implementation** for compatibility issues
5. **Document** as "private package - verified from local source"

### Deprecated/Archived Projects

If project deprecated:

1. **Check when archived** (date matters)
2. **Read last version source** (may still work)
3. **Look for maintained forks**
4. **Assess if API changes affect it**
5. **Document** deprecation status with evidence

---

## Investigation Depth Guidelines

### Shallow (NOT ACCEPTABLE)
- Only checked public npm
- Only searched GitHub
- Only read README
- Used vague language

### Medium (ACCEPTABLE for non-critical)
- Checked registry + GitHub
- Read documentation
- Searched issue tracker
- Documented with sources

### Deep (REQUIRED for critical)
- All of Medium, PLUS:
- Read actual source code
- Checked configuration files
- Traced code paths
- Verified with multiple sources
- Tested if needed
- Documented with file:line refs

**Reference:** See RESEARCH-DEPTH.md for detailed depth level definitions.

---

## Time-Boxing

If investigation taking too long:

1. **Document what tried** (all methods attempted)
2. **Document what's remaining** (methods available but not tried)
3. **Ask user** if you should continue or move on
4. **Mark as "requires further investigation"** with specific next steps

**Do NOT:**
- Silently give up
- Mark as "unknown" without documentation
- Make assumptions to fill gaps

**Reference:** See COMMON-PATTERNS.md § Time-Boxing Pattern for template.

---

## Self-Check Before Concluding "Unknown"

- [ ] Tried at least 3 investigation methods
- [ ] Checked local codebase if applicable
- [ ] Documented all methods attempted
- [ ] Documented why remaining methods cannot be used
- [ ] Explained what specific information is missing
- [ ] Explained WHY it's unknowable (not just "couldn't find")

**If any fails:** Continue investigating.

**Reference:** See COMMON-PATTERNS.md § Unknown/Gap Documentation for template.
