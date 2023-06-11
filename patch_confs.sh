#!/bin/bash
PATCH_FILE=incoming.patch
CURRENT=master
TARGET=origin/master
git fetch
git diff --no-prefix ${CURRENT} ${TARGET} > ${PATCH_FILE}

ESCAPED_HOME=$(printf '%s\n' "${HOME}" | sed -e 's/[\/&]/\\&/g')

sed -i "s/ confs\/dotprefix\// ${ESCAPED_HOME}\/./g" ${PATCH_FILE}

patch -f -p0 -d / < ${PATCH_FILE}
git pull --ff-only

