# Instructions for coding agents

This repository is, or is about to become, the **deployment folder** for one
LiteLLM gateway to Amazon Bedrock. All of the technical work is described in the
`litellm-bedrock-gateway` skill from
[nmfs-opensci/agent-skills](https://github.com/nmfs-opensci/agent-skills). Follow
that skill, and do not rebuild any of it here.

## Before anything else: find the skill

Check that the `litellm-bedrock-gateway` skill is available to you. If it is not,
stop and tell the user how to install it, using the "Get started" steps in
`README.md`. Then ask them to restart you. Do not try to set up a gateway from
memory or from general knowledge of LiteLLM: the skill has the account checks,
the security rules, and the order of the work, and they matter.

## Starting a new gateway

If there is no `gateway.env` in this repository, the gateway has not been
set up yet. Follow the skill's order of work from step 1, asking the user its
questions before you do anything. When the skill says to start a deployment
folder, use **this repository's root**:

```bash
<skill-dir>/scripts/init_deployment.sh .
```

It adds `scripts/`, `assets/`, `gateway.env`, `models.yaml` and `.gitignore`
without overwriting any of them that already exist.

## An existing gateway

If `gateway.env` exists, this repository already describes a gateway. Run
commands from the repository root after `source gateway.env`, using the scripts
copied here, not the ones in the skill: the copy is what the running gateway
was deployed with. Use the skill for how and when to run them. If the skill's
scripts have changed since this gateway was set up, tell the user, and do not
copy the new versions in unless they ask.

## Rules for this repository

These restate the parts of the skill that concern what gets committed, because
this repository is often public:

- Never commit the gateway URL, a key, a password, or anything under
  `secrets/`. The URL lives in `secrets/gateway-url` and goes out privately.
- `secrets/`, `build/` and `.venv/` stay git-ignored. `docs/` and `hub/` are
  generated and committed.
- Never print a secret, even to the user in this session.
- Ask before creating anything that is billed, and before deleting anything.

## This file

`CLAUDE.md` is a symbolic link to this file, so Claude Code and agents that read
`AGENTS.md` get the same instructions. Edit `AGENTS.md`.
