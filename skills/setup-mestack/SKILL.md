---
name: setup-mestack
description: >
  Configure mestack for this machine: check the install, write optional
  model overrides, and show how to make /mestack the default. Use for
  /setup-mestack or "configure mestack".
---

# Setup mestack

## 1. Check the install

Resolve the current session's capabilities through
[mestack/references/harness.md](../mestack/references/harness.md).
Locate the loaded `mestack/SKILL.md` and confirm it points at this repo's
`skills/` tree. Symlinks are expected. A directly loaded file is valid.

If discovery is missing, use the installation options in the repo's
README. Configure a supported skill search path, link the skill tree,
or load the entry file explicitly. Do not assume every harness scans
the same directories. Do not run `install.sh` unless the user asks.

## 2. Models

Read `~/.agents/mestack-models.md` if it exists. Otherwise start from
the default shape in
[mestack/references/models.md](../mestack/references/models.md).

Show the current mapping (`code`, `judgment`, `reviewers`). Ask
whether to keep inherit-parent for everything or set specific slugs
this session can actually run. Never write a slug you have not seen
in this session's model list.

Write `~/.agents/mestack-models.md` in the shape from
[mestack/references/models.md](../mestack/references/models.md).
Overwrite the whole file so reruns stay idempotent.

## 3. Optional default routing

If they want mestack on every non-trivial task, show this block and
ask where to put it in a rules file the current harness actually loads.
Do not write it without a yes:

```text
Non-trivial engineering work (bug, feature, refactor, investigation):
read and follow the mestack skill before acting. Casual questions stay
ordinary chat. The user can opt out for a turn by saying so.
```

## 4. Project verification skill

If this session is inside a git repo, search for a `verify-*` skill
using
[create-verification-skill/references/location.md](../create-verification-skill/references/location.md).

- Found: name the path. Mention `/maintain-verification-skill` when
  the map may have drifted.
- Missing, and the repo has a runnable app: offer once to run
  `/create-verification-skill`. Do not generate it without a yes.
- Missing, no runnable surface: skip. Do not push a verify skill on
  a docs-only or library-only tree.

## 5. Confirm

Tell them `/help` lists the pack. Slash-menu discovery depends on
the harness; skills can also be loaded by path. `/interrogate` spawns
one child per `reviewers` entry. A slug this session cannot run is
a dropout.
