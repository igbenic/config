#!/bin/zsh

payload="${1-}"
if [[ -z "$payload" ]]; then
  echo "Expected notify JSON payload as argv[1]." >&2
  exit 1
fi

status=0

/Users/igbenic/.nvm/versions/node/v22.18.0/bin/codex-wakatime "$payload" || status=$?

exit "$status"
