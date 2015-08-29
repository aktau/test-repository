#!/bin/bash

# set -e
set -u

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(basename $SCRIPT_PATH)
LAST_TAG=$(git describe --abbrev=0 --tags)
VERBOSE=

github-release $VERBOSE release \
    --user aktau \
    --repo $DIR  \
    --tag $LAST_TAG \
    --name "the dog of source street" \
    --description "Not a movie, contrary to popular opinion. Still, my first release!" \

github-release $VERBOSE edit \
    --user aktau \
    --repo $DIR  \
    --tag $LAST_TAG \
    --name "the cow of cows" \
    --description "Just a regular edit, nothing to see here folks" \

github-release $VERBOSE edit \
    --user aktau \
    --repo $DIR  \
    --tag "v0.0.1" \
    --name "this should not work" \
    --description "at all..." \
