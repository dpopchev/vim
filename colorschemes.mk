# place the links in tmp file and run the command below to generate the same output
# sed -n -e 'h;s/.*\/\(.*\)\..*/\nCOLORSCHEMES += \1\nCOLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := /;G;s/ := \n/ := /;p;'

COLORSCHEMES += gruvbox
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

COLORSCHEMES += molokai
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

COLORSCHEMES += onehalflight
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/sonph/onehalf/master/vim/colors/onehalflight.vim

COLORSCHEMES += onehalfdark
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/sonph/onehalf/master/vim/colors/onehalfdark.vim

COLORSCHEMES += zenburn
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim

COLORSCHEMES += PaperColor
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/NLKNguyen/papercolor-theme/master/colors/PaperColor.vim

COLORSCHEMES += base16-zenburn
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-zenburn.vim

COLORSCHEMES += base16-onedark
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-onedark.vim

COLORSCHEMES += base16-papercolor-dark
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-papercolor-dark.vim

COLORSCHEMES += base16-papercolor-light
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-papercolor-light.vim

COLORSCHEMES += base16-classic-dark
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-classic-dark.vim

COLORSCHEMES += base16-classic-light
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-classic-light.vim

COLORSCHEMES += base16-default-dark
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-default-dark.vim

COLORSCHEMES += base16-default-light
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-default-light.vim

COLORSCHEMES += base16-gruvbox-dark-hard
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-dark-hard.vim

COLORSCHEMES += base16-gruvbox-light-soft
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-gruvbox-light-soft.vim

COLORSCHEMES += base16-monokai
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-monokai.vim

COLORSCHEMES += atom-dark
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark.vim

COLORSCHEMES += atom-dark-256
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim

COLORSCHEMES += badwolf
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim

COLORSCHEMES += goodwolf
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/sjl/badwolf/master/colors/goodwolf.vim

COLORSCHEMES += tender
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/jacoborus/tender.vim/master/colors/tender.vim

COLORSCHEMES += base16-material-dark
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/base16-material/base16-material-dark.vim

COLORSCHEMES += base16-material
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/base16-material/base16-material.vim

COLORSCHEMES += hybrid_material
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/colors/hybrid_material.vim

COLORSCHEMES += hybrid_reverse
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/kristijanhusak/vim-hybrid-material/master/colors/hybrid_reverse.vim

COLORSCHEMES += purify
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/kyoz/purify/master/vim/colors/purify.vim

COLORSCHEMES += monokain
COLORSCHEME_URL_$(lastword $(COLORSCHEMES)) := https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/monokain.vim
