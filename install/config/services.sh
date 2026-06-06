# Enable essential systemd services
echo "Enabling systemd services..."

# System services
sudo systemctl enable --now NetworkManager 2>/dev/null || true
sudo systemctl enable --now bluetooth 2>/dev/null || true

# PipeWire user services
systemctl --user enable --now pipewire pipewire-pulse wireplumber 2>/dev/null || true
