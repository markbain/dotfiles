## Task lists

Never use the TaskCreate/TaskUpdate/TaskList tools. Track tasks via Asana mirrors (.claude/asana-mirror.md) only.

**Reminders and follow-ups are tasks too.** A "remind me in n days" goes in Asana
via `sync.py --create-task --task-due`, not into cron, `at`, a systemd timer, a
scheduled cloud agent or a Slack ping. Asana is where Mark looks; anything else
fires into a channel he is not watching and leaves units on the machine to clean
up.
