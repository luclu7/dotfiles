set nocompatible      " Nécessaire
filetype off          " Nécessaire

" Ajout de Vundle au runtime path et initialisation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" On indique à Vundle de s'auto-gérer :)
" Plugin 'gmarik/Vundle.vim'  " Nécessaire

"
" C'est ici que vous allez placer la liste des plugins que Vundle doit gérer
"
Plugin 'itchyny/lightline.vim'
Plugin 'lucidstack/ctrlp-mpc.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'c.vim'
Plugin 'reedes/vim-pencil' " Super-powered writing things
Plugin 'tpope/vim-abolish' " Fancy abbreviation replacements
Plugin 'junegunn/limelight.vim' " Highlights only active paragraph
Plugin 'junegunn/goyo.vim' " Full screen writing mode
Plugin 'reedes/vim-lexical' " Better spellcheck mappings
Plugin 'reedes/vim-litecorrect' " Better autocorrections
Plugin 'reedes/vim-textobj-sentence' " Treat sentences as text objects
Plugin 'reedes/vim-wordy' " Weasel words and passive voice
Plugin 'ying17zi/vim-live-latex-preview'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'stevearc/vim-arduino'
Plugin 'cespare/vim-toml'
Plugin 'StanAngeloff/php.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'tpope/vim-surround'

" themes
Plugin 'wmvanvliet/vim-blackboard'
Plugin 'ntk148v/vim-horizon'
"Plugin 'vim-airline/vim-airline-themes'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'fatih/vim-go'

Plugin 'neoclide/coc.nvim'

  augroup pencil
   autocmd!
"   autocmd filetype markdown,mkd call pencil#init()
"	\ | call lexical#init()
"	\ | call litecorrect#init()
"	\ | setl spell spl=fr fdl=4 noru nonu nornu
"	\ | setl fdo+=search
  augroup END
 " Pencil / Writing Controls {{{
   let g:pencil#wrapModeDefault = 'soft'
   let g:pencil#textwidth = 74
   let g:pencil#joinspaces = 0
   let g:pencil#cursorwrap = 1
   let g:pencil#conceallevel = 3
   let g:pencil#concealcursor = 'c'
   let g:pencil#softDetectSample = 20
   let g:pencil#softDetectThreshold = 130
 " }}}


call vundle#end()            " Nécessaire
filetype plugin indent on    " Nécessaire

" binds
" map &lt;F8&gt; :w &lt;CR&gt;  :!clear && gcc %  &lt;CR&gt; 
" map F9 :w && :!gcc -o % && !./%
map <C-F8> :w <CR> :!gcc % -o %<; ./%< <CR>
nmap <F8> :TagbarToggle<CR>
map <F9> :w && :make <CR>
map <F5> :syntax on <CR>
map <F6> :syntax off <CR>
map <F7> :%!python -m json.tool <CR>
map <F10> :setlocal spell spelllang=fr <CR>
map <F12> :set nospell <CR>
map <C-t> :Files <CR>
map <C-i> :History <CR>


" automap of C-K
let extension = expand('%:e')
:set ignorecase
if extension == "go"
	map <C-K>  :GoRun <CR>
elseif extension == "md"
	map <C-K> :Pandoc <CR>
elseif extension == "sh"
	map <C-K> :!bash %:p<CR>
elseif extension == "py"
	nnoremap <buffer> <C-K> :exec '!python' shellescape(@%, 1)<cr>
else
	map <C-K> :make <CR>
endif


syntax on
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
" pathogen
execute pathogen#infect()
" auto spellcheck
" :setlocal spell spelllang=fr
colorscheme blackboard

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

let g:coc_node_path = "/usr/bin/node"

" fzf
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

:set nospell
:set number

if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
let g:airline_powerline_fonts = 1
set ruler
set t_Co=256
set undodir=~/.vim/undodir
