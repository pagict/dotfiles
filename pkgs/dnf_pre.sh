#!/bin/bash

shopt -s expand_aliases
if command -v gsed &> /dev/null ; then
  alias sed=gsed
fi

FILE="/etc/dnf/dnf.conf"
if [ -f ${FILE} ]; then
  sed -i 's/^tsflags.*nodocs.*/# &/' ${FILE}
fi

dnf install -y epel-release
