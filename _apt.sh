#!/bin/zsh

set -euo pipefail

DIR=${0:a:h}
PACKAGES_FILE="$DIR/packages.txt"

if ! command -v apt-get &>/dev/null; then
  echo "apt-get not found; skipping package install." >&2
  exit 0
fi

packages=("${(@f)$(grep -Ev '^#|^[[:space:]]*$' "$PACKAGES_FILE")}")

if [ ${#packages[@]} -eq 0 ]; then
  exit 0
fi

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y "${packages[@]}"

# Debian/Ubuntu ship bat as `batcat` to avoid a name clash.
if command -v batcat &>/dev/null && ! command -v bat &>/dev/null; then
  sudo ln -sf "$(command -v batcat)" /usr/local/bin/bat
fi
