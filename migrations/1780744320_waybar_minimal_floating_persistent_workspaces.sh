echo "Redesign waybar: minimal floating style, consistent colors, 6 persistent workspaces"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Waybar config and style ---
WAYBAR_DIR="$HOME/.config/waybar"
if [[ -d "$WAYBAR_DIR" ]]; then
  if ! grep -q 'persistent-workspaces' "$WAYBAR_DIR/config.jsonc" 2>/dev/null; then
    echo "  Updating waybar config (floating, minimal, 6 persistent workspaces)"
    cp "$ISLAND_PATH/config/waybar/config.jsonc" "$WAYBAR_DIR/config.jsonc"
    cp "$ISLAND_PATH/config/waybar/style.css" "$WAYBAR_DIR/style.css"
  else
    echo "  Waybar already has persistent workspaces, skipping."
  fi
fi

echo "  Done."
