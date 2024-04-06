#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets"

road="$PWD/track/road"

paw="$PWD/track/paw"

matrix="$PWD/track/matrix"

cannes="$PWD/track/cannes"

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

#--------------------------------------------------------------------------------------------------
# road
#--------------------------------------------------------------------------------------------------

if [ $1 = "road" ]; then

    path="$assets/track/road/deploy"
    mkdir -p "$path"

    cp "$road"/deploy/*.mp4 "$path"

    path="$assets/track/road/dist"
    mkdir -p "$path"

    cp "$road"/dist/*.kra "$path"
    cp "$road"/dist/*.png "$path"

    path="$assets/track/road/dist/content"
    mkdir -p "$path"

    cp "$road"/dist/content/*.png "$path"
    cp "$road"/dist/content/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# paw
#--------------------------------------------------------------------------------------------------

if [ $1 = "paw" ]; then

    path="$assets/track/paw/deploy"
    mkdir -p "$path"

    cp "$paw"/deploy/*.mp4 "$path"

    path="$assets/track/paw/dist"
    mkdir -p "$path"

    cp "$paw"/dist/*.kra "$path"
    cp "$paw"/dist/*.png "$path"

    path="$assets/track/paw/dist/content"
    mkdir -p "$path"

    cp "$paw"/dist/content/*.png "$path"
    cp "$paw"/dist/content/*.mp4 "$path"

    path="$assets/track/paw/dist/upscale"
    mkdir -p "$path"

    cp "$paw"/dist/upscale/*.jpeg "$path"

    path="$assets/track/paw/dist/upscale/base"
    mkdir -p "$path"

    cp "$paw"/dist/upscale/base/*.png "$path"
fi

#--------------------------------------------------------------------------------------------------
# matrix
#--------------------------------------------------------------------------------------------------

if [ $1 = "matrix" ]; then

    path="$assets/track/matrix/deploy"
    mkdir -p "$path"

    cp "$matrix"/deploy/*.mp4 "$path"

    path="$assets/track/matrix/dist"
    mkdir -p "$path"

    cp "$matrix"/dist/*.kra "$path"
    cp "$matrix"/dist/*.png "$path"

    path="$assets/track/matrix/dist/content"
    mkdir -p "$path"

    cp "$matrix"/dist/content/*.png "$path"
    cp "$matrix"/dist/content/*.mp4 "$path"

    path="$assets/track/matrix/dist/upscale"
    mkdir -p "$path"

    cp "$matrix"/dist/upscale/*.jpeg "$path"

    path="$assets/track/matrix/dist/upscale/base"
    mkdir -p "$path"

    cp "$matrix"/dist/upscale/base/*.png "$path"
fi

#--------------------------------------------------------------------------------------------------
# cannes
#--------------------------------------------------------------------------------------------------

if [ $1 = "cannes" ]; then

    path="$assets/track/cannes/deploy"
    mkdir -p "$path"

    cp "$cannes"/deploy/*.mp4 "$path"

    path="$assets/track/cannes/dist"
    mkdir -p "$path"

    cp "$cannes"/dist/*.kra "$path"
    cp "$cannes"/dist/*.png "$path"

    path="$assets/track/cannes/dist/content"
    mkdir -p "$path"

    cp "$cannes"/dist/content/*.png "$path"
    cp "$cannes"/dist/content/*.mp4 "$path"

    path="$assets/track/cannes/dist/upscale"
    mkdir -p "$path"

    cp "$cannes"/dist/upscale/*.jpeg "$path"

    path="$assets/track/cannes/dist/upscale/base"
    mkdir -p "$path"

    cp "$cannes"/dist/upscale/base/*.png "$path"

    path="$assets/track/cannes/dist/voice/base"
    mkdir -p "$path"

    cp "$cannes"/dist/voice/base/*.webm "$path"
fi
