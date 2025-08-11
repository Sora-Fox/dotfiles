#!/bin/bash
# ~/.config/xorg/status.sh

unknown="n/a"
interval=0.7
date_format="%m/%d %I:%M"

battery_dev=$(ls /sys/class/power_supply 2>/dev/null | grep -E '^BAT' | head -n1)
if [ -n "$battery_dev" ]; then
  battery_path="/sys/class/power_supply/$battery_dev"
else
  battery_path=""
fi

while true; do
    datetime=$(date +"$date_format" || echo "$unknown" )
    ram=$(awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf "%.1f", (t-a)/1048576}' /proc/meminfo 2>/dev/null || echo "$unknown")
    cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "%.0f", 100 - $1}' || echo "$unknown")
    cpu_temp=$(sensors | awk '/^Core/ {sum += $3; count++} END {if (count > 0) printf "%.0f", sum/count; else print "n/a"}' || echo "$unknown")

    source_mute_status=$(pactl get-source-mute @DEFAULT_SOURCE@ 2>/dev/null | awk '{print $2}' || echo "$unknown")
    sink_mute_status=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}' || echo "$unknown")

    bat_status=$(cat "$battery_path"/status 2>/dev/null)
    case "$bat_status" in
        "Charging")  bat_symbol="^" ;;
        "Discharging") bat_symbol=" " ;;
        "Full") bat_symbol="!" ;;
        *) bat_symbol="$unknown" ;;
    esac
    bat_perc=$(cat "$battery_path"/capacity 2>/dev/null || echo "$unknown")

    status="[$datetime]"
    status+=" [RAM ${ram}G]"
    status+=" [CPU ${cpu}%]"
    status+=" [TMP ${cpu_temp}°C]"
    [[ $source_mute_status == no ]] && status+=" [IN]"
    [[ $sink_mute_status == no ]] && status+=" [OUT]"
    status+=" [BAT${bat_symbol}${bat_perc}%]"

    xsetroot -name "$status"
    sleep "$interval"
done

