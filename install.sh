#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
target_dir=${CODEX_SKILLS_DIR:-${HOME:?HOME must be set}/.codex/skills}
mkdir -p "$target_dir"

linked=0
skipped=0
while IFS= read -r -d '' skill_dir; do
  skill_name=${skill_dir##*/}
  destination="$target_dir/$skill_name"

  if [[ -L "$destination" ]]; then
    current_target=$(readlink "$destination")
    if [[ "$current_target" == "$skill_dir" ]]; then
      printf 'unchanged %s\n' "$skill_name"
    else
      printf 'skip %s (existing symlink: %s)\n' "$skill_name" "$current_target" >&2
    fi
    skipped=$((skipped + 1))
  elif [[ -e "$destination" ]]; then
    printf 'skip %s (existing file or directory)\n' "$skill_name" >&2
    skipped=$((skipped + 1))
  else
    ln -s "$skill_dir" "$destination"
    printf 'linked %s\n' "$skill_name"
    linked=$((linked + 1))
  fi
done < <(find "$repo_root/skills" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

printf 'complete: %d linked, %d skipped, target=%s\n' "$linked" "$skipped" "$target_dir"
