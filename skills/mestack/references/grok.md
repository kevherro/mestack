# Grok Build

## Spawn

Use `spawn_subagent`.

| Field | Value |
| --- | --- |
| `subagent_type` | `mestack-agent` for work that must follow mestack. `explore` for read-only search. `general-purpose` only when the child must edit and mestack-agent is unavailable. |
| `background` | `true` for fan-out. Drain with `get_command_or_subagent_output`. |
| `isolation` | `worktree` for any writer. `none` for read-only. |
| `model` | Only a slug from [models.md](models.md) that this session can actually run. Omit to inherit the parent. |

Grok children cannot spawn. If you are already a child, do the work
yourself.

## Tools

- Shell: `run_terminal_command`. Long jobs: `background: true`.
- Overnight wake: Grok `/loop` and the scheduler. Pair with the
  leave-running playbook.
- Project rules: `AGENTS.md` and `~/.grok/rules/*.md`.
- Model sheet: `~/.agents/mestack-models.md`. Optionally mirrored at
  `~/.grok/rules/mestack-models.md` so it always loads.

## Do not use

Cursor `Task`, Amp orb APIs, or nested `spawn_subagent` from a child.
