## Brand voice

Mark's writing voice, with all its rules, lives in one document:
`/media/data/Dropbox/Work/Content/Brand Voice/brand-voice.md`, maintained via the
`/brand-voice` skill. It is deliberately **not** loaded into every session - it runs
to about 6,000 tokens and most sessions never write a client-facing sentence.

**Public-facing written output goes to the copywriter agent**, who reads that document
in full at review time and edits the copy. Spawn her with the Agent tool
(`subagent_type: "copywriter"`) or via `/copywriter`. That is standing authorisation,
not something to ask about each time. In scope: client emails and quick messages,
proposals, reports, invoices, case studies, published web copy, PDFs, social posts,
portfolio copy, Upwork and LinkedIn entries. Mark's review is the final gate, so don't
re-review or soften her edits.

Not in scope: code, comments, commit messages, internal notes, ADRs, repo
documentation. Don't send her internal work.

**Don't apply voice rules from memory.** There are roughly ninety banned words, a
set of banned constructions, three strength tiers and six situational registers, and
half-remembering them produces worse copy than not trying. Read the document or call
her.
