# mestack

Skill pack for [Amp](https://ampcode.com) and
[Grok Build](https://grok.x.ai). One tree, two parents.

```text
/mestack <goal, and how you will know it is done>
```

`/mestack` picks a playbook, applies the principles that change a
decision, and keeps subagent fan-out in the parent. Why that shape:
[docs/why.md](docs/why.md).

## Install

```bash
./install.sh
```

Symlinks `skills/*` into `~/.agents/skills/` and `~/.grok/skills/`,
and `agents/mestack-agent.md` into `~/.grok/agents/`. Does not edit
`config.toml` or `AGENTS.md`. Re-run after new skills appear.

Grok, as a plugin instead of (or besides) the links:

```bash
grok plugin install /Users/kevin/src/mestack --trust
```

Amp: the `~/.agents/skills` links, or add `~/src/mestack/skills` to
its skill path.

## Setup

```text
/setup-mestack
```

Writes `~/.agents/mestack-models.md` if you want per-role model
overrides. Offers a project `verify-*` skill when the current repo
has a runnable app and none exists. Optional always-on routing:

```text
Non-trivial engineering work (bug, feature, refactor, investigation):
read and follow the mestack skill before acting. Casual questions stay
ordinary chat. The user can opt out for a turn by saying so.
```

Put that in user or project `AGENTS.md`, or `~/.grok/rules/`.

## Commands

| Command | When |
| --- | --- |
| `/mestack` | Non-trivial engineering work |
| `/help` | List mestack skills |
| `/how` | Walk a subsystem, read-only |
| `/prove` | Exercise the real artifact |
| `/create-verification-skill` | Repo has an app and no `verify-*` yet |
| `/maintain-verification-skill` | That skill or its map drifted |
| `/setup-mestack` | Install check and model sheet |

Playbooks behind `/mestack`: `investigate`, `fix`, `build`,
`reshape`, `leave-running`.

`/prove` prefers `<repo>/.agents/skills/verify-<app>/`, then an
existing harness, then a one-off invocation. Create writes that
skill (launch, doctor, drive, evidence, feature map) and runs one
feature before handoff. Details: [docs/why.md](docs/why.md).

## Layout

```text
skills/mestack/                      dispatcher, playbooks, adapters
skills/principle-*/                  one rule each; slash-hidden
skills/how prove setup-mestack help
skills/create-verification-skill/    owns verify-* contract
skills/maintain-verification-skill/
agents/mestack-agent.md              Grok child; no nested spawn
docs/why.md                          design argument
```

Harness tool names live only in `skills/mestack/references/`.

## Status

v0.2. No arena, multi-model interrogate, or Graphite autopilot.
Competing designs: parent spawns isolated writers and reads them.
