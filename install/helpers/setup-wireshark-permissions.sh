#!/bin/bash
# install/helpers/setup-wireshark-permissions.sh
# Grants packet capture permissions to non-root users via the wireshark group and Linux capabilities.

set -euo pipefail

echo "Configuring non-root packet capture permissions for Wireshark/dumpcap..."

TARGET_USER="${SUDO_USER:-$USER}"

# Ensure wireshark group exists
if ! getent group wireshark >/dev/null 2>&1; then
  echo "Creating wireshark group..."
  if [[ $EUID -eq 0 ]]; then
    groupadd -r wireshark || true
  else
    sudo groupadd -r wireshark || true
  fi
fi

# Add user to wireshark group
if [[ -n "$TARGET_USER" ]]; then
  echo "Adding $TARGET_USER to wireshark group..."
  if [[ $EUID -eq 0 ]]; then
    usermod -aG wireshark "$TARGET_USER" || true
  else
    sudo usermod -aG wireshark "$TARGET_USER" || true
  fi
fi

# Set group ownership and capabilities on dumpcap if present
if command -v dumpcap >/dev/null 2>&1; then
  DUMPCAP_BIN=$(command -v dumpcap)
  echo "Setting permissions and capabilities on $DUMPCAP_BIN..."
  if [[ $EUID -eq 0 ]]; then
    chgrp wireshark "$DUMPCAP_BIN" || true
    chmod 750 "$DUMPCAP_BIN" || true
    setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' "$DUMPCAP_BIN" || true
  else
    sudo chgrp wireshark "$DUMPCAP_BIN" || true
    sudo chmod 750 "$DUMPCAP_BIN" || true
    sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' "$DUMPCAP_BIN" || true
  fi
fi

echo "Wireshark packet capture permissions configured."
