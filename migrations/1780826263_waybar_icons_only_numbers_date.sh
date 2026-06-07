echo "Waybar: icon-only right side, numbered workspaces, clock with day, tighter spacing"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
WAYBAR_DIR="$HOME/.config/waybar"

if [[ -d "$WAYBAR_DIR" ]]; then
  echo "  Updating waybar config and style"
  cp "$ISLAND_PATH/config/waybar/config.jsonc" "$WAYBAR_DIR/config.jsonc"
  cp "$ISLAND_PATH/config/waybar/style.css" "$WAYBAR_DIR/style.css"
fi
