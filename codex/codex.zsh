export CONFIG_REPO_DIR="${CONFIG_REPO_DIR:-$HOME/Projects/config}"
export CODEX_CONFIG_REPO_DIR="${CODEX_CONFIG_REPO_DIR:-$CONFIG_REPO_DIR/codex}"

alias codexconfig='code "$CODEX_CONFIG_REPO_DIR"'
alias codexconfighome='cd "$CODEX_CONFIG_REPO_DIR"'
alias codexconfig-install='"$CONFIG_REPO_DIR"/install.sh'
alias codexconfig-status='ls -l ~/.codex/config.toml ~/.codex/bin/codex-notify-fanout.sh'
