#!/bin/bash

shopt -s expand_aliases
if which gsed > /dev/null 2>&1 ; then
  alias sed=gsed
fi

FILE="/etc/dnf/dnf.conf"
if [ -f ${FILE} ]; then
  sed -i 's/^tsflags.*nodocs.*/# &/' ${FILE}
fi
