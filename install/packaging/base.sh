# Install base packages from the package list
echo "Installing base packages..."
mapfile -t packages < <(grep -v '^#' "$ISLAND_INSTALL/island-base.packages" | grep -v '^$')
island-pkg-add "${packages[@]}"

# Install AUR packages
echo "Installing AUR packages..."
mapfile -t aur_packages < <(grep -v '^#' "$ISLAND_INSTALL/island-aur.packages" | grep -v '^$')
if (( ${#aur_packages[@]} > 0 )); then
  island-pkg-aur-add "${aur_packages[@]}"
fi
