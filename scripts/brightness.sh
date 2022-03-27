#!/bin/bash
# a script for changing the brightness
# by Mathijs Afman
# 24-02-2022
# requires the rust-notify package to be installed

# This command causes the script to fail if certain
# things happen, otherwise we might get bugs that
# are hard to discover
set -euo pipefail


menu() {
	printf "1. high / 1.0\n"
	printf "2. midhigh / 0.7\n"
	printf "3. mid / 0.5\n"
	printf "4. low / 0.3\n"
	printf "Quit"
}

setBrightness() {
	xrandr --output DP-0 --brightness $1
}

choice=$(menu | dmenu -l 50 -p "Choose Brightness:" | cut -d'.' -f1) || exit

case $choice in
	"1")
		echo "setting brightness to high (1.0)"
		setBrightness 1.0
		;;
	"2")
		echo "setting brightness to midhigh (0.7)"
		setBrightness 0.7
		;;
	"3")
		echo "setting brightness to mid (0.5)"
		setBrightness 0.5
		;;
	"4")
		echo "setting brightness to low (0.3)"
		setBrightness 0.3
		;;
	"Quit")
		echo "cancelled"
		exit
		;;
	*)
		notify 'Brightness' 'Something went wrong and the program was terminated'
		echo "Program terminated" && exit 0
		;;
esac
