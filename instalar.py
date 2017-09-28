#! /usr/bin/python
#-.- encoding: utf-8 -.-

from os import rename, path, symlink
from subprocess import call
import sys
import getpass

try:
    import pexpect
except ImportError:
    sys.stderr.write("Requirements not satisfied, please install with:")
    sys.stderr.write("pip install pexpect")
    sys.exit()
# Compatibilidad para python2 y python3 en inputs:
try:
    input = raw_input
    print("¡Pásate a python 3 de una **** vez!")
except NameError:
    # Estamos en python 3, todo bien.
    pass

home = path.expanduser("~")
try:
    rename(home + "/.vimrc", home + "/.vimrcOld")
except OSError:
    print("No .vimrc found")
try:
    rename(home + "/.vim", home + "/.vimOld")
except OSError:
    print("No .vim folder found")

if not path.islink(home + '/.vimrc'):
    symlink(home + "/vim/.vim/.vimrc", home + "/.vimrc")
if not path.islink(home + '/.vim'):
    symlink(home + "/vim/.vim", home + "/.vim")

if not path.isdir(home + "/vim/.vim/bundle/Vundle.vim"):
    call([
        "git",
        "clone",
        "https://github.com/VundleVim/Vundle.vim.git",
        home + "/vim/.vim/bundle/Vundle.vim"]
    )
else:
    print("Vundle ya instalado")

if not path.isdir(home + "/vim/.vim/bundle/YouCompleteMe"):
    # Install python dependencies for YouCompleteMe
    py_deps = ['build-essential', 'cmake', 'python-dev', 'python3-dev']
    child = pexpect.spawn(
        'sudo apt-get install ' + ' '.join(py_deps) + ' -y')
    child.logfile = sys.stdout
    child.expect("password")
    XXX = getpass.getpass('Input your sudo password:')
    child.sendline(XXX)
    child.expect(pexpect.EOF, timeout=None)
    call(['vim', '-c', 'PluginInstall'] + ['-c', 'q'] * 2)
    call([
        home + '/.vim/bundle/YouCompleteMe/install.py',
        '--clang-completer',
    ])
    # TODO: pedir input para ver si se instala soporte para otros lenguajes:
    # Go, C#, TypeScript, JavaScript, Rust
else:
    print("YouCompleteMe ya instalado, saliendo...")
