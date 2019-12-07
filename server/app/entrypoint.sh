#!/usr/bin/env bash

echo Waiting for inputs "$@"

for f in $(dirname $0)/commands/*.sh; do source $f; done

function process
{
    local line="$@"
    local cmd

    set -- $line

    cmd="cmd_$1"

    echo received message: "$line"
    echo cmd is "$cmd"

    if [[ $(LC_ALL=C type -t $cmd) = 'function' ]]; then
        echo running $cmd
        $cmd "${@:2}"
    else
        echo unknown message
    fi
}

pipe=/input

trap "rm -f $pipe" EXIT

if [[ ! -p $pipe ]]; then
    mkfifo $pipe
fi

while true
do
    if read line <$pipe; then
        process "${line}"
    fi
done

echo "Reader exiting"