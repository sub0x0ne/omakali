#!/bin/bash
# install/helpers/setup-blackarch.sh
# Integrates the BlackArch Linux penetration testing repository.

set -euo pipefail

if grep -q "^\[blackarch\]" /etc/pacman.conf 2>/dev/null; then
  echo "BlackArch repository is already configured in /etc/pacman.conf."
  exit 0
fi

echo "Setting up BlackArch Linux repository..."

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

STRAP_URL="https://blackarch.org/strap.sh"

echo "Fetching BlackArch strap script from $STRAP_URL..."
if ! curl -fsSL "$STRAP_URL" -o "$TMPDIR/strap.sh"; then
  echo "Error: Failed to download BlackArch strap script." >&2
  exit 1
fi

chmod +x "$TMPDIR/strap.sh"

echo "Executing BlackArch bootstrap script (requires root privileges)..."
if [[ $EUID -eq 0 ]]; then
  "$TMPDIR/strap.sh"
else
  sudo "$TMPDIR/strap.sh"
fi

echo "Updating pacman package databases..."
if [[ $EUID -eq 0 ]]; then
  pacman -Sy
else
  sudo pacman -Sy
fi

echo "BlackArch repository successfully configured! (2,800+ security tools available via pacman)"
