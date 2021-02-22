let mapleader = "K"
let g:netrw_banner=1

let vimrc = stdpath('config') . '/init.vim'

" File Operations{{{
function OpenFile(file) 
	exec 'split' a:file
endfunction
command! -nargs=1 OpenFile	:call OpenFile(<f-args>)

function CompileLatex()
	!xelatex %
	!rm %:r.log %:r.aux %:r.out
	!xdg-open %:r.pdf
endfunction

function CompileMarkdown()
	!pandoc % --pdf-engine=xelatex -o %:r.pdf
	!xdg-open %:r.pdf
endfunction

function BuildCMS()
	!mvn compile
	!mvn war:war
	!\cp target/cms.war ~/apache-tomcat-9.0.39/webapps/cms.war
	!~/apache-tomcat-9.0.39/bin/catalina.sh stop
	!~/apache-tomcat-9.0.39/bin/catalina.sh start
	!sleep .5
	!firefox localhost:8080/cms
endfunction

function BuildCmake(execute)
	!cmake .
	!make
	let folder="%:p:h"
	let executable = a:execute
	exec "!" . folder . "/" . a:execute
endfunction

"}}}
" Keymaps{{{
nnoremap <silent> <leader>rc :call OpenFile(vimrc)<CR>"{{{}}}
nnoremap <silent> <leader>s :exe 'source' vimrc<CR>
nnoremap <silent> <leader>cl :call CompileLatex()<CR>
nnoremap <silent> <leader>cm :call CompileMarkdown()<CR>
nnoremap <silent> <leader>bc :call BuildCmake("")<Left><Left>
nnoremap <silent> <leader>du :call BuildCmake("duck")<CR>

"turn into latex math equation
nnoremap  <leader>$ g@iW$

"toggle spellcheck
nnoremap <silent> <leader>ts :setlocal spell!<CR>

"sums up a series of operations
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

"}}}
"Plugins{{{
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/goyo.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'cocopon/colorswatch.vim'
Plug 'cocopon/inspecthi.vim'
Plug 'cocopon/pgmnt.vim'
Plug 'junegunn/seoul256.vim'
Plug '/home/wilson/Projects/Vim-ColorSchemes/topsoil'
Plug 'clktmr/vim-gdscript3'

call plug#end()
"}}}
"Appearance and Behaviours {{{
let g:seoul256_background = 235
colo seoul256
set bs=1
set number
set mouse=a
set termguicolors
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
set foldmethod=marker

set spelllang=en
set spell

"Fuzzy Filefinding in root
set path+=**
set wildmenu

"Tag Building
command! MakeTags !ctags -R

"}}}
"Language Servers{{{
"Visit https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
"for details on how to configure a language server

lua << EOF

local on_attach_vim = function(_, bufnr)
  require'completion'.on_attach()
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require'lspconfig'.pyls.setup{on_attach=on_attach_vim, cmd = {"pyls"}, filetypes = {"python"}}
require'lspconfig'.omnisharp.setup{on_attach=on_attach_vim}
require'lspconfig'.jdtls.setup{on_attach=on_attach_vim}

require'lspconfig'.html.setup{on_attach=on_attach_vim}
require'lspconfig'.cssls.setup{on_attach=on_attach_vim} --doesn't work
require'lspconfig'.tsserver.setup{on_attach=on_attach_vim}

-- lua is the only one that doesn't work at all right now
require'lspconfig'.sumneko_lua.setup{on_attach=on_attach_vim}
require'lspconfig'.gdscript.setup{on_attach=on_attach_vim}
require'lspconfig'.bashls.setup{on_attach=on_attach_vim}
require'lspconfig'.clangd.setup{on_attach=on_attach_vim}
EOF
"}}}

"Configure Tab Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"Fix vim markdown to work with math equations
syn region math start=/\$\$/ end=/\$\$/
syn match math '\$[^$].\{-}\$'
hi link math Statement

"Language Server Features
nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader><c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
