## Gmail drafts

**Every URL Claude writes into a Gmail draft comes back wrapped.** The connector rewrites it to
`https://www.google.com/url?q=...&source=gmail&ust=...` at write time, in plain text and HTML
alike, and it linkifies bare domains that were never anchors. Only Claude's own content is
touched: the Gmail signature's links and the quoted thread come back untouched. Verified
2026-11-16 with three probes, including an `htmlBody`-only draft, so there is no draft format
through the connector that avoids it.

It matters because the plain-text part then carries the full tracking URL inline, mid-sentence,
where the link text should be.

**So: draft as normal and let Mark fix the links.** Pass `body` and `htmlBody` together with
`includeSignature: true`, write URLs plainly in the prose, and **say which links need his
attention when handing the draft over**. He corrects them in the composer before sending. That is
his decision, 16 November 2026, over two alternatives he turned down: a Gmail API script using
`gmail.compose` (the existing OAuth app at `bain-studio/studio/tools/ivas-prep/` is
`gmail.readonly`, so it would need re-consent), and an HTML paste file.

Never try to defeat the linkifier with zero-width characters, broken schemes or lookalike
domains. A wrapped link that works beats a clever one that does not, and Mark is sending it under
his own name.

**Never repair a draft with `update_draft`.** It drops the Gmail signature and regenerates the
plain-text part from the HTML, tracking URLs and all. Delete the draft and create it again.

Drafting, not sending, remains governed by `never-send-on-marks-behalf.md`.
