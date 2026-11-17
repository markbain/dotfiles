## Asana comments

Every comment Claude posts to Asana — from any project, any skill, any session — follows
this. It is not a looper rule. The wall-of-text comment that prompted it came from an
ordinary project session, not the looper.

**A leading `@mark` is what makes a comment reach Mark's Asana inbox at all.** Every comment
goes through `sync.py`; a note opening `@mark` makes it add Mark as a **collaborator** on the
task, wait 35 seconds, then post a real mention. It lands in his inbox filtered to
**"Mentioned"**. A note without the token posts silently. Never post to the Asana API directly.

| Posted via | "Mentioned" filter | Normal inbox | Browser notification |
|---|---|---|---|
| `sync.py` with `@mark` | **yes** | yes | yes |
| `sync.py` without it | no | no | no |

**Do not remove the collaborator add, and do not shorten its wait below 30 seconds.** The add
is Asana's documented procedure (John_Vu, Asana, [forum thread 3326](https://forum.asana.com/t/any-way-to-create-user-mentions-using-api/3326),
2024-01-05): an API mention does not add the user to the task by itself. The wait works around
an Asana bug their staff confirmed on 2026-11-17: a comment posted less than 30 seconds after
the user became a collaborator is not counted as a mention. With the old 3-second wait every
note missed the filter. The markup was never the problem. See BSTD-878.

```bash
python3 /media/data/dev/bain-studio/studio/sync.py --comment --task-gid {GID} \
  --comment-text "@mark Review: {what changed, one line} || Where: {branch} · {commit} · {URL or path} || Check: || 1. {imperative} || 2. {imperative} || Gaps: {known, not fixed}"
```

From inside a project, write the same string as the task's `**Progress:**` line in
`asana-mirror.md` and let the scheduled sync post it. `||` separates blocks, expanded to
newlines at post time — a Progress note must occupy exactly one mirror line.

**The token is a signal, not a courtesy.** Use `@mark` only when he must act: work ready
for review, or genuinely blocked. Routine status changes post without it — on the record,
and off his radar. Putting it on everything restores the flood that silence is there to
prevent, and it is the only volume control there is, since the inbox filter does not
distinguish these notes.

| Block | Holds | Limit |
|---|---|---|
| `Review:` / `Blocked:` | What changed, or the question | One line. Asana truncates at "See more", so the action lives here or nowhere. |
| `Where:` | Branch, commits, URL or file path | One line |
| `Check:` | What Mark does to verify | Max 5, one line each, imperative — something he *does*, not something he reads |
| `Gaps:` | Work knowingly left undone | Omit entirely when there is none. Never a hedge. Anything meant to be done later is a task, cited by ID. |

**A follow-up is a task, not a sentence.** Before a comment names further work - a follow-up,
a next step, a `Gaps:` item that someone is meant to pick up - create it with
`sync.py --create-task --follow-up-of {this task's ID}` and cite its local ID. Work mentioned only in a comment is lost.

**Cite related tasks by local ID** (`BSTD-856`). `sync.py` turns every ID that resolves in a
registered project's `asana-ids.json` into a link to that task, so Mark can jump to it. Write
the bare ID: no URL, no GID, no task title.

**No date in the note.** Asana stamps every comment; write `Review:` and `Blocked:`, not
`Review 2026-11-05:`.

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
