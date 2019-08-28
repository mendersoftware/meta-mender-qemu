#!/bin/bash

set -e

# Takes two arguments, a variable name and a path to use as the wait file. If
# the variable is "true", then the wait file will be created and the script will
# wait for as long as it exists.

if [ "$(eval echo \"\$$1\")" != "true" ]; then
    exit 0
fi

touch "$2"
echo "$1 == true. Waiting indefinitely until $2 is removed."
while [ -f "$2" ]; do
    sleep 10
done
