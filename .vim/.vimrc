set nocompatible              " required
filetype off                  " required
" Uso de Vundle
" set the runtime path to include Vundle and initialize
" Esta directiva funciona condicionada a haber creado los symlinks
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" PLUGIN LIST

" Auto Pairs, insert or delete pairs of characters like brackets
Plugin 'jiangmiao/auto-pairs'

" Sintaxis de yaml
Plugin 'avakhov/vim-yaml'

" Sintaxis de Terraform
Plugin 'hashivim/vim-terraform'

let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=1

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)

" Plugin para mejorar los plegados
Plugin 'tmhedberg/SimpylFold'
" ^ no olvides instalar con :PluginInstall
let g:SimpylFold_docstring_preview=1

" Plugin 'scrooloose/nerdtree'
" ^ Explorador de archivos para noobs

Plugin 'tpope/vim-fugitive'
" ^ Plugin para utilidades git

" Plugin 'python-mode/python-mode'
" ^ Plugin para utilidades python.

let g:pymode_options_max_line_length = 125
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}

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
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ycm-core/YouCompleteMe'

" FZF: fuzzy search plugin
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Tagbar
Plugin 'majutsushi/tagbar'

" Syntastic
" Plugin 'vim-syntastic/syntastic'
" Ha sido reemplazado por ALE

" ALE, para la sintaxis
Plugin 'dense-analysis/ale'

" Javascript syntax, sintaxis
Plugin 'pangloss/vim-javascript'

" Jinja2 syntax
Plugin 'Glench/Vim-Jinja2-Syntax' 

" JSX syntax for react
Plugin 'MaxMEllon/vim-jsx-pretty'

" Rust language syntax
Plugin 'rust-lang/rust.vim'

" Typescript syntax
Plugin 'leafgarland/typescript-vim'

" puto prettier
Plugin 'prettier/vim-prettier'

" Beancount syntax
Plugin 'nathangrigg/vim-beancount'

" Sintaxis Jsonnet
Plugin 'google/vim-jsonnet'

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
"
" YCM config for virtual environments:
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \ 'g:ycm_python_interpreter_path',
  \ 'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/vim/global_extra_conf.py'

" Configuraciones de sintaxis para ALE
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:ale_fixers = {'yaml': ['prettier', 'yamlfmt']}

"Yaml linter with syntastic
" let g:syntastic_yaml_checkers = ['yamllint']

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
" set colorcolumn=80
" Eliminar archivos swap y backup para evitar ejecutar tests automatizados al
" guardarse.
set nobackup
set nowritebackup
set noswapfile

" En algunas versiones no sale por defecto.
set ruler

" Números de línea híbridos (Hybrid numbertoggle)
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

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

" Abrir TAG de ctags en nueva pestaña con LEADER T:
" Leader es , tal y como se define unas líneas más arriba
" Al pulsar ,T nos abre la tag en una tab nueva
nnoremap <silent><Leader>T <C-w><C-]><C-w>T

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

" Bash space indent
au BufRead,BufNewFile *.bash set tabstop=2
au BufRead,BufNewFile *.bash set expandtab
au BufRead,BufNewFile *.bash set softtabstop=2
au BufRead,BufNewFile *.bash set shiftwidth=2
au BufRead,BufNewFile *.bash set autoindent

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

" Go indent
au BufRead,BufNewFile *.go set tabstop=2
au BufRead,BufNewFile *.go set expandtab
au BufRead,BufNewFile *.go set softtabstop=2
au BufRead,BufNewFile *.go set shiftwidth=2
au BufRead,BufNewFile *.go set autoindent

" Javascript space indent
au BufRead,BufNewFile *.js set tabstop=2
au BufRead,BufNewFile *.js set expandtab
au BufRead,BufNewFile *.js set softtabstop=2
au BufRead,BufNewFile *.js set shiftwidth=2
au BufRead,BufNewFile *.js set autoindent

" json indent
au BufRead,BufNewFile *.json set tabstop=2
au BufRead,BufNewFile *.json set expandtab
au BufRead,BufNewFile *.json set softtabstop=2
au BufRead,BufNewFile *.json set shiftwidth=2
au BufRead,BufNewFile *.json set autoindent

" jsonnet indent
au BufRead,BufNewFile *.jsonnet set tabstop=2
au BufRead,BufNewFile *.jsonnet set expandtab
au BufRead,BufNewFile *.jsonnet set softtabstop=2
au BufRead,BufNewFile *.jsonnet set shiftwidth=2
au BufRead,BufNewFile *.jsonnet set autoindent

" nunjucks template syntax maps
au BufRead,BufNewFile *.tf.njk set filetype=terraform

" Typescript indent 
au BufRead,BufNewFile *.ts set tabstop=2
au BufRead,BufNewFile *.ts set expandtab
au BufRead,BufNewFile *.ts set softtabstop=2
au BufRead,BufNewFile *.ts set shiftwidth=2
au BufRead,BufNewFile *.ts set autoindent

" Zsh space indent
au BufRead,BufNewFile *.zsh set tabstop=2
au BufRead,BufNewFile *.zsh set expandtab
au BufRead,BufNewFile *.zsh set softtabstop=2
au BufRead,BufNewFile *.zsh set shiftwidth=2
au BufRead,BufNewFile *.zsh set autoindent
