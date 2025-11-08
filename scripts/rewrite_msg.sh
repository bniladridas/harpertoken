#!/bin/bash

# Script to rewrite commit messages for conventional commits
# Usage: ./rewrite_msg.sh <commit-hash> or for range: ./rewrite_msg.sh <start>..<end>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <commit-hash> or $0 <start>..<end>"
    exit 1
fi

COMMIT_RANGE=$1

# Function to rewrite a single commit message
rewrite_commit() {
    local commit=$1
    local msg=$(git log --format=%B -n 1 $commit)
    local first_line=$(echo "$msg" | head -n1)

    # Make lowercase
    local new_first_line=$(echo "$first_line" | tr '[:upper:]' '[:lower:]')

    # Truncate to 40 chars if longer
    if [ ${#new_first_line} -gt 40 ]; then
        new_first_line="${new_first_line:0:40}"
    fi

    # Reconstruct message
    local rest=$(echo "$msg" | tail -n +2)
    local new_msg="$new_first_line
$rest"

    # Use git commit --amend to change the message
    git filter-branch --msg-filter "if [[ \$GIT_COMMIT == $commit ]]; then echo \"$new_msg\"; else cat; fi" -- $commit^..$commit
}

# If range, loop through commits
if [[ $COMMIT_RANGE == *..* ]]; then
    for commit in $(git rev-list $COMMIT_RANGE); do
        rewrite_commit $commit
    done
else
    rewrite_commit $COMMIT_RANGE
fi

echo "Commit messages rewritten. Force push if needed."
