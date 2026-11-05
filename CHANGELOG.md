# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).
This file uses change log convention from [Keep a CHANGELOG](http://keepachangelog.com).

## [Unreleased][unreleased]

1.6.0 - 2026-11-05

### Added
- `claude/rules/asana-comments.md` - the format every Claude session must use when it comments
  on an Asana task. Mark's Asana inbox is filtered to *Mentioned*, so a comment without a
  `@mark` token never reaches him, and a plain-text comment cannot mention anyone at all.
  The rule carries the note template, the convention that the mention is a signal rather than
  a courtesy (review and blocked notes only, never routine status changes), and the line that
  reasoning belongs in the commit message rather than the comment. `bain-studio`'s `sync.py`
  enforces the limits rather than trusting the prose: a note over 900 characters, with a block
  over 200, or with more than 8 blocks is refused and logged.

### Changed
- `word-choice` states its scope once, for all four rules, instead of repeating it per rule.
- `oh-my-zsh/alias.zsh` caught up with the live file, which had drifted ahead of the repo copy
  the way `bashrc` and `zshrc` had. The live file is now a symlink to this one. `ssh_bd` was
  deliberately left out: it held a Cloudways server username and IP.

### Removed
- The 18 `ssh_*` client aliases, which named each client's host, account and web root,
  including two bare IPs and two non-standard ports. Not credentials, since access needs the
  key in `~/.ssh`, but a per-client inventory of where everything lives, published under
  Mark's own name. They now live in `~/.config/secrets/ssh-aliases.zsh` at mode 600 alongside
  the API keys, sourced by `zshrc`, and `RECOVERY.md` records the file as
  rebuild-rather-than-restore. The alias file keeps a comment saying where they went, so the
  next one does not get added back here.

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
