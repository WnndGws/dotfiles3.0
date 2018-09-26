#!/bin/sh

ac_text=$(acpi --battery | awk '{print $3}')
if [[ "$ac_text" = "Discharging," ]]; then
    ac=0
else
    ac=1
fi

battery_percent=$(ibam --all | rg 'Bios percentage' | awk '{print $3}')
discharge_time_left=$(ibam --all | rg 'Adapted battery' | awk '{print $5}' | rev | cut -d':' -f2-3 | rev)
charge_time_left=$(ibam --all | rg 'Adapted charge' | awk '{print $5}' | rev | cut -d':' -f2-3 | rev)
if [[ $charge_time_left == 0:00 ]]; then
    charge_time_left="Full"
fi

if [ "$ac" -eq 1 ]; then
    icon=""
    echo "%{u#4E9A06 +u}$icon $battery_percent% ($charge_time_left)"
else
    if [ "$battery_percent" -gt 85 ]; then
        icon=""
    elif [ "$battery_percent" -gt 60 ]; then
        icon=""
    elif [ "$battery_percent" -gt 35 ]; then
        icon=""
    elif [ "$battery_percent" -gt 10 ]; then
        icon=""
    else
        icon=""
    fi

    echo "%{u#FFB52A +u}$icon $battery_percent% ($discharge_time_left)"
fi

