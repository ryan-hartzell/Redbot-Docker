#!/bin/bash

set -e

if [ -z "${INSTANCE_NAME:-}" ]
then
    echo "set redbot instance name to environment variable INSTANCE_NAME"
    exit 1
fi

if [ "$#" = 1 ] && [ "$1" = "setup" ]
then
    echo -e "$INSTANCE_NAME\n\nY\n1\n" | redbot-setup
else
    redbot $INSTANCE_NAME
fi
