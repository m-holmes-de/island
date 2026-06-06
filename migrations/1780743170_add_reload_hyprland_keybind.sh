echo "Add SUPER+SHIFT+C keybinding to reload Hyprland config"

BINDINGS="$HOME/.config/hypr/bindings.lua"

if [[ ! -f "$BINDINGS" ]]; then
  echo "  No bindings.lua found, skipping."
  exit 0
fi

if grep -q 'hyprctl reload' "$BINDINGS" 2>/dev/null; then
  echo "  Keybinding already exists, skipping."
  exit 0
fi

echo 'island.bind("SUPER + SHIFT + W", "Reload Hyprland config", hl.dsp.exec_cmd("hyprctl reload"))' >> "$BINDINGS"
echo "  Added SUPER+SHIFT+C to reload Hyprland."
