#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"
shopt -s expand_aliases
if which gcp > /dev/null & 2>&1; then
  alias cp=gcp
fi
cp --backup=numbered -rfT ${DIR}/Rime $HOME/Library/Rime
