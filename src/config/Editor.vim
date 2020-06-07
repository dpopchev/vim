" EDITOR {{{
set encoding=utf-8      " default encoding if none specified for the file

let textThreshold=80                " set desired text width
let &textwidth=textThreshold        " maximum allowed width of a line
let &colorcolumn=textThreshold+1    " set text length marker

set nowrap                          " disable line wrap
set linebreak                       " avoid wrapping a line in middle of a word
set display=lastline                " display as much as possible of a line
                                    " if not possible it will end with @@@

set scrolloff=5         " amount of lines to keep above and below cursor
set sidescrolloff=5     " amount of screen columns to keep to the right

set number              " show line numbers
set relativenumber      " show line numbers relative to current line

set showmatch           " highlight matching brackets
" extend default match pairs
set matchpairs+=<:>
"set matchtime=5        " tenths of a second to show matching bracket parent
                        " default is 5

set cursorline          " highlight current line
" if colorscheme is giving underline cursorline uncomment the below
" augroup HacForCursorlineWhenUnavailable
"     autocmd!
"     autocmd WinEnter * setlocal cursorline
"     autocmd WinLeave * setlocal nocursorline
" augroup END
"hi cursorline cterm=none term=none
"highlight CursorLine guibg=#303000 ctermbg=233
" better highlight in visual mode
" hi Visual cterm=reverse ctermfg=NONE

" filetype plugins are overriding formatoptions, which is annoying;
" I want the one below applied for all filetypes;
" source: https://stackoverflow.com/questions/28375119/override-options-set-by-ftplugins-in-vim
augroup ForceOverwriteFO
    autocmd!
    autocmd FileType * setlocal formatoptions=tcrqbj
augroup END

function! CopyToClipboard()
    " based on https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript/1534347#1534347

    " if vim is supporting clipboard, yank visually selected text to "+
    " otherwise inform the user the lack of such functionality
    if has('clipboard')
        normal! "+y
    else
        call EchoWARN("check vim clipboard support")
    endif
endfunction

" source https://vim.fandom.com/wiki/Accessing_the_system_clipboard
" check if clipboard supported in vim installation by
" :echo has('clipboard') OR in terminal: vim --version | grep clipboard
" to paste, enter paste mode(:set invpaste) and Ctrl+Shift+V
vnoremap <C-c> :call CopyToClipboard()<cr>

" uncomment if you want to  sent all yanked text to Xserver clipboard automatically
"set clipboard=unnamed

" strange backspace problem prevention; choose one
" source https://vim.fandom.com/wiki/Backspace_and_delete_problems
" set backspace=2 " make backspace work like most other programs
set backspace=indent,eol,start " alternative formulation

set autoread    " automatically re-read file; default is off
set confirm     " display confirm dialog when closing unsaved file
"set hidden      " hide files in the background instead of closing; default off
set history=500 " increase undo history

" print caps log warning if capital U is pressed as false undo warning
nnoremap U :call EchoWARN("check caps lock")<CR>

" quit without saving
nnoremap <silent><leader>q :q<cr>

" prevent cursor jumping when :w
let g:syntastic_auto_jump = 0
" save file
nnoremap <silent><leader>w :w<cr>

" toggle paste mode
nnoremap <leader>p :set invpaste<cr>

" visual shifting
vnoremap < <gv
vnoremap > >gv

"set list listchars=tab:»-,trail:·,extends:»,precedes:«
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" press 'q' to exit help buffer
augroup QtoExitHelpBuffer
    autocmd!
    autocmd FileType help noremap <buffer>q :q<cr>
augroup END

" Clean up before saving {{{
function! TrimTrailingSpaces()
    " trim the trailing spaces on each line
    " and make sure the cursor stays at the same position

    let save_pos = getpos(".")
    " one way
    " %s/\S\zs\s\+$//e
    " or
    %s/\s\+$//e
    call setpos('.', save_pos)

    return 0
endfunction

function! TrimTrailingBlankLines()
    " trim the trailing spaces on each line
    " and make sure the cursor stays at the same position

    let save_pos = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_pos)

    return 0
endfunction

" trim trailing spaces and blank lines at end of the file
augroup TrimTrailingSpacesBlankLines
    autocmd!
    autocmd BufWritePre * call TrimTrailingSpaces()
    autocmd BufWritePre * call TrimTrailingBlankLines()
augroup END
" }}} end clean up before saving

" Always highlight from file start to prevent syntax highlight not be applied
augroup HighlightFromFileStart
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" source https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
" single Ctrl-j/k deletes blank line below/above, and double -- inserts them.
" nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><C-j><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><C-k><C-k>  :set paste<CR>m`O<Esc>``:set nopaste<CR>
" alternative approach
function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction

