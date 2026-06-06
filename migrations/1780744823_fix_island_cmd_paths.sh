echo "Fix island- commands: resolve to full path so Hyprland keybindings work"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# Update helpers.lua with resolve_cmd support
if [[ -f "$HOME/.config/hypr/helpers.lua" ]]; then
  if ! grep -q 'resolve_cmd' "$HOME/.config/hypr/helpers.lua" 2>/dev/null; then
    echo "  Updating helpers.lua with full path resolution"
    cp "$ISLAND_PATH/config/hypr/helpers.lua" "$HOME/.config/hypr/helpers.lua"
  fi
fi

echo "  Done. Reload Hyprland to apply."
