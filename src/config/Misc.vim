"set complete-=i     " limit the files searched for auto-complted
"set lazyredraw      " dont update screen during macro and script execution
"set ttyfast         " improves redrawing on newer computers
set t_ut=            " fix highlight problem on win 10 wls
set t_BE=            " remove extra characters when shift+insert

" CTRLP {{{
" build in netwr quick configs and shortcuts
" create file tree in the current directory
"let g:netrw_browse_split = 2
"let g:vrfr_rg = 'true'
"let g:netrw_banner = 0
"let g:netrw_winsize = 25
"nnoremap <leader>t :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" lets use NERDtree plugin instead of build in file browser
nnoremap <leader>t :NERDTreeToggle<cr>
" in case I want to switch
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }}} end CTRLP

" NERDCommenter {{{
" quick mapping recap
"   <leader>ci  -- invert comments
"   <leader>cy  -- yank the lines and then comment them
"   <leader>c$  -- comment from cursor to EOL
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" in case of mixed selection NERD will nest the comments
nnoremap <leader>c :call NERDComment(0,"nested")<cr>
vnoremap <leader>c :call NERDComment(0,"nested")<cr>

" when we have nested comments we need specify the action
nnoremap <leader><leader>c :call NERDComment(0,"uncomment")<cr>
vnoremap <leader><leader>c :call NERDComment(0,"uncomment")<cr>

" add comment deliminter at EOL and enter insert mode after it
nnoremap <leader>ca :call NERDComment(0,"append")<cr>
vnoremap <leader>ca :call NERDComment(0,"append")<cr>

" }}} end NERDCommenter

" show/hide Undotree plugin
nnoremap <leader>u :UndotreeToggle<cr>

" vim-man {{{
" open man page under cursor in horizontal/vertical split
map <leader>mk <Plug>(Man)
map <leader>mv <Plug>(VMan)
" open man page for word under cursor in a horizontal split
" }}}

" CtrlP plugin {{{
" fuzzy search files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar*,*.rar     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}} end Ctrlp recommend options

" Rainbow plugin
" rainbow plugin brackets activate globally
let g:rainbow_active = 1

" syntastic {{{
" :lnxet and lprevious will go around the erros;
" get syntastic status with :SyntasticInfo
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap <leader>l :Errors<cr>
nnoremap <leader><leader>L :SyntasticCheck<cr>
nnoremap <leader><leader>LL :SyntasticToggleMode<cr>

" recommend
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" hide error list by default; show it with :Error
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let b:syntastic_mode="passive"

" change symbols if you want
" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" set which checker to be used with following syntax
" let g:syntastic_<filetype>_checkers = ['<checker-name>']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_sh_checkers = ['shellcheck']
" }}}

" buftabline {{{
set hidden
nnoremap [b :bnext<CR>
nnoremap ]b :bprev<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bb :ls<CR>
" }}}

" vim-surround {{{
" to change "" to '' do cs"'
" it works with tags cs'<q>
" also can do cst"
" to remove ds"
" to surround only a word, place cursor on it and ysiw]
" to wrap an entire line yss) or yss( to give spacing
" }}}

" tabular {{{
" to align w.r.t. = do :Tab /=
" to align w.r.t. : in nested json do :Tab/:
"   or to align, but exclude the : do :Tab /:\zs
" to align markdown table do :Tab/|

" align w.r.t. = or :
vnoremap <leader>= :norm gvy<Esc>:Tab/<C-r>"<cr>
" }}}

" vim signature {{{
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z
"
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer
"
" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
" m<BS>        Remove all markers<S-Insert>
" }}}

" asyncomplete {{{
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_buffer_clear_cache = 1


call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 500000,
    \  },
    \ }))

call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['c', 'cpp', 'html'],
    \ 'completor': function('asyncomplete#sources#omni#completor')
    \  }))

if has('python3')
    packadd ultisnips
    packadd vim-snippets
    packadd asyncomplete-ultisnips.vim

    let g:UltiSnipsExpandTrigger="<c-e>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif
" }}}

" load/unload plugins installed as described below
" https://opensource.com/article/20/2/how-install-vim-plugins
