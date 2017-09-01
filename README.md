Compatible con:

Ubuntu 14.04+
Debian Jessie

Instrucciones:

Clonar el repo (se clonará en la carpeta vim, supondremos que en ~/vim sin punto)

Entrar en el repo clonado y ejecutar:

```
./instalar.py
```
El script se encarga del resto. Necesitas introducir tu contraseña y tener
permisos para instalar paquetes. 

El siguiente fragmento del .vimrc es el que hace que Vundle nos funcione:

```
set nocompatible               " be iMproved
    filetype off                   " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'
    filetype plugin indent on     " required!
```
