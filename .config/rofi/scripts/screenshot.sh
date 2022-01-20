#!/usr/bin/env bash

rofi_command="rofi -theme themes/screenshotsmenu.rasi"

# Options
screen=""
area=""
timer=""

# Variable passed to rofi
options="$screen\n$area\n$timer"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        ~/.local/bin/shot-now delay
        ;;
    $area)
        ~/.local/bin/shot-seldraw
        ;;
    $timer)
        ~/.local/bin/shot-timer
        ;;
esac
