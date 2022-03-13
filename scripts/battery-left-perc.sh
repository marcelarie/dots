#!/usr/bin/env bash
m_acpi=$(acpi);
bat="$( cut -d',' -f 2 <<< "$m_acpi" | tr -d ' ' )";
full_time="$( acpi | cut -d',' -f 3 | sed 's/[aA-zZ]//g' )";
hours_left="$( cut -d':' -f 1 <<< "$full_time" | tr -d ' ' )";
mins_left="$( cut -d':' -f 2 <<< "$full_time" )";

if [[ $hours_left -gt 0 ]]; then
    echo "bat: $bat t: ${hours_left}h"
else
    echo "bat: $bat t: ${mins_left}m"
fi
