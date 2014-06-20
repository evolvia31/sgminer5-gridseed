#!/bin/sh

set -e

./bootstrap.sh
if test -z "$NOCONFIGURE"; then
    exec ./configure --enable-udev "$@"
fi
