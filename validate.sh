#!/usr/bin/env bash
set -euo pipefail

TMP="/tmp/sysctl-validate-$$.conf"
cp "$1" "$TMP"
if sudo sysctl -p "$TMP" >/dev/null 2>&1; then
    echo "✓ Valid syntax!"
else
    echo "✗ Invalid sysctl settings detected"
    rm -f "$TMP"
    exit 1
fi
rm -f "$TMP"
