#!/bin/bash

set -o xtrace 

export -f travis_wait

if [[ "${CI}" = true ]]; then
  PREFIX="travis_wait 20"
  LXD_FLAGS="-c security.privileged=true"
  SU="sudo"
else
  PREFIX=""
  LXD_FLAGS=""
  SU=""
fi


${PREFIX} ${SU} lxc launch ubuntu:22.04 test ${LXD_FLAGS} 2>&1
lxc ls
