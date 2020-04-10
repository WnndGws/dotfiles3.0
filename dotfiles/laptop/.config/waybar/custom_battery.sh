#!/bin/sh

STATE=$(cat /sys/class/power_supply/BAT0/status)
PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
TIME=$(acpi | awk -F ', ' '{print $3}' | cut -d':' -f1-2)
[ -z "$TIME" ] && TIME=$STATE

[ $PERCENT -le 30 ] && [ $STATE != 'Charging' ] && STATE='Low'

echo -e "{\"text\":\"$TIME\", \"percentage\":$PERCENT, \"class\":\"$STATE\"}"
