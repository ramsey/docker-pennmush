#!/bin/bash
set -e

source /usr/bin/common.sh

function ctrl_c() {
    local signal="$1"
    local alive="1"
    local pid=""

    source /usr/bin/shutdown.sh

    exit $?
}

function ctrl_z() {
    local signal="$1"
    local alive="1"
    local pid=""

    source /usr/bin/reboot.sh

    if [ "$?" -ne 0 ]; then
        exit $?
    fi
}

function trap_with_arg() {
    local func="$1" ; shift
    for sig ; do
        trap "$func $sig" "$sig"
    done
}

trap_with_arg ctrl_c INT TERM
trap_with_arg ctrl_z TSTP

if [ -z "$1" ]; then
    if [ ! -d "$gamedir" ]; then
        echo -e "${RED}You must mount a volume at /mush/game.\n"
        echo "If this is your first time starting the Docker container, create an"
        echo -e "empty directory and mount with an option like this:\n"
        echo -e "    -v \"/path/to/host/game/files:/mush/game\"\n${NC}"
        exit 1
    fi

    if [ ! -f "$gamedir/mush.cnf" ]; then
        cp -a /mush/game.original/. $gamedir/
        sed -i "/^error_log/c\#error_log log\/netmush\.log" $gamedir/mush.cnf
    fi

    $gamedir/restart
    sleep $SLEEP

    echo
    echo -e "${GREEN}Your MUSH is running!${NC}"
    echo
    echo -e "${BLUE}While this is running, you may use Ctrl+z to send a @shutdown/reboot"
    echo -e "command to the MUSH, or you may use Ctrl+c to send a @shutdown command.${NC}"
    echo

    # Infinite loop so that Docker continues to run.
    while true; do sleep $SLEEP; done
else
    exec "$1"
fi
