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
    echo -e "${BLUE}Restarting MUSH.${NC}"
    echo

    kill -USR1 $pid
    sleep $SLEEP

    echo
    echo -e "${GREEN}MUSH restarted!${NC}"
    echo

    $RETURN 0
fi

echo -e "${RED}Cannot restart MUSH."
echo -e "$gamedir/netmush: Not running.${NC}"

$RETURN 1
