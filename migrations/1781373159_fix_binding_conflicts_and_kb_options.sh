#!/bin/bash
# Fix keybinding conflicts and add lv3:ralt_switch for German layout
set -eEo pipefail

echo "Fix binding conflicts and kb_options for German layout"

HYPR_DIR="$HOME/.config/hypr"

# --- Fix HYPER+SHIFT+K conflict: move Keybindings from SHIFT+K to SHIFT+SLASH ---
if grep -q 'SHIFT + K.*Keybindings' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i 's/SHIFT + K", "Keybindings/SHIFT + SLASH", "Keybindings/' "$HYPR_DIR/bindings.lua"
  echo "  Moved Keybindings from HYPER+SHIFT+K to HYPER+SHIFT+SLASH"
else
  echo "  Keybindings binding already fixed, skipping."
fi

# --- Fix HYPER+SHIFT+S conflict: move Shrink/Grow from SHIFT+S/D to MINUS/EQUAL ---
if grep -q 'SHIFT + S.*Shrink window' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i 's/SHIFT + S", "Shrink window/MINUS", "Shrink window/' "$HYPR_DIR/bindings.lua"
  echo "  Moved Shrink from HYPER+SHIFT+S to HYPER+MINUS"
else
  echo "  Shrink binding already fixed, skipping."
fi

if grep -q 'SHIFT + D", "Grow window' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i 's/SHIFT + D", "Grow window/EQUAL", "Grow window/' "$HYPR_DIR/bindings.lua"
  echo "  Moved Grow from HYPER+SHIFT+D to HYPER+EQUAL"
else
  echo "  Grow binding already fixed, skipping."
fi

# --- Add lv3:ralt_switch to prevent Ctrl+Alt being treated as AltGr ---
if grep -q 'kb_options = ""' "$HYPR_DIR/input.lua" 2>/dev/null; then
  sed -i 's/kb_options = ""/kb_options = "lv3:ralt_switch"/' "$HYPR_DIR/input.lua"
  echo "  Set kb_options to lv3:ralt_switch"
elif grep -q 'lv3:ralt_switch' "$HYPR_DIR/input.lua" 2>/dev/null; then
  echo "  kb_options already set, skipping."
else
  echo "  Could not find kb_options in input.lua, skipping."
fi

echo "  Done."
