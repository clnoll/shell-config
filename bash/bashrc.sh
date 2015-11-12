_cwd=$(pwd)

export GIT_PS1_UNSTAGED="🐉  "
export GIT_PS1_STAGED="🐠  "

cd ~/configfiles/
source lib.sh
source path.sh
source git-functions.sh
source env.sh
# # __dan_is_osx && source osx_env.sh
source dircolors.sh
source prompt.sh
source bash/history.sh
source bash/completion.sh
# source ~/configfiles/git-completion.bash
# source fasd.sh
source readline.sh
source alias.sh
[ -f extra.sh ] && source extra.sh
# source bash/alias_completion.sh
source tmux.sh

cd "$_cwd"

. ~/configfiles/git-functions.sh

source $(which virtualenvwrapper.sh)
export WORKON_HOME=$HOME/.virtualenvs
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
