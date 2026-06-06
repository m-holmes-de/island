# Set environment variables via systemd environment.d
# Note: Wayland/Hyprland env vars are set in config/hypr/envs.lua via hl.env()
# This file is for non-Hyprland session vars only
echo "Setting up environment..."

mkdir -p ~/.config/environment.d

cat > ~/.config/environment.d/island-wayland.conf << EOF
ISLAND_PATH=$HOME/.local/share/island
EOF
