#! /usr/bin/python
#-.- encoding: utf-8 -.-

from os import rename, path, symlink
from subprocess import call

home = path.expanduser("~")
try:
    rename(home + "/.vimrc", home + "/.vimrcOld")
except OSError:
    print("No .vimrc found") 
try:
    rename(home + "/.vim", home + "/.vimOld")
except OSError:
    print("No .vim folder found") 

symlink(home + "/vim/.vim/.vimrc", home + "/.vimrc")
symlink(home + "/vim/.vim", home + "/.vim")

call(["git", "clone", "https://github.com/VundleVim/Vundle.vim.git", home + "/vim/.vim/bundle/Vundle.vim"])


