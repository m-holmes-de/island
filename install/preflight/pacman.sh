# Refresh package databases and ensure yay is available
echo "Refreshing package databases and upgrading system..."
sudo pacman -Syu --noconfirm

if ! command -v yay &>/dev/null; then
  echo "Installing yay (AUR helper)..."
  sudo pacman -S --noconfirm --needed git base-devel
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
  (cd "$tmpdir/yay-bin" && makepkg -si --noconfirm)
  rm -rf "$tmpdir"
fi
