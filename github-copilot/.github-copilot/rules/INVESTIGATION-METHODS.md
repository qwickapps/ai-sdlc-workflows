# Investigation Methods Checklist

**When to apply:** During any research, spike, or investigation task - especially before concluding "cannot verify" or "unknown".

---

## Core Principle

**Exhaust all available investigation methods before concluding something is unknowable.**

Do not give up after hitting a dead end. Pivot to alternative methods.

---

## Investigation Methods Hierarchy

Try methods in order. Document which methods were attempted and why others cannot be used.

### Level 1: Local Codebase (ALWAYS TRY FIRST)

Before searching externally, check what exists locally:

- [ ] **Search for files**: Use Glob, find, ls to locate relevant files
  - Example: `find . -name "plugin.xml"` or `Glob: "**/@zeyt/*/plugin.xml"`

- [ ] **Read source code**: Check node_modules, plugins, vendor, lib directories
  - Example: Read `node_modules/@package/plugin.xml` for engine requirements
  - Example: Read `plugins/cordova-plugin-x/src/ios/Plugin.m` for implementation

- [ ] **Inspect configuration**: Check plugin.xml, package.json, *.config files
  - Example: Read plugin.xml for engine tags, dependencies
  - Example: Check package.json for versions and dependencies

- [ ] **Check installed files**: platforms/, www/, hooks/ directories
  - Example: Read `platforms/ios/App/config.xml` for actual configuration

- [ ] **Grep codebase**: Search for usage, imports, references
  - Example: `Grep: "import.*Plugin"` to find usage
  - Example: `Grep: "scene.*openURL"` to find Scene API implementation

**Why this first:** Source code is ground truth. Public documentation may be outdated or wrong.

---

### Level 2: Public Package Registries

If Level 1 insufficient, check public registries:

- [ ] **npm/yarn**: Search npmjs.com, check package page
  - Provides: Version history, last update, dependencies, engine requirements

- [ ] **PyPI**: For Python packages

- [ ] **Maven/Gradle**: For Java packages

- [ ] **RubyGems**: For Ruby packages

- [ ] **Other registries**: Based on technology stack

**What to check:**
- Latest version and publish date
- Engine/platform requirements
- Dependencies and peer dependencies
- Download statistics (indicates active use)

---

### Level 3: Code Repositories

- [ ] **GitHub/GitLab/Bitbucket**: Search for repository
  - Check: Last commit date, open issues, pull requests, contributors
  - Read: README, CHANGELOG, release notes
  - Look for: Compatibility mentions, breaking changes, deprecation notices

- [ ] **Issue Trackers**: Search for specific version or compatibility issues
  - Search: "[package name] [platform version]"
  - Check: Open and closed issues

- [ ] **Pull Requests**: Check for pending compatibility fixes
  - May indicate work in progress or known issues

**Why repositories:** Shows maintenance status, community activity, known problems.

---

### Level 4: Official Documentation

- [ ] **Official docs**: Product documentation, API references
  - WebFetch documentation pages
  - Check version-specific docs (e.g., "cordova-ios 8 docs")

- [ ] **Release announcements**: Official blog posts, changelogs
  - Contains breaking changes, new features, deprecations

- [ ] **Migration guides**: Platform upgrade guides
  - Documents compatibility requirements

---

### Level 5: Community Sources

- [ ] **Stack Overflow**: Search for specific errors or compatibility questions

- [ ] **Forums/Discussions**: Reddit, Discord, Slack communities

- [ ] **Blog posts**: Developer experiences with upgrades

- [ ] **Social media**: Twitter/X for recent reports

**Caution:** Community sources may be outdated or incorrect. Verify with primary sources.

---

### Level 6: Testing/Experimentation

When documentation is unavailable or contradictory:

- [ ] **Create test project**: Minimal reproduction
- [ ] **Run commands**: Check actual behavior
- [ ] **Inspect output**: Build logs, error messages
- [ ] **Compare versions**: Side-by-side comparison

**When to test:**
- Documentation unclear or missing
- Claims contradict each other
- Need to verify compatibility claim

---

## Before Concluding "Cannot Verify"

Check this exhaustiveness gate:

### Exhaustiveness Checklist

