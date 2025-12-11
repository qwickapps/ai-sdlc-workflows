#!/bin/bash
# Branch name validator
# Validates branch names against required patterns

if [ -z "$1" ]; then
    echo "Usage: $0 <branch-name>"
    exit 1
fi

BRANCH="$1"

# Check patterns
if echo "$BRANCH" | grep -qE '^bugfix/RS-[0-9]+$'; then
    echo "[PASS] Valid bugfix branch: $BRANCH"
    exit 0
elif echo "$BRANCH" | grep -qE '^feature/RS-[0-9]+$'; then
    echo "[PASS] Valid feature branch: $BRANCH"
    exit 0
elif echo "$BRANCH" | grep -qE '^hotfix/RS-[0-9]+$'; then
    echo "[PASS] Valid hotfix branch: $BRANCH"
    exit 0
else
    echo "[FAIL] Branch name does not match required format"
    echo ""
    echo "Required formats:"
    echo "  bugfix/RS-XXXXX   - For bug fixes"
    echo "  feature/RS-XXXXX  - For features/stories"
    echo "  hotfix/RS-XXXXX   - For hotfixes"
    echo ""
    echo "Your branch: $BRANCH"
    exit 1
fi
