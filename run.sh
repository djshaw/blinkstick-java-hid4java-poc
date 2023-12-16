#!/bin/bash

set -e
set -o
set -x

java -cp hid4java.jar:jna.jar:. Main

