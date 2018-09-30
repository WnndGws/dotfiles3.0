#!/usr/bin/zsh
## Checks my calendar for whatever the next even in it is

time_now=$(date +%T)
tomorrow=$(date --date="tomorrow")

mkdir -p /home/wynand/.cache/polybar
file="/home/wynand/.cache/polybar/agenda.txt"
##TODO: check why $XDG_CACHE_HOME doesnt work. Suspect polybar run as root

gcalcli agenda $time_now 23:59 > $file

# Test if file is younger than an hour old
if [ $(stat --format=%Y $file) -le $(( $(date +%s) - 3600 )) ]; then 
    gcalcli agenda $time_now 23:59 > $file
fi

# Test if have enough events
if [[ $(cat $file | wc -l) -le 3 ]]; then
    gcalcli agenda $time_now $tomorrow > $file
fi

time_of_next_event=$(cat $file | awk '{if ($3 ~ /:/) print substr($0, index($0,$3))}' | head -n 1 | awk '{print $1}')

## Correct morning events to be for tomorrow rather than today
if [[ $(date -d $time_now "+%P") == "pm" && $(echo $time_of_next_event | tail -c 3) == "am" ]]; then
    time_of_next_event_adjusted=$(bc <<< ($(date -d $time_of_next_event "+%s") + 86400))
else
    time_of_next_event_adjusted=$(bc <<< ($(date -d $time_of_next_event "+%s") + 3600))
    ## important to keep this 3600 the same as the 3600 on line 12
fi

while [[ $(date -d $time_now "+%s") -gt $time_of_next_event_adjusted ]]; do
    echo "$(tail -n +2 $file)" > $file
    time_of_next_event=$(cat $file | awk '{if ($3 ~ /:/) print substr($0, index($0,$3))}' | head -n 1 | awk '{print $1}')
done
## Checks the string time of the next event
#TODO: add check if next event is today or tomorrow

next_event=$(cat $file | head -n 10 | awk '{if ($3 == "'$time_of_next_event'") print substr($0, index($0,$4))}' | tr '\n' '; ')
## Checks how many events match that string time in the next 5 events
#TODO make this more robust than only next 5

echo $time_of_next_event ${next_event%?}
## Print next event except last character to remove trailing ";"
