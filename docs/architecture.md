# Island Architecture

## Overview

Island is a Hyprland desktop environment for CachyOS. It uses a migration-based
install system inspired by [Omarchy](https://github.com/basecamp/omarchy).

## References

- [Hyprland Wiki](https://wiki.hyprland.org/) — official documentation for all Hyprland configuration
- [Hyprland Variables](https://wiki.hyprland.org/Configuring/Variables/) — all config options
- [Hyprland Binds](https://wiki.hyprland.org/Configuring/Binds/) — keybinding reference
- [Hyprland Monitors](https://wiki.hyprland.org/Configuring/Monitors/) — monitor configuration
- [Hyprland Window Rules](https://wiki.hyprland.org/Configuring/Window-Rules/) — window rules
- [Hyprland Animations](https://wiki.hyprland.org/Configuring/Animations/) — animation configuration
- [Hyprland Lua API](https://wiki.hyprland.org/Configuring/Lua-API/) — Lua scripting reference

## Install Flow

```
install.sh
  -> rsync repo to ~/.local/share/island/
  -> preflight (CachyOS check, pacman refresh, ensure yay)
  -> packaging (install from island-base.packages)
  -> config (deploy to ~/.config/, enable services, set env vars)
  -> post-install (run migrations, show completion)
```

## Key Directories

| Path | Purpose |
|------|---------|
| `bin/` | CLI tools prefixed `island-` |
| `config/` | Default configs, copied to `~/.config/` |
| `install/` | Install phase scripts |
| `migrations/` | Timestamped evolution scripts |
| `docs/` | Documentation |

## Runtime Paths

| Path | Purpose |
|------|---------|
| `~/.local/share/island/` | Installed copy of the repo |
| `~/.local/state/island/migrations/` | Migration state tracking |
| `~/.config/hypr/` | Hyprland config (user's copy) |
| `~/.config/waybar/` | Waybar config |
| `~/.config/environment.d/island-wayland.conf` | Wayland env vars |

## Config Deployment

Configs are deployed with `cp -n` (no-clobber). This means:
- First install: all defaults are copied to `~/.config/`
- Re-runs: existing user modifications are never overwritten
- To reset a config to default, delete it and re-run `./install.sh`

## Migration System

Migrations handle system evolution over time (new packages, config changes, etc.).

- Named `<unix-timestamp>_description.sh` in `migrations/`
- Tracked via empty state files in `~/.local/state/island/migrations/`
- Only pending migrations run; completed ones are skipped
- Failed migrations can be skipped and retried later

## Idempotency

Every operation is safe to re-run:
- `pacman -S --needed` skips installed packages
- `mkdir -p` is safe on existing directories
- `cp -n` never overwrites
- `systemctl enable` is idempotent
- Migrations track their own state
