# Handoff

Rolling session state for `nmfs-opensci/litellm-gateway-template`. Keep it lean.

## What this repo is

The template an installer copies to set up one LiteLLM gateway to Amazon
Bedrock for a workshop or clinic: participants get personal keys with budgets,
no AWS credentials. It is "task B" of the gateway follow-ups in
`nmfs-opensci/agent-coders-clinics` (`claude/notes/gateway-skill-tasks.md`
there has the original plan, which called this repo
`litellm-bedrock-gateway`; the real name is `litellm-gateway-template`).

## Eli's direction (2026-09-28)

**The template uses the skill; it does not reimplement it.** Everything
technical lives in the `litellm-bedrock-gateway` skill in
`nmfs-opensci/agent-skills` (`~/agent-skills/skills/litellm-bedrock-gateway`
on this hub), which is the source of truth. The template only has to tell a
person enough to get started:

- how to get the skill (clone `nmfs-opensci/agent-skills`, install
  `litellm-bedrock-gateway` as a skill for their agent: that repo's README
  "Using a skill" / "Install one" sections), and
- what prompt to give the agent. From there the skill handles everything:
  asking the installer's questions, AWS sign-in, Bedrock readiness, deploy,
  keys, workshop sign-up, organizers without AWS, teardown.

Likely contents, per Eli: a short `README.md`, an `AGENTS.md` with the agent
instructions, and `CLAUDE.md` as a symlink to `AGENTS.md`. Keep it
agent-independent (the skill follows the open Agent Skills convention).

## Facts to build on

- The skill's `scripts/init_deployment.sh <folder>` turns a folder (this repo,
  once copied) into a deployment: it copies `scripts/` and `assets/`, and adds
  `gateway.env`, `models.yaml` and `.gitignore` without overwriting existing
  ones. The copy is deliberate (a running gateway must not change because the
  skill changed), so an install repo ends up with its own scripts; the template
  itself should not ship them.
- Install repos are usually **public**: no gateway URL or secret in any
  committed file. `docs/` and `hub/` (rendered) are committed; `secrets/`,
  `build/`, `.venv/` are git-ignored.
- An organizer without AWS gets their own revocable key
  (`keys.py organizer create`), never the master key or Admin UI password.
  Several named workshops can run on one gateway (skill PR
  nmfs-opensci/agent-skills#28).
- Decisions behind the skill: `~/agent-skills/claude/notes/litellm-bedrock-gateway-skill.md`.

## State

- Only the initial commit: `LICENSE`, a two-line `README.md`. No `## Reuse and
  citation` section yet (check `~/.claude/templates/reuse/POLICY.md`; mention it
  once, do not add it unasked).
- Not started. After this comes task C: the colleague's instructions for an
  install in an org AWS account.
