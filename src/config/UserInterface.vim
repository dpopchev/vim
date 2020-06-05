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
set timeout timeoutlen=500 ttimeoutlen=500

"set autoread            " automatically re-read files
"set hidden              " hide files in the background instead of closing
