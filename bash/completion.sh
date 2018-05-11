export FIGNORE=.pyc:#:.DS_Store:.git

. $(brew --prefix)/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
