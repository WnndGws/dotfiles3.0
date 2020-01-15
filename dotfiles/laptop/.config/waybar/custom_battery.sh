#!/bin/sh

STATE=`acpi | awk -F '0: ' '{print $2}' | cut -d',' -f1`
PERCENT=`acpi | awk -F ', ' '{print $2}' | cut -d'%' -f1`
TIME=`acpi | awk -F ', ' '{print $3}' | cut -d':' -f1-2`
if [ -z "$TIME" ]; then
    TIME=$STATE
fi

if [ $PERCENT -le 30 ] && [ $STATE != 'Charging' ]; then
    STATE='Low'
fi

echo -e "{\"text\":\"$TIME\", \"percentage\":$PERCENT, \"class\":\"$STATE\"}"
