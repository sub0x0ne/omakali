#!/bin/bash
# install/helpers/setup-metasploit.sh
# Initializes PostgreSQL and Metasploit database (msfdb).

set -euo pipefail

if ! command -v msfconsole >/dev/null 2>&1; then
  echo "Metasploit Framework is not installed. Skipping msfdb initialization."
  exit 0
fi

echo "Configuring PostgreSQL and Metasploit database..."

# Ensure postgresql service is enabled and started
if command -v systemctl >/dev/null 2>&1; then
  if [[ $EUID -eq 0 ]]; then
    systemctl enable --now postgresql 2>/dev/null || true
  else
    sudo systemctl enable --now postgresql 2>/dev/null || true
  fi
fi

# Run msfdb init if msfdb is available
if command -v msfdb >/dev/null 2>&1; then
  echo "Initializing Metasploit database via msfdb init..."
  msfdb init || true
fi

echo "Metasploit setup completed."
