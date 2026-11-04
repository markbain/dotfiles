## Git flow

Follow git flow by default in every repo, without being asked. Assume it applies unless the
repo clearly does not use it (no `develop` branch, or a documented alternative in its own
CLAUDE.md).

- `main` is production-released code. Never commit to it directly.
- `develop` is the integration branch. Day-to-day work happens here or on a branch off it.
- Feature work: `git flow feature start {name}` (branches off `develop`).
- Releases: cut `release/x.y.z`, put the version-bump commit on it, merge to `main`, tag,
  then merge back into `develop`.
- Hotfixes: `hotfix/x.y.z` off `main`, merged to both `main` and `develop`.

Tags are `X.Y.Z` with **no `v` prefix**. Semantic versioning: fixes only = patch, new features
or changes = minor, breaking change or major redesign = major.

Before starting work, check the current branch. If it is `main`, branch first rather than
committing there. If a repo has git flow config but the branch layout has drifted, say so
rather than silently working around it.

Never push or merge without being asked - merge and push are the user's decisions, not
side effects of finishing a task.
