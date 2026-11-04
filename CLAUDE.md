# Dotfiles

Mark's shell, git, terminal and Claude Code configuration. **This repo is public**
(`github.com/markbain/dotfiles`), so nothing secret belongs in it at any point, including
in history.

## The working tree is live config

Six paths outside this repo are symlinks **into this working tree**, so editing a file here
changes live configuration immediately, with no deploy step:

| Live path | This repo |
|---|---|
| `~/.zshrc` | `zsh/zshrc` |
| `~/.bashrc` | `bash/bashrc` |
| `~/.gitconfig` | `git/gitconfig` |
| `~/.config/terminator/config` | `terminator/config` |
| `~/.claude/rules` | `claude/rules/` |
| `~/.claude-kf/rules` | `claude/rules/` |

Both Claude config dirs share one `rules/` directory, so a rule file here loads in every
session on both accounts.

### Therefore: this checkout stays on `develop`

**Never switch branches in `~/.dotfiles`.** A checkout rewrites the live shell config of
every open terminal and the rules loaded into every Claude session. It also fails
confusingly: an uncommitted edit to a file that differs between branches blocks the
checkout outright.

- Day-to-day edits: commit straight to `develop`.
- Anything needing a branch: `git worktree add .worktrees/<name>` and work there.
- Releases: cut `release/x.y.z` **in a worktree**, merge to `master`, tag `X.Y.Z`
  (no `v` prefix), merge back to `develop`.

## Read a live dotfile before copying it in here

When a live file and its repo copy have drifted, **work out which direction is safe before
syncing.** They are not symmetrical:

- `~/.zshrc` had drifted ahead with harmless aliases, so live overwrote the repo copy.
- `~/.bashrc` had drifted ahead with two **plaintext API keys**. Copying live into the repo
  would have published them. The repo copy overwrote live instead, which removed the
  duplicate, because the keys were already in the secrets file.

Check what a file actually contains before it goes in a public repo.

## Secrets

`~/.config/secrets/env`, mode 600, sourced by both `bashrc` and `zshrc`. It lives
**outside** this repo deliberately. Never move it back in, and never add a secret value to
a tracked file "temporarily".

If the file is absent both shells still start; the symptom is a missing API key, not a
broken install. See `RECOVERY.md` for what belongs in it.

## Known drift

`~/.oh-my-zsh/custom/alias.zsh` is a **real file, not a symlink**, though the `symlinks`
script creates it as one. It is ahead of `oh-my-zsh/alias.zsh` here by three aliases, one of
which holds a Cloudways SSH username and server IP. Do not sync it into this repo without
dealing with that line first.

## Fresh machine

`setup` installs packages; `symlinks` creates the links. Neither currently wires the Claude
rules dirs or bootstraps the secrets file, so both are manual steps for now. `RECOVERY.md`
is the full procedure and is the authority over this file.
