#!/bin/bash

BATTERY="battery_BAT0"
CACHE="/tmp/low_battery_level"
LEVELS=(20 15 10 5)

INFO=$(upower -i /org/freedesktop/UPower/devices/$BATTERY)
PERCENT=$(echo "$INFO" | awk '/percentage/ {gsub(/%/, "", $2); print int($2)}')
STATE=$(echo "$INFO" | awk '/state/ {print $2}')

# Reset cache when charging
if [ "$STATE" != "discharging" ]; then
    rm -f "$CACHE"
    exit 0
fi

LAST_PERCENT=100
[ -f "$CACHE" ] && LAST_PERCENT=$(cat "$CACHE")

for LEVEL in "${LEVELS[@]}"; do
    if [ "$PERCENT" -le "$LEVEL" ] && [ "$LAST_PERCENT" -gt "$LEVEL" ]; then
        if [ "$LEVEL" -le 10 ]; then
            URGENCY="critical"
            ICON="battery-caution"
            TITLE="⚠ Critical Battery"
        else
            URGENCY="normal"
            ICON="battery-low"
            TITLE="🔋 Low Battery"
        fi

        notify-send -u "$URGENCY" -i "$ICON" \
            "$TITLE" \
            "Battery at ${PERCENT}%"

        # store actual percent, not level
        echo "$PERCENT" > "$CACHE"
        exit 0
    fi
done

