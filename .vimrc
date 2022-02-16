"" find default vundle config here: https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " required
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
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

inoremap kj <Esc>

"" {{{ Colorscheme Config
syntax enable
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"" }}} Colorscheme Config

"" }}} Vim Config

"" {{{ vim-terraform
let g:terraform_fmt_on_save = 1
"" }}} vim-terraform
