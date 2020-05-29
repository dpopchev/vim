" twiggle with gruvbox contrast settings, available are hard, soft and medium
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'medium'
" manually specify background color -- available are dark and light
set background=light

let colorscheme_def = "gruvbox"         " set default colorscheme
let colorscheme_fallback = "industry"   " set fallback colorscheme

" try setting the default colorscheme
" if it fails try the fallback one
try
    exe "colorscheme " . colorscheme_def
catch /^Vim\%((\a\+)\)\=:E185/
    :call EchoWARN("colorscheme not found " . colorscheme_def)
    :call EchoWARN("will try with fallback: " . colorscheme_fallback)
    exe "colorscheme " . colorscheme_fallback
endtry

" optional if different type of numbering is preferred in different mode
"augroup ChaneNumberingInsertMode
    "autocmd!
    "autocmd InsertEnter * :set number
    "autocmd InsertLeave * :set relativenumber
"augroup END

set showcmd             " show command in bottom bar
set wildmenu            " display command line tab complete options as a menu
set noruler             " do not display cursor position
set laststatus=2        " always display status line
set noerrorbells	    " disable beep on erros
set novisualbell		" disable flash the screen instead of beeping on errors
set title 		        " set window title to opened file
set showmode		    " show current mode
set tabpagemax=50       " maxumum number of pages opened from the cmd line
set mouse=n             " enable mouse only in normal mode

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" time out length on mapping and key codes in that order
set timeout timeoutlen=200 ttimeoutlen=100

"set autoread            " automatically re-read files
set backspace=2         " backspace fix, research
set confirm             " display confirm dialog when closing an unsaved file
"set hidden              " hide files in the background instead of closing
set history=500         " increase undo limit

" function to advanced make of the currently open file
" TODO work in prgress
"function CompileFile()
"    " attempt for an advanced vim make
"    " if a makefile is present in $CWD
"    " it will check if the filename is a part of a recipe
"    " or if the extension is part of a general dependency
"    " it will return the case with a single match, deducing that this is the
"    " simplest and thus most proper desire of the device behind the keyboard
"
"    " check for makefile in current directory
"    if !filereadable("makefile")
"        echom "No makefile in current directory"
"        return 0
"    endif
"
"    " amount of recipes in which the name of the current file is a target
"    let amountName = system("grep -c ^".expand("%:r")." makefile")
"
"    " amount of recipes in which the extension of the current file is a dependence
"    let amountExtension = system("grep -c ".expand("%:e")." makefile")
"
"    " if current file is a target in an single recipe, use it to build
"    if amountName == 1
"        echom "Found recipe in which ".expand("%:r")." is a dependency"
"
"        let targetFile = system("grep ^".expand("%:r")." makefile | sed 's/:.*//'")
"
"        return targetFile
"    endif
"
""    echo system("grep -c ".fileExtension." makefile")
"
"    return 1
"endfunction
"" update the makefile
"noremap <F4> :o makefile<CR>
"" run single file
"noremap <F5> :call CompileFile()<bar>copen<bar>redraw<CR>
""noremap <F5> :w<bar>make run<bar>redraw<CR>
"noremap <F7> :w<bar>make build<bar>redraw<CR>
"noremap <F10> :w<bar>make all<bar>redraw<CR>