function! AddEmptyLineAbove()
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, "")
  if winline() != winheight(0)
    silent normal! <C-e>
  end
  let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
  if line(".") == line("$")
    return
  end
  let l:line = getline(line(".") + 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .+1d
    ''
    call cursor(line("."), l:colsave)
  end
endfunction

function! DelEmptyLineAbove()
  if line(".") == 1
    return
  end
  let l:line = getline(line(".") - 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .-1d
    silent normal! <C-y>
    call cursor(line("."), l:colsave)
  end
endfunction

noremap <silent> <C-j> :call DelEmptyLineBelow()<CR>
noremap <silent> <C-k> :call DelEmptyLineAbove()<CR>
noremap <silent> <C-j><C-j> :call AddEmptyLineBelow()<CR>
noremap <silent> <C-k><C-k> :call AddEmptyLineAbove()<CR>
" }}} end EDITOR

" FOLDING {{{
" folding cheat sheet
"   zf#j/k      create fold from cursor down/up # number of lines
"   zj/k        move cursor to next fold down/up
"   zo/O        open fold/all folds at the cursor

set foldenable            " enable folding
set foldlevelstart=10     " starting fold level when buffer is opened
                          " it ensures only very nested blocks of code are
                          " folded when opening a buffer
set foldmethod=indent     " fold is based on indent level

" let space toggle a folding
nnoremap <leader><space> za
" }}} end FOLDING

" COMPLETION {{{
" see https://vim.fandom.com/wiki/Omni_completion
set omnifunc=syntaxcomplete#Complete

" make vim competition popup more intuitive
" source http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

" sample mapping configuration for pop up menu navigation {{{
" " enter key selects the highlighted option as <C-y> does
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Making navigating in autocompletion menu work with jk
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
" keep menu item always highlighted by simulating <Up>/<Down> on pu visible
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <C-p> pumvisible() ? '<C-p>' : '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'
" }}} end of pop up menu navigation set

" alternative setup for navigation in the completion menu
" source https://vim.fandom.com/wiki/Improve_completion_popup_menu
inoremap <expr> <Esc> (pumvisible())?("\<C-e>"):("\<Esc>")
inoremap <expr> <CR> (pumvisible())?("\<C-y>"):("\<CR>")
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <C-d> (pumvisible())?("\<PageDown>\<C-p>\<C-n>"):("\<C-d>")
inoremap <expr> <C-u> (pumvisible())?("\<PageUp>\<C-p>\<C-n>"):("\<C-u>")

" }}}

" SPELL {{{
"   move to misspelled words via            ]s and [s
"   change word under cursor via            z=
"   add word under cursor to dictionary     zg
"   remove word from dictionary via         zw
set spell           " enable spellcheck
set spelllang=en    " spellcheck language
"set spellfile=...  " place to store additional words
"set complete+=kspell   include spell check suggestions in completion menu
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellCap
hi SpellCap cterm=none
hi clear SpellLocal
hi SpellLocal cterm=underline
" }}}

" INDENT {{{
" resource https://vim.fandom.com/wiki/Indenting_source_code

" set amount of spaces for indentation
let indent=4

" indentation without hard tabs
set expandtab           " convert tabs to 'softtabstop' amount of spaces
let &shiftwidth=indent  " affects when pressing >>, << or == and automatic indentation
let &softtabstop=indent " affects when pressing <TAB> or <BS> keys
                        " for indentation without hard tabs it should be set to 'shiftwidth'
let &tabstop=indent            " reset 'tabstop'
"set tabstop&            " reset 'tabstop'

" indentation purely hard tabs
"let &shiftwidthh=indent
"let &tabstop=indent     " change width of TAB character
"set expandtab&
"set softtabstop&

" indentation with mixed tabs and spaces
"let &shiftwidth=indent
"let &softtabstop=indent
"set expandtab&
"set tabstop&

" indentation method
set autoindent          " copy the indentation from the previus line
                                        " does not interfere with other indentation settings
"set smartindent        " automatically insert one extra level of indentation in some cases
                                        " does interfere with other indentation settings
"set cindent            " as smartindent, but more strict when comes to syntax
                                        " does interfere with other indentation settings

set shiftround          " when shifting lines, round the indentation to the nearest
                    " multiple of shiftwidht

"set smarttab           " insert tabstop number of spaces when tab

" force set expandtab; use case is if filetype plugin has been executed earlier
"augroup ForceExpandtab
    "autocmd!
    "autocmd FileType * setlocal expandtab " convert tabs to spaces
"augroup END

" pseudo indentation guidelines accomplished by highlighting the cursorcolumn
"set cursorcolumn
" }}} INDENT end

" SEARCH {{{
" resource https://vim.fandom.com/wiki/Searching
set hlsearch	" enable search highlighting
set incsearch	" incremental search that shows partial matches
set ignorecase	" ignore case when searching
set smartcase	" automatically switch to case-sensitive when search
                " query contains an uppercase letter
                " NOTE: applies only when typing
                " NOTE: not when '*' or '#' or 'gd'
set magic       " for regular expressions turn magic on

" clear search highlight
nnoremap <leader>/ :let @/=""<cr>
" }}} SEARCH

" vimdiff {{{
if &diff
    " diff mode ignore white spaces
    set diffopt+=iwhite

    " put/obtain line cursor is on
    nnoremap <silent> <leader>dp V:diffput<cr>
    nnoremap <silent> <leader>do V:diffget<cr>

    " undo the other, inactive window
    nnoremap <silent> <leader>du :wincmd w<cr>:normal u<cr>:wincmd w<cr>

    " recalculate differences
    nnoremap <silent> <leader>dr :diffupdate<cr>
endif
" }}} end vimdiff
