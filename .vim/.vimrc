set nocompatible              " required
filetype off                  " required
" Uso de Vundle
" set the runtime path to include Vundle and initialize
" Esta directiva funciona condicionada a haber creado los symlinks
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

Plugin 'klen/python-mode'
" ^ Plugin para utilidades python.
Plugin 'davidhalter/jedi-vim'
" ^ Plugin para mejorar autocompletado
Plugin 'scrooloose/nerdcommenter'
" ^ Plugin para comentar texto mejor.


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fin de lista de plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Empieza el vimrc "
syntax on
filetype indent plugin on
set modeline
set background=dark
" Indicar columna 80
set colorcolumn=80
" Eliminar archivos swap y backup para evitar ejecutar tests automatizados al
" guardarse.
set nobackup
set nowritebackup
set noswapfile

" Cambiar la tecla <leader> para que sea una coma
let mapleader=","
set timeout timeoutlen=1500
" Lugares en los que dividir la pantalla:
set splitbelow
set splitright
" ^ abre un archivo con :sv {{nombre del fichero}} para dividir la pantalla
" verticalmente. Usa :vs para que sea horizontal. 
" Numerar
set nu
" Abrir el archivo vimrc escribiendo :vimrc
autocmd bufwritepost .vimrc source $MYVIMRC

" Cambiar entre ventanas (usando mapeo de combinaciones):
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ^ Ctrl-j para mover a la de abajo
" ^ Ctrl-k para mover a la de arriba
" ^ Ctrl-l para mover a la de la derecha
" ^ Ctrl-h para mover a la de izquierda

" Activar plegado con Simpylfold
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" Evitar que se plieguen imports y docstrings:
let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_import = 0
" ^ No parece estar funcionando

" Permitir plegado con la barra espaciadora
nnoremap <space> za
" Mostrar ocultos en NERDTree
let NERDTreeShowHidden=1
" Definimos BadWhitespace para poder usarlo para resaltar
highlight BadWhitespace ctermbg=red guibg=darkred

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

