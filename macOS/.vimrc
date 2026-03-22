" === vim-plug ===
call plug#begin('~/.vim/plugged')

" Essentials
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy finder (brew install fzf)
Plug 'junegunn/fzf.vim'                                 " :Files, :Rg, etc.
Plug 'tpope/vim-fugitive'                               " Git :G status, :G blame
Plug 'airblade/vim-gitgutter'                           " Git diff in gutter
Plug 'tpope/vim-commentary'                             " gcc to comment
Plug 'tpope/vim-surround'                               " cs"', ds"

" Syntax (blockchain)
Plug 'tomlion/vim-solidity'                             " .sol
Plug 'rust-lang/rust.vim'                               " .rs (Foundry)
Plug 'pangloss/vim-javascript'                          " .js
Plug 'leafgarland/typescript-vim'                       " .ts
Plug 'maxmellon/vim-jsx-pretty'                         " JSX

" Theme (light & fast)
Plug 'morhetz/gruvbox'

call plug#end()

" === Basic Settings ===
set nocompatible
filetype plugin indent on
syntax on
set number
set relativenumber
set cursorline
set hidden
set incsearch
set hlsearch
set ignorecase smartcase
set tabstop=2 shiftwidth=2 expandtab
set autoindent
set mouse=a
"set clipboard=unnamedplus   " macOS: pbcopy/pbpaste
set updatetime=100          " GitGutter refresh

" === Colors ===
colorscheme gruvbox
set background=dark

" === Keymaps ===
let mapleader = " "

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>b :Buffers<CR>

" Git
nnoremap <leader>gs :G status<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>

" Clear search
nnoremap <leader>h :nohlsearch<CR>

" === Plugin Settings ===
" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" === Auto Commands ===
augroup blockchain
  autocmd!
  autocmd FileType solidity setlocal tabstop=4 shiftwidth=4
  autocmd FileType rust setlocal tabstop=4 shiftwidth=4
augroup END

