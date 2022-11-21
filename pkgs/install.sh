#!/bin/bash

CMD=''
if which dnf > /dev/null 2>&1; then
  CMD=dnf
elif which dnf > /dev/null 2>&1; then
  CMD=apt
elif which brew > /dev/null 2>&1; then
  CMD=brew
else
  echo 'Unknown package management tools'
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"

FILE=${DIR}/${CMD}_pre.sh
if [ -f ${FILE} ]; then
  echo "Run prepare ${FILE}..."
  sh ${FILE}
fi

FILE=${DIR}/${CMD}.list
PKGS=$(awk -F'#' '{if (NF>1) {print $1;} else {print $0;}}' $FILE)
ECHO_CMD=$(echo ${CMD} install ${PKGS})
echo ${ECHO_CMD}
${CMD} install ${PKGS}

if [[ -n ${DISPLAY} ]]; then
  FILE=${DIR}/${CMD}_workstation_pre.sh
  if [ -f ${FILE} ]; then
    echo "Run workstation's prepare script ${FILE}..."
    sh ${FILE}
  fi

  FILE=${DIR}/${CMD}_workstation.list
  if [ -f ${FILE} ]; then
    PKGS=$(awk -F'#' '{if (NF>1) {print $1;} else {print $0;}}' $FILE)
    ECHO_CMD=$(echo ${CMD} install ${PKGS})
    echo ${ECHO_CMD}
    ${CMD} install ${PKGS}
  fi
fi
