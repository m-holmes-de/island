#!/bin/bash
# Rebind: keybindings to HYPER+I, maximize to HYPER+M, btop to HYPER+X, drop fullscreen
set -eEo pipefail

echo "Rebind keybindings/maximize/btop shortcuts"

HYPR_DIR="$HOME/.config/hypr"

if [[ ! -f "$HYPR_DIR/bindings.lua" ]]; then
  echo "  bindings.lua not found, skipping."
  exit 0
fi

# --- Keybindings: SHIFT+SLASH → I ---
if grep -q 'SHIFT + SLASH.*Keybindings' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i 's/SHIFT + SLASH", "Keybindings/I", "Keybindings/' "$HYPR_DIR/bindings.lua"
  echo "  Moved Keybindings to HYPER+I"
else
  echo "  Keybindings binding already updated, skipping."
fi

# --- Btop: M → X ---
if grep -q 'HYPER .. " + M".*System monitor' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i 's/HYPER .. " + M", "System monitor/HYPER .. " + X", "System monitor/' "$HYPR_DIR/bindings.lua"
  echo "  Moved btop to HYPER+X"
else
  echo "  btop binding already updated, skipping."
fi

# --- Remove fullscreen binding ---
if grep -q '+ F", "Fullscreen"' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i '/+ F", "Fullscreen"/d' "$HYPR_DIR/bindings.lua"
  echo "  Removed fullscreen binding"
else
  echo "  Fullscreen binding already removed, skipping."
fi

# --- Maximize: SHIFT+F → M ---
if grep -q 'SHIFT + F.*Maximized' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i 's/SHIFT + F", "Maximized/M", "Maximize/' "$HYPR_DIR/bindings.lua"
  echo "  Moved Maximize to HYPER+M"
else
  echo "  Maximize binding already updated, skipping."
fi

echo "  Done."
