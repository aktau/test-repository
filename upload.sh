#!/bin/bash

PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(basename $(PATH))
LAST_TAG=$(git describe --abbrev=0 --tags)

github-release release \
    --user aktau \
    --repo $DIR  \
    --tag $LAST_TAG \
    --name "the wolf of source street" \
    --description "Not a movie, contrary to popular opinion. Still, my first release!" \
