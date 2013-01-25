#!/bin/bash
#http://huoding.com/2012/11/08/198 swapµÄ×ïÓë·£
cd /proc

for pid in [0-9]*; do
    command=$(cat /proc/$pid/cmdline)

    swap=$(
        awk '
            BEGIN  { total = 0 }
            /Swap/ { total += $2 }
            END    { print total }
        ' /proc/$pid/smaps
    )

    if (( $swap > 0 )); then
        if [[ "${head}" != "yes" ]]; then
            echo -e "PID\tSWAP\tCOMMAND"
            head="yes"
        fi

        echo -e "${pid}\t${swap}\t${command}"
    fi
done
