# source ~/configfiles/git-completion.bash

export GIT_PS1_UNSTAGED="🐉  "
export GIT_PS1_STAGED="🐠  "

# . ~/configfiles/bash/bashrc.sh

. ~/configfiles/git-functions.sh

source bash/completion.sh
source $(which virtualenvwrapper.sh)
export WORKON_HOME=$HOME/.virtualenvs
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
