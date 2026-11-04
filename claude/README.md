# Claude Code shared rules

`rules/` holds the user-level instruction rules that apply to every project, split one
topic per file. They are the single source of truth: both Claude Code config directories
symlink to this directory rather than holding their own copies.

| Config dir | Account |
|---|---|
| `~/.claude` | primary account |
| `~/.claude-kf` | secondary account, separate credentials and history |

Link them in (once per config dir, per machine):

```bash
ln -s ~/.dotfiles/claude/rules ~/.claude/rules
ln -s ~/.dotfiles/claude/rules ~/.claude-kf/rules
```

User-level rules under `<config dir>/rules/` load at the start of every session in every
project. Add a new `.md` here and both accounts pick it up on the next launch - no symlink
or import list to update.

## Brand voice

`rules/brand-voice.md` is a short pointer, not the voice rules themselves. The rules
live in Dropbox at `Work/Content/Brand Voice/brand-voice.md` and are maintained via
the `/brand-voice` skill.

It used to be a symlink to that file, so the whole thing loaded every session. That
was removed on 2026-11-04: the document is ~6,000 tokens and coding sessions never
need it. The copywriter agent reads it in full at review time instead, which is the
only job that needs all of it. The pointer's purpose is to carry the standing
authorisation to spawn her - without it, nothing tells a session she exists.

Each config dir keeps its own `CLAUDE.md` for content that is genuinely specific to that
account. Anything that applies to all work belongs here instead.

To confirm what actually loaded, run `/context` in a session and read the **Memory files**
list.
