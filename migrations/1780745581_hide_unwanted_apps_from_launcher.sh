echo "Hide unwanted apps from rofi launcher (Cosmic, Avahi, system internals, etc.)"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
HIDDEN_DIR="$ISLAND_PATH/applications/hidden"
DEST="$HOME/.local/share/applications"

mkdir -p "$DEST"

if [[ -d "$HIDDEN_DIR" ]]; then
  count=0
  for file in "$HIDDEN_DIR"/*.desktop; do
    [[ -f "$file" ]] || continue
    name=$(basename "$file")
    if [[ ! -f "$DEST/$name" ]]; then
      cp "$file" "$DEST/$name"
      ((count++)) || true
    fi
  done
  echo "  Hidden $count new apps from launcher."
else
  echo "  No hidden apps directory found, skipping."
fi
