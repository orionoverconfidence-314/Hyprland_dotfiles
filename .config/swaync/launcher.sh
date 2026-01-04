#!/bin/bash

# Kill existing SwayNC gracefully
killall -9 swaync

# Wait a tiny bit for process to exit
sleep 0.2

# Start SwayNC in background
swaync &

sleep 2

# Optional: refresh / sync client
swaync-client -t -sw
