if _dan_is_laptop ; then
    for dir in $(cat <<EOF
/usr/local/bin
/usr/local/share/python
$HOME/bin
EOF
    ) ; do
	[ -d $dir ] && export PATH=$dir:$PATH || {
	    echo "Directory doesn't exist: $dir" 1>&2
	}
    done
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
