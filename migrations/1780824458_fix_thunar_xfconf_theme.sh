echo "Set GTK theme via xfconf (Thunar reads xfconf, not settings.ini)"

# Thunar is an XFCE app — it uses xfconf for settings, not GTK settings.ini
if command -v xfconf-query &>/dev/null; then
  xfconf-query -c xsettings -p /Net/ThemeName -s "rose-pine-moon-gtk" --create -t string 2>/dev/null
  xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-circle-black-dark" --create -t string 2>/dev/null
  xfconf-query -c xsettings -p /Gtk/FontName -s "JetBrainsMono Nerd Font 11" --create -t string 2>/dev/null
  xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Adwaita" --create -t string 2>/dev/null
  echo "  Theme set via xfconf."
else
  echo "  xfconf-query not found, skipping."
fi
