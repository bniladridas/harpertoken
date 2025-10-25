# harpertoken

harpertoken is a lightweight, cross-platform code quality
and style checker that works across dozens of programming
languages. It runs locally without compiler activation,
installs easily, and can enforce automatic checks via Git
hooks. Powered by Mega-Linter and Docker, harpertoken provides
consistent, reliable results on macOS, Windows, and Linux.

**Quick start:** `./bin/harpertoken.pl` for checks, `./bin/harpertoken.pl --install` for Git hooks.

To use harpertoken:

1. Prerequisites: Install Perl and Docker on your system.
2. Get the tool: Clone this repo:
   git clone <repo-url>
3. Make executable:
    chmod +x bin/harpertoken.pl
4. Run checks: In your project directory, run:
 /path/to/harpertoken.pl
5. Auto-checks:
    /path/to/harpertoken.pl --install
    This sets up a Git pre-commit hook that blocks commits
    with issues.
    Alternative: Use hooks/pre-commit.global for a more advanced
    global hook with pre-commit framework.
    Optional: Use hooks/commit-msg to enforce conventional commit messages.
6. Output: It prints results; fix any errors shown.

For team use, push this repo to GitHub so others can
clone/download it. The tool stays installed once set up.

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to stop execution.
Press <kbd>Enter</kbd> to continue after prompts.
