## Skills

Global skills (usable from any project) must be symlinked from a versioned repo into `~/.claude/skills/`, never copied in directly. Write/edit the SKILL.md inside `/media/data/dev/bain-studio/.claude/skills/{name}/` (or `/home/bain/dev/bain-skills/{name}/` for skills unrelated to the studio workflow), then `ln -s` it into `~/.claude/skills/{name}`. If a skill under `~/.claude/skills/` is a plain file/directory instead of a symlink, that's a bug: move its content back into the source repo and replace it with a symlink.

Inside any global skill's SKILL.md, never reference another file with a relative path (e.g. `.claude/skills/foo/SKILL.md`) — it resolves against the invoking project's cwd, not the skill's own directory, and breaks when the skill runs outside bain-studio. Always use the absolute path (e.g. `/home/bain/.claude/skills/foo/SKILL.md`).
