_cwd=$(pwd)

export GIT_PS1_UNSTAGED="🐉  "
export GIT_PS1_STAGED="🎲  "

cd ~/configfiles/
source lib.sh
source path.sh
source git-functions.sh
source env.sh
# __dan_is_osx && source osx_env.sh
source dircolors.sh
source prompt.sh
source bash/history.sh
source bash/completion.sh
# source fasd.sh
source readline.sh
source alias.sh
[ -f extra.sh ] && source extra.sh
# source bash/alias_completion.sh
source tmux.sh

export __prompt_command
export PROMPT_COMMAND=__prompt_command

cd "$_cwd"

. ~/configfiles/git-functions.sh

source $(which virtualenvwrapper.sh)
export WORKON_HOME=$HOME/.virtualenvs
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

export DOCKER_MACHINE_IP=192.168.99.100
okh() { sed -i "" "${1}d" ~/.ssh/known_hosts; }
export EDITOR='emacsclient -n'
alias e='emacsclient -n'
alias eg='emacs-magit-status'
alias emacs-magit='emacs-magit-status'

# . ~/facet/completion/bash/facet
