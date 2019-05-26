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
Plugin 'dag/vim-fish' " fish shell syntax highlighting

" themes
Plugin 'wmvanvliet/vim-blackboard'
Plugin 'ntk148v/vim-horizon'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'fatih/vim-go'
Plugin 'wakatime/vim-wakatime'

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
map <F8> :w <CR> :!gcc % -o %<; ./%< <CR>
map <F9> :w && :make <CR>
map <F5> :syntax on <CR>
map <F6> :syntax off <CR>
map <F7> :%!python -m json.tool <CR>
map <F10> :setlocal spell spelllang=fr <CR>
map <F12> :set nospell <CR>
map <C-t> :Files <CR>
map <C-i> :History <CR>

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
