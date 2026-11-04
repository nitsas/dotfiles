#!/bin/bash
# Status line based on the zsh theme sorin-nitsas:
# last 3 path components (red), git branch and status symbols (green),
# then the current model.
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
[ -z "$cwd" ] && cwd=$(pwd)

# Equivalent of zsh %3c: path relative to ~, last 3 components.
path="${cwd/#$HOME/~}"
dir=$(echo "$path" | awk -F/ '{
  n = NF; start = (n > 3) ? n - 2 : 1; out = "";
  for (i = start; i <= n; i++) out = out (i > start ? "/" : "") $i;
  if (out == "") out = "/";
  print out }')

red=$'\e[31m'; green=$'\e[32m'; cyan=$'\e[36m'; reset=$'\e[0m'

git_part=""
if git -C "$cwd" --no-optional-locks rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  st=$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)
  sym=""
  echo "$st" | grep -q '^A'              && sym="$sym+"
  echo "$st" | grep -q '^.M\|^M'         && sym="$sym*"
  echo "$st" | grep -q '^.D\|^D'         && sym="$sym-"
  echo "$st" | grep -q '^R'              && sym="$sym➜"
  echo "$st" | grep -q '^UU\|^AA\|^DD'   && sym="$sym═"
  git_part=" (${branch}${sym})"
fi

printf '%s%s%s%s%s' "$red" "$dir" "$green" "$git_part" "$reset"
[ -n "$model" ] && printf ' %s[%s]%s' "$cyan" "$model" "$reset"
printf '\n'
