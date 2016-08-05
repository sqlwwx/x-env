#!/bin/bash

function die() {
  echo "${@}"
  echo 1
}

rm -rf /tmp/hub

git clone --recursive https://github.com/github/hub.git "/tmp/hub" \
  || die "Could not clone the repository to /tmp/hub"

cd /tmp/hub || die "Could not go into the /tmp/hub"

./script/build -o ~/bin/hub || die "build failed"

echo "eval \"$(hub alias -s)\"" >> "${HOME}.bash_profile"

rm -rf /tmp/hub
upx ~/bin/hub
