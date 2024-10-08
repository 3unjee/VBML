#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

upscale="$PWD/upscale"

temp="$upscale/temp"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

run()
{
    cp "$1" "$upscale"
}

exists()
{
    ls "$1" 1> /dev/null 2>&1
}

#--------------------------------------------------------------------------------------------------
# Run
#--------------------------------------------------------------------------------------------------

if [ "$1" = "restore" ]; then

    if exists "$temp"/*.mp4; then

        rm -f "$upscale"/*.mp4

        mv "$temp"/*.mp4 "$upscale"
    fi
else
    if exists "$upscale"/*.mp4; then

        mv "$upscale"/*.mp4 "$temp"
    fi

    run "koraidon.mp4"  iris-3
    run "koraidon2.mp4" iris-3
fi
