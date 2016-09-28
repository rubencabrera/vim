Instrucciones:

Clonar el repo (se clonará en la carpeta vim, supondremos que en ~/vim sin punto)
Hacer copia de seguridad de los ficheros de vim que se tienen en el sistema y crear enlaces simbólicos a los de esta configuración:

mv .vimrc .vimrcOld
mv .vim .vimOld
ln -s ~/vim/.vim/.vimrc ~/.vimrc
ln -s ~/vim/.vim ~/.vim

Clonar Vundle donde toca para que se encarge de instalarnos todos los plugins que necesitamos (da igual cómo lo clonemos porque el directorio bundle se ignora)

git clone https://github.com/gmarik/vundle.git ~/vim/.vim/bundle/Vundle.vim

El siguiente fragmento del .vimrc es el que hace que Vundle nos funcione:

set nocompatible               " be iMproved
    filetype off                   " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'
    filetype plugin indent on     " required!

A continuación abrimos Vim e instalamos los bundles con
:BundleInstall
o con
:PluginInstall
