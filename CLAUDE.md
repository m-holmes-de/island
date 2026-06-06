# Island - Hyprland Desktop for CachyOS

## What is this?
Island is a Hyprland desktop environment configuration system for CachyOS (Arch-based).
It uses a migration-based install system inspired by Omarchy (basecamp/omarchy).

## Project structure
- `install.sh` - Entry point, sources install phases in order
- `bin/` - CLI tools, all prefixed with `island-`
- `config/` - Default configs, copied to `~/.config/` on install (never overwrites)
- `install/` - Install phase scripts (preflight, packaging, config, post-install)
- `migrations/` - Timestamped migration scripts for evolving the system
- `default/` - Default dotfiles (bashrc additions, etc.)
- `docs/` - Documentation

## Key paths at runtime
- Install location: `~/.local/share/island/`
- State: `~/.local/state/island/`
- Migration state: `~/.local/state/island/migrations/`
- User configs: `~/.config/hypr/`, `~/.config/waybar/`, etc.

## Development commands
- `./install.sh` - Run full install (idempotent, safe to re-run)
- `island-migrate` - Run pending migrations only
- `island-pkg-add <pkg>` - Install a package idempotently

## Coding conventions
- All scripts use `#!/bin/bash` with `set -eEo pipefail`
- Two spaces for indentation, no tabs
- Package lists in `.packages` files (comments with #, one package per line)
- Configs use native formats: .lua for hyprland, JSONC for waybar, .rasi for rofi
- All bin/ scripts are prefixed `island-`
- Use `[[ ]]` for string/file tests, `(( ))` for numeric
- Quote variables in double quotes

## Hyprland reference
- Always consult the Hyprland wiki for configuration: https://wiki.hyprland.org/
- Lua API reference: https://wiki.hyprland.org/Configuring/Lua-API/
- Variables/options: https://wiki.hyprland.org/Configuring/Variables/
- Keybindings: https://wiki.hyprland.org/Configuring/Binds/
- Window rules: https://wiki.hyprland.org/Configuring/Window-Rules/
- Monitors: https://wiki.hyprland.org/Configuring/Monitors/
- Animations: https://wiki.hyprland.org/Configuring/Animations/

## CRITICAL: Migration-first rule
Any change to deployed configs (`~/.config/`) MUST go through a migration.
- `config/` holds defaults for NEW installs only (deployed via `cp -n`, never overwrites)
- To update configs on existing installs, create a migration in `migrations/`
- The migration patches `~/.config/` files directly (the user's live copies)
- Update `config/` defaults AND create a migration — both are required
- Migrations must be idempotent (safe to run if the change is already applied)
- Never force-copy from `config/` to `~/.config/` — that destroys user customizations

## Architecture decisions
- Hyprland configs use Lua (hyprland's native Lua scripting support)
- Modular hyprland config: main file requires bindings, appearance, etc.
- `cp -n` for config deployment (never overwrites user changes)
- Rose Pine (main/dark) as default color scheme
- TUI-first: impala (wifi), bluetui (bluetooth), pulsemixer (audio), btop (system)
- No GUI tray applets — TUIs launched via keybindings in ghostty
- Migrations are bash scripts named `<timestamp>_description.sh`

## Idempotency patterns
- `pacman -S --needed` skips installed packages
- `mkdir -p` for directory creation
- `cp -n` for config deployment (no-clobber)
- `systemctl enable --now ... 2>/dev/null || true` for services
- Migration state files in `~/.local/state/island/migrations/` prevent re-execution

## Testing
Run `./install.sh` on a CachyOS system. It is idempotent.
After install, log out and select Hyprland session.
