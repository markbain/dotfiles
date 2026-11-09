## Asana comments

Every comment Claude posts to Asana — from any project, any skill, any session — follows
this. It is not a looper rule. The wall-of-text comment that prompted it came from an
ordinary project session, not the looper.

**A leading `@mark` is what makes a comment reach Mark's Asana inbox at all.** Every comment
goes through `sync.py`; a note opening `@mark` makes it add Mark as a **collaborator** on the
task before posting, and that is what puts the note in his inbox. A note without the token
posts silently. Never post to the Asana API directly.

**It does not produce an Asana "mention", despite the name.** `sync.py` sends the documented
rich-text form, `<a data-asana-gid="…"/>`, and Asana annotates it `data-asana-type="user"` —
but a comment posted through the API never lands in an inbox **filtered to "Mentioned"**.
Tested six ways on 2026-11-06, including three markup variants and the same comment posted
from the web UI as the bot (which does reach the filter). So:

| Posted via | "Mentioned" filter | Normal inbox | Browser notification |
|---|---|---|---|
| `sync.py` with `@mark` | no | **yes** | yes |
| `sync.py` without it | no | no | no |

**The collaborator add is Asana's own documented procedure, not a workaround.** John_Vu, from
Asana, in [forum thread 3326](https://forum.asana.com/t/any-way-to-create-user-mentions-using-api/3326)
on 2024-01-05: a rich-text mention "does not automatically add the @mentioned user to the
resource", and the prescribed step is a follow-up `addFollowersForTask` call. So **do not
remove the collaborator add or its wait** — it is the only reason a note arrives, removing it
delivers nothing at all, and it is what Asana tells integrations to do.

Do not "fix" the rest in `sync.py` either: the markup is already correct. What remains
unanswered by Asana is only the filter — their prescribed route delivers the note as activity
on a followed task, which is precisely what an inbox filtered to "Mentioned" excludes. See
BSTD-878.

```bash
python3 /media/data/dev/bain-studio/studio/sync.py --comment --task-gid {GID} \
  --comment-text "@mark Review 2026-11-05: {what changed, one line} || Where: {branch} · {commit} · {URL or path} || Check: || 1. {imperative} || 2. {imperative} || Gaps: {known, not fixed}"
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
