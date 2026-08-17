#!/bin/bash
# install/helpers/setup-wordlists.sh
# Sets up standard penetration testing wordlists (SecLists, RockYou).

set -euo pipefail

WORDLIST_DIR="/usr/share/wordlists"

echo "Configuring penetration testing wordlists directory ($WORDLIST_DIR)..."

if [[ ! -d "$WORDLIST_DIR" ]]; then
  if [[ $EUID -eq 0 ]]; then
    mkdir -p "$WORDLIST_DIR"
  else
    sudo mkdir -p "$WORDLIST_DIR"
  fi
fi

# Decompress rockyou.txt if found compressed
for gz_path in "$WORDLIST_DIR/rockyou.txt.gz" "/usr/share/dict/rockyou.txt.gz" "$WORDLIST_DIR/passwords/rockyou.txt.gz"; do
  if [[ -f "$gz_path" ]]; then
    target_dir="$(dirname "$gz_path")"
    if [[ ! -f "$target_dir/rockyou.txt" ]]; then
      echo "Extracting rockyou.txt from $gz_path..."
      if [[ $EUID -eq 0 ]]; then
        gzip -dc "$gz_path" > "$target_dir/rockyou.txt"
      else
        sudo gzip -dc "$gz_path" | sudo tee "$target_dir/rockyou.txt" >/dev/null
      fi
    fi
  fi
done

# Check if SecLists is installed or needs cloning
SECLISTS_DIR="$WORDLIST_DIR/seclists"
if [[ ! -d "$SECLISTS_DIR" && ! -d "$WORDLIST_DIR/SecLists" ]]; then
  echo "SecLists not found locally. Would you like to clone SecLists? (shallow clone)"
  echo "Cloning SecLists into $SECLISTS_DIR..."
  if [[ $EUID -eq 0 ]]; then
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git "$SECLISTS_DIR" 2>/dev/null || true
  else
    sudo git clone --depth 1 https://github.com/danielmiessler/SecLists.git "$SECLISTS_DIR" 2>/dev/null || true
  fi
fi

echo "Wordlist setup completed."
