#!/usr/bin/env bash
set -euo pipefail

TARGET="/etc/sysctl.d/my-tunings.conf"

if [ ! -f "$TARGET" ]; then
    echo "✗ No custom tunings installed."
    exit 1
fi

echo "Comparing desired → current kernel values:"
while IFS=' =' read -r key val; do
    case "$key" in
        ""|"#"*) continue ;;
    esac

    live=$(sysctl -n "$key" 2>/dev/null || echo "N/A")
    if [ "$live" != "$val" ]; then
        printf "⚠ %s: live=%s desired=%s\n" "$key" "$live" "$val"
    else
        printf "✓ %s OK (%s)\n" "$key" "$val"
    fi
done < "$TARGET"
