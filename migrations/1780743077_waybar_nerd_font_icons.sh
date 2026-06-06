echo "Update waybar network/bluetooth/battery/audio to use Nerd Font icons with TUI on-click"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
WAYBAR_CONF="$HOME/.config/waybar/config.jsonc"

if [[ ! -f "$WAYBAR_CONF" ]]; then
  echo "  No waybar config found, skipping."
  exit 0
fi

# Check if already migrated (look for a Nerd Font icon we're adding)
if grep -q '󰤨' "$WAYBAR_CONF" 2>/dev/null; then
  echo "  Waybar already has Nerd Font icons, skipping."
  exit 0
fi

echo "  Replacing waybar config with updated Nerd Font icons"
cp "$ISLAND_PATH/config/waybar/config.jsonc" "$WAYBAR_CONF"
