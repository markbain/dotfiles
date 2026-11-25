## Asana task descriptions

Every task Claude creates in Asana — from any project, any skill, any session — follows this.
It is the companion to `asana-comments.md`: the same failure, in the task's description rather
than in a comment.

**A description is a brief, not a write-up.** It says three things:

1. What the task is.
2. What done looks like.
3. Where the work is — paths, URLs, task GIDs, branch names.

Per ADR 022 it carries its own context rather than leaning on the Asana section, a parent task
or its place in a list.

**A title is the task itself, as a plain sentence. No prefix.** Nothing before a colon: not a
client or project name (`Acme:`, `Privacy policy:`, `Theme review:` in the Theme
Review project), a tool (`sync.py:`), a component (`Looper runner:`), a workstream
(`KF archive:`) or a kind (`Question:`, `Decision:`). Prefixes make a narrow task list
impossible to scan, because every row starts with the same words. Where the page, section or
tool matters, put it inside the sentence: "Stop the looper runner starting empty sessions".

**Group tasks with Asana's own links, never with title text:** the project (multi-home if
needed), a section, a tag, a custom field, a dependency, or a parent. Mark never prefixes the
tasks he writes; match them. Studio policy, Mark's decision, 25 November 2026 (ADR 022
addendum).

**Never in a description:** how the problem arose, what was ruled out, alternatives weighed,
a session narrative, what was tested, how many pages were checked, or dates of past sessions.
That belongs in the commit message, where `git log` reaches it when wanted and stays invisible
when not. The audit trail for a piece of work is not the brief for it.

**The limit is enforced, not advisory.** `sync.py` refuses a description over 1,200 characters
on `--create-task` and `--update-task`, and sends nothing to Asana. The studio median is about
500 characters; the walls of text that prompted the limit ran 2,000–3,500. If a description
will not fit, the detail belongs in the commit message or a comment — not in a longer
description.

**Pick the section by whether the work is happening now.** A task Claude creates for work it
is doing in this session goes straight into `DOING` (`--task-section DOING`). A follow-up or
anything left for later keeps the default, `NEXT UP`.

**Never create a task via the Asana MCP or the API directly.** All writes go through
`sync.py --create-task`, which uses the bainbot token, assigns the local ID and updates the
mirror.

**A description is read-only in the mirror.** `- **Notes:**` is mirrored in full but never
pushed: it is the brief the task was created with, and Asana logs no history of its own for a
description edit. Amendments go in a comment. A genuinely wrong or misleading description is
rewritten deliberately:

```bash
python3 /media/data/dev/bain-studio/studio/sync.py --get-task BSTD-856     # read it first
python3 /media/data/dev/bain-studio/studio/sync.py --update-task \
  --task-gid {GID} --task-notes "{the corrected description}"
```

It replaces the description wholesale, so read the current text before amending rather than
rewriting.

**Most other fields do push back from the mirror** — section, due, start, assignee, tags,
followers, dependencies, Priority and every other custom field on the task. Edit the mirror
line and run `sync.py`; don't reach for the Asana UI or the MCP. The exceptions are the
description (above), the task **title**, which takes `--update-task --task-name`, and
**completion**, below.

**Tick a task off yourself when it is low impact and nothing waits on Mark** (Mark,
2026-11-25). Low impact: studio tooling, docs, Asana or client housekeeping; nothing outside
the studio sees it, it is easy to undo, and it is not a decision. Then:

```bash
python3 /media/data/dev/bain-studio/studio/sync.py --complete-task {ID} --reason "{why it is done}"
```

It posts the reason as a silent comment and refuses open subtasks or a "Waiting on Mark" tag.
`--reopen-task {ID} --reason "..."` undoes it. Anything that needs his review, his decision or
his eyes outside the studio gets a `Review`/`Done` note instead, and he ticks it.

Full reference: `/media/data/dev/bain-studio/docs/gods/hermes/sync.md` and
`/media/data/dev/bain-studio/docs/utilities/new-task.md`.
