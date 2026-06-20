#!/bin/bash
# Modernize rofi with transparent theme + Hyprland blur/xray
set -eEo pipefail

echo "Modernize rofi theme with blur/xray"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
HYPR_DIR="$HOME/.config/hypr"
ROFI_DIR="$HOME/.config/rofi"

# --- Update rofi config ---
if [[ -f "$ROFI_DIR/config.rasi" ]]; then
  cp "$ISLAND_PATH/config/rofi/config.rasi" "$ROFI_DIR/config.rasi"
  echo "  Updated rofi config"
else
  echo "  rofi config not found, skipping."
fi

# --- Add layerrule for rofi blur/xray in rules.lua ---
if [[ -f "$HYPR_DIR/rules.lua" ]]; then
  if ! grep -q 'layer_rule.*rofi' "$HYPR_DIR/rules.lua" 2>/dev/null; then
    sed -i '1a\-- Rofi — frosted glass with xray blur\nhl.layer_rule({ match = { namespace = "rofi" }, blur = true, xray = 1, ignore_alpha = 0.3 })\n' "$HYPR_DIR/rules.lua"
    echo "  Added rofi layerrule for blur/xray"
  else
    echo "  Rofi layerrule already exists, skipping."
  fi
else
  echo "  rules.lua not found, skipping."
fi

echo "  Done."
