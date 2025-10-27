#!/usr/bin/env bash
set -euo pipefail

TARGET="/etc/sysctl.d/my-tunings.conf"

if [ ! -f "$TARGET" ]; then
    echo "✗ $TARGET not found. Run ./init.sh first."
    exit 1
fi

sudo sysctl --system
echo "✓ Tunings applied from $TARGET"
