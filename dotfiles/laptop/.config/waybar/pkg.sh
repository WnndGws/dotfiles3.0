#!/bin/sh

case "$1" in
    --checking)
        pac=$(checkupdates 2> /dev/null | wc -l | tail -n 1)
        aur=$(pikaur -Qqu 2> /dev/null | wc -l )
        check=$(( pac + aur ))
        ;;
    --reset)
        check="0"
        ;;
    --test)
        pac="1"
        aur="1"
        check=$((pac + aur))
        ;;
    --exec-check)
        pac=$(checkupdates 2> /dev/null | wc -l | tail -n 1)
        aur=$(pikaur -Qqu 2> /dev/null | wc -l )
        check=$(( pac + aur ))
        if [ "$check" != "0" ]; then
            exit 0
        else
            exit 1
        fi
        ;;
esac

echo "$pac  $aur"
