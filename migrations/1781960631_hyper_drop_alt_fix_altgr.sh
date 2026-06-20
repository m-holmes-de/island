#!/bin/bash
# Remove Alt from Hyper key to fix Ctrl+Alt=AltGr conflict on German layout
# HYPER changes from Super+Ctrl+Alt to Super+Ctrl
# Directional resize bindings move from SUPER+CTRL to HYPER+ALT
set -eEo pipefail

echo "Remove Alt from Hyper key (fix AltGr conflict on German layout)"

HYPR_DIR="$HOME/.config/hypr"
KANATA_DIR="$HOME/.config/kanata"

# --- Update kanata: remove lalt from hyper combo ---
if [[ -f "$KANATA_DIR/kanata.kbd" ]]; then
  if grep -q '(multi lmet lctl lalt)' "$KANATA_DIR/kanata.kbd" 2>/dev/null; then
    sed -i 's/(multi lmet lctl lalt)/(multi lmet lctl)/' "$KANATA_DIR/kanata.kbd"
    sed -i 's/Super+Ctrl+Alt (Hyper)/Super+Ctrl (Hyper)/' "$KANATA_DIR/kanata.kbd"
    echo "  Updated kanata: Hyper is now Super+Ctrl"
  else
    echo "  kanata already updated, skipping."
  fi
else
  echo "  kanata.kbd not found, skipping."
fi

# --- Update bindings.lua: change HYPER definition ---
if [[ -f "$HYPR_DIR/bindings.lua" ]]; then
  if grep -q 'HYPER = "SUPER + CTRL + ALT"' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
    sed -i 's/HYPER = "SUPER + CTRL + ALT"/HYPER = "SUPER + CTRL"/' "$HYPR_DIR/bindings.lua"
    sed -i 's/CapsLock (hold) = Super+Ctrl+Alt/CapsLock (hold) = Super+Ctrl/' "$HYPR_DIR/bindings.lua"
    echo "  Updated HYPER definition to SUPER + CTRL"
  else
    echo "  HYPER definition already updated, skipping."
  fi

  # --- Move directional resize bindings from SUPER+CTRL to HYPER+ALT ---
  if grep -q '"SUPER + CTRL + H"' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
    sed -i 's/"SUPER + CTRL + H"/HYPER .. " + ALT + H"/' "$HYPR_DIR/bindings.lua"
    sed -i 's/"SUPER + CTRL + L"/HYPER .. " + ALT + L"/' "$HYPR_DIR/bindings.lua"
    sed -i 's/"SUPER + CTRL + K"/HYPER .. " + ALT + K"/' "$HYPR_DIR/bindings.lua"
    sed -i 's/"SUPER + CTRL + J"/HYPER .. " + ALT + J"/' "$HYPR_DIR/bindings.lua"
    echo "  Moved directional resize to HYPER+ALT+H/L/K/J"
  else
    echo "  Directional resize bindings already updated, skipping."
  fi
else
  echo "  bindings.lua not found, skipping."
fi

# --- Restart kanata service to pick up changes ---
if systemctl --user is-active kanata.service &>/dev/null; then
  systemctl --user restart kanata.service
  echo "  Restarted kanata service"
fi

echo "  Done."
