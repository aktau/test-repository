#!/bin/bash

# version v0.0.13

# Bla bla
# Goopo

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
    --description "at all..." || {
    echo "edit of non-existing tag didn't work, exellent"
}

echo "Uploading regular artefact"
github-release upload \
    --user aktau \
    --repo $DIR \
    --tag $LAST_TAG \
    --name "upload.sh" \
    --file upload.sh

echo "Uploading gzipped file"
gzip < upload.sh | github-release upload \
    --user aktau \
    --repo $DIR \
    --tag $LAST_TAG \
    --name "upload.sh.gz" \
    --file -

echo "Uploading bzipped file with a label"
bzip2 < upload.sh | github-release upload \
    --user aktau \
    --repo $DIR \
    --tag $LAST_TAG \
    --name "upload.sh.bz2" \
    --label "A nice, bzip2'ed file" \
    --file -

# github-release release -u aktau -r test-repository -c c22d9e4a2dd8f7
# --name "commitish" --description "does it even work" --tag v0.43.0
