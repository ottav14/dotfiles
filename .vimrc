" Syntax highlighting
syntax enable

" Tab width
set tabstop=4
set shiftwidth=4

" Line number mode
set relativenumber

" Enable mouse
set mouse=a


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

" Switch window
nnoremap <Leader>j <C-w><C-w>
nnoremap <Leader>k <C-w>p

" Rotate window focus
nnoremap <Leader>r <C-w><C-r><C-w><C-w>

" Increase window width
nnoremap <C-l> :vertical resize +5<CR>

" Decrease window width
nnoremap <C-h> :vertical resize -5<CR>

