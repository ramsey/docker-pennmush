#!/bin/bash
set -e

if [[ "$0" != "$BASH_SOURCE" ]] ; then
    RETURN=return
else
    RETURN=exit
fi

source /usr/bin/common.sh

is_running alive pid

echo
echo

if [ "$alive" -eq 0 ]; then
    echo -e "${BLUE}Shutting down.${NC}"
    echo

    kill -INT $pid

    while [ -f "$gamedir/netmush.pid" ]; do
        sleep $SLEEP
    done

    echo
    echo -e "${GREEN}$gamedir/netmush: Shutdown.${NC}"
    echo

    $RETURN 0
fi

echo -e "${RED}Cannot shutdown MUSH."
echo -e "$gamedir/netmush: Not running.${NC}"

$RETURN 1
