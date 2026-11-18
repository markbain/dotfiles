#!/usr/bin/env python3
"""SubagentStop hook - measure every subagent report, nudge the listed ones.

Reads the SubagentStop payload on stdin. That payload carries
`last_assistant_message`, the subagent's final report, so there is no transcript
to parse.

Two jobs, deliberately separate:

  measure   every report from every agent is logged, whatever its type.
            That is how the budgets below get real numbers instead of guesses.
  nudge     only an agent listed in BUDGETS with mode "bounce" is asked to
            rewrite. Everything else only ever gets logged.

Start every agent on "log", read ~/logs/agent-reports.log for a week, then set
real numbers and switch the ones worth it to "bounce".

A bounce is a nudge, not a refusal. Each agent_id is asked at most once - the id
is recorded in ~/logs/agent-reports.bounced and skipped on a second fire - and the
report then passes at whatever length it is. Unlike sync.py's 900-character limit
on Asana notes, nothing here can refuse a report outright.

Fails open: a missing field, an unparseable payload, or any error exits 0.

Registered in ~/.claude/settings.json under hooks.SubagentStop. Unregistered while
it sits in dotfiles/claude/drafts/.
"""

import json
import os
import sys
import time

# agent_type -> (character budget, mode). Only agents listed here with mode
# "bounce" are ever asked to rewrite. Unlisted agents are logged, not nudged.
#
# 600 is a placeholder. It stands until the log has a week of real lengths.
#
# Deliberately left on "log", each for a reason in rules/agent-reports.md:
#   copywriter         her per-edit list is Mark's review mechanism
#   hermes, studio-pm  cross-project, length scales with project count
#   mnemosyne          output is data rows the calling agent needs
#   Explore, Plan      findings are data for the parent, and they cannot
#                      write files to offload the detail into
BUDGETS = {
    "claude": (600, "log"),
    "general-purpose": (600, "log"),
    "copywriter": (0, "log"),
    "hermes": (0, "log"),
    "mnemosyne": (0, "log"),
    "studio-pm": (0, "log"),
}

DEFAULT_BUDGET = 600

LOG = os.path.expanduser("~/logs/agent-reports.log")
BOUNCED = os.path.expanduser("~/logs/agent-reports.bounced")

RULE = "~/.claude/rules/agent-reports.md"

BOUNCE = (
    "Your report is {n} characters. The budget for a {agent} report is {budget}.\n\n"
    "Rewrite it to the shape in {rule}:\n"
    "  Outcome        one line, what is now true\n"
    "  Decide         only if Mark must choose, with your recommended answer\n"
    "  Blocked/Gaps   only if something really stopped or was left undone\n"
    "  Where          paths, task IDs, branch, commands\n\n"
    "Move the detail into a file - the commit message, or a note in the project's "
    "Dropbox folder - and name that path instead of carrying the content in the "
    "report.\n\n"
    "Keep every failure, every blocked or skipped item, and every unverified claim "
    "you flagged. Cut length, never bad news. A report that fits by dropping a "
    "failure is worse than the long one.\n\n"
    "Reply with the rewritten report and nothing else."
)


def log(agent, agent_id, n, budget, action):
    try:
        os.makedirs(os.path.dirname(LOG), exist_ok=True)
        with open(LOG, "a") as fh:
            fh.write(
                "%s\t%s\tid=%s\tchars=%s\tbudget=%s\t%s\n"
                % (
                    time.strftime("%Y-%m-%dT%H:%M:%S"),
                    agent or "-",
                    agent_id or "-",
                    n,
                    budget,
                    action,
                )
            )
    except Exception:
        pass


def already_bounced(agent_id):
    if not agent_id:
        return False
    try:
        with open(BOUNCED) as fh:
            return any(line.strip() == agent_id for line in fh)
    except Exception:
        return False


def mark_bounced(agent_id):
    if not agent_id:
        return
    try:
        os.makedirs(os.path.dirname(BOUNCED), exist_ok=True)
        with open(BOUNCED, "a") as fh:
            fh.write(agent_id + "\n")
    except Exception:
        pass


def main():
    try:
        payload = json.load(sys.stdin)
    except Exception:
        return
    if not isinstance(payload, dict):
        return

    report = payload.get("last_assistant_message")
    if not isinstance(report, str) or not report.strip():
        return

    agent = payload.get("agent_type") or ""
    agent_id = payload.get("agent_id") or ""
    budget, mode = BUDGETS.get(agent, (DEFAULT_BUDGET, "log"))
    n = len(report)

    # Measure first, always. This is the whole point of the log-only phase.
    if mode != "bounce":
        log(agent, agent_id, n, budget, "over, log only" if n > budget else "within")
        return
    if n <= budget:
        log(agent, agent_id, n, budget, "within")
        return
    if payload.get("stop_hook_active") is True or already_bounced(agent_id):
        # Second pass. Its length is the only evidence a bounce shrinks anything.
        log(agent, agent_id, n, budget, "over, second pass - passing through")
        return

    mark_bounced(agent_id)
    log(agent, agent_id, n, budget, "bounced")
    print(
        json.dumps(
            {
                "hookSpecificOutput": {
                    "hookEventName": "SubagentStop",
                    "additionalContext": BOUNCE.format(
                        n=n, agent=agent, budget=budget, rule=RULE
                    ),
                }
            }
        )
    )


if __name__ == "__main__":
    try:
        main()
    except Exception:
        pass
    sys.exit(0)
