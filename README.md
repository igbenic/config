# Config Repo

Tracked local-machine config lives here, grouped by tool instead of piling files into the repo root.

## Layout

- `codex/`
- `shell/`
- `hammerspoon/`

## Install / relink

Run:

```bash
/Users/igbenic/Projects/config/install.sh
```

That script relinks the managed files into your home directory and backs up any replaced file or symlink with a timestamped `.bak.*` suffix.

## Current managed targets

- `shell/.zshrc` -> `~/.zshrc`
- `codex/config.toml` -> `~/.codex/config.toml`
- `codex/bin/codex-notify-fanout.sh` -> `~/.codex/bin/codex-notify-fanout.sh`
- `hammerspoon/init.lua` -> `~/.hammerspoon/init.lua`

## New-Mac flow

1. Clone `~/Projects/config`
2. Run `~/Projects/config/install.sh`
3. Open a new shell
4. Restart Codex so it reloads `~/.codex/config.toml`

## Caution

Some tracked config files currently contain real local values and secrets. Keep this repo private unless you later split secrets into a separate untracked overlay.
