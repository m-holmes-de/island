echo "Set up kanata: CapsLock as Escape (tap) / Hyper (hold)"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Install kanata from AUR ---
"$ISLAND_PATH/bin/island-pkg-aur-add" kanata

# --- Deploy config and enable service ---
"$ISLAND_PATH/bin/island-setup-kanata"

echo "  Done."
