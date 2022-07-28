#!/bin/bash

OS="'uname'"
case "$OSTYPE" in
  darwin*)  OS="OSX" ;;
  linux*)   OS="LINUX" ;;
  *)        OS="unknown: $OSTYPE" ;;
esac

if [[ $OS = "OSX" ]]; then
    # Allow access from localhost
    xhost + 127.0.0.1
    # Run xterm inside the docker
    docker run \
        --env DISPLAY=host.docker.internal:0 \
        --hostname test \
        --rm -it test-graph xterm

elif [[ "$OS" = "LINUX" ]]; then
    # Run xterm inside the docker
    docker run \
        --privileged \
        --env DISPLAY=$DISPLAY \
        --volume /tmp/.X11-unix:/tmp/.X11-unix \
        --hostname test \
        --rm -it test-graph xterm

else
    echo ${OS};
fi