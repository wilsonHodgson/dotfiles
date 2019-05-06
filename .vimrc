""---Personal Config---
set tabstop=2
set number
set relativenumber
set mouse=a

"Fuzzy Filefinding in root dir
set path+=**
set wildmenu

"Tag Building
command! MakeTags !ctags -R


""disable beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
				  autocmd GUIEnter * set visualbell t_vb=
	endif

""coloration
colo desert 
syntax on

""Omni-autocomplete
"filetype plugin on
""set omnifunc=syntaxcomplete#Complete

""---Plugins---

""Non-Vundle Managed Plugins""
""Pico8 syntax
set rtp+=~/.vim/vim-pico8-syntax
autocmd FileType pico8 let b:vcm_tab_complete = 'omni'

" Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'severin-lemaignan/vim-minimap' 
Plugin 'neoclide/coc.nvim'
Plugin 'calviken/vim-gdscript3'
Plugin 'junegunn/goyo.vim'

call vundle#end()
filetype plugin indent on

""---End of Plugins---

""---Language Servers---
