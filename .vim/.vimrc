set nocompatible              " required
filetype off                  " required
" Uso de Vundle
" set the runtime path to include Vundle and initialize
" Esta directiva funciona condicionada a haber creado los symlinks
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Sintaxis de yaml
Plugin 'avakhov/vim-yaml'

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
"Plugin 'davidhalter/jedi-vim'
" ^ Plugin para mejorar autocompletado
Plugin 'scrooloose/nerdcommenter'
" ^ Plugin para comentar texto mejor.
Plugin 'tpope/vim-surround'
" ^ Rodear texto (poner entre paréntesis, comillas...)
" Comienzo de fragmento para utilsnips
" Snippets, que van por otro lado:
Plugin 'honza/vim-snippets'
" Motor:
Plugin 'SirVer/ultisnips'
" YouCompleteMe debe ser instalado con pasos adicionales
Plugin 'Valloric/YouCompleteMe'

" Disparadores:
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="lñ"
let g:UltiSnipsJumpForwardTrigger="df"
let g:UltiSnipsJumpBackwardTrigger="fd"
" Permitir al editor de snippets separar ventana:
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEnableSnipMate = 0
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsSnippetDirectories=['~/vim/.vim/ultisnips', '~/vim/.vim/bundle/vim-snippets/snippets']
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'ultisnips', '~/vim/.vim/bundle/vim-snippets']
let g:UltiSnipsSnippetsDir='~/vim/.vim/ultisnips'
" ^ Tendremos que copiar en el anterior directorio los snippets de terceros
" Directorio donde guardar los snippets personalizados:
" que queramos utilizar.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fin de lista de plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim se queda colgado por rope, lo desactivamos:
let g:pymode_rope = 0

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

" Evitar tener que estirar el dedo hasta ESC pulsando jj para salir del
" insert mode:
inoremap jj <ESC>
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
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" Evitar que se plieguen imports y docstrings:
" let g:SimpylFold_docstring_preview = 0
" let g:SimpylFold_import = 0
" ^ No parece estar funcionando

" Permitir plegado con la barra espaciadora
nnoremap <space> za
" Mostrar ocultos en NERDTree
let NERDTreeShowHidden=1
" Definimos BadWhitespace para poder usarlo para resaltar
highlight BadWhitespace ctermbg=red guibg=darkred
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

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
