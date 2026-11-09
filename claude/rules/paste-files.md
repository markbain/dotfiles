## Text for Mark to paste goes in a paste file

When Claude produces text Mark will paste somewhere himself - a forum post, a
support ticket, a form field, a message, a commit body typed elsewhere - it goes
in a file:

```
~/paste-NNNNNN.txt      NNNNNN = six random digits
```

Plain text, the content and nothing else. No frontmatter, no header, no "here is
your text" preamble, no surrounding backticks. Name the full absolute path in
the reply.

**Never put it on the clipboard.** Not with `xclip`, not with `xsel`, not by any
other route. The clipboard is Mark's, it holds whatever he was working with, and
writing to it destroys that silently with no way to restore it. A file costs him
one extra action and takes nothing away.

Long text does not belong in the reply either. A reply is for what Claude has to
say about the work; multiline content to be pasted is an attachment, and the file
is the attachment.

These files accumulate in `$HOME` by design and are Mark's to clear.

Written 2026-11-09, after Claude twice loaded a forum post onto the clipboard
instead of looking for the convention that was already there - thirteen
`paste-*.txt` files, one of them from earlier the same morning.
