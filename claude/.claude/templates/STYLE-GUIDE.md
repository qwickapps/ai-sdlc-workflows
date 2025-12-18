# Professional Writing Style Guide

## Purpose

This guide ensures all documentation, reports, and communications maintain professional quality and avoid patterns that undermine credibility.

## Core Principles

1. **Factual accuracy over persuasion**
2. **Brevity over elaboration**
3. **Neutral tone over enthusiasm**
4. **Evidence over claims**

## Writing Standards

### Sentence Structure

**DO:**
- Use short, clear sentences (15-20 words maximum)
- One idea per sentence
- Active voice when possible
- Direct statements

**DON'T:**
- Use run-on sentences with multiple clauses
- Nest complex thoughts
- Use passive voice unnecessarily
- Add filler words

### Punctuation

**DO:**
- Use periods for statements
- Use single dashes for interruptions
- Use colons for lists

**DON'T:**
- Use excessive exclamation marks
- Use multiple em dashes per sentence
- Use ellipses except for literal omissions
- Use emojis in professional documents

### Tone

**DO:**
- State facts neutrally
- Acknowledge limitations
- Use precise technical terms
- Present options objectively

**DON'T:**
- Use superlatives (best, perfect, ideal)
- Make absolute claims without evidence
- Use marketing language
- Add unnecessary enthusiasm

### Evidence and Claims

**DO:**
- Cite sources for external information
- Include file paths for code references (file.ts:123)
- Link to documentation
- Mark assumptions explicitly
- Note when something cannot be verified

**DON'T:**
- Present assumptions as facts
- Make unverifiable claims
- Use vague references
- Omit sources

## Examples

### Bad Example

```
This is a really exciting solution that will dramatically improve performance!
The health endpoint is perfect for this use case, and it's super easy to implement.
We can leverage the existing infrastructure to create an amazing user experience
that will delight users and solve all the problems. This approach is clearly the
best option available.
```

**Problems:**
- Superlatives (really exciting, perfect, super easy, amazing, clearly the best)
- Unsubstantiated claims (dramatically improve, solve all problems)
- Excessive enthusiasm
- No evidence
- Long, nested sentences

### Good Example

```
The health endpoint approach extends existing functionality. This reduces
implementation risk and maintenance overhead. Performance impact is minimal
based on current endpoint latency (avg 50ms).

Trade-offs:
- Adds 2KB to health response payload
- Requires version table in database
- Cannot force immediate updates

This approach meets the requirements stated in AC. Alternative approaches
are documented in section 4.
```

**Strengths:**
- Factual statements
- Specific measurements
- Acknowledges trade-offs
- No superlatives
- Short sentences
- References other sections

## Common Violations

### Emojis

**NEVER use:**
- ⭐ Stars for emphasis
- ✅ Checkmarks for approval
- 🚀 Rockets for excitement
- Any emoji in professional documents

**Exception:** User interface mockups where emojis are part of the design.

### Excessive Em Dashes

**Bad:**
```
The solution—which leverages existing patterns—provides a way to notify users—
both iOS and Android—when updates are required.
```

**Good:**
```
The solution extends existing patterns. It notifies both iOS and Android users
when updates are required.
```

### Unverified Claims

**Bad:**
```
The mobile app uses version checking on startup.
```

**Good:**
```
The mobile app sends version info in User-Agent header (verified in
network_service.ts:45). No version checking mechanism was found in
codebase search (searched: "version check", "app version", "update required").
```

### Vague References

**Bad:**
```
There's an endpoint that handles this.
```

**Good:**
```
The /ta/rest/v1/health endpoint returns system status (health_controller.ts:23).
```

## Verification Requirements

Every factual claim must include:

1. **Source**: Where the information came from
2. **Method**: How it was verified
3. **Location**: File path and line number for code claims
4. **Timestamp**: When external docs were checked (if applicable)

### Verification Template

```
Claim: {Statement}
Source: {File path:line OR URL OR documentation reference}
Verified: {Date} via {method: code search/test execution/documentation review}
```

## Document Length

Reports should be concise:

- Spike reports: 1-2 pages maximum
- Bug analysis: 1 page maximum
- Design docs: 2-3 pages maximum
- Review reports: 1-2 pages maximum

If longer, split into sections with clear headings.

## Review Checklist

Before submitting any document:

- [ ] All sentences under 20 words
- [ ] No emojis
- [ ] No superlatives without data
- [ ] No excessive punctuation (!!!, ---, ...)
- [ ] All code references include file paths
- [ ] All claims have sources
- [ ] Assumptions marked as such
- [ ] Neutral tone throughout
- [ ] Trade-offs acknowledged
