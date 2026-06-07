echo "Add slight transparency to GTK app backgrounds"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

echo "  Updating gtk.css with transparent backgrounds"
cp "$ISLAND_PATH/config/gtk-3.0/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"
