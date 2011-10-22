alias beh='tac ~/.bash_eternal_history'
alias c='cat'
alias cdt='cd "$_"'
alias e="$EDITOR"
alias f='find'
alias g='grep'
alias gb='git branch'
alias gc='git checkout'
alias gcm='git checkout master'
alias gd='git diff'
alias gl='git log'
alias gs='git show'
alias glh='git log --oneline -n 20'
alias gls='git ls-files'
alias grep='grep --color=auto'
alias gri='git rebase -i'
alias gst='git status'
alias gitk-all='gitk --all --simplify-by-decoration'
alias git-init='git init && git add * && git commit -m "init"'
alias h='head'
alias jp=jsonpipe
alias less='less -S'
alias l='less'
alias ls='ls --color=tty --hide="*.pyc" --hide="#*"'
alias ll='ls -lh'
alias lt='ls -lht'
alias mkdir='mkdir -p'
alias mk='mkdir'
alias m='more'
alias org='cd ~/lib/emacs/org'
alias pwdr='pwd | sed "s,$HOME/,,"'
alias ping-www='ping www.direct.gov.uk'
alias ps-me='ps -u `whoami`'
alias reload='. ~/.bashrc'
alias rsync='rsync --exclude=.git'
alias R='R --silent --no-restore --no-save --vanilla'
alias s=show
alias sshfs=~/lib/sshfs-binaries/sshfs-static-leopard
alias sshfs-analysis='sshfs analysis: ~/analysis -oauto_cache,reconnect,volname=analysis -oworkaround=nonodelay'
alias sync-history='history -a ; history -n'
alias tm='tree | more'
alias tree='tree -AC --noreport'
alias t='tree'
alias tl='topleft'
alias tail-messages='tail -f /var/log/messages'
if [ "$_dan_system" = "Darwin" ] ; then
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
    alias hibernateon="sudo pmset -a hibernatemode 5"
    alias hibernateoff="sudo pmset -a hibernatemode 0"
else
    alias top='top -d.8'
    alias s='sync-dirs'
    alias ps2pdf='ps2pdf -dAutoRotatePages=/None'
    alias mutt='LANG=en mutt -y'
    alias gt='gthumb'
    alias exit='sync-history ; builtin exit'
    alias fusermount='fusermount -uz'
    alias mu='mutt'
    alias screen-external='xrandr --auto && xrandr --output LVDS1 --off && pgrep compiz && compiz --replace &'
    alias screen-internal='xrandr --auto && xrandr --output VGA1 --off'
    alias xdvi='xdvi -expert -s 5'
    alias xpdf='xpdf -fullscreen -bg white'
fi
