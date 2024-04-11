#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "road"   -a \
                    $1 != "paw"    -a \
                    $1 != "matrix" -a \
                    $1 != "cannes" ]; then

    echo "Usage: push <road>"
    echo "            <paw>"
    echo "            <matrix>"
    echo "            <cannes>"

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

    cp "$source"/*.kra "$path"
    cp "$source"/*.png "$path"
fi

source="$PWD/track/$1/dist/content"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/content"
    mkdir -p "$path"

    cp "$source"/*.png "$path"
    cp "$source"/*.mp4 "$path"
fi

source="$PWD/track/$1/dist/content/extra"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/content/extra"
    mkdir -p "$path"

    cp "$source"/*.mp4  "$path"
    cp "$source"/*.webm "$path"
fi

source="$PWD/track/$1/dist/upscale"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/upscale"
    mkdir -p "$path"

    cp "$source"/*.jpeg "$path"
fi

source="$PWD/track/$1/dist/upscale/base"

if [ -d "$source" ]; then

    echo "$source"

    path="$assets/track/$1/dist/upscale/base"
    mkdir -p "$path"

    cp "$source"/*.png "$path"
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
