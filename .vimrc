
" Setup Plug
call plug#begin()

Plug 'lervag/vimtex'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'

call plug#end()

" Syntax highlighting
syntax enable
filetype plugin indent on
autocmd BufRead,BufNewFile *.ts,*.tsx set filetype=typescript

" Tab width
set tabstop=4
set shiftwidth=4

" Line number mode
set relativenumber

" Enable mouse
set mouse=a

" *** CONFIG ***

" VimTeX 
let g:vimtex_view_method = 'zathura' 
let g:vimtex_compiler_method = 'latexmk'

" YouCompleteMe 
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_completion = 1

" *** BINDINGS ***

" Leader
let mapleader = "\<Space>"

" Save and quit
nnoremap <Leader>x :x!<CR>

" Quit
nnoremap <Leader>q :q!<CR>

" Save
nnoremap <leader>w :w<CR>

" Open NetRW
nnoremap <Leader>e :Ex<CR>

" Source open file
nnoremap <Leader>s :source %<CR>

" Split window
nnoremap <Leader>v :vsplit %<CR><C-w><C-w>
nnoremap <Leader>h :split %<CR><C-w><C-w>

" Switch window
nnoremap <Leader>j <C-w><C-w>
nnoremap <Leader>k <C-w>p

" Rotate window focus
nnoremap <Leader>r <C-w><C-r><C-w><C-w>

" Increase window width
nnoremap <C-l> :vertical resize +5<CR>

" Decrease window width
nnoremap <C-h> :vertical resize -5<CR>

" New tab
nnoremap <Leader>t :tabnew<CR>:Files `=getcwd()`<CR>

" fzf bindings
nnoremap <Leader>f :Files `=getcwd()`<CR>

