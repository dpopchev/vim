PLUGINS += vimpeekaboo
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/junegunn/vim-peekaboo.git

PLUGINS += vimrainbow
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/frazrepo/vim-rainbow.git

PLUGINS += nerdcommenter
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/preservim/nerdcommenter.git

PLUGINS += nerdtree
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/preservim/nerdtree.git

PLUGINS += autopairs
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/jiangmiao/auto-pairs.git

PLUGINS += ctrlp
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/ctrlpvim/ctrlp.vim.git

PLUGINS += undotree
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/mbbill/undotree.git

PLUGINS += vimman
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/vim-utils/vim-man.git

PLUGINS += vimfugitive
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/tpope/vim-fugitive.git

PLUGINS += gruvbox
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/morhetz/gruvbox.git

PLUGINS += solarized
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/altercation/vim-colors-solarized.git

PLUGINS += jellybeans
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/nanotech/jellybeans.vim.git

PLUGINS += badwolf
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/sjl/badwolf.git

PLUGINS += vimvisualstarsearch
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/nelstrom/vim-visual-star-search.git

PLUGINS += syntastic
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/vim-syntastic/syntastic.git

PLUGINS += vimperl
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/vim-perl/vim-perl.git

PLUGINS += vimpythonjedi
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/davidhalter/jedi-vim.git

PLUGINS += vimbuftabline
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/ap/vim-buftabline.git

PLUGINS += completor
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/maralla/completor.vim.git

PLUGINS += vimsurround
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/tpope/vim-surround.git

PLUGINS += vimrepeat
PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/tpope/vim-repeat.git

# Please follow updated instructions from here
# https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
# make sure you have nodejs >= 10.12
# curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
# see available extensions here:
# https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
#PLUGINS += coc
#PLUGIN_URL_$(lastword $(PLUGINS)) := https://github.com/neoclide/coc.nvim
