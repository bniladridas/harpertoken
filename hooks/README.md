# Git Hooks for harpertoken

This directory contains example Git hooks that can be used with harpertoken or independently.

## Available Hooks

### pre-commit.global
- **Location**: `hooks/pre-commit.global`
- **Purpose**: Advanced global pre-commit hook using the pre-commit framework.
- **What it does**: Runs comprehensive linting and formatting checks on all files before commits. Includes checks for Python (black, isort, ruff), YAML (yamllint), and basic file issues.
- **Installation**: Copy to `~/.git-templates/hooks/pre-commit` and run `git config --global init.templateDir ~/.git-templates`.
- **Requirements**: pre-commit installed (`pip install pre-commit`).

### commit-msg
- **Location**: `hooks/commit-msg`
- **Purpose**: Enforces conventional commit message standards.
- **What it does**: Validates commit messages for lowercase, ≤60 characters, and conventional types (feat:, fix:, etc.).
- **Installation**: Copy to `.git/hooks/commit-msg` in any repo and make executable.
- **Requirements**: Bash shell.

## Usage with harpertoken

harpertoken provides a simple built-in hook via `harpertoken --install`. These are advanced alternatives for stricter enforcement.

## Notes

- These hooks are examples and can be customized.
- Ensure hooks are executable (`chmod +x`).
- For global use, set up Git templates as described.