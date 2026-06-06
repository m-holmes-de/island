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

**CRITICAL: After initial deployment, ALL config changes go through migrations.**
The `config/` directory is only for new installs. Never force-copy over `~/.config/`.

## Migration System

Migrations handle system evolution over time (new packages, config changes, etc.).

- Named `<unix-timestamp>_description.sh` in `migrations/`
- Tracked via empty state files in `~/.local/state/island/migrations/`
- Only pending migrations run; completed ones are skipped
- Failed migrations can be skipped and retried later

### When to create a migration

| Change | What to do |
|--------|-----------|
| Fix a bug in a config file | Update `config/` default + create migration to patch `~/.config/` |
| Add a new package | Create migration with `island-pkg-add` |
| Add a new keybinding | Update `config/hypr/bindings.lua` + migration to patch `~/.config/hypr/bindings.lua` |
| Change a default setting | Update `config/` + migration to apply to existing installs |
| Add a new config file for a new tool | Add to `config/` (will be deployed on next install) + migration to copy it |

### Migration idempotency

Every migration must be safe to run even if the change is already applied:
- Check before modifying: `grep -q "pattern" file` before `sed`
- Use `cp` only when replacing entire files intentionally
- Use `island-pkg-add` which skips installed packages

## Idempotency

Every operation is safe to re-run:
- `pacman -S --needed` skips installed packages
- `mkdir -p` is safe on existing directories
- `cp -n` never overwrites
- `systemctl enable` is idempotent
- Migrations track their own state
