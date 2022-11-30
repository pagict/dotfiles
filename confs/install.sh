#!/bin/bash

##### 1.     Before anything, define some vars      ########
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd)"
echo DIR is ${DIR}
OS=''
if [[ "`uname -s`x" == "Darwinx" ]]; then
  OS="macos"
elif [[ "`uname -s`x" == "Linuxx" ]]; then
  OS="linux"
fi
PLATFORMS="macos\nlinux\nwindows\nfreebsd"
OTHEROS=$(echo -e ${PLATFORMS} | grep -v ${OS})
echo OS is: ${OS}

shopt -s expand_aliases
if command -v gsed &> /dev/null ; then
  alias sed=gsed
fi
if command -v gcp &> /dev/null ; then
  alias cp=gcp
fi

##### 2.  Common operations BEFORE moving configs  #######
mkdir $HOME/.ssh 2>/dev/null


##### 3.      Moving dot files                     ########
PSDIRS=(config)           # `PSDIRS` Platform-dependent dirs

# copy first level config files/dirs
for name in $(ls ${DIR}/dotprefix); do
  if [ -d ${DIR}/dotprefix/${name} ]; then
    if [[ " ${PSDIRS[*]} " =~ " ${name} " ]]; then
      # if platform-dependent directory, copy it later
      continue
    fi
  fi
  echo "cp --backup=numbered -rfT ${DIR}/dotprefix/${name} $HOME/.${name}"
  cp --backup=numbered -rfT ${DIR}/dotprefix/${name} $HOME/.${name}
done

# copy files/dirs under platform-dependent directory
for dir in ${PSDIRS}; do
  for name in $(ls ${DIR}/dotprefix/${dir}); do
    suff=$(echo ${name} | awk -F'.' '{print $NF;}')
    if echo ${OTHEROS} | grep ${suff} > /dev/null 2>&1 ; then
      # other platforms' config file
      echo "skip copying ${DIR}/dotprefix/${dir}/${name}..."
      continue
    fi
    newname=$(echo ${name} | sed "s/\.${OS}$//")
    echo "cp --backup=numbered -rfT ${DIR}/dotprefix/${dir}/${name} $HOME/.${dir}/${newname}"
    cp --backup=numbered -rfT ${DIR}/dotprefix/${dir}/${name} $HOME/.${dir}/${newname}
  done
done

##### 4.  Common ops AFTER moving configs        ########

######### bashrc
CNT=`cat $HOME/.bashrc | grep -e '^source' | grep premium_env | wc -l | sed 's/^ *//' | sed 's/ *$//'`
if [ $CNT -eq 0 ]; then
  echo source $HOME/.premium_env >> $HOME/.bashrc
fi
CNT=`cat $HOME/.bashrc | grep fzf | wc -l | sed 's/^ *//' | sed 's/ *$//'`
if [ $CNT -eq 0 ]; then
  echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> $HOME/.bashrc
fi

######## vim plugins
vim --cmd '' -c 'PlugInstall' -c 'qa!'

#### 5.   OS-dependent POST ops                  #######
FIN_SH=${DIR}/${OS}_fin.sh
if [ -e ${FIN_SH} ]; then
  echo "Run final script: ${FIN_SH}"
  sh ${FIN_SH}
else
  echo "No final script: ${FIN_SH}"
  echo "Skipping..."
fi
