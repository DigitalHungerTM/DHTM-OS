#!/bin/bash
# a script for automatically changing the wallpaper

wallpaperdir="$HOME/Pictures/Wallpapers"

files=($wallpaperdir/*)
randompic=`printf "%s\n" "${files[RANDOM % ${#files[@]}]}"`
gsettings set org.gnome.desktop.background picture-uri "file://$randompic"
