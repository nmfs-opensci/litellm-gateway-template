# litellm-gateway-template

A starting point for running a [LiteLLM](https://docs.litellm.ai/) gateway to
Amazon Bedrock for a workshop or clinic. Participants get personal keys with
their own budgets and expiry dates and use coding agents (Claude Code, OpenCode,
GitHub Copilot CLI) with Bedrock models. Nobody but the installer needs AWS
credentials.

This repository holds almost nothing on purpose. The work is done by your coding
agent following the
[`litellm-bedrock-gateway`](https://github.com/nmfs-opensci/agent-skills/tree/main/skills/litellm-bedrock-gateway)
skill from [nmfs-opensci/agent-skills](https://github.com/nmfs-opensci/agent-skills).
It asks you the setup questions, and it covers AWS sign-in, getting Bedrock
ready, deployment, keys, workshop sign-up, batches of keys for workshop
organizers, issuing keys without AWS access, and teardown. The skill is
**Experimental**, and it will tell you which steps have not been tested in an
account like yours.

## What you need

- An AWS account where you can administer Bedrock, EC2 and CloudFormation.
- The AWS CLI installed locally: version 2.32 or later, which has
  `aws login`.
- git and Python 3.

## Get started

1. **Make your own copy of this repository.** Click **Use this template** on
   GitHub, or clone it. Your copy becomes the record of your gateway. It can be
   public: the gateway URL and all keys stay in git-ignored files and are never
   committed.

2. **Install the skill for your agent.** Clone the catalog once, then link the
   skill where your agent looks for skills:

   ```bash
   git clone https://github.com/nmfs-opensci/agent-skills ~/agent-skills

   # Claude Code
   mkdir -p ~/.claude/skills
   ln -s ~/agent-skills/skills/litellm-bedrock-gateway ~/.claude/skills/litellm-bedrock-gateway

   # Codex (and other agents that read ~/.agents/skills)
   mkdir -p ~/.agents/skills
   ln -s ~/agent-skills/skills/litellm-bedrock-gateway ~/.agents/skills/litellm-bedrock-gateway
   ```

   Other agents and project-level installs are covered in the catalog's
   [Using a skill](https://github.com/nmfs-opensci/agent-skills#using-a-skill)
   section. Restart the agent after installing so it finds the skill.

3. **Start the agent in your copy of this repository and say:**

   ```text
   Help me set up LiteLLM.
   ```

   The agent checks what state this repository is in, tells you what it can
   do from there, and suggests what to ask next. For a new gateway it asks
   about your AWS account, Region, domain name and models, and it stops and
   asks before creating anything you will be billed for.

Come back the same way whenever you need something. Once the gateway is
running it can serve several workshops, each with its own budgets and
organizer, and either a sign-up code or a batch of keys, and the agent will
suggest how to add one, hand out keys, check spending, stop the gateway between events, or tear it down.

## What ends up in this repository

When the agent sets up the gateway, it copies the skill's scripts and templates
into this repository and adds `gateway.env` and `models.yaml`, which hold your
settings. It also writes participant, key issuer and organizer guides under
`docs/`. Your
gateway keeps running on that copy, so later changes to the skill cannot change
it unexpectedly. Secrets, build output and the Python environment (`secrets/`,
`build/`, `.venv/`) are git-ignored.

[`AGENTS.md`](AGENTS.md) holds the instructions your agent reads in this
repository. `CLAUDE.md` is a link to the same file, and
`.claude/settings.json` has Claude Code greet you with the prompt to use
when it starts here.

## Reuse and citation

This work is released under [CC0 1.0 Universal](LICENSE). You are free to use,
copy, modify, and redistribute it, including commercially. If you use it in
published work, in a presentation, or in another repository, please give
attribution to NMFS Open Science:

> NMFS Open Science (2026). *LiteLLM gateway template*.
> nmfs-opensci/litellm-gateway-template.
> https://github.com/nmfs-opensci/litellm-gateway-template
