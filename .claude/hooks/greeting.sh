#!/usr/bin/env bash
# SessionStart hook: greet the person when Claude Code starts in this repository,
# since agents say nothing until spoken to. Prints JSON whose systemMessage
# Claude Code shows in the terminal. Other agents ignore this file; AGENTS.md
# covers them once the user types something.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
if [ ! -f gateway.env ]; then
  msg='LiteLLM gateway template: no gateway is set up in this folder yet.\nTo start, type:  Help me set up LiteLLM'
else
  msg='This folder holds a LiteLLM gateway.\nSay what you want to do (add a workshop, make keys, check spending, stop or tear down the gateway), or type:  What can I do here?'
fi
printf '{"systemMessage": "%s"}\n' "$msg"
