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
ready, deployment, keys, workshop sign-up, organizers without AWS access, and
teardown. The skill is **Experimental**, and it will tell you which steps have
not been tested in an account like yours.

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

3. **Start the agent in your copy of this repository and give it this
   prompt:**

   ```text
   Set up a LiteLLM gateway to Amazon Bedrock for my workshop,
   using this repository as the deployment folder.
   ```

   The agent then asks you about your AWS account, Region, models, number of
   participants, budgets, and who will organize. It stops and asks before
   creating anything you will be billed for.

Later requests go the same way: start the agent in this repository and say what
you want, such as "make keys for 20 participants", "open sign-up for the
workshop", "how much has been spent?", "stop the gateway until next week", or
"tear it down".

## What ends up in this repository

When the agent sets up the gateway, it copies the skill's scripts and templates
into this repository and adds `gateway.env` and `models.yaml`, which hold your
settings. It also writes participant and organizer guides under `docs/`. Your
gateway keeps running on that copy, so later changes to the skill cannot change
it unexpectedly. Secrets, build output and the Python environment (`secrets/`,
`build/`, `.venv/`) are git-ignored.

[`AGENTS.md`](AGENTS.md) holds the instructions your agent reads in this
repository. `CLAUDE.md` is a link to the same file.

## Reuse and citation

This work is released under [CC0 1.0 Universal](LICENSE). You are free to use,
copy, modify, and redistribute it, including commercially. If you use it in
published work, in a presentation, or in another repository, please give
attribution to NMFS Open Science:

> NMFS Open Science (2026). *LiteLLM gateway template*.
> nmfs-opensci/litellm-gateway-template.
> https://github.com/nmfs-opensci/litellm-gateway-template
