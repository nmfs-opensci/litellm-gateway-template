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

## When the user is not specific: ask what they want

The README gives people one prompt, "Help me set up LiteLLM", and relies on
you for the rest. This applies whenever the user's message does not name a
task: a greeting such as "hello", a request as general as that prompt, or a
question about what you can do. Do not start a procedure, and do not stop at
a summary of the repository: the reply must end by asking what they want to
do, with suggested prompts. Look at the repository first, without signing in
to AWS or running anything that touches the gateway:

| What is present | What it means |
| --- | --- |
| no `gateway.env` | No gateway yet: this is a fresh copy of the template. |
| `gateway.env` and `secrets/gateway-url`, no `secrets/issuer-key` or `secrets/organizer-key` | The installer's copy of a deployed gateway. |
| `gateway.env`, `secrets/gateway-url` and `secrets/issuer-key` (or `secrets/organizer-key`, its earlier name) | A key issuer's copy: they can make keys and run workshops but have no AWS access. |
| `gateway.env` but no `secrets/gateway-url` | Not deployed yet, or deployed from another machine. Ask which. |

Tell the user in a sentence or two what you found. Then ask what they want
to do, offering the prompts that fit, in their words, for them to pick or
adapt. For example:

- **No gateway yet:** "Set up a LiteLLM gateway to Amazon Bedrock." Say
  what setup involves: AWS sign-in, getting Bedrock ready, and a deploy that
  you will ask about before anything is billed. Mention that workshops are
  added once the gateway is running.
- **Installer, gateway set up:**
  - "Set up a workshop named "orca" with organizer "jane-blow"." One
    gateway can serve several workshops, each with its own budgets and
    organizer, and either a sign-up code or a batch of keys to hand out.
  - "Make keys for 20 participants."
  - "How much has the orca workshop spent?"
  - "Is the gateway healthy?"
  - "Stop the gateway until next week."
  - "Add a model."
  - "Tear it down."
- **Key issuer:**
  - "Make a batch of 15 keys for the orca workshop."
  - "Open sign-up for the orca workshop."
  - "Who has a key, and how much has been spent?"
  - "Block ws-orca-07."
  - "Close sign-up."

Only offer what the skill supports, and keep the list short: the few that
fit, not all of them. Once the user picks one, follow the skill.

A workshop organizer who only hands out a batch of keys never uses this
repository: everything they need runs on the JupyterHub. If someone says they
are that organizer, point them to the key issuer who sent their keys.

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
