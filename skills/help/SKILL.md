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

1. Read [references/catalog.md](references/catalog.md) relative to
   this skill's reported directory.
2. Reply with that table verbatim. No extra catalog. Do not
   paraphrase descriptions.

The catalog is generated from the source pack's frontmatter
`description` values. Short text is the first sentence.
`user-invocable: false` skills are listed without a slash.
