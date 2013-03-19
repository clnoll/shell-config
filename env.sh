export BROWSER=google-chrome

# export EDITOR='emacsclient > /dev/null'
export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient > /dev/null'

export INFOPATH=/usr/homebrew/share/info
export CLOJURESCRIPT_HOME=/Users/Shared/lib/clojure/clojurescript

export GEM_HOME=$(brew --prefix)

export GIT_MERGE_AUTOEDIT=no

PSQL_EDITOR="emacsclient --eval \"(setq-default major-mode 'sql-mode)\"; emacsclient"
