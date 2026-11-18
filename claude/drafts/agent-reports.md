## Agent reports

Applies to the final report a subagent hands back, and to the hand-back a skill
prints when it finishes. It is the companion to `concise-replies.md`: the same
failure, in an agent's report rather than in a reply.

**Suppression before compression.** The question is not "how short" but "does this
reach Mark at all". Detail goes where it is reachable on demand — the commit
message first, or a note in the project's Dropbox folder. The report names that
path; it does not carry the content. Not the task's `**Progress:**` line: that
posts to Asana, where `asana-comments.md` applies and `sync.py` refuses anything
over 900 characters.

**The shape**, in this order:

| Block | Holds | Limit |
|---|---|---|
| Outcome | What is now true. Not what was done. | One line |
| Decide | Only when Mark must choose: the choice, and the recommended answer | One line per choice, max 3 |
| Blocked / Gaps | What stopped, or was knowingly left undone, and why | One line each. Omit entirely when there is none |
| Where | Paths, task IDs, branch, commands to run | One line |

**Budget: 600 characters** for a report that reaches Mark.

**The budget is not a licence to drop anything on the never-cut list in
`concise-replies.md`.** Length is the thing being cut, never the bad news. A report
that fits by dropping a failure is worse than the long one.

**Exceptions — where the detail is the deliverable:**

- **The copywriter is exempt by name.** Her per-edit list, with the rule quoted
  from the brand doc, is how Mark reviews her edits without reading the whole
  file again. Shortening it removes the review, not the noise.
- **Data handed to another agent** — Mnemosyne's comps, Explore's findings — is
  read by the calling agent, not by Mark. The caller needs every row. The budget
  applies to the prose around the rows, not the rows.
- **Cross-project reports** — the Hermes sync report, the studio-pm morning
  report — scale with the number of projects, so a fixed character budget would
  truncate them. They are bounded a different way: report only what changed. A
  project with nothing new gets no section, and the quiet ones are counted in the
  closing line.

**A parent relaying a subagent's report is bound by this too.** A 40-line report
read by the parent becomes one Outcome line to Mark, plus anything he must decide.
Paraphrasing the whole report back up is the leak this rule exists to close.
