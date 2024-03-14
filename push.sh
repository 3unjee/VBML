#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets"

road="$PWD/track/road"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "road" ]; then

    echo "Usage: push <road>"

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
