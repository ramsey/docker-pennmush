#!/bin/bash

gamedir=$GAME_DIR

SLEEP=3
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

function is_running() {
    local __alivevar=$1
    local __pidvar=$2
    local __aliveresult="1"
    local __pidresult=""

    if [ -f "$gamedir/netmush.pid" ]; then
        __pidresult=`cat $gamedir/netmush.pid`
        __aliveresult=`kill -0 $__pidresult 2>/dev/null ; echo $?`
    fi

    eval $__alivevar="'$__aliveresult'"
    eval $__pidvar="'$__pidresult'"
}
