#!/usr/bin/zsh
## Checks my calendar for whatever the next even in it is

time_now=$(date +%T)

time_of_next_event=$(gcalcli agenda $time_now | awk '{if ($3 ~ /:/) print substr($0, index($0,$3))}' | head -n 1 | awk '{print $1}')
## Checks the string time of the next event
#TODO: add check if next event is today or tomorrow

next_event=$(gcalcli agenda $time_now | head -n 10 | awk '{if ($3 == "'$time_of_next_event'") print substr($0, index($0,$4))}' | tr '\n' '; ')
## Checks how many events match that string time in the next 5 events
#TODO make this more robust than only next 5

echo $time_of_next_event ${next_event%?}
## Print next event except last character to remove trailing ';'
