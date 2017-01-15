syntax enable
syntax on
filetype on

" about line number
set number numberwidth=5
set relativenumber

" about cursor
set ruler cursorline cursorcolumn gcr=a:block-blinkon0

" about tabs and indents
set tabstop=4 shiftwidth=4 shiftround softtabstop=4 expandtab cindent
filetype indent on

" highlight search result
set hlsearch incsearch

" shell
set shell=/bin/bash

" fold
" set foldmethod=syntax

""" mappings begin

let mapleader = "-"

nnoremap <leader>rl :source $MYVIMRC<cr>

" CTRL-s save
inoremap <c-s> <c-c>:update<cr>
nnoremap <c-s> :update<cr>

" CTRL-A select all
inoremap <c-a> <c-c>ggVG
nnoremap <c-a> ggVG

nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap J <nop>

""" mappings end


""" vundle setup begin

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" To ignore plugin indent changes, instead use:

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" let Vundle manage Vundle, required

Plugin 'fatih/vim-go'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'rhysd/vim-clang-format'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" vundle setup end

""" YouCompleteMe begin

let g:ycm_confirm_extra_conf = 0
nnoremap <leader>dk :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>df :YcmCompleter GoToDefinition<cr>

""" YouCompleteMe end

""" airline begin

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'

""" airline end

""" vim-markdown begin

let g:markdown_fenced_languages = ["html", "python", "cpp", "c", "java", "bash=sh"]
let g:markdown_syntax_conceal = 0

""" vim-markdown end

""" syntastic begin

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:Syntastic_python_checkers = ["flake8", "python"]
let g:Syntastic_python_python_exec = ["python3"]

let g:Syntastic_cpp_checkers = ["gcc"]
let g:Syntastic_cpp_gcc_compiler = "clang++"
let g:syntastic_cpp_compiler_options = "-std=c++14 --fsyntax-only -Wall"


""" Syntastic end

"""

nnoremap <leader>nt :NERDTree<cr>

"""

""" NerdCommenter begin

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

let g:NERDBlockComIgnoreEmpty = 0
let g:NERDCommentEmptyLines = 1

let g:NERDCustomDelimiters = {
            \ 'cpp': {'left': '//', 'leftAlt': '/*', 'rightAlt': '*/'}, 
            \ 'c': {'left': '//', 'leftAlt': '/*', 'rightAlt' : '*/'}
            \ }

""" NerdCommenter end

""" ClangFormat begin

let g:clang_format#style_options = {
            \ "BasedOnStyle": "Google",
            \ "IndentWidth": 4,
            \ "AllowShortFunctionsOnASingleLine": "Empty",
            \ "AllowShortBlocksOnASingleLine": "false",
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "AccessModifierOffset": -2,
            \ "AlignAfterOpenBracket": "AlwaysBreak",
            \ }

nnoremap <leader>cf :ClangFormat<cr>

"let g:clang_format#detect_style_file = 1

""" ClangFormat end

""" C/CPP snippets begin

iabbrev mian main

autocmd FileType c,cpp 
            \ nnoremap <buffer> <leader>main 
            \ iint main(int argc, char **argv) {<cr><cr>}<cr><up><up><tab>
autocmd FileType c,cpp 
            \ nnoremap <buffer> <leader>ins
            \ O#include <><left>
autocmd FileType c,cpp
            \ nnoremap <buffer> <leader>inc
            \ O#include ""<left>
autocmd FileType c,cpp,java inoremap <C-e> <end>;
autocmd FileType c,cpp,java inoremap <C-b> <end><space>{}<left>
autocmd FileType python inoremap <C-b> <end>:<cr>
autocmd FileType python inoremap <C-e> <end>


""" emmet begin

let g:user_emmet_leader_key='<C-x>'



""" easymotion begin

map <space> <Plug>(easymotion-prefix)


""" vim-go begin

let g:go_term_mode = "split"
