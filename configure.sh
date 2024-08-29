#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "all"    -a \
                    $1 != "road"   -a \
                    $1 != "paw"    -a \
                    $1 != "matrix" -a \
                    $1 != "cannes" ]; then

    echo "Usage: configure <all>"
    echo "                 <road>"
    echo "                 <paw>"
    echo "                 <matrix>"
    echo "                 <cannes>"

    exit 1
fi

read -p "Run configure for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

#--------------------------------------------------------------------------------------------------
# All
#--------------------------------------------------------------------------------------------------

if [ $1 = "all" ]; then

    sh configure.sh road
    sh configure.sh paw
    sh configure.sh matrix
    sh configure.sh cannes

    exit 0
fi

source="$assets/track/$1/deploy"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/deploy"

    cp "$source"/*.mp4 "$path"
fi

source="$assets/track/$1/dist"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist"

    cp "$source"/*.kra "$path"
    cp "$source"/*.png "$path"
fi

source="$assets/track/$1/dist/content"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist/content"

    cp "$source"/*.png "$path"
    cp "$source"/*.mp4 "$path"
fi

source="$assets/track/$1/dist/upscale"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist/upscale"

    if exists "$source"/*.jpeg; then

        cp "$source"/*.jpeg "$path"
    fi

    if exists "$source"/*.mp4; then

        cp "$source"/*.mp4 "$path"
    fi
fi

source="$assets/track/$1/dist/upscale/base"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist/upscale/base"

    cp "$source"/*.png "$path"
fi

source="$assets/track/$1/dist/voice"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist/voice"

    cp "$source"/*.mp3 "$path"
fi

source="$assets/track/$1/dist/voice/base"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist/voice/base"

    cp "$source"/*.webm "$path"
fi

source="$assets/extra/track/$1/video"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist/content/extra"

    cp "$source"/*.mp4 "$path"
fi

source="$assets/extra/track/$1/audio"

if [ -d "$source" ]; then

    echo "$source"

    path="$PWD/track/$1/dist/content/extra"

    cp "$source"/*.webm "$path"
fi
