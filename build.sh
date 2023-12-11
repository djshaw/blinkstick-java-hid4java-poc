#!/bin/bash

set -e
set -x

if [[ ! -f hid4java.jar || ! -f jna.jar ]] ; then
    ./build-hid4java.sh
fi

javac -cp hid4java.jar:jna.jar Main.java

