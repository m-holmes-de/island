# Style

- Two spaces for indentation, no tabs
- Use bash 5 conditionals: `[[ ]]` for string/file tests, `(( ))` for numeric
- Shebangs must use `#!/bin/bash`
- Scripts under `install/` and `migrations/` may omit shebangs (they are sourced)
- Quote variables in double quotes except inside `[[ ]]`
- Use `set -eEo pipefail` in entry-point scripts

# Command Naming

All commands start with `island-`. Prefixes indicate purpose:

- `pkg-` - package management helpers
- `capture-` - screenshots, screen recordings
- `launch-` - open applications
- `refresh-` - reset a config file to default from island/config/
- `restart-` - restart a component (waybar, mako, etc.)
- `system-` - lock, logout, reboot, shutdown

# Config Files

- `config/` - default configs, copied to `~/.config/` with `cp -n` (no overwrite)
- Hyprland uses Lua scripting (`.lua` files) with `require()` for modularity
- Waybar uses JSONC (config.jsonc) and CSS (style.css)
- Rofi uses `.rasi` format
- Mako uses INI-like format
- One concern per file in hyprland config (bindings.conf, appearance.conf, etc.)

# Package Lists

- `.packages` files use one package per line
- Lines starting with `#` are comments
- Blank lines are ignored
- Parsed with: `grep -v '^#' file.packages | grep -v '^$'`

# Migrations — MANDATORY for config changes

**Every change to deployed user configs MUST be done via a migration.**

`config/` is only for new installs (copied once with `cp -n`). Once configs are
deployed to `~/.config/`, the ONLY way to update them is a migration. This
protects user customizations.

When changing a config:
1. Update the default in `config/` (for new installs)
2. Create a migration in `migrations/` (for existing installs)
3. The migration must be idempotent (check before modifying)

Migration rules:
- Filename: `<unix-timestamp>_description.sh`
- No shebang (run via `bash "$file"`)
- Start with `echo` describing what the migration does
- Use `island-pkg-add`, `island-pkg-missing` etc. where possible
- State tracked in `~/.local/state/island/migrations/`
- Must be idempotent: use `grep -q` before `sed`, check file contents before replacing

Example — replacing a whole config file:
```bash
echo "Fix Hyprland monitor config to use table format"
ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
cp "$ISLAND_PATH/config/hypr/monitors.lua" ~/.config/hypr/monitors.lua
```

Example — patching a line in a config:
```bash
echo "Switch keyboard layout to de"
sed -i 's/kb_layout = "us"/kb_layout = "de"/' ~/.config/hypr/input.lua
```

# Development Process

## Commit checklist

Before every commit, verify:

1. **Migration required?** If any file under `config/` was changed, there MUST be
   a corresponding migration in `migrations/`. No exceptions.
2. **Defaults updated?** If a migration patches a deployed config, the matching
   file in `config/` must also be updated (for fresh installs).
3. **Idempotent?** Run `island-migrate` twice — the second run should skip or
   no-op every migration.
4. **Syntax check?** `bash -n` on all new/modified shell scripts.
5. **Deployed?** After committing, `rsync` to `~/.local/share/island/` and run
   `island-migrate` to apply changes to the live system.

## Deploy workflow

```bash
# 1. Make changes in the repo
# 2. Sync to install location
rsync -a --delete --exclude='.git' . ~/.local/share/island/
# 3. Run migrations
island-migrate
# 4. Reload Hyprland to pick up config changes
# SUPER+SHIFT+W or: hyprctl reload
```

## Hyprland Lua helpers

All `island-*` commands are auto-resolved to their full path by the `resolve_cmd`
function in `helpers.lua`. You don't need to use full paths in bindings or
autostart — just use the command name (e.g., `"island-wallpaper-select"`).

## Hiding apps from rofi

To hide an app from the rofi launcher:
1. Add a file `applications/hidden/<app-name>.desktop` containing:
   ```
   [Desktop Entry]
   Type=Application
   NoDisplay=true
   Hidden=true
   ```
2. Create a migration that copies it to `~/.local/share/applications/`

# Install Scripts

- `install/*/all.sh` orchestrate each phase
- Leaf scripts are run via `run_logged "$ISLAND_INSTALL/path/to/script.sh"`
- Use `$ISLAND_PATH` and `$ISLAND_INSTALL` instead of hard-coded paths
- Avoid `exit` in sourced install scripts unless intentionally aborting

# Idempotency Patterns

- `mkdir -p` for directory creation
- `cp -n` for config deployment (no-clobber)
- `pacman -S --noconfirm --needed` for package installation
- `systemctl enable --now ... 2>/dev/null || true` for services
- Check before append: `grep -q "pattern" file || echo "line" >> file`
