# Agent reporting — where this got to, 2026-11-16

Nothing in this directory is live. The rule file only takes effect if moved into
`rules/`; the hook only if copied to `~/.claude/hooks/` and registered.

## Settled

- **Focus view works** in the default renderer. Enabled for that session only.
  To persist: `"viewMode": "focus"` in `~/.claude/settings.json`. Once set there,
  `/focus` cannot turn it off — remove the line and restart.
- **The problem is not report length, it is that reports exist at all.** Mark does
  not read them. Compression was the wrong fix; silence by default is the right one.
- **Routing, decided:** finished work and decisions that can wait go to Asana. A
  Slack ping only when something is genuinely blocked and stopped, so a ping always
  means stopped.
- **The studio `/focus` skill was deleted** (both symlinks, the source, its
  cheatsheet row). Uncommitted on `develop` in bain-studio.

## Not built, not authorised

1. `studio/raise.py` — `--blocked` (Asana `@mark` + Slack), `--decision` (Asana
   only), `--done` (mirror progress line, silent). Plumbing exists already:
   `studio/notifier.py` for Slack, `sync.py --comment` for the Asana inbox.
2. Rewrite `agent-reports.md` — it currently assumes a report reaches Mark and asks
   it to be short. It should say silence is the default output, `raise.py` is the
   only route to him, and three things earn it: blocked, a decision only he can
   make, a failure.
3. Hermes and studio-pm stop producing reports; sync and raise on exception only.
   This replaces `agent-reports.patch`, which still assumed a report.
4. `agent-report-budget.py` stays log-only — measurement, not enforcement.

## Known wrong in the current drafts

`agent-reports.md` and `agent-reports.patch` were written for the compression
premise. Do not apply them as they stand.
