#!/bin/bash

if [ $1 = "wsc" ]; then 
    if [ $2 = "root" ]; then
        cd ~/Dropbox/work/active/wsc/
        emacs &
    elif [ $2 = "num" ]; then
        cd ~/Dropbox/work/active/wsc/numerics/char_line/
        emacs &
    elif [ $2 = "note" ]; then
        cd ~/Dropbox/work/active/wsc/notes/
        emacs note.tex &
    elif [ $2 = "numc" ]; then
        cd ~/Dropbox/work/active/wsc/numerics/cpp/
	    emacs --funcall setup-dev-env &
    elif [ $2 = "pap" ]; then
        cd ~/Dropbox/work/active/wsc/paper/
        emacs wsc.tex&
    elif [ $2 = "ana" ]; then
        cd ~/Dropbox/work/active/wsc/numerics/ana/
        jupyter notebook
    fi
elif [ $1 = "cell" ]; then
	cd ~/prog/cell/exp/cpp
	emacs --funcall setup-dev-env &
elif [ $1 = "write" ]; then 
    cd ~/write/01/
    emacs src.tex &
elif [ $1 = "mcsearch" ]; then
    cd ~/Dropbox/work/active/mcsearch/numerics/v2working
    ~/.tplate 
elif [ $1 = "work" ]; then
    cd ~/Dropbox/work/active/gloss
    emacs &
elif [ $1 = "chi" ]; then
    cd ~/prog/chi_new/
    emacs --funcall setup-dev-env &
fi


