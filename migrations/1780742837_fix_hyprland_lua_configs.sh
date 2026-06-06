echo "Fix Hyprland Lua configs: monitor API, input structure, appearance keys, binding syntax"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
HYPR_DIR="$HOME/.config/hypr"

# Only run if hyprland configs exist (i.e. island was installed)
if [[ ! -d "$HYPR_DIR" ]]; then
  echo "  No hyprland config found, skipping."
  exit 0
fi

# --- monitors.lua: fix hl.monitor() call to table format ---
if grep -q 'hl\.monitor(","' "$HYPR_DIR/monitors.lua" 2>/dev/null; then
  echo "  Fixing monitors.lua: hl.monitor() table format"
  cp "$ISLAND_PATH/config/hypr/monitors.lua" "$HYPR_DIR/monitors.lua"
fi

# --- input.lua: remove invalid gestures block, fix kb_layout ---
if grep -q 'gestures' "$HYPR_DIR/input.lua" 2>/dev/null || grep -q 'tap_to_click' "$HYPR_DIR/input.lua" 2>/dev/null; then
  echo "  Fixing input.lua: removing invalid keys, setting kb_layout=de"
  cp "$ISLAND_PATH/config/hypr/input.lua" "$HYPR_DIR/input.lua"
fi

# --- appearance.lua: remove invalid keys, fix animations ---
if grep -q 'new_optimizations' "$HYPR_DIR/appearance.lua" 2>/dev/null || grep -q 'force_default_wallpaper' "$HYPR_DIR/appearance.lua" 2>/dev/null; then
  echo "  Fixing appearance.lua: removing invalid config keys"
  cp "$ISLAND_PATH/config/hypr/appearance.lua" "$HYPR_DIR/appearance.lua"
fi

# --- bindings.lua: fix screenshot/media key syntax ---
if grep -q '", Print"' "$HYPR_DIR/bindings.lua" 2>/dev/null || grep -q 'repeatable' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  echo "  Fixing bindings.lua: key syntax and options"
  cp "$ISLAND_PATH/config/hypr/bindings.lua" "$HYPR_DIR/bindings.lua"
fi

# --- hyprland.lua: fix wiki URL ---
if grep -q 'wiki\.hypr\.land' "$HYPR_DIR/hyprland.lua" 2>/dev/null; then
  echo "  Fixing hyprland.lua: wiki URL"
  sed -i 's|wiki\.hypr\.land|wiki.hyprland.org|g' "$HYPR_DIR/hyprland.lua"
fi

# --- rules.lua: fix wiki URL ---
if grep -q 'wiki\.hypr\.land' "$HYPR_DIR/rules.lua" 2>/dev/null; then
  echo "  Fixing rules.lua: wiki URL"
  sed -i 's|wiki\.hypr\.land|wiki.hyprland.org|g' "$HYPR_DIR/rules.lua"
fi

echo "  Hyprland Lua config fixes applied."
