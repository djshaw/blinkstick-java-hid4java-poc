#!/bin/bash

set -e
set -o
set -x

# If JAVA_HOME isn't set, and if we're on an ubuntu system (or possibly others)
# the java binary in PATH is symlink. We can follow the symlinks to find a
# JAVA_HOME value.
if [ -z $JAVA_HOME ] ; then
    JAVA_HOME=$( which java )
    while [ -L $JAVA_HOME ] ; do
        JAVA_HOME=$( readlink $JAVA_HOME )
    done
    JAVA_HOME=$( dirname $( dirname $JAVA_HOME ) )
fi

TEMP_DIR=$( mktemp -d )
pushd $TEMP_DIR
    git clone https://github.com/gary-rowe/hid4java.git
    pushd hid4java
        git checkout hid4java-0.7.0
        JAVA_HOME=$JAVA_HOME mvn install dependency:copy-dependencies
    popd
popd
cp $TEMP_DIR/hid4java/target/hid4java-0.7.0.jar hid4java.jar
cp $TEMP_DIR/hid4java/target/dependency/jna-*.jar jna.jar
rm -rf $TEMP_DIR

