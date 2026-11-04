## Documents live in Dropbox, never in a code repo

Code repos are for code. **Never write a report, audit, proposal, note or draft into a project
repo** - not at the repo root, not in a `docs/` folder. Documents belong in the project's
Dropbox folder, which for client work is
`/media/data/Dropbox/Work/Projects/Client/{Client}/`:

| Kind of document | Goes in |
|---|---|
| Client-facing reports, audits, proposals (`.md` + branded `.pdf`) | `Docs/<Topic>/` |
| Internal technical notes backing a client report | `Docs/<Topic>/` alongside it, suffixed `-internal` |
| Hosting, DNS, infrastructure, migration notes | `Dev Ops/` |
| Security incident material | `Dev Ops/Site Hack/` |

Name dated documents `YYYY-MM-DD-<slug>.md` so they sort chronologically.

Write the file straight to its Dropbox path. Do not create it in the repo and move it
afterwards. If you are about to write a `.md` that is not code documentation, stop and put it
in Dropbox instead.

**Check Dropbox before starting any new document.** A report on the same topic may already
exist there, and looking only in the repo will miss it.

Exceptions that legitimately live in a repo: the project's own `CLAUDE.md`, and
`asana-mirror.md` / `asana-ids.json`, which `bain-studio/studio/sync.py` writes to the project
root by design. A repo's own developer documentation (README, ADRs, code architecture notes)
is code documentation and stays with the code.
