"" find default vundle config here: https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " required
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'

Plugin 'elzr/vim-json'
"Plugin 'git://git.wincent.com/command-t.git'

Plugin 'hashivim/vim-terraform'

"" color schemes
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

"" `:source %` to reload current file

"" {{{ Vim Config
set nu                       " number
set rnu                      " relative number

inoremap jk <Esc>

"" {{{ Colorscheme Config
syntax enable
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"" }}} Colorscheme Config

"" }}} Vim Config

"" {{{ nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
"" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"" }}} nerdtree
"" {{{ vim-terraform
let g:terraform_fmt_on_save = 1
"" }}} vim-terraform
