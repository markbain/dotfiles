## No client data in the public tooling repos

Three repos are **public on GitHub**: `bain-studio`, `bain-skills`, `bain-tools`.
Nothing that identifies a client goes in them, in any file, **including commit
messages**.

| Not in a public repo | Where it goes |
|---|---|
| Client or contact names, email addresses | the registry, or Dropbox |
| Live domains, staging hostnames, provider install names | the registry's `domains` |
| Hosting and search provider application IDs | `$STUDIO_CONTENT_DIR/internal/` |
| Analytics property IDs, Asana GIDs | the registry, or `studio/.env` |
| Client repository URLs, Dropbox client paths | the registry |
| Per-project notes and status | `$STUDIO_CONTENT_DIR/projects/` |

**Project prefixes are fine.** `KF-WEB`, `TSTY`, `EBIZG` are codes; the mapping
from prefix to client lives outside those repos, so a bare prefix identifies
nobody. Use prefixes freely in ADRs, commit messages, docs and sample output.
Where an example needs a name, invent one.

**This does not apply to a client's own repo.** A client project's `CLAUDE.md`
legitimately carries its client name, its Asana GID and its hostnames: that repo
is private and belongs to that client's work. Do not strip those.

In `bain-studio` a commit hook enforces this, generating its term list at commit
time from the registry outside the repo. Set it up per clone with
`studio/scripts/setup-machine.sh`. With no registry it refuses rather than
passing, because an unconfigured machine is where client data slips through
unnoticed; `BAIN_SKIP_CLIENT_GUARD=1` is the deliberate one-off.

Full reasoning: `bain-studio/docs/adr/021-studio-state-and-registry-leave-the-repo.md`
(2026-11-06 addendum) and `docs/utilities/gen-denylist.md`.
