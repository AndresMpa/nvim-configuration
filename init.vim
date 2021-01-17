"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""NVIM SETTINGS"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
"""""""""""""""""""""""""""""""""""""LINES"""""""""""""""""""""""""""""""""""""

set sw=2		        " Replace tabs with X number of spaces
set number		      " Show the numbers on the left
set numberwidth=1	  " Set numbers width
set relativenumber	" It shows the current cursor line

"""""""""""""""""""""""""""""""""""""STYLE"""""""""""""""""""""""""""""""""""""

set ruler		        " It shows the bar down
set hidden          " It hides what is down on nvim commands
set showcmd		      " Show the commands you are using
set nobackup        " It can make coc work badly 
set showmatch		    " It shows the closing parentesis
set splitright      " Open new panes to the right
set cmdheight=1     " Better display for coc
set nowritebackup   " Neccessary for some coc servers
set encoding=utf-8	" Add characters
set updatetime=300  " Changing update time make coc works better

"""""""""""""""""""""""""""""""""""""MOUSE"""""""""""""""""""""""""""""""""""""

set title		          " It shows the file title
set mouse=a	  	      " It lets you use mous-e on the terminal
set clipboard=unnamed	" Keep what you copy on the clip-board

"""""""""""""""""""""""""""""""""""""STATUS"""""""""""""""""""""""""""""""""""""

set noshowmode  	                                                    " This space is needed
set laststatus=2	                                                    " Allways show your status
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P  " Status line for kite
set belloff+=ctrlg                                                    " if vim beeps during completion

"""""""""""""""""""""""""""""""""""""COMPLEOPT"""""""""""""""""""""""""""""""""""""

set completeopt+=noselect
set completeopt+=noinsert
set completeopt+=menuone

syntax enable		" Change the natural rgb


call plug#begin(expand('~/.config/nvim/plugged'))

"""""""""""""""""""""""""""""""""""""THEME"""""""""""""""""""""""""""""""""""""

" Bar
Plug 'ryanoasis/vim-devicons'                           " Icons for NERDTree
Plug 'vim-airline/vim-airline'                          " Bar theme
Plug 'vim-airline/vim-airline-themes'				            " Airline themes

" Nvim
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }	            " Nvim theme

"""""""""""""""""""""""""""""""""""""MOTION"""""""""""""""""""""""""""""""""""""

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " fzf install instructions
Plug 'christoomey/vim-tmux-navigator'				                        " Navigation between windows
Plug 'easymotion/vim-easymotion'						                        " Navigation in files
Plug 'haya14busa/incsearch.vim'							                        " Better way to look for words
Plug 'scrooloose/nerdtree'							                            " Navigation between files
Plug 'junegunn/fzf.vim'                                             " Better way to search files

""""""""""""""""""""""""""""""CODE HELPERS & SYNTAX""""""""""""""""""""""""""""""

Plug 'neoclide/coc.nvim', {'branch': 'release'}   " Text editing support
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'		                    " Syntax highligth for multiple languajes
Plug 'jiangmiao/auto-pairs'                       " Autocomplete parentesis
Plug 'marlonfan/coc-phpls'
Plug 'Yggdroot/indentLine'                        " Identation helper (It shows the identation of functions)
Plug 'tpope/vim-surround'                         " It helps to 'CRUD' parentesis, comillas and tags
Plug 'Shougo/echodoc.vim'                         " Shows functions definition
Plug 'tpope/vim-fugitive'                         " Support to git commands
Plug 'honza/vim-snippets'                         " Track the engine
Plug 'tpope/vim-rhubarb'                          " Browser support for fugitive.vim
Plug 'sirver/ultisnips'                           " Snippers for vim-snippers

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""PLUG SETTINGS"""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""STYLE""""""""""""""""""""""""""""""""""""""""

" vim-airline

let g:airline_theme = 'cool'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
   " Using powerline symbols, it changes some icons
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.paste = "\uE0CE"
  let g:airline_symbols.linenr = "\uE0CC"
  let g:airline#extensions#branch#prefix = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol = '⊘'
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol = "\uE0CF"
  let g:airline#extensions#tabline#left_alt_sep = ''
endif

" Nvim THEME
colorscheme gruvbox

let g:gruvbox_color_column='bg0'
let g:gruvbox_contrast_dark='hard'

""""""""""""""""""""""""""""""""""""""NAVIGATION""""""""""""""""""""""""""""""""""""""""

" incsearch 
let g:incsearch#auto_nohlsearch = 1 " Remove the highligth after search

" NERDTree
let NERDTreeMouseMode=1             " let you use the mouse
let NERDTreeQuitOnOpen=1            " quit nerdtree when you open a file
let NERDTreeShowHidden=1            " show files or dir hidden by '.'

" fzf
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'

""""""""""""""""""""""""""""""""""""""CODE HELPERS & SYNTAX""""""""""""""""""""""""""""""""""""""""

" kite
let g:kite_supported_languages = ['javascript', 'python']

" coc
"" Prettier, Emmet, HTML, CSS, Json, Sh, Rust, Ruby, R
let g:coc_global_extensions = ['coc-prettier', 'coc-emmet', 'coc-html', 'coc-css', 'coc-json', 'coc-sh', 'coc-rls', 'coc-solargraph', 'coc-r-lsp']

" indentline
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']

" Echodoc
let g:echodoc_enable_at_startup = 1

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""AUTOCMD""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto-close pop up helpers
autocmd CompleteDone * if !pumvisible() | pclose | endif

" coc
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""MAPPING""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "			" Setting the leader key to space

" Settings commands in normal mode

" easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

" NERDTree
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeToggle<CR>

" fzf
nmap <Leader>ff :Files<CR>
nmap <Leader>ft :Filetypes<CR>

" vim-fugitive (git support)
nmap <Leader>gii :Git init<CR>
nmap <Leader>gsh :Git show<CR>
nmap <Leader>gst :Git status<CR>
nmap <Leader>grv :Git remote -v<CR>
nmap <Leader>gaa :Git add --all<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gcam :Git commit -am<CR>
nmap <Leader>gra :Git remote --add<CR>
" Replace <oringin> <dev> to other branch if neccessary
nmap <Leader>gpl :Git pull origin dev<CR>
nmap <Leader>gps :Git push origin dev<CR>

" Kite
nmap <silent> <buffer> gK <Plug>(kite-docs)

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if &filetype == "javascript" || &filetype == "python"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Plug
nmap <Leader>pc :PlugClean<CR>
nmap <Leader>pi :PlugInstall<CR>

" Extras
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>h :ls<CR>
nmap <Leader>j :bnext<CR>
nmap <Leader>l :bdelete<CR>
nmap <Leader>k :bprevious<CR>
nmap <Leader>> 10<C-w>>
nmap <Leader>< 10<C-w><

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""TERMINAL"""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Function
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://zsh"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"

    startinsert!
  endif
endfunction
nmap <C-t> :call OpenTerminal()<CR>