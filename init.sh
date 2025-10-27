#!/usr/bin/env bash
set -euo pipefail

TARGET="/etc/sysctl.d/my-tunings.conf"
SRC="${1:-my-tunings.conf.template}"

sudo cp "$SRC" "$TARGET"
sudo chmod 644 "$TARGET"
echo "✓ Installed $SRC → $TARGET"
echo "Run ./apply.sh to activate immediately."
