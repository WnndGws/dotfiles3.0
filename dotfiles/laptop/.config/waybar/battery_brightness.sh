#!/usr/bin/zsh
## Sets the display brightness to match battery level

light -N 10
# Sets minimum brightness to 10%

battery_percentage=$(acpi --battery | rg -o '[0-9]+%' | awk -F '%' '{print $1}')
set_percentage=$(bc <<< $battery_percentage/1.5)
set_percentage=$(printf "%.0f" "$set_percentage/5")
set_percentage=$(bc <<< $set_percentage*5)
# Rounds set_percentage to nearest 5
echo $set_percentage

battery_state=$(acpi --battery | awk '{print $3}')

if [[ $battery_state == "Charging," ]]; then
    light -S 100
else
    if [[  $battery_state == "Full," ]]; then
        light -S 100
    else
        light -S $set_percentage
    fi
fi
