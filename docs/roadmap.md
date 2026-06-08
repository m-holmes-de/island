# Island Roadmap

## Phase 2 — Planned Features

### ~~Clipboard Manager~~ — Done
Using `cliphist` with rofi (SUPER+V).

### ~~Screenshots & Screen Recording~~ — Done
Screenshots via `island-capture-screenshot` (grim + slurp + satty).
Recording via `island-capture-recording` (wf-recorder) with waybar indicator.

### ~~Keybinding Viewer~~ — Done
Rofi-based viewer parsing bindings.lua. SUPER+/ to open.

### ~~Theme Management~~ — Done
Template-based theming across all apps (SUPER+SHIFT+T). Rose Pine Moon and One Dark Pro,
with --dark variant for black backgrounds. Uses `island-theme-set` and `island-theme-select`.

### ~~Neovim Configuration~~ — Done
LazyVim-based with Rose Pine main variant. Config in `config/nvim/`.

### ~~Tmux Configuration~~ — Done
Rose Pine themed, Ctrl+Space prefix, vi mode, TPM plugins. Config in `config/tmux/`.

### ~~ZSH Configuration~~ — Done
Zinit plugins, starship prompt, vi mode, fzf, zoxide. Config in `default/.zshrc`.

## Open Issues

- GTK/Thunar live theme hot-reload via xsettingsd — installed and configured but needs testing after logout/login
- Ghostty requires manual Ctrl+Shift+, to reload after theme switch

## Future Ideas

- More themes (Catppuccin, Tokyo Night, Gruvbox, Nord)
- Wallpaper-based color generation with [matugen](https://github.com/InioX/matugen)

- DankMaterialShell / Quickshell as waybar replacement (once Quickshell hits 1.0)
- Power menu (shutdown/reboot/suspend/logout via rofi)
- Update system (self-update from git + run migrations)
- Hook system for user-defined post-boot/post-update actions
- Display/monitor management TUI
