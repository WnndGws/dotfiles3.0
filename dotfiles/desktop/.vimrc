" ------------------------------ "
" >>>>> PRECURSOR SETTINGS <<<<< "
" ------------------------------ "

set title
"Set the window’s title, reflecting the file currently being edited.

set nocompatible
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

" ----------------------------- "
" >>>>> TEMPLATE SETTINGS <<<<< "
" ----------------------------- "

if has('autocmd')
  augroup templates
    autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton_docs.tex
    autocmd BufNewFile *.service 0r ~/.vim/templates/skeleton.service
    autocmd BufNewFile *.timer 0r ~/.vim/templates/skeleton.timer
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *soln.md 0r ~/.vim/templates/skeleton_soln.md
    autocmd BufNewFile *beamer*.md 0r ~/.vim/templates/skeleton_beamer.md
    autocmd BufNewFile README.md 0r ~/.vim/templates/skeleton_readme.md
    autocmd BufNewFile CONTRIBUTING.md 0r ~/.vim/templates/skeleton_contributing.md
  augroup END
endif

augroup markdown
  autocmd FileType markdown let g:indentLine_enabled=0
augroup END

"Navigating with guides
"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

""""LATEX
if has('autocmd')
  augroup latex
    autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
    autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
    autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
    autocmd FileType tex inoremap ;tc \textcite{}<++><Esc>T{i
    autocmd FileType tex inoremap ;pc \parencite{}<++><Esc>T{i
    autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Tab>\end{enumerate}<Enter><Tab><++><Esc>2kA<Enter><Tab>\item<Space>
    autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Tab>\end{itemize}<Enter><Tab><++><Esc>2kA<Enter><Tab>\item<Space>
    autocmd FileType tex inoremap ;li \item<Space>
    autocmd FileType tex inoremap ;chap \chapter{}<Enter><Tab><++><Esc>-f}i
    autocmd FileType tex inoremap ;sec \section{}<Enter><Tab><++><Esc>-f}i
    autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Tab><++><Esc>-f}i
    autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Tab><++><Esc>-f}i
    autocmd FileType tex inoremap ;ques \begin{questions}<Enter><Tab>\end{questions}<Enter><Tab><++><Esc>2kA<Enter><Tab>\newquestion{}<Space>
    autocmd FileType tex inoremap ;part \begin{parts}<Enter><Tab>\end{parts}<Enter><Tab><++><Esc>2kA<Enter><Tab>\newpart{}<Space>
  augroup END
endif

" ---------------------------- "
" >>>>> GENERAL SETTINGS <<<<< "
" ---------------------------- "
"au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
"au InsertLeave * let &updatetime=updaterestore
"au CursorHoldI * call ExitInsertMode()
" automatically leave insert mode after 'updatetime' milliseconds of inaction
" set 'updatetime' to 5 seconds when in insert mode

" Vertically center document when entering insert mode
augroup niceties
    autocmd InsertEnter * norm zz
augroup END

set autoindent
"New lines inherit the indentation of previous lines

set formatoptions+=j
"Proper line join removes comment flags
set formatoptions-=ro
"Dont insert comment leader in new line

set clipboard+=unnamedplus
"set relativenumber
"Shows relative line numbers so math doesnt need to be done

set number
"Line numbers are good

set cursorline
"Sets cursorline

set backspace=indent,eol,start
"Allow backspace in insert mode

set history=1000
"Store lots of :cmdline history

set showcmd
"Show incomplete cmds down the bottom

set showmode
"Show current mode down the bottom

set guicursor=a:blinkon0
"Disable cursor blink

set autoread
"Reload files changed outside vim

set timeoutlen=1000
set ttimeoutlen=10
set showmatch

set mousehide
" Hide the mouse cursor while typing

scriptencoding utf-8
set iskeyword-=.
" '.' is an end of word designator
set iskeyword-="
" '"' is an end of word designator
set iskeyword-=-
" '-' is an end of word designator
set iskeyword-=_
" '_' is an end of word designator

set noundofile

set undolevels=1000
" Maximum number of changes that can be undone

set undoreload=10000
" Maximum number lines to save for undo on a buffer reload

set ignorecase
" Case insensitive search

set smartcase
" Case sensitive when uc present

"set spell spelllang=en_au
" Uses spellcheck in vim

set splitright
" Puts new vsplit windows to the right of the current

set splitbelow
" Puts new split windows to the bottom of the current

set hidden
" Buffers exist in the background

set noswapfile
set nobackup
set nowritebackup

set smarttab
"Insert “tabstop” number of spaces when the “tab” key is pressed.
set shiftwidth=4
set shiftround
"When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set softtabstop=4
set tabstop=4
set expandtab

set list listchars=tab:\ \ ,trail:·
" Display tabs and trailing spaces visually

set wrap
"Do wrap lines

set linebreak
"Avoid wrapping a line in the middle of a word.

set nofoldenable
set foldnestmax=3
"Only fold up to three nested levels.
set foldmethod=indent
"Allow me to fold by my settings

set lazyredraw
"Don’t update screen during macro and script execution.

set wildmenu
"Display command line’s tab complete options as a menu.

" --------------------------- "
" >>>>> KEYMAP SETTINGS <<<<< "
" --------------------------- "
let mapleader = ','

map <leader>sc :setlocal spell!<cr>
"Pressing :sc will toggle and untoggle spell checking

map <leader>sa <Esc>]szg
"Spell add word to dictionary
" ]s is go to next spelling error
" zg adds to dictionary

map <leader>cs <Esc>]s1z=
" leader cs corrects spelling by choosing the first suggestion
" 1z= is choose first suggestion
" ]s is go to next spelling error

map <leader>ln :execute "normal! i" . ( line("."))<cr>
"Insert the line number

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"Hit v to visually select character, again to select word, again to select paragraph

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"split navigations

nnoremap <Leader>w :w<CR>
" Save file using leader w

nnoremap <Leader>l :vsp<CR>
nnoremap <Leader>j :sp<CR>
" Split vim using leader keys

nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {
"Remaps backspace to move back a paragraph

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }
"Remaps enter to move forward a paragraph

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
"using the PRIMARY clipboard * with the y and p commands

nnoremap gl $
nnoremap gh 0

" --------------------------- "
" >>>>> SWITCH SETTINGS <<<<< "
" --------------------------- "
syntax enable
" Turn on syntax highlighting

" --------------------- "
" >>>>> FUNCTIONS <<<<< "
" --------------------- "
cmap w!! %!sudo tee > /dev/null %
"Stolen from CIA Hack, save file you forgot to open as root

noremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" ----------------------- "
" >>>>> VIM PLUGINS <<<<< "
" ----------------------- "
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/w0rp/ale.git' "linter
" Install shellcheck, vint, python-pylint from aur
Plug 'https://github.com/dkarter/bullets.vim' "plugins for automated bullet lists
Plug 'https://github.com/junegunn/fzf.vim.git' "fuzzyfind
Plug 'https://github.com/mattn/gist-vim.git' "gists in vim
Plug 'https://github.com/Yggdroot/indentLine.git' "better indenting
Plug 'https://github.com/haya14busa/incsearch.vim.git' "improved incrimental searching
Plug 'https://github.com/wellle/targets.vim.git' "better targeting
Plug 'https://github.com/chiedo/vim-case-convert.git' "convert between cases
Plug 'https://github.com/terryma/vim-expand-region.git' "expand region
Plug 'https://github.com/jamessan/vim-gnupg.git' "gnupg
Plug 'https://github.com/jez/vim-superman.git' "use man pages
Plug 'https://github.com/reedes/vim-pencil.git' "pencil
Plug 'https://github.com/sheerun/vim-polyglot.git' "language pack
Plug 'https://github.com/chrisbra/csv.vim' "polyglot-csv
Plug 'https://github.com/LaTeX-Box-Team/LaTeX-Box' "polyglot-latex
Plug 'https://github.com/vim-python/python-syntax' "polyglot-python
Plug 'https://github.com/rust-lang/rust.vim' "polyglot-rust
Plug 'https://github.com/lervag/vimtex.git' "use latex
Plug 'https://github.com/dhruvasagar/vim-table-mode.git' "tables in vim
Plug 'https://github.com/mattn/webapi-vim.git' "webapi for vim
Plug 'https://github.com/shime/vim-livedown.git' "need for md preview
Plug 'https://github.com/sirver/ultisnips' "Ultisnips is the completion engine that reads vim-snippets
Plug 'https://github.com/honza/vim-snippets' "Read by ultisnips for completions
"Need YouCompleteMe for a nice popup interface for ultisnips
"Install vim-youcompleteme-git from aur
Plug 'https://github.com/ervandew/supertab' "Need SuperTab to allow YouCompleteMe selection to expand
call plug#end()

"------------------------"
" ALE
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_list_vertical = 1

let g:ale_linters = {'latex': ['redpen', 'chktex'], 'python': ['pylint'], 'vim': ['vint'], 'zsh': ['shellcheck']}
let g:ale_fixers = {'latex': ['redpen', 'chktex'], 'python': ['yapf'], 'zsh': ['shellcheck']}

"------------------------"
" EMMET
vmap <Leader>h <c-y>,
" Enables emmit

vmap <Leader>hc <c-y>/
" Comments out the selected html
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL

"------------------------"
" GISTS
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_update_on_write = 1

nnoremap <Leader>g :Gist
" Save file using leader w

"------------------------"
" PYTHON MUMBOJUMBO
let python_highlight_all=1

"autocmd BufWritePost *.py :term ipython %:p
"Run ipython everytime save python file

"------------------------"
" VIMTEX
filetype plugin indent on
set grepprg=grep\ -nH\ $*

let g:tex_flavor = 'latex'
let g:vimtex_enabled=1
let g:vimtex_compiler_method='latexmk'
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:tex_conceal = ''
let g:polyglot_disabled = ['latex']


" Vimtex mappings

"let g:livepreview_previewer = 'zathura'

"nnoremap <leader>vtc :VimtexCompile
"nnoremap <leader>vtr :VimtexReload
"nnoremap <leader>vtv :VimtexView
"" Vimtex mappings

"" Compile on initialization, cleanup on quit
"augroup vimtex_event_1
  "au!
  "au User VimtexEventQuit     call vimtex#compiler#clean(0)
  ""au User VimtexEventInitPost call vimtex#compiler#compile()
"augroup END

"" Close viewers on quit
"function! CloseViewers()
  "if executable('xdotool') && exists('b:vimtex')
      ""\ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
    "call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
  "endif
"endfunction

"augroup vimtex_event_2
  "au!
  "au User VimtexEventQuit call CloseViewers()
"augroup END

"------------------------"
" NEOCOMPLETE
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Tab completion

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
    \ '\v\\%('
    \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|%(include%(only)?|input)\s*\{[^}]*'
    \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|\a*'
    \ . ')'
 
"------------------------"
" VIMCASE
map <Leader>stc :SnakeToCamel
map <Leader>cth :CamelToHyphen
map <Leader>cts :CamelToSnake
map <Leader>htc :HyphenToCamel
map <Leader>hts :HyphenToSnake
map <Leader>sth :SnakeToHyphen

" ----------------------"
" SOLARIZED COLOURS

"set termguicolors
"set background=dark
"colorscheme solarized8
" ----------------------"
" FZF
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ----------------------"
" VIM-PENCIL
"autocmd FileType * call pencil#init({'wrap': 'soft'})

" ----------------------"
" INC-SEARCH
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" ----------------------"
" VIM-MARKDOWN
" pandoc , markdown
command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nmap <Leader>md :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf % && mupdf /tmp/vim-pandoc-out.pdf &<cr>

" ----------------------"
" ULTISNIPS
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', 'J']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>', 'K']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
