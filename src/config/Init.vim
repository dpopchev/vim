" Set 'nocompatible', if not already set to ward off unexpected things that
" your distro might have made, as well as sanely reset options when
" re-sourcing .vimrc It overrides options, so preferably set it at the beginning
if &compatible
    set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
    set nocompatible
silent! endwhile

" enable plugin, detection and indentation on a file; for more info:
" check :h filetype

" NOTE: this overrides formatoptions
filetype plugin indent on

" NOTE: https://vim.fandom.com/wiki/Omni_completion
set omnifunc=syntaxcomplete#Complete

" optionally change the default leader key '\'
" let mapleader=','

" see https://medium.com/usevim/securing-vim-d6a12496fec8
set nomodeline          " improve security by ignoring mode lines
                        " and using use vimrc instead

" Enable syntax highlighting
" There is a difference between on and enable
" source: https://stackoverflow.com/questions/33380451/is-there-a-difference-between-syntax-on-and-syntax-enable-in-vimscript
if !exists("g:syntax_on")
    syntax enable
endif

" put all auxiliary files in the first existing dir from following list
let auxDump=[ $HOME."/.vim/tmp/", $HOME."/.tmp/", $HOME."/tmp/", "/tmp/" ]
let &backupdir=join(auxDump, ",")  " store backup files
let &dir=join(auxDump, ",")        " store swap files
let &undodir=join(auxDump, ",")    " store undo files

" general purpose function to echo warnings from mine functions
function! EchoWARN(WARN)
    let WARN_msg = toupper(a:WARN)
    let WARN_prefix = " < < ==== "
    let WARN_suffix = " ==== > > "

    echom join([WARN_prefix, WARN_msg, WARN_suffix], " ")

    return 0
endfunction

" this is a internal keybinding, which searches for help but I do not need it
map <S-k> <Nop>
