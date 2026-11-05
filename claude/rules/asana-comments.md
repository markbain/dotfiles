## Asana comments

Every comment Claude posts to Asana — from any project, any skill, any session — follows
this. It is not a looper rule. The wall-of-text comment that prompted it came from an
ordinary project session, not the looper.

**Mark's Asana inbox is filtered to "Mentioned".** A comment that does not @-mention him
never reaches him. A plain-text comment *cannot* mention anyone: Asana needs rich text. So
every comment goes through `sync.py`, which converts a leading `@mark` token into a real
mention. Never post to the Asana API directly.

```bash
python3 /media/data/dev/bain-studio/studio/sync.py --comment --task-gid {GID} \
  --comment-text "@mark Review 2026-11-05: {what changed, one line} || Where: {branch} · {commit} · {URL or path} || Check: || 1. {imperative} || 2. {imperative} || Gaps: {known, not fixed}"
```

From inside a project, write the same string as the task's `**Progress:**` line in
`asana-mirror.md` and let the scheduled sync post it. `||` separates blocks, expanded to
newlines at post time — a Progress note must occupy exactly one mirror line.

**The mention is a signal, not a courtesy.** Use `@mark` only when he must act: work ready
for review, or genuinely blocked. Routine status changes post without it — on the record,
and off his radar. Mentioning everything restores the flood the filter was built to stop.

| Block | Holds | Limit |
|---|---|---|
| `Review {date}:` / `Blocked {date}:` | What changed, or the question | One line. Asana truncates at "See more", so the action lives here or nowhere. ISO date required. |
| `Where:` | Branch, commits, URL or file path | One line |
| `Check:` | What Mark does to verify | Max 5, one line each, imperative — something he *does*, not something he reads |
| `Gaps:` | Work knowingly left undone | Omit entirely when there is none. Never a hedge. |

**Never in an Asana comment:** reasoning, diagnosis, what was ruled out, alternatives
considered, how many pages were tested, session usage. That belongs in the commit message,
reachable by `git log` when he wants it and invisible when he does not. The audit trail for
a fix is not the review instructions for it.

**Correct a note by rewriting the same line**, never by adding a second comment. `sync.py`
edits the existing comment in place when no human comment has landed since. A "Correction …,
replacing my earlier note" comment is a defect.

**These limits are enforced, not advisory.** `sync.py` refuses to post a note over 900
characters, with any block over 200, or with more than 8 blocks. It logs an error naming the
task and leaves the note in the mirror to be rewritten; the task's own state still syncs. If a
note will not fit, the detail belongs in the commit message.

Full reference, including the state file and the matching rules:
`/media/data/dev/bain-studio/docs/utilities/asana-comments.md`
