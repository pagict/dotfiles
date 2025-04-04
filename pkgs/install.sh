#!/bin/bash

CMD=''
if command -v dnf &> /dev/null ; then
  CMD=dnf
elif command -v apt-get &> /dev/null ; then
  CMD=apt-get
elif command -v brew &> /dev/null ; then
  CMD=brew
else
  echo 'Unknown package management tools'
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"

###   xxx_pre.sh
FILE=${DIR}/${CMD}_pre.sh
if [ -f ${FILE} ]; then
  echo "Run prepare ${FILE}..."
  sh ${FILE}
fi

###    install list
FILE=${DIR}/${CMD}.list
PKGS=$(awk -F'#' '{if (NF>1) {print $1;} else {print $0;}}' $FILE)
ECHO_CMD=$(echo ${CMD} install ${PKGS})
echo ${ECHO_CMD}
${CMD} install ${PKGS}
if [ ${CMD} == "brew" ]; then
   FILE=${DIR}/brew-cask.list
   PKGS0=$(awk -F'#' '{if (NF>1) {print $1;} else {print $0;}}' $FILE)
   PKGS="${PKGS0//$'\n'/ }"
   ECHO_CMD=$(echo ${CMD} install --cask ${PKGS})
   echo ${ECHO_CMD}
   ${CMD} install --cask ${PKGS}
fi


if [[ -n ${DISPLAY} ]]; then
  ###     xxx_ws_pre.sh
  FILE=${DIR}/${CMD}_workstation_pre.sh
  if [ -f ${FILE} ]; then
    echo "Run workstation's prepare script ${FILE}..."
    sh ${FILE}
  fi

  ###      install list for workstation
  FILE=${DIR}/${CMD}_workstation.list
  if [ -f ${FILE} ]; then
    PKGS=$(awk -F'#' '{if (NF>1) {print $1;} else {print $0;}}' $FILE)
    ECHO_CMD=$(echo ${CMD} install ${PKGS})
    echo ${ECHO_CMD}
    ${CMD} install ${PKGS}
  fi
fi
