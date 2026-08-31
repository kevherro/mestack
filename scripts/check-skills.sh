#!/usr/bin/env bash
# Check skill directory names, frontmatter names, and required files.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
errors=0

fail() {
  printf 'error: %s\n' "$1" >&2
  errors=$((errors + 1))
}

name_ok() {
  local n="$1"
  [[ "$n" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] && [[ ${#n} -ge 2 && ${#n} -le 64 ]]
}

shopt -s nullglob
for skill_dir in "$ROOT"/skills/*/; do
  name="$(basename "$skill_dir")"
  skill_md="$skill_dir/SKILL.md"

  if [[ ! -f "$skill_md" ]]; then
    fail "$name: missing SKILL.md"
    continue
  fi

  if ! name_ok "$name"; then
    fail "$name: directory name is not a valid skill name"
  fi

  fm_name="$(awk '
    BEGIN { in_fm=0 }
    /^---[[:space:]]*$/ { if (in_fm) exit; in_fm=1; next }
    in_fm && $1=="name:" {
      sub(/^name:[[:space:]]*/, "")
      gsub(/[[:space:]]+$/, "")
      gsub(/^["'\'']|["'\'']$/, "")
      print
      exit
    }
  ' "$skill_md")"

  if [[ -z "$fm_name" ]]; then
    fail "$name: SKILL.md has no frontmatter name"
  elif [[ "$fm_name" != "$name" ]]; then
    fail "$name: frontmatter name '$fm_name' does not match directory"
  fi
done

if [[ ! -f "$ROOT/skills/mestack/SKILL.md" ]]; then
  fail "missing entry skill skills/mestack/SKILL.md"
fi

for pb in investigate fix build reshape leave-running; do
  if [[ ! -f "$ROOT/skills/mestack/playbooks/$pb.md" ]]; then
    fail "missing playbook $pb.md"
  fi
done

for f in \
  skills/create-verification-skill/SKILL.md \
  skills/create-verification-skill/references/location.md \
  skills/create-verification-skill/references/generated-skill.md \
  skills/create-verification-skill/references/feature-map.md \
  skills/maintain-verification-skill/SKILL.md
do
  if [[ ! -f "$ROOT/$f" ]]; then
    fail "missing $f"
  fi
done

if [[ "$errors" -gt 0 ]]; then
  printf '%s check(s) failed\n' "$errors" >&2
  exit 1
fi

printf 'ok\n'
