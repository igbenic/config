#!/bin/zsh

set -euo pipefail

BASE_DIR="${0:A:h}"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

link_with_backup() {
  local source_path="$1"
  local target_path="$2"

  mkdir -p "$(dirname "$target_path")"

  if [[ -L "$target_path" ]]; then
    local current_target
    current_target="$(readlink "$target_path")"
    if [[ "$current_target" == "$source_path" ]]; then
      echo "Already linked: $target_path -> $source_path"
      return
    fi

    mv "$target_path" "${target_path}.bak.${TIMESTAMP}"
  elif [[ -e "$target_path" ]]; then
    mv "$target_path" "${target_path}.bak.${TIMESTAMP}"
  fi

  ln -s "$source_path" "$target_path"
  echo "Linked: $target_path -> $source_path"
}

link_with_backup "$BASE_DIR/shell/.zshrc" "$HOME/.zshrc"
link_with_backup "$BASE_DIR/codex/config.toml" "$HOME/.codex/config.toml"
link_with_backup "$BASE_DIR/codex/bin/codex-notify-fanout.sh" "$HOME/.codex/bin/codex-notify-fanout.sh"
link_with_backup "$BASE_DIR/launchagents/com.igor.codex-worklog-sweeper.plist" "$HOME/Library/LaunchAgents/com.igor.codex-worklog-sweeper.plist"
link_with_backup "$BASE_DIR/hammerspoon/init.lua" "$HOME/.hammerspoon/init.lua"

if command -v launchctl >/dev/null 2>&1; then
  launchctl bootout "gui/$(id -u)" "$HOME/Library/LaunchAgents/com.igor.codex-worklog-sweeper.plist" >/dev/null 2>&1 || true
  if launchctl bootstrap "gui/$(id -u)" "$HOME/Library/LaunchAgents/com.igor.codex-worklog-sweeper.plist"; then
    launchctl enable "gui/$(id -u)/com.igor.codex-worklog-sweeper" >/dev/null 2>&1 || true
    echo "Loaded LaunchAgent: com.igor.codex-worklog-sweeper"
  else
    echo "Failed to load LaunchAgent: com.igor.codex-worklog-sweeper" >&2
  fi
fi

echo "Managed config links now point at $BASE_DIR"
