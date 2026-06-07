echo "Change idle lock timeout to 10 minutes"

CONF="$HOME/.config/hypr/hypridle.conf"

if [[ -f "$CONF" ]] && grep -q 'timeout = 300' "$CONF" 2>/dev/null; then
  echo "  Updating hypridle timeouts (lock 10m, screen off 12m, suspend 20m)"
  ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
  cp "$ISLAND_PATH/config/hypr/hypridle.conf" "$CONF"
fi
