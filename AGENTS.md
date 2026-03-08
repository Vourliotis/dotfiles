# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Overview

This is a GNU Stow managed dotfiles repository. Each top-level directory is a stow package whose contents mirror the target home directory structure. For example, `fish/.config/fish/config.fish` gets symlinked to `~/.config/fish/config.fish`.

## Stow Commands

```bash
# Symlink a package to home directory
stow <package>

# Remove symlinks for a package
stow -D <package>

# Re-stow (useful after adding/removing files)
stow -R <package>

# Dry-run to preview what would be linked
stow -n -v <package>
```

## Package Layout

Most configs live under `<package>/.config/<app>/`, following XDG conventions. Some packages place files directly in home instead:
- `bash/.bashrc`, `zsh/.zshrc`
- `git/.gitconfig`
- `x/.Xresources`
- `scripts/.local/bin/` contains user scripts added to PATH

## Conventions

- No build system, linter, or tests. This is a config only repo.
- Commit messages use conventional commit prefixes scoped to the package (e.g., `feat(fish): Add config.fish`, `chore(tmux): Clean up bindings`).
- When adding a new application config, create a new top-level directory matching the app name with contents mirroring the home directory structure.
