#!/bin/bash
BAT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)
DYING="/tmp/battery_dying"
CHARGING="/tmp/battery_charging"
SOUND_DIR="/usr/share/sounds/freedesktop/stereo"
ICON_DIR="/usr/share/icons/Adwaita/symbolic/status/"

if [ "$STATUS" = "Charging" ]; then
  if [ ! -f "$CHARGING" ]; then
    touch "$CHARGING"
    paplay "$SOUND_DIR/power-plug.oga"
  fi
  echo "  $BAT%"
elif [ $BAT -gt 80 ]; then
  echo "  $BAT%"
elif [ $BAT -gt 50 ]; then
  echo "  $BAT%"
elif [ $BAT -gt 25 ]; then
  echo "  $BAT%"
elif [ $BAT -gt 10 ]; then
  echo "  $BAT%"
else
  # Not charging and dying.
  if [ ! -f "$DYING" ]; then
    touch "$DYING"
    dunstify -i "$ICON_DIR/battery-level-0-symbolic.svg" \
      -u critical -t 10000 "Battery low!"
    paplay "$HOME/.local/share/sounds/notification.wav"

  fi
  echo "  $BAT%"
fi

# Not dying anymore
if [ -f "$DYING" ] && [ "$BAT" -gt 10 ]; then
  rm "$DYING"
fi

# Not charging.
if [ -f "$CHARGING" ] && [ ! "$STATUS" = "Charging" ]; then
  rm "$CHARGING"
  rm "$DYING"
  paplay "$SOUND_DIR/power-unplug.oga" &
fi
