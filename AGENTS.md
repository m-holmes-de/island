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

# Migrations

- Filename: `<unix-timestamp>_description.sh`
- No shebang (run via `bash "$file"`)
- Start with `echo` describing what the migration does
- Use `island-pkg-add`, `island-pkg-missing` etc. where possible
- State tracked in `~/.local/state/island/migrations/`

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
