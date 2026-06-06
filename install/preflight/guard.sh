# Ensure we're on CachyOS or Arch
if [[ ! -f /etc/os-release ]] || ! grep -qE 'ID=(cachyos|arch)' /etc/os-release; then
  echo "Error: Island requires CachyOS or Arch Linux." >&2
  exit 1
fi

# Ensure not running as root
if [[ $EUID -eq 0 ]]; then
  echo "Error: Do not run install.sh as root. It will prompt for sudo when needed." >&2
  exit 1
fi

echo "Preflight checks passed."