- [ ] Searched for files locally (Glob, find)
- [ ] Read available source code (node_modules, plugins)
- [ ] Inspected configuration files (plugin.xml, package.json)
- [ ] Checked package registries (npm, etc.)
- [ ] Searched code repositories (GitHub)
- [ ] Read official documentation (if available)
- [ ] Searched community sources (if needed)

### If ANY checkbox is unchecked AND that method is available:

**Do NOT conclude "cannot verify"**

Instead:
1. Document which methods you've tried
2. Identify the next available method
3. Try that method
4. Update your findings

---

## Documenting Investigation Attempts

When you hit a dead end, document what you tried:

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
3. Inspect iOS/Android source code for compatibility issues

Next step: Read installed plugin files.
```

---

## Common Investigation Failures

### Failure 1: Stopping After Public Search Fails

**Wrong:**
```
Searched npm, not found. Cannot verify.
```

**Right:**
```
Not on public npm. Checking local installation...
[Read node_modules/@zeyt/plugin-name/plugin.xml]
Found: Plugin is actually [source], version X.Y.Z
```

### Failure 2: Not Checking Installed Files

**Wrong:**
```
Plugin source unknown, cannot assess compatibility.
```

**Right:**
```
[Check if plugin is installed]
[Read plugin.xml from installed location]
[Inspect source code in src/ directory]
Found: Engine requirements, implementation language, API usage
```

### Failure 3: Assuming Without Verifying

**Wrong:**
```
Old plugin, probably incompatible.
```

**Right:**
```
[Read plugin source code]
[Check for specific API usage]
Found: Uses deprecated API X (src/ios/Plugin.m:45)
Evidence: No SceneDelegate implementation present
```

### Failure 4: Not Pivoting After Dead End

**Wrong:**
```
GitHub search found nothing. Unknown.
```

**Right:**
```
GitHub search found nothing. Trying alternative:
[Search for plugin functionality keywords]
[Read local source if installed]
[Check package.json for actual package name]
```

---

## Special Cases

### Private/Internal Packages

If package is not publicly available:

1. **Check local installation** (they must be installed if in use)
2. **Read source code** from installed location
3. **Check package.json** for actual package name (may differ from @scope)
4. **Inspect implementation** for compatibility issues
5. **Document** as "private package - verified from local source"

**Example:**
```
@zeyt packages not found on public npm.
Conclusion: Internal/private packages.
Investigation: Read installed plugin files.
Result: @zeyt/cordova-universal-links-plugin is actually e-imaxina/cordova-plugin-deeplinks (plugin.xml:13)
```

### Deprecated/Archived Projects

If project is deprecated:

1. **Check when it was archived** (date matters)
2. **Read last version source code** (may still work)
3. **Look for maintained forks**
4. **Assess if API changes affect it**
5. **Document** deprecation status with evidence

---

## Investigation Depth Guidelines

### Shallow Investigation (NOT ACCEPTABLE)
- Only checked public npm
- Only searched GitHub
- Only read README
- Used vague language ("may need", "possibly")

### Medium Investigation (ACCEPTABLE for non-critical)
- Checked registry + GitHub
- Read documentation
- Searched issue tracker
- Documented findings with sources

### Deep Investigation (REQUIRED for critical items)
- All of Medium, PLUS:
- Read actual source code
- Checked configuration files
- Traced code paths
- Verified with multiple sources
- Tested if needed
- Documented with file:line references

---

## Time-Boxing

If investigation is taking too long:

1. **Document what you've tried** (all methods attempted)
2. **Document what's remaining** (methods available but not tried)
3. **Ask user** if you should continue or move on
4. **Mark as "requires further investigation"** with specific next steps

**Do NOT:**
- Silently give up
- Mark as "unknown" without documentation
- Make assumptions to fill gaps

---

## Self-Check Before Concluding "Unknown"

- [ ] Tried at least 3 investigation methods
- [ ] Checked local codebase if applicable
- [ ] Documented all methods attempted
- [ ] Documented why remaining methods cannot be used
- [ ] Explained what specific information is missing
- [ ] Explained WHY it's unknowable (not just "couldn't find")

If any checkbox fails, continue investigating.
