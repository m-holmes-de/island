# Install base packages from the package list
echo "Installing base packages..."
mapfile -t packages < <(grep -v '^#' "$ISLAND_INSTALL/island-base.packages" | grep -v '^$')
island-pkg-add "${packages[@]}"
