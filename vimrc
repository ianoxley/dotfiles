set nocompatible

syntax on
set encoding=utf-8
set showcmd
filetype plugin indent on

let mapleader = ","
:let maplocalleader = ","

if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

if !has('gui_running')
  set t_Co=256
endif

"" Line nos
"" set number turn off if using relativenumber
set pastetoggle=<F5>
set relativenumber
set number


"" Whitespace
set wrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set textwidth=79
set formatoptions=qrn1
set colorcolumn=120

set wildmenu
set wildmode=list:longest

"" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
"" Disable search highlighting
nnoremap <leader><space> :noh<cr>

"" leader mappings from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#using-the-leader
"" Sort CSS selectors
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
"" Reselect text after paste
nnoremap <leader>v V`]
"" Underline with = or -
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

"" Font and colours
" set Vim-specific sequences for RGB colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors
set guifont=Anonymous\ Pro:h16
set background=dark
colorscheme solarized8

"" tmp, backup, and undo files
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/undo
set undofile
set undolevels=1000

set laststatus=2
" set statusline=%{fugitive#statusline()}\ %f\ (%p%%) "tail of the filename

"" use my bash login profile when using :shell
set shell=/usr/local/bin/zsh

set mouse=a

"" Pathogen
execute pathogen#infect()

"" NERDTree
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

"" Custom keybindings
inoremap jk <Esc>

"" Find / replace the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

"" Enable word wrapping in a single command a la http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

"" Open todo.txt files in todo mode
au BufRead,BufNewFile todo.txt set filetype=xml
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.less set filetype=css
au BufRead,BufNewFile *.ui set filetype=ruby

"" Open .config files as XML
au BufRead,BufNewFile *.config set filetype=xml

"" Python settings from http://www.jedberg.net/jedberg_vimrc

""
"" Python specific settings
""

" Full Python syntax highlighting, when combined with 'syntax on' above
let python_highlight_all=1

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py set tabstop=4

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set expandtab

" Make backspacing easier
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py set textwidth=79

" Use UNIX (\n) line endings.
au BufRead,BufNewFile *.py set fileformat=unix

" The following line sets the smartindent mode for *.py files. It means that
" after typing lines which start with any of the keywords in the list (ie.
" def, class, if, etc) the next line will automatically indent itself to the
" next level of indentation:
au BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Remove any extra whitespace from the ends of lines when saving a file
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" Expression register
imap <C-i>u <C-r>=system(expand('~/vimconfig/scripts/insert_uuid.py'))<cr>

" Git commit messages
au FileType gitcommit setlocal spell tw=72

" Insert date and / or time
inoremap <F5> <C-R>=strftime('%Y-%m-%d')<CR>
inoremap <C-i>t <C-R>=strftime('%H:%Mn')<CR>
inoremap <C-i>s <C-R>=strftime('%Y%m%d%H%M%S')<CR>

" ALE settings
let g:ale_linters = {
\   'cs': ['OmniSharp'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" This is regular lightline configuration, we just added 
" 'linter_warnings', 'linter_errors' and 'linter_ok' to
" the active right panel. Feel free to move it anywhere.
" `component_expand' and `component_type' are required.
"
" For more info on how this works, see lightline documentation.
let g:lightline = {
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok'
      \ },
      \ }

autocmd User ALELint call lightline#update()

" ale + lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d --', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d >>', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

" No need to show the mode as it is shown via lightline
set noshowmode

" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#statusline'
"       \ },
"       \ }

let g:lightline = {}
let g:lightline.colorscheme = 'wombat'

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.component_function = {
      \     'gitbranch': 'fugitive#head'
      \ }

let g:lightline.active = { 'right': [
      \   [
      \     'linter_checking',
      \     'linter_errors',
      \     'linter_warnings',
      \     'linter_ok'
      \   ],
      \   [ 'lineinfo' ],
      \   [ 'percent' ],
      \   [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ }

let g:lightline.active.left = [[ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ]]

let g:ale_set_highlights = 0

" fzf
set rtp+=/usr/local/opt/fzf
set tags+=./.git/tags
nmap <leader>r :Buffers<CR>
nmap <leader>f :Files<CR>
nmap <leader>t :Tags<CR>

" matchit
runtime macros/matchit.vim

" Omnisharp
let g:OmniSharp_server_stdio = 1

let g:OmniSharp_server_path = '/Users/ian.oxley/.vscode/extensions/ms-vscode.csharp-1.20.0/.omnisharp/1.32.20/run'

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

let g:OmniSharp_highlight_types = 2

let g:OmniSharp_selector_ui = 'fzf' 

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Use <Enter> to select from the autocomplete menu
" inoremap <expr> <CR> pumvisible() ? "<C-y>" : "\<CR>"
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" nnoremap <leader>db :new<Bar>0r!dotnet build<CR>
"
" inoremap <expr> <C-n> pumvisible() ? "<C-n>" : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : "<CR>"'
" inoremap <expr> <M-,> pumvisible() ? "<C-n>" : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : "<CR>"'

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

  " Finds members in the current buffer
  autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

  autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
  autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
  autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

  " Navigate up and down by method/property/field
  autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
  autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

au BufRead,BufNewFile *.cs set tabstop=4

" C#: 4 spaces
au BufRead,BufNewFile *.cs set shiftwidth=4
au BufRead,BufNewFile *.cs set expandtab

" Make backspacing easier
au BufRead,BufNewFile *.cs set softtabstop=4

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" vimwiki encryption
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.wiki\)\='

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" tmux
nmap \r :!tmux send-keys -t 0:0.1 C-p C-j <CR><CR>
