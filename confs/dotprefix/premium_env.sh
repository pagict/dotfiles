alias ls='ls --color -G'
alias ll='ls -lha --color -G'

if [ -e /opt/homebrew/bin/brew ]; then
  export PATH=/opt/homebrew/bin:$PATH
fi
export PATH=${HOME}/.local/bin:${PATH}

if [[ ":$PATH:" == *":$HOME/.fzf/bin:"* ]]; then
  :
else
  export PATH=$PATH:$HOME/.fzf/bin
fi

if [[ -n ${SHELL} && "`basename $SHELL`x" == "zshx" ]]; then
# export plugins=(autojump bazel colored-man-pages colorize common-aliases dnf fd git git-flow gitignore git-lfs gnu-utils golang history knife man pip rsync ssh-agent sudo systemd tmux tmuxinator vim-interaction vi-mode vscode yum zsh-interactive-cd zsh-navigation-tools)
#DISABLE_AUTO_TITLE="true"

  source $HOME/.zsh_func
fi

source ${HOME}/.premium_func.sh

if ! command -v bat &> /dev/null ; then
  alias bat=batcat
fi

export EDITOR=vim

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[[ -f ${HOME}/.LESS_TERMCAP ]] && . ${HOME}/.LESS_TERMCAP

# export http_proxy=http://127.0.0.1:10818
# export https_proxy=http://127.0.0.1:10818
# export all_proxy=socks5://127.0.0.1:10818

if command -v neofetch &> /dev/null ; then
  neofetch --disable "Packages"
fi

