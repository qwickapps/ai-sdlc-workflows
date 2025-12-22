#!/bin/bash
# Commit message validator
# Validates commit messages against the required regex pattern

REGEX='^(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)\((deps|[a-zA-Z]+-[0-9]+)\)(!)?:.+'

if [ -z "$1" ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi

MESSAGE="$1"

if echo "$MESSAGE" | grep -qE "$REGEX"; then
    echo "[PASS] Commit message is valid"
    exit 0
else
    echo "[FAIL] Commit message does not match required format"
    echo ""
    echo "Required format:"
    echo "  type(scope): description"
    echo ""
    echo "Examples:"
    echo "  feat(RS-12345): Add user authentication"
    echo "  fix(RS-12346): Resolve navigation bug"
    echo "  docs(RS-12347): Update API documentation"
    echo ""
    echo "Types: build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test"
    echo "Scope: deps or RS-XXXXX (ticket number)"
    exit 1
fi
