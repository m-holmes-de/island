echo "Fix GTK dark theme: use adw-gtk3-dark with Rose Pine color overrides"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Deploy gtk.css color override ---
echo "  Deploying Rose Pine color overrides for GTK"
cp "$ISLAND_PATH/config/gtk-3.0/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"
cp "$ISLAND_PATH/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"
mkdir -p "$HOME/.config/gtk-4.0"
cp "$ISLAND_PATH/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"

# --- Set xfconf for Thunar ---
if command -v xfconf-query &>/dev/null; then
  xfconf-query -c xsettings -p /Net/ThemeName -s "adw-gtk3-dark" --create -t string 2>/dev/null
  xfconf-query -c xsettings -p /Gtk/FontName -s "JetBrainsMono Nerd Font Propo 11" --create -t string 2>/dev/null
fi

# --- Set gsettings ---
if command -v gsettings &>/dev/null; then
  gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' 2>/dev/null || true
  gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font Propo 11' 2>/dev/null || true
fi

echo "  Done. Reopen Thunar to see dark Rose Pine theme."
