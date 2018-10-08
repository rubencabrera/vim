# Vim custom setup

Este repositorio contiene mi configuración de VIM para disponer de todo lo que
necesita un editor de texto directamente en consola. 

No necesitas un entorno gráfico ni un trillón de GB de RAM para tener un IDE.

Algunas de las funcionalidades que incluye son:

* Plegado de bloques de texto con tmhedberg/SimplyFold
* Navegación en panel lateral con scrooloose/nerdtree
* Integración con git gracias a tpope/vim-fugitive
* Comprobación de sintaxys python con klen/python-mode
* Comentado rápido de bloques de texto con scrooloose/nerdcommenter
* Envolver texto rápidamente con tpope/vim-surround
* Manejo de snippets con SirVer/ultisnips
* Algunos snippets útiles de honza/vim-snippets
* Autocompletado con Valloric/YouCompleteMe


## Tested with:

- Ubuntu 14.04
- Ubuntu 16.04
- Ubuntu 17.10
- Ubuntu 18.04
- Debian Jessie
- Debian Stretch

## Instrucciones de instalación:

Clonar el repo, para mayor simplicidad, hacerlo directamente en el home de 
usuario. El repositorio se clonará en la carpeta vim, supondremos que en ~/vim,
sin punto)

Entrar en el repo clonado y ejecutar:

```
./instalar.py
```
El script se encarga del resto. Necesitas introducir tu contraseña de sudo  y
 tener permisos para instalar paquetes para que el autocompletado con YCM
funcione. 

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
