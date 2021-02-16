# Personal vim configuration

Personal vim configuration project to allow syncing in between different
workstations.

## Installation

Just

    git clone https://github.com/dpopchev/vim.git
    cd vim
    make install

This will
1. create usual vim home at `~/.vim`
1. create auto start plugin directory at expected `~/.vim/pack/plugins/start`
1. create temp directory for vim auxiliary files `~/.vim/tmp`
1. retrieve plugins via `git clone`
1. create soft `.vimrc` link in `~/.vim`
1. create soft `templates` link in `/.vim/templates`

## Prerequisites

vim version:

```
dimitar@kaktus ~ $ vim --version
VIM - Vi IMproved 8.1 (2018 May 18, compiled Dec 14 2019 15:48:59)
Included patches: 1-648
Modified by Gentoo-8.1.0648-r1
Compiled by dimitar@kaktus
Huge version without GUI.  Features included (+) or not (-):
+acl               +extra_search      +mouse_netterm     +tag_old_static
+arabic            +farsi             +mouse_sgr         -tag_any_white
+autocmd           +file_in_path      -mouse_sysmouse    -tcl
+autochdir         +find_in_path      +mouse_urxvt       +termguicolors
-autoservername    +float             +mouse_xterm       -terminal
-balloon_eval      +folding           +multi_byte        +terminfo
+balloon_eval_term -footer            +multi_lang        +termresponse
-browse            +fork()            -mzscheme          +textobjects
++builtin_terms    +gettext           +netbeans_intg     +textprop
+byte_offset       -hangul_input      +num64             +timers
+channel           +iconv             +packages          +title
+cindent           +insert_expand     +path_extra        -toolbar
+clientserver      +job               -perl              +user_commands
+clipboard         +jumplist          +persistent_undo   +vartabs
+cmdline_compl     +keymap            +postscript        +vertsplit
+cmdline_hist      +lambda            +printer           +virtualedit
+cmdline_info      +langmap           +profile           +visual
+comments          +libcall           -python            +visualextra
+conceal           +linebreak         -python3           +viminfo
+cryptv            +lispindent        +quickfix          +vreplace
-cscope            +listcmds          +reltime           +wildignore
+cursorbind        +localmap          +rightleft         +wildmenu
+cursorshape       -lua               -ruby              +windows
+dialog_con        +menu              +scrollbind        +writebackup
+diff              +mksession         +signs             +X11
+digraphs          +modify_fname      +smartindent       +xfontset
-dnd               +mouse             +startuptime       -xim
-ebcdic            -mouseshape        +statusline        -xpm
+emacs_tags        +mouse_dec         -sun_workshop      +xsmp_interact
+eval              +mouse_gpm         +syntax            +xterm_clipboard
+ex_extra          -mouse_jsbterm     +tag_binary        -xterm_save
```
## Notes

To load debug info
```
vim -V9myVim.log
```
