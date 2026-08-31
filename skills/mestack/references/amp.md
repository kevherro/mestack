# Amp

## Spawn

Start an independent thread for each child (an orb when the child
needs its own machine, checkout, or overnight budget). The parent
keeps working.

Each child gets a complete brief, the files it needs, a unique output
path, and an instruction to report back. Uncommitted parent files are
not visible unless you send them.

Fan-out is several threads at once, then the parent synthesizes. Do
not serialize independent slices without a reason.

A second opinion, when Amp exposes an oracle or equivalent, is one
extra read-only thread with the same rubric. It does not apply
changes.

## Overnight

An orb plus a finish condition from the leave-running playbook. The
orb is the machine. The playbook is the contract.

## Model sheet

Read `~/.agents/mestack-models.md` when present. Amp-native models run
in-process. A role that names a model this Amp session cannot run is a
dropout.

## Do not use

Grok `spawn_subagent` or Cursor `Task`.
