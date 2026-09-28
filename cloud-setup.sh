#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if [[ -n "${CODEX_CAPABILITY_DIR:-}" ]]; then
  capability_dir=$CODEX_CAPABILITY_DIR
elif [[ -n "${CODEX_SKILLS_DIR:-}" ]]; then
  capability_dir=$CODEX_SKILLS_DIR
elif [[ -d /workspace ]]; then
  capability_dir=/workspace/.codex/skills
else
  capability_dir=${HOME:?HOME must be set}/.codex/skills
fi

CODEX_SKILLS_DIR="$capability_dir" "$repo_root/install.sh"
