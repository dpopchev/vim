"set complete-=i     " limit the files searched for auto-complted
"set lazyredraw      " dont update screen during macro and script execution
"set ttyfast         " improves redrawing on newer computers
set t_ut=            " fix highlight problem on win 10 wls
set t_BE=            " remove extra characters when shift+insert

" if $TERM is set to use 256 colors to give 256 value to t_Co
" this is a suggested way to fix faulty colors in vim
"
" nevertheless, at the end seems better to just rely on vim and TERM to figure out
"if $TERM == "xterm-256color" || $TERM == "rxvt-unicode-256color"
"        \ || $COLORTERM == "gnome-terminal"
"    set t_Co=256
"endif

" File browser and such {{{
" build in netwr quick configs and shortcuts
" create file tree in the current directory
"let g:netrw_browse_split = 2
"let g:vrfr_rg = 'true'
"let g:netrw_banner = 0
"let g:netrw_winsize = 25
"nnoremap <leader>t :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" lets use NERDtree plugin instead of build in file browser
nnoremap <leader>t :NERDtreeToggle<cr>
" }}} end file browser and such

" show/hide Undotree plugin
nnoremap <leader>u :UndotreeToggle<cr>

" recommend options for CtrlP plugin {{{
" fuzzy search files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar*,*.rar     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <leader>s :CtrlP<cr>
" }}} end Ctrlp recommend options

" ALE configs {{{
" ALE and Gitgutter plugins are in conflict for the sign space
" source https://github.com/dense-analysis/ale/issues/23
"let g:ale_sign_priority=8
"let g:gitgutter_sign_priority=9
"let g:ale_sign_column_always=1
" Write this in your vimrc file
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0

"let g:ale_completion_enabled=1
"set omnifunc=ale#completion#OmniFunc
" }}} end ale configs

" Rainbow plugin config
" rainbow plugin brackets activate globally
let g:rainbow_active = 1

" deoplete plugin
"let g:deoplete#enable_at_startup = 1
