#!/bin/bash

OS="'uname'"
case "$OSTYPE" in
  darwin*)  OS="OSX" ;;
  linux*)   OS="LINUX" ;;
  *)        OS="unknown: $OSTYPE" ;;
esac

if [[ $OS = "OSX" ]]; then
    docker build \
        --tag "test-graph" .

elif [[ "$OS" = "LINUX" ]]; then
    docker build \
        --tag "test-graph" .
else
    echo ${OS};
fi