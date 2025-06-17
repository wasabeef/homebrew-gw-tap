# CLAUDE.md

This file provides guidance to Claude AI when working with this Homebrew tap.

## Project Overview

This is the Homebrew tap repository for Git Workers. It manages the Formula for distributing Git Workers binaries via Homebrew.

## Formula Update Process

### 1. Calculate SHA256 Hashes

Calculate SHA256 for new releases:

```bash
# macOS ARM64
curl -sL https://github.com/wasabeef/git-workers/releases/download/v0.1.0/git-workers-aarch64-apple-darwin.tar.gz | shasum -a 256

# macOS x86_64
curl -sL https://github.com/wasabeef/git-workers/releases/download/v0.1.0/git-workers-x86_64-apple-darwin.tar.gz | shasum -a 256

# Linux x86_64
curl -sL https://github.com/wasabeef/git-workers/releases/download/v0.1.0/git-workers-x86_64-unknown-linux-musl.tar.gz | shasum -a 256
```

### 2. Update Formula

Update `Formula/gw.rb`:
- Version number
- SHA256 hashes for each platform

### 3. Automatic Updates (GitHub Actions)

The git-workers release.yml automatically updates this tap on new releases:
1. Build new version binaries
2. Calculate SHA256
3. Update Formula and commit
4. Push to this repository

## File Structure

```
homebrew-gw-tap/
├── .gitignore       # Excludes macOS/editor files
├── README.md        # User documentation
├── CLAUDE.md        # This file
└── Formula/
    └── gw.rb        # Homebrew formula
```

## Testing

```bash
# Local installation test
brew install --build-from-source ./Formula/gw.rb

# Verify installation
gw --version

# Uninstall
brew uninstall gw
```

## Notes

- Formula URLs must match actual release asset URLs
- Shell integration file (gw.sh) is placed in the share directory
- Binaries are expected to be distributed in tar.gz format