set nocompatible              " required
filetype off                  " required
" Uso de Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)

" Plugin para mejorar los plegados
Plugin 'tmhedberg/SimpylFold'
" ^ no olvides instalar con :PluginInstall
let g:SimpylFold_docstring_preview=1

Plugin 'scrooloose/nerdtree'
" ^ Explorador de archivos

Plugin 'tpope/vim-fugitive'
" ^ Plugin para utilidades git

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Empieza el vimrc "
syntax on
filetype indent plugin on
set modeline
set background=dark
" Lugares en los que dividir la pantalla:
set splitbelow
set splitright
" ^ abre un archivo con :sv {{nombre del fichero}} para dividir la pantalla
" verticalmente. Usa :vs para que sea horizontal. 

" Cambiar entre ventanas (usando mapeo de combinaciones):
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ^ Ctrl-j para mover a la de abajo
" ^ Ctrl-k para mover a la de arriba
" ^ Ctrl-l para mover a la de la derecha
" ^ Ctrl-h para mover a la de izquierda

" Activar plegado
set foldmethod=indent
set foldlevel=99
" Permitir plegado con la barra espaciadora
nnoremap <space> za


" Python, PEP-008
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set textwidth=139
au BufRead,BufNewFile *.py,*.pyw set tabstop=4
au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set autoindent
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'

