#!/bin/bash
# this is a script that sets the brightness based on the current time

# takes the current time in hours
time=`date | cut -d' ' -f6 | cut -d':' -f1`
#time=4

# some time settings
morning=6
noon=12 # currently not used
evening=21
night=23
midnight=0

# some logic
brightness=1.0
if [[ "$time" -gt "$morning" && "$time" -lt "$evening" ]]; then
	brightness=1.0
elif [[ "$time" -ge "evening" && "$time" -le "night" ]]; then
	brightness=0.3
elif [[ "$time" -ge "midnight" && "$time" -le "morning" ]]; then
	brightness=0.3
fi

# finds the ID of the main display
display=`xrandr --query | grep "connected primary" | cut -d' ' -f1`

# sets the brightness
xrandr --output $display --brightness $brightness
