echo "Add SUPER+SHIFT+R keybinding to restart waybar"

BINDINGS="$HOME/.config/hypr/bindings.lua"

if [[ ! -f "$BINDINGS" ]]; then
  echo "  No bindings.lua found, skipping."
  exit 0
fi

if grep -q 'island-restart-waybar' "$BINDINGS" 2>/dev/null; then
  echo "  Keybinding already exists, skipping."
  exit 0
fi

echo 'island.bind("SUPER + SHIFT + R", "Restart waybar", "island-restart-waybar")' >> "$BINDINGS"
echo "  Added SUPER+SHIFT+R to restart waybar."
