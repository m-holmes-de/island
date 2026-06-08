echo "Add theme system with rose-pine-moon and one-dark-pro"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Deploy onedarkpro nvim plugin if missing ---
NVIM_PLUGINS="$HOME/.config/nvim/lua/plugins"
if [[ -d "$NVIM_PLUGINS" ]]; then
  cp -n "$ISLAND_PATH/config/nvim/lua/plugins/onedarkpro.lua" "$NVIM_PLUGINS/onedarkpro.lua" 2>/dev/null || true
  cp -n "$ISLAND_PATH/config/nvim/lua/plugins/island-theme.lua" "$NVIM_PLUGINS/island-theme.lua" 2>/dev/null || true
fi

# --- Update tmux.conf to source theme.conf ---
TMUX_CONF="$HOME/.config/tmux/tmux.conf"
if [[ -f "$TMUX_CONF" ]] && ! grep -q 'source-file.*theme.conf' "$TMUX_CONF" 2>/dev/null; then
  echo "  Updating tmux.conf to source theme.conf"
  cp "$ISLAND_PATH/config/tmux/tmux.conf" "$TMUX_CONF"
fi

# --- Update appearance.lua to load theme.lua ---
APPEARANCE="$HOME/.config/hypr/appearance.lua"
if [[ -f "$APPEARANCE" ]] && ! grep -q 'theme.lua' "$APPEARANCE" 2>/dev/null; then
  echo "  Updating appearance.lua to load theme overlay"
  cp "$ISLAND_PATH/config/hypr/appearance.lua" "$APPEARANCE"
fi

# --- Add theme selector keybinding ---
BINDINGS="$HOME/.config/hypr/bindings.lua"
if [[ -f "$BINDINGS" ]] && ! grep -q 'island-theme-select' "$BINDINGS" 2>/dev/null; then
  echo "  Adding SUPER+SHIFT+T for theme selector"
  sed -i '/island-keybindings/a island.bind("SUPER + SHIFT + T", "Theme selector", "island-theme-select")' "$BINDINGS"
fi

# --- Apply default theme ---
if [[ ! -f "$HOME/.local/state/island/current-theme" ]]; then
  echo "  Applying default theme: rose-pine-moon"
  "$ISLAND_PATH/bin/island-theme-set" rose-pine-moon
fi

echo "  Done. Use SUPER+SHIFT+T to switch themes."
