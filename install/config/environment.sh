# Set Wayland environment variables via systemd environment.d
echo "Setting up Wayland environment..."

mkdir -p ~/.config/environment.d

cat > ~/.config/environment.d/island-wayland.conf << EOF
ISLAND_PATH=$HOME/.local/share/island
PATH=$HOME/.local/share/island/bin:\$PATH
QT_QPA_PLATFORM=wayland
QT_WAYLAND_DISABLE_WINDOWDECORATION=1
GDK_BACKEND=wayland,x11
SDL_VIDEODRIVER=wayland
CLUTTER_BACKEND=wayland
XDG_CURRENT_DESKTOP=Hyprland
XDG_SESSION_TYPE=wayland
XDG_SESSION_DESKTOP=Hyprland
EOF
