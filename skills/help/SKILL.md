---
name: help
description: >
  Print a table of the current mestack skills and a short
  description of each. Use for /help, "list mestack skills",
  or "what can mestack do".
disable-model-invocation: true
---

# Help

Print the mestack catalog. Do not invent rows.

## Steps

1. Find this skill's directory (the folder that contains this
   SKILL.md). Prefer the path the harness loaded. Otherwise use
   `skills/help` in this checkout or a documented skill discovery path.
2. Run `scripts/list.sh` from that directory.
3. Reply with the script's stdout. No extra catalog. Do not
   paraphrase descriptions.

The script walks the pack's `skills/*/SKILL.md`. Frontmatter
`description` is the one home. Short text is the first sentence.
`user-invocable: false` skills are listed without a slash.
