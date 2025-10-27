#!/usr/bin/env bash
set -euo pipefail

TARGET="/etc/sysctl.d/my-tunings.conf"
DISABLE="/etc/sysctl.d/my-tunings.conf.disabled"

if [ -f "$TARGET" ]; then
    sudo mv "$TARGET" "$DISABLE"
    sudo sysctl --system
    echo "✓ Tunings disabled and reloaded."
else
    echo "✗ Tunings already disabled or never installed."
fi
