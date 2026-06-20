#!/bin/bash
# Add HYPER+D system menu binding
set -eEo pipefail

echo "Add system menu binding (HYPER+D)"

BINDINGS="$HOME/.config/hypr/bindings.lua"

if [[ ! -f "$BINDINGS" ]]; then
  echo "  bindings.lua not found, skipping."
  exit 0
fi

if grep -q 'island-system-menu' "$BINDINGS" 2>/dev/null; then
  echo "  System menu binding already exists, skipping."
  exit 0
fi

sed -i '/+ I", "Keybindings"/a island.bind(HYPER .. " + D", "System menu", "island-system-menu")' "$BINDINGS"
echo "  Added HYPER+D system menu binding."

echo "  Done."
