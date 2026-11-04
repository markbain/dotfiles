# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).
This file uses change log convention from [Keep a CHANGELOG](http://keepachangelog.com).

## [Unreleased][unreleased]

1.5.0 - 2026-11-04

### Added
- Shared Claude Code rules in `claude/rules/`, one topic per file, symlinked into both
  `~/.claude` and `~/.claude-kf` so a rule is written once and loads on both accounts
- `RECOVERY.md`, the full clean-install and disaster-recovery procedure
- `CLAUDE.md`, recording that this working tree is live config: the symlink inventory, the
  stay-on-develop rule with worktrees for branch work, and which direction is safe when a
  live file and its repo copy have drifted
- Nerd-dictation push-to-talk setup under `dictation/`, symlinked with its autostart entries
- `symlinks` now wires the Claude rules directories and writes a commented-out
  `~/.config/secrets/env` template at mode 600
- Prompt toggle (`tp`) for switching between the full and short zsh prompt

### Changed
- Secrets moved out of the repo entirely, to `~/.config/secrets/env`. This repo is public,
  so a secret inside it was one `.gitignore` mistake away from being published
- `~/.zshrc` and `~/.bashrc` are symlinks into this repo again, as `symlinks` always
  intended; both had drifted to standalone files
- `symlinks` is safe to re-run: a correct link is left alone, a wrong one replaced, and
  anything real moved to the backup dir first. The `/home/bain` link no longer writes
  outside `$HOME`, and the VVV links apply only where the old `~/Development` tree exists
- VS Code replaces Sublime Text; its settings come from built-in Settings Sync rather than
  symlinks
- The gh CLI is the GitHub credential helper
- Terminator: font 11, no title bar, hidden scrollbar

### Removed
- Bitbucket user and app-password exports from the tracked shell configs

1.4.0 - 2025-12-19

Multiple updates to various configurations and scripts.

1.3.0 - 2019-11-20

### Added
- Add subtlepatterns backgrounds for Terminator
- Add VSCode workspace

### Changed
- Change the Terminator background paths

1.2.0 - 2018-01-03

### Added 
- Add this changelog
- Add ConEmu config (Windows)
