#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets"

#--------------------------------------------------------------------------------------------------
# Functions
#--------------------------------------------------------------------------------------------------

exists()
{
    ls "$1" 1> /dev/null 2>&1
}

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "road"   -a \
                    $1 != "paw"    -a \
                    $1 != "matrix" -a \
                    $1 != "cannes" -a \
                    $1 != "pokemon" ]; then

    echo "Usage: push <road>"
    echo "            <paw>"
    echo "            <matrix>"
    echo "            <cannes>"
    echo "            <pokemon>"

    exit 1
fi

read -p "Run push for $1 ? (yes/no) " REPLY

if [ "$REPLY" != "yes" ]; then exit 1; fi

source="$PWD/track/$1/deploy"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/deploy"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"
fi

source="$PWD/track/$1/dist"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist"
    mkdir -p "$path"

    if exists "$source"/*.kra; then

        cp "$source"/*.kra "$path"
    fi

    if exists "$source"/*.png; then

        cp "$source"/*.png "$path"
    fi

    if exists "$source"/*.jpg; then

        cp "$source"/*.jpg "$path"
    fi
fi

source="$PWD/track/$1/dist/content"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/content"
    mkdir -p "$path"

    if exists "$source"/*.png; then

        cp "$source"/*.png "$path"
    fi

    if exists "$source"/*.mp4; then

        cp "$source"/*.mp4 "$path"
    fi
fi

source="$PWD/track/$1/dist/content/upscale"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/content/upscale"
    mkdir -p "$path"

    if exists "$source"/*.mp4; then

        cp "$source"/*.mp4 "$path"
    fi
fi

source="$PWD/track/$1/dist/upscale"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/upscale"
    mkdir -p "$path"

    if exists "$source"/*.jpeg; then

        cp "$source"/*.jpeg "$path"
    fi
fi

source="$PWD/track/$1/dist/upscale/base"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/upscale/base"
    mkdir -p "$path"

    if exists "$source"/*.png; then

        cp "$source"/*.png "$path"
    fi
fi

source="$PWD/track/$1/dist/voice"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/voice"
    mkdir -p "$path"

    cp "$source"/*.mp3 "$path"
fi

source="$PWD/track/$1/dist/voice/base"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/voice/base"
    mkdir -p "$path"

    cp "$source"/*.webm "$path"
fi

source="$PWD/track/$1/dist/content/extra/video"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/extra/track/$1"
    mkdir -p "$path"

    cp "$source"/*.mp4 "$path"
fi

source="$PWD/track/$1/dist/content/extra/audio"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/extra/track/$1"
    mkdir -p "$path"

    cp "$source"/*.webm "$path"
fi
