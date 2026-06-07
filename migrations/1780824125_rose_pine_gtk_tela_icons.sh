echo "Install Rose Pine GTK theme and Tela Circle Black icons for Thunar"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Install Tela Circle icons (official repos) ---
"$ISLAND_PATH/bin/island-pkg-add" tela-circle-icon-theme-black

# --- Install Rose Pine GTK theme (AUR) ---
"$ISLAND_PATH/bin/island-pkg-aur-add" rose-pine-gtk-theme

# --- Update GTK settings ---
GTK_CONF="$HOME/.config/gtk-3.0/settings.ini"
if [[ -f "$GTK_CONF" ]]; then
  if ! grep -q 'rose-pine-gtk' "$GTK_CONF" 2>/dev/null; then
    echo "  Updating GTK theme to Rose Pine + Tela Circle Black"
    cp "$ISLAND_PATH/config/gtk-3.0/settings.ini" "$GTK_CONF"
  fi
fi

# --- Also set for GTK4 apps ---
mkdir -p "$HOME/.config/gtk-4.0"
if [[ ! -f "$HOME/.config/gtk-4.0/settings.ini" ]]; then
  cp "$ISLAND_PATH/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"
fi

# --- Set icon theme via gsettings if available ---
if command -v gsettings &>/dev/null; then
  gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-black-dark' 2>/dev/null || true
  gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-gtk' 2>/dev/null || true
fi

echo "  Done. Reopen Thunar to see the new theme."
