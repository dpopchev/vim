set encoding=utf-8      " default encoding if none specified for the file

let textThreshold=80                " set desired text width
let &textwidth=textThreshold        " maximum allowed width of a line
let &colorcolumn=textThreshold+1    " set text length marker

" toggle cheatsheet
set foldenable            " enable folding
set foldlevelstart=10     " starting fold level when buffer is opened
                          " it ensures only very nested blocks of code are
                          " folded when opening a buffer
set foldmethod=indent     " fold is based on indent level
" folding cheat sheet
"   zf#j/k      create fold from cursor down/up # number of lines
"   zj/k        move cursor to next fold down/up
"   zo/O        open fold/all folds at the cursor
" let space toggle a folding
nnoremap <leader><space> za

set nowrap                          " disable line wrap
set linebreak                       " avoid wrapping a lien in middle of a word
set display+=lastline               " try to show paragraphs last line

" filetype plugins are overriding formatoptions, which is annoying;
" I want the one below applied for all filetypes;
" source: https://stackoverflow.com/questions/28375119/override-options-set-by-ftplugins-in-vim
autocmd FileType * setlocal formatoptions=tcrqbj

set scrolloff=5         " amount of lines to keep above and below cursor
set sidescrolloff=5     " amount of screen columns to keep to the right

set number              " show line numbers
set relativenumber      " show line numbers relative to current line

set showmatch           " highlight matching brackets
set matchpairs+=":"     " add double quotes to be matched as pairs
set matchpairs+=':'     " add single quotes to be matched as pairs

"set matchtime=5        " tenths of a second to show matching bracket parent
                        " default is 5

set cursorline          " highlight current line
" if colorscheme is giving underline cursorline uncomment the below
"hi cursorline cterm=none term=none
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
"highlight CursorLine guibg=#303000 ctermbg=233

" make vim competition popup more intuitive
" source http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

" Making navigating in autocompletion menu work with jk
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" enter key selects the highlighted option as <C-y> does
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" keep menu item always highlighted by simulating <Up>/<Down> on pu visible
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
  \ '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'

" see link, more complicated and needs testing
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" source https://vim.fandom.com/wiki/Accessing_the_system_clipboard
" check if clipboard supported in vim installation by
" :echo has('clipboard') OR in terminal: vim --version | grep clipboard
" to paste, enter paste mode(:set invpaste) and Ctrl+Shift+V
vnoremap <C-c> :call CopyToClipboard()<cr>

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

" spell shortcuts
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

" better highlight in visual mode
hi Visual cterm=reverse ctermfg=NONE

" source https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines
" single Ctrl-j/k deletes blank line below/above, and double -- inserts them.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k><C-k>  :set paste<CR>m`O<Esc>``:set nopaste<CR>
" original delete mapping combination was with Alt key, but it is not
" recognized by some terminals; workaround is to use ^] as below (ESC key)
" in insert mode first C-v then A-j to produce the <A-j/k> key combination symbol
"nnoremap j :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" quit without saving
nnoremap <silent><leader>q :q<cr>

" save file
nnoremap <silent><leader>w :w<cr>
let g:syntastic_auto_jump = 0 " prevent cursor jumping when :w

" toggle all line numbers
"nnoremap <silent> <leader>n :set invnumber invrelativenumber<cr>

" delete without saving to register (sent it to 'black hole' register)
nnoremap <silent><leader>d "_d<cr>

" change with sending to 'black hole' register
nnoremap <silent><leader>c "_c<cr>

" toggle paste mode
nnoremap <leader>p :set invpaste<cr>

" visual shifting
vnoremap < <gv
vnoremap > >gv

" detect indent via DetectIndendt plugin
augroup DetectIndent
    autocmd!
    autocmd BufReadPost * :DetectIndent
augroup END
