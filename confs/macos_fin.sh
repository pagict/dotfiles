#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"
shopt -s expand_aliases
if command -v gcp &> /dev/null ; then
  alias cp=gcp
fi
cp --backup=numbered -rfT ${DIR}/Rime $HOME/Library/Rime
