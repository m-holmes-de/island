#!/bin/bash
# Switch workspace bindings from code: keycodes to keysym names
# Fixes HYPER+SHIFT+2 not working on German layout (FOUR_LEVEL xkb type conflict)
set -eEo pipefail

echo "Switch workspace bindings to keysym names (fix German layout)"

HYPR_DIR="$HOME/.config/hypr"

if [[ ! -f "$HYPR_DIR/bindings.lua" ]]; then
  echo "  bindings.lua not found, skipping."
  exit 0
fi

if grep -q 'code:.*tostring(workspace + 9)' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  sed -i '/-- === Workspaces ===/,/^end$/c\-- === Workspaces ===\n-- Use keysym names to avoid German layout issues with code: + SHIFT\nlocal ws_keys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }\nfor workspace = 1, 10 do\n  local key = ws_keys[workspace]\n  island.bind(HYPER .. " + " .. key, "Workspace " .. workspace, hl.dsp.focus({ workspace = tostring(workspace) }))\n  island.bind(HYPER .. " + SHIFT + " .. key, "Move to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))\nend' "$HYPR_DIR/bindings.lua"
  echo "  Switched workspace bindings to keysym names"
else
  echo "  Workspace bindings already updated, skipping."
fi

echo "  Done."
