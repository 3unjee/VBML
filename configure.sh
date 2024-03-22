#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets"

road="$assets/track/road"

paw="$assets/track/paw"

matrix="$assets/track/matrix"

paw_extra="$assets/extra/track/paw"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "all"  -a \
                    $1 != "road" -a \
                    $1 != "paw" -a \
                    $1 != "matrix" ]; then

    echo "Usage: configure <all>"
    echo "                 <road>"
    echo "                 <paw>"
    echo "                 <matrix>"

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

    exit 0
fi

#--------------------------------------------------------------------------------------------------
# road
#--------------------------------------------------------------------------------------------------

if [ $1 = "road" ]; then

    path="$PWD/track/road/deploy"

    cp "$road"/deploy/*.mp4 "$path"

    path="$PWD/track/road/dist"

    cp "$road"/dist/*.kra "$path"
    cp "$road"/dist/*.png "$path"

    path="$PWD/track/road/dist/content"

    cp "$road"/dist/content/*.png "$path"
    cp "$road"/dist/content/*.mp4 "$path"
fi

#--------------------------------------------------------------------------------------------------
# paw
#--------------------------------------------------------------------------------------------------

if [ $1 = "paw" ]; then

    path="$PWD/track/paw/deploy"

    cp "$paw"/deploy/*.mp4 "$path"

    path="$PWD/track/paw/dist"

    cp "$paw"/dist/*.kra "$path"
    cp "$paw"/dist/*.png "$path"

    path="$PWD/track/paw/dist/content"

    cp "$paw"/dist/content/*.png "$path"
    cp "$paw"/dist/content/*.mp4 "$path"

    path="$PWD/track/paw/dist/upscale"

    cp "$paw"/dist/upscale/*.jpeg "$path"

    path="$PWD/track/paw/dist/upscale/base"

    cp "$paw"/dist/upscale/base/*.png "$path"

    path="$PWD/track/paw/dist/content/extra"

    cp "$paw_extra"/video/*.mp4  "$path"
    cp "$paw_extra"/audio/*.webm "$path"
fi

#--------------------------------------------------------------------------------------------------
# matrix
#--------------------------------------------------------------------------------------------------

if [ $1 = "matrix" ]; then

    path="$PWD/track/matrix/deploy"

    cp "$matrix"/deploy/*.mp4 "$path"

    path="$PWD/track/matrix/dist"

    cp "$matrix"/dist/*.kra "$path"
    cp "$matrix"/dist/*.png "$path"

    path="$PWD/track/matrix/dist/content"

    cp "$matrix"/dist/content/*.png "$path"
    cp "$matrix"/dist/content/*.mp4 "$path"

    path="$PWD/track/matrix/dist/upscale"

    cp "$matrix"/dist/upscale/*.jpeg "$path"

    path="$PWD/track/matrix/dist/upscale/base"

    cp "$matrix"/dist/upscale/base/*.png "$path"

    path="$PWD/track/matrix/dist/content/extra"

    cp "$matrix_extra"/video/*.mp4 "$path"
fi
