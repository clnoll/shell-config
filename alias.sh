alias ..='cd ..'
alias acurl='curl --user $(cat ~/.ssh/auth)'
alias agp='ag --python'
alias beh='tac ~/.bash_eternal_history'
alias c='cat'
alias cb='cargo build'
alias cdt='cd "$_"'
cdp () { mkdir -p "$1" && cd "$1";}
alias cdtemp='cd $(mktemp -d)'
alias cgrep='grep --color=always'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias copy='reattach-to-user-namespace pbcopy'

alias docker-prune='docker rmi $(docker images -f "dangling=true" -q)'
alias docker-rm-all='docker rm -f $(docker ps -a -q)'
alias docker-clean='docker-rm-all && docker-prune'

alias d=docker
alias dc=docker-compose
alias di='docker images'
alias dps='docker ps'

DOCKER_MACHINE_NAME=docker5
alias dm='docker-machine'
alias dmstart="docker-machine start $DOCKER_MACHINE_NAME"
alias dip="docker-machine ip $DOCKER_MACHINE_NAME"
alias denv='docker-machine-env-docker'

mv-downcase () { local f=`mktemp -u`; mv "$1" "$f" && mv "$f" $(tr "[:upper:]" "[:lower:]" <<< "$1"); }

alias e="emacsclient -n"
alias ep='emacs_pipe'
alias ee="emacs -nw -q"
alias ef='efind'
alias eg='egit'
egt () { gt "$1" && e "$1" ; }
alias f='find'
alias ff='find . -type f -name'
alias fromip="who | grep \"^$USER\" | sed 1q | perl -n -e 's,.*\(([0-9.]+)\),\1, and print'"
alias virtualenv-temp='rm -fr /tmp/v && virtualenv /tmp/v && . /tmp/v/bin/activate'

# git aliases
alias git-init='git init && git commit --allow-empty -m "Init"'
alias ga='git add'
alias gb='git branch'
alias gbc='git branch --contains'
alias gbd='git branch-by-date'
alias gbdh='git branch-by-date|head'
alias gbda='git branch-by-date'
alias gbl='git blame'
alias gc='git checkout'
gcf () { git checkout "$@" || git-fetch-branch "$@" ; }
alias gcbz='git branch -D z 2> /dev/null ; git checkout -b z'
alias gconf='git config'
alias gconfl='git config -l'
alias gcl='git clean'
alias gcln='git clean -nd'
alias gclo='git clone'
alias gcm='git checkout master'
alias gcmm='git branch master origin/master && git checkout master'
alias gco='git commit'
alias gcoa='git commit --amend'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gd='git diff'
alias gdm='git diff master'
alias gdob='git diff origin/$(git rev-parse --abbrev-ref HEAD)'
alias gf='git fetch'
alias gfb='git-fetch-branch'
alias gdc='git diff --cached'
alias gdcs='git diff --cached --stat=200,200'
alias gdsc='git diff --cached --stat=200,200'
alias gdw='git diff --word-diff=color'
alias gdw.='git diff --word-diff=color --word-diff-regex=.'
alias gds='git diff --stat=200,200'
alias gg='git grep'
alias ghci='ghci -fwarn-incomplete-patterns'
alias gl='git log1'
alias gl1='gl -n1'
alias gls='gl --stat'
alias glme='gl --author=dan'
alias gla='gl --format="%an"'
alias gm='git merge'
alias gp='git pull'
alias gpo='git pull origin'
alias gpob='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gprob='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gr='git reset'
alias gr1='git reset HEAD~1'
alias gr2='git reset HEAD~2'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias grhob='git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
alias gre='git remote'
alias gres='git remote -v show'
alias gs='git show'
alias gsw='git show --word-diff=color'
alias gsw.='git show --word-diff=color --word-diff-regex=.'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstsd='git stash save debugging'
alias gsts='git stash save `date "+%Y-%m-%d %H:%M"`'
alias gstp='git stash pop'
alias gstr='git stash save && git stash drop stash@{1}'
alias gstsp='git stash show -p'
alias gstl='git stash list'
alias gss='git show --stat=120,120'
gt () { touch "$1" && git add "$1" ; }
alias glh='git log --oneline -n 20'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias gri='git rebase --interactive'
for i in 1 2 3 4 5 6 7 8 9 10; do
    alias gri${i}="git rebase --interactive HEAD~${i}"
done
alias gri4='git rebase --interactive HEAD~3'
alias grio='git rebase --interactive origin/$(git rev-parse --abbrev-ref HEAD)'

alias hubc='open https://github.counsyl.com/dev/website/commit/$(git rev-list -n1 HEAD)'

alias gitk-all='gitk --all --simplify-by-decoration'
alias g='grep'
alias gless='grep --color=always | less -R'
alias grep='grep --color=auto'
alias h='head'
alias ip=ipython
alias jp=jsonpipe
alias less='less -SX'
alias l='less'
alias le='lein'
alias ler='lein repl'

alias ctl='(column -t | less -SX) <'
alias ls='ls --color=tty --hide="*.pyc" --hide="#*"'
alias lh='ls -lh'
alias ll='ls -lh'
alias lt='ls -lht'
alias lth='ls -lht | head'
alias 'make-explain'="make -rnd | perl -p -e 's,(^ +),\1\1\1\1,'"
alias mkdir='mkdir -p'
alias mk='mkdir'
alias m='more'
alias open='reattach-to-user-namespace open'
alias p=python
alias path='readlink -f'
alias psl='ps auxwww | less'
alias pvirtualenv='echo $VIRTUAL_ENV'
alias pwdr='pwd | sed "s,.*$HOME/,,"'
alias ping-world='ping -c 1 www.direct.gov.uk'
alias ps-me='ps -u `whoami`'
alias pyz='py /tmp/z.py'
alias R='R --silent --no-restore --no-save --vanilla'
alias rn='rename'
alias rs='rsync -z --progress'
alias ssh='ssh -A'
alias s='switchto'
alias sw='switchto website'
alias tm='tree | more'
alias tree='tree -AC --noreport'
alias t='tree'

alias 'tmux-current-session'='tmux display-message -p "#S"'
alias ta='tmux attach'
alias tns='tmux new-session'
alias tls='tmux list-sessions'
alias tcs='tmux-current-session'

alias tl='topleft'
alias tail-messages='tail -f /var/log/messages'
alias v=vpn
alias vssh='vagrant ssh'
alias vpro='vagrant provision'

if [[ -n ${ZSH_VERSION-} ]]; then
    alias hist='tac ~/.zsh_history'
    alias thg='tac ~/.zsh_history | grep'
else
    alias hist='tac ~/.bash_eternal_history'
fi

alias hibernateon="sudo pmset -a hibernatemode 5"
alias hibernateoff="sudo pmset -a hibernatemode 0"
