#!/usr/bin/env bash
WP_PATH="$1"

if [ -n "$WP_PATH" ] && [ -f "$WP_PATH" ]; then
    # Run sync_sddm.py to generate synced color scheme for the new wallpaper
    python3 ~/.local/share/serpantinum/src/scripts/sync_sddm.py 2>/dev/null || true
    
    if pkexec bash -c "cp -f \"$WP_PATH\" /usr/share/sddm/themes/material-you/bg.png && cp -f /tmp/Main.qml.synced /usr/share/sddm/themes/material-you/Main.qml" 2>/dev/null || sudo bash -c "cp -f \"$WP_PATH\" /usr/share/sddm/themes/material-you/bg.png && cp -f /tmp/Main.qml.synced /usr/share/sddm/themes/material-you/Main.qml" 2>/dev/null; then
        notify-send -a "Serpantinum" -i "preferences-desktop-wallpaper" "SDDM Wallpaper & Theme" "Successfully updated SDDM wallpaper AND color scheme!" 2>/dev/null || true
    else
        notify-send -a "Serpantinum" -i "dialog-error" "SDDM Update Error" "Authentication required to update SDDM wallpaper & theme." 2>/dev/null || true
    fi
fi
