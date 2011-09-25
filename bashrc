#!/usr/bin/env bash

_cwd=$(pwd)
cd ~/config/bash

source lib.sh
source env.sh
source bash/path.sh
source prompt.sh
source history.sh
source completion.sh
source autojump.sh
source readline.sh
source dircolors.sh
source alias.sh
[ -f extra.sh ] && source extra.sh

cd "$_cwd"
