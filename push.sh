#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

assets="/c/users/bunjee/OneDrive/assets"

road="$PWD/track/road"

paw="$PWD/track/paw"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 ] || [ $1 != "road" -a \
                    $1 != "paw" ]; then

    echo "Usage: push <road>"
    echo "            <paw>"

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
fi
