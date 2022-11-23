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
which gsed &>/dev/null
if [ $? -eq 0 ]; then
  alias sed=gsed
fi
if which gcp > /dev/null 2>&1 ; then
  alias cp=gcp
fi

##### 2.  Common operations BEFORE moving configs  #######


##### 3.      Moving dot files                     ########
dentries=$(ls ${DIR}/dotprefix | grep -v ${DIR}/dotprefix/config)
for name in ${dentries}; do
  suff=$(echo ${name} | awk -F'.' '{print $NF;}')
  if echo ${OTHERS} | grep ${suff} > /dev/null 2>&1; then
    # this belongs to other platforms, skip
    continue
  fi
  # strip the OS suffix
  newname=$(echo ${name} | sed "s/\.$OS$//")
  echo "cp --backup=numbered -rfT ${DIR}/dotprefix/${name} $HOME/.${newname}"
  cp --backup=numbered -rfT ${DIR}/dotprefix/${name} $HOME/.${newname}
done

echo "Moving .config files..."
dentries=$(ls ${DIR}/dotprefix/config)
for name in ${dentries}; do
  suff=$(echo ${name} | awk -F'.' '{print $NF;}')
  if echo ${OTHEROS} | grep ${suff} > /dev/null 2>&1 ; then
    # this belongs to other platforms, skip
    continue
  fi
  newname=$(echo ${name} | sed "s/\.${OS}$//")
  echo "cp --backup=numbered -rfT ${DIR}/dotprefix/config/${name} $HOME/.config/${newname}"
  cp --backup=numbered -rfT ${DIR}/dotprefix/config/${name} $HOME/.config/${newname}
done


##### 4.  Common ops AFTER moving configs        ########

######### bashrc
CNT=`cat $HOME/.bashrc | grep -e '^source' | grep premium_env | wc -l | sed 's/^ *//' | sed 's/ *$//'`
if [ $CNT -eq 0 ]; then
  echo source $HOME/.premium_env >> $HOME/.bashrc
fi
CNT=`cat $HOME/.bashrc | grep fzf | wc -l | sed 's/^ *//' | sed 's/ *$//'`
if [ $CNT -eq 0 ]; then
  echo '[-f ~/.fzf.bash ] && source ~/.fzf.bash' >> $HOME/.bashrc
fi

######## vim plugins
#mkdir -p $HOME/.vim/autoload/
#cp -f ${DIR}/../third_parties/vim-plug/plug.vim $HOME/.vim/autoload/
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
