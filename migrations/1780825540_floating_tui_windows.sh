echo "Make TUI apps open as floating centered windows"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
HYPR_DIR="$HOME/.config/hypr"

# --- Update helpers.lua with title flag ---
if [[ -f "$HYPR_DIR/helpers.lua" ]] && ! grep -q "Island TUI" "$HYPR_DIR/helpers.lua" 2>/dev/null; then
  echo "  Updating helpers.lua: TUI windows get 'Island TUI' title"
  cp "$ISLAND_PATH/config/hypr/helpers.lua" "$HYPR_DIR/helpers.lua"
fi

# --- Add window rule for TUI title ---
if [[ -f "$HYPR_DIR/rules.lua" ]] && ! grep -q "Island TUI" "$HYPR_DIR/rules.lua" 2>/dev/null; then
  echo "  Adding floating/centered window rule for TUI apps"
  sed -i '1,/^--/{ s/^-- Float common dialogs/-- TUI apps (opened via island.tui) — floating, centered\nisland.window({ title = "^Island TUI$" }, { float = true, center = true, size = { 900, 600 } })\n\n-- Float common dialogs/ }' "$HYPR_DIR/rules.lua"
fi

# --- Update waybar on-click commands ---
WAYBAR_CONF="$HOME/.config/waybar/config.jsonc"
if [[ -f "$WAYBAR_CONF" ]] && grep -q '"ghostty -e impala"' "$WAYBAR_CONF" 2>/dev/null; then
  echo "  Updating waybar TUI on-click commands with title flag"
  sed -i "s|ghostty -e pulsemixer|ghostty --title='Island TUI' -e pulsemixer|" "$WAYBAR_CONF"
  sed -i "s|ghostty -e impala|ghostty --title='Island TUI' -e impala|" "$WAYBAR_CONF"
  sed -i "s|ghostty -e bluetui|ghostty --title='Island TUI' -e bluetui|" "$WAYBAR_CONF"
fi

echo "  Done. TUI apps will now open floating and centered."
