"                        _                 _  __
"                       | |               | |/ _|
"   __ _  ___   ___   __| | __      _____ | | |_
"  / _` |/ _ \ / _ \ / _` | \ \ /\ / / _ \| |  _|
" | (_| | (_) | (_) | (_| |  \ V  V / (_) | | |
"  \__, |\___/ \___/ \__,_|   \_/\_/ \___/|_|_|
"   __/ |
"  |___/
"
"     :syntax less
"
" A Vim colorscheme pieced together by Steve Losh.
" Available at http://stevelosh.com/projects/badwolf/
"
" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "goodwolf"

" }}}
" Palette {{{

let s:bwc = {}

if get(g:, 'goodwolf_gruv', 0)

  let s:bwc.snow = ['f9f5d7', 15]

  let s:bwc.plain = ['ebdbb2', 15]

  let s:bwc.brightgravel   = ['c5b391', 252]
  let s:bwc.lightgravel    = ['a89984', 245]
  let s:bwc.gravel         = ['928374', 243]
  let s:bwc.mediumgravel   = ['7c6f64', 241]
  let s:bwc.deepgravel     = ['665c54', 238]
  let s:bwc.deepergravel   = ['504945', 236]
  let s:bwc.darkgravel     = ['32302f', 235]
  let s:bwc.blackgravel    = ['282828', 233]
  let s:bwc.blackestgravel = ['1d2021', 232]

  let s:bwc.coal = ['0d1011', 16]

  let s:bwc.lime = ['a6cb4b', 154]

  let s:statusline = 'coal'
elseif get(g:, 'goodwolf_light', 0)

  let s:bwc.snow = ['ffffff', 15]

  let s:bwc.plain = ['1d2021', 15]

  let s:bwc.brightgravel   = ['282828', 252]
  let s:bwc.lightgravel    = ['32302f', 245]
  let s:bwc.gravel         = ['504945', 243]
  let s:bwc.mediumgravel   = ['665c54', 241]
  let s:bwc.deepgravel     = ['7c6f64', 238]
  let s:bwc.deepergravel   = ['928374', 236]
  let s:bwc.darkgravel     = ['a89984', 235]
  let s:bwc.blackgravel    = ['f6f6e0', 233]
  let s:bwc.blackestgravel = ['e5d3b1', 232]

  let s:bwc.coal = ['0d1011', 16]

  let s:bwc.lime = ['a6cb4b', 154]

  let s:statusline = 'coal'
else
  " The most basic of all our colors is a slightly tweaked version of the Molokai
  " Normal text.
  let s:bwc.plain = ['e8e6e2', 15]

  " Pure and simple.
  let s:bwc.snow = ['ffffff', 15]
  let s:bwc.coal = ['000000', 16]

  " All of the Gravel colors are based on a brown from Clouds Midnight.
  let s:bwc.brightgravel   = ['d5c3a1', 252]
  let s:bwc.lightgravel    = ['998f84', 245]
  let s:bwc.gravel         = ['857f78', 243]
  let s:bwc.mediumgravel   = ['666462', 241]
  let s:bwc.deepgravel     = ['45413b', 238]
  let s:bwc.deepergravel   = ['35322d', 236]
  let s:bwc.darkgravel     = ['242321', 235]
  let s:bwc.blackgravel    = ['1c1b1a', 233]
  let s:bwc.blackestgravel = ['141413', 232]

  " A limier green from Getafe.
  let s:bwc.lime = ['aeee00', 154]

  let s:statusline = 'deepergravel'
endif

" A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
" my desk.
let s:bwc.dalespale = ['fade3e', 221]

" A beautiful tan from Tomorrow Night.
let s:bwc.dirtyblonde = ['f4cf86', 222]

" Delicious, chewy red from Made of Code for the poppiest highlights.
let s:bwc.taffy = ['ff2c4b', 196]

" Another chewy accent, but use sparingly!
let s:bwc.saltwatertaffy = ['8cffba', 121]

" The star of the show comes straight from Made of Code.
"
" You should almost never use this.  It should be used for things that denote
" 'where the user is', which basically consists of:
"
" * The cursor
" * A REPL prompt
let s:bwc.tardis = ['0a9dff', 39]

" This one's from Mustang, not Florida!
let s:bwc.orange = ['ffa724', 214]


let s:bwc.green = ['86ab2b', 154]

" Rose's dress in The Idiot's Lantern.
let s:bwc.dress = ['ff9eb8', 211]

" Another play on the brown from Clouds Midnight.  I love that color.
let s:bwc.toffee = ['b88853', 137]

" Also based on that Clouds Midnight brown.
let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! GoodWolfHL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        elseif a:fg == 'none'
            let histring .= 'guifg=NONE ctermfg=NONE '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        elseif a:1 == 'none'
            let histring .= 'guibg=NONE ctermbg=NONE '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    execute histring
endfunction

" }}}
" Configuration Options {{{

let s:gutter = 'blackgravel'

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call GoodWolfHL('Normal', 'plain', 'blackgravel')

call GoodWolfHL('Folded', 'mediumgravel', 'blackestgravel', 'none')

call GoodWolfHL('CursorLine',   '', 'darkgravel', 'none')
call GoodWolfHL('CursorLineNr',   'tardis', 'darkgravel', 'none')
call GoodWolfHL('CursorColumn', '', 'darkgravel')
call GoodWolfHL('ColorColumn',  '', 'darkgravel')

call GoodWolfHL('MatchParen', 'dalespale', 'darkgravel', 'bold')

call GoodWolfHL('NonText',    'deepgravel', 'bg')
call GoodWolfHL('Whitespace',    'taffy', 'bg')
call GoodWolfHL('SpecialKey', 'deepgravel', 'bg')

call GoodWolfHL('Visual',    'snow',  'tardis')
call GoodWolfHL('VisualNOS', '',  'deepgravel')

call GoodWolfHL('Search',    'coal', 'dalespale', 'bold')
call GoodWolfHL('IncSearch', 'coal', 'tardis',    'bold')

call GoodWolfHL('Underlined', 'fg', '', 'underline')

call GoodWolfHL('StatusLine',   'brightgravel', s:statusline, 'NONE')
call GoodWolfHL('StatusLineNC', 'lightgravel', s:statusline, 'NONE')
call GoodWolfHL('User1', 'snow', s:statusline, 'none')
call GoodWolfHL('User2', 'taffy', s:statusline, 'none')

call GoodWolfHL('VertSplit', s:statusline, 'bg', 'none')

call GoodWolfHL('TabLine', 'plain', s:statusline, 'none')
call GoodWolfHL('TabLineFill', 'plain', s:statusline, 'none')
call GoodWolfHL('TabLineSel', 'dirtyblonde', s:statusline, 'none')

call GoodWolfHL('Directory', 'dirtyblonde', '', 'bold')

call GoodWolfHL('Title', 'lime')

call GoodWolfHL('ErrorMsg',   'taffy',       'bg', 'bold')
call GoodWolfHL('MoreMsg',    'dalespale',   '',   'bold')
call GoodWolfHL('ModeMsg',    'dirtyblonde', '',   'bold')
call GoodWolfHL('Question',   'dirtyblonde', '',   'bold')
call GoodWolfHL('WarningMsg', 'dress',       '',   'bold')

call GoodWolfHL('Conceal', 'saltwatertaffy',       'bg',   'none')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call GoodWolfHL('Tag', '', '', 'bold')

" }}}
" Gutter {{{

call GoodWolfHL('LineNr',     'mediumgravel', s:gutter)
call GoodWolfHL('SignColumn', '',             s:gutter)
call GoodWolfHL('FoldColumn', 'mediumgravel', s:gutter)

" }}}
" Cursor {{{

call GoodWolfHL('Cursor',  'coal', 'tardis', 'bold')
call GoodWolfHL('TermCursor',  'coal', 'tardis', 'bold')
call GoodWolfHL('vCursor', 'coal', 'tardis', 'bold')
call GoodWolfHL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call GoodWolfHL('Special', 'brightgravel')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call GoodWolfHL('Comment',        'gravel', 'bg', 'none')
call GoodWolfHL('Todo',           'dalespale',   'bg', 'bold')
call GoodWolfHL('SpecialComment', 'gravel',   'bg', 'bold')

" Strings are highlighted separately.
call GoodWolfHL('String', 'green', 'bg', 'none')

" Turn off everything else
call GoodWolfHL('Statement',    'brightgravel', '', 'none')
call GoodWolfHL('Keyword',      'plain', '', 'none')
call GoodWolfHL('Conditional',  'plain', '', 'none')
call GoodWolfHL('Operator',     'plain', '', 'none')
call GoodWolfHL('Label',        'plain', '', 'none')
call GoodWolfHL('Repeat',       'plain', '', 'none')
call GoodWolfHL('Identifier',   'plain', '', 'none')
call GoodWolfHL('Function',     'plain', '', 'none')
call GoodWolfHL('PreProc',      'plain', '', 'none')
call GoodWolfHL('Macro',        'plain', '', 'none')
call GoodWolfHL('Define',       'plain', '', 'none')
call GoodWolfHL('PreCondit',    'plain', '', 'none')
call GoodWolfHL('Constant',     'plain', '', 'none')
call GoodWolfHL('Character',    'plain', '', 'none')
call GoodWolfHL('Boolean',      'plain', '', 'none')
call GoodWolfHL('Number',       'plain', '', 'none')
call GoodWolfHL('Float',        'plain', '', 'none')
call GoodWolfHL('Type',         'plain', '', 'none')
call GoodWolfHL('StorageClass', 'plain', '', 'none')
call GoodWolfHL('Structure',    'plain', '', 'none')
call GoodWolfHL('Typedef',      'plain', '', 'none')
call GoodWolfHL('Exception',    'plain', '', 'none')

" Not sure what 'special character in a constant' means, but let's make it pop.
call GoodWolfHL('SpecialChar', 'lime', '', 'bold')

" Misc
call GoodWolfHL('Error',  'snow',   'taffy', 'bold')
call GoodWolfHL('Debug',  'snow',   '',      'bold')
call GoodWolfHL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call GoodWolfHL('Pmenu', 'plain', 'deepergravel')
call GoodWolfHL('PmenuSel', 'coal', 'tardis', 'bold')
call GoodWolfHL('PmenuSbar', '', 'deepergravel')
call GoodWolfHL('PmenuThumb', 'brightgravel')

call GoodWolfHL('WildMenu', 'coal', 'tardis', 'bold')

" }}}
" Diffs {{{

call GoodWolfHL('DiffDelete', 'coal', 'coal')
call GoodWolfHL('DiffAdd',    'coal',     'green')
call GoodWolfHL('DiffChange', '', 'deepergravel')
call GoodWolfHL('DiffText',   'orange', 'deepergravel', 'none')

" }}}
" Spelling {{{

if has("spell")
    call GoodWolfHL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call GoodWolfHL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call GoodWolfHL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call GoodWolfHL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

" }}}
" Status Line Utils {{{

call GoodWolfHL('GWStatusLineMode', 'coal', 'lime')
call GoodWolfHL('GWStatusLineModeX', 'lime', 'deepergravel')


" }}}

" }}}
" Plugins {{{

" Clam {{{

" hg status
call GoodWolfHL('clamHgStatusAdded',    'lime', '', 'none')
call GoodWolfHL('clamHgStatusModified', 'saltwatertaffy', '', 'none')
call GoodWolfHL('clamHgStatusRemoved',  'toffee', '', 'none')
call GoodWolfHL('clamHgStatusUnknown',  'taffy', '', 'bold')

" }}}
" Rainbow Parentheses {{{

call GoodWolfHL('level1c',  'mediumgravel', '', 'bold')

" }}}
" Sneak {{{

call GoodWolfHL('Sneak',  'coal', 'orange', 'bold')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call GoodWolfHL('clojureParen0', 'lightgravel', '', 'none')
call GoodWolfHL('clojureAnonArg', 'snow', '', 'bold')

" }}}
" CSS {{{

call GoodWolfHL('cssBraces', 'lightgravel', '', 'none')
call GoodWolfHL('cssStyle', 'fg', '', 'bold')
call GoodWolfHL('cssClassName', 'fg', '', 'bold')
call GoodWolfHL('cssTagName', 'fg', '', 'bold')

" }}}
" Diff {{{

call GoodWolfHL('gitDiff', 'lightgravel', '',)

call GoodWolfHL('diffRemoved', 'dress', '',)
call GoodWolfHL('diffAdded', 'lime', '',)
call GoodWolfHL('diffFile', 'coal', 'toffee', 'bold')
call GoodWolfHL('diffNewFile', 'coal', 'toffee', 'bold')

call GoodWolfHL('diffLine', 'coal', 'orange', 'bold')
call GoodWolfHL('diffSubname', 'orange', '', 'none')

" }}}
" HTML {{{

" Punctuation
call GoodWolfHL('htmlTag',    'darkroast', 'bg', 'none')
call GoodWolfHL('htmlEndTag', 'darkroast', 'bg', 'none')

" Tag names
call GoodWolfHL('htmlTagName',        'coffee', '', 'bold')
call GoodWolfHL('htmlSpecialTagName', 'coffee', '', 'bold')
call GoodWolfHL('htmlSpecialChar',    'lime',   '', 'none')

call GoodWolfHL('xmlTagName',        'coffee', '', 'bold')
call GoodWolfHL('xmlTag',        'darkroast', '', 'none')
call GoodWolfHL('xmlEndTag',        'darkroast', '', 'none')
call GoodWolfHL('xmlAttrib', 'coffee', '', 'none')
call GoodWolfHL('xmlAttribPunct',    'darkroast',   '', 'none')

" Attributes
call GoodWolfHL('htmlArg', 'coffee', '', 'none')

" Stuff inside an <a> tag

call GoodWolfHL('htmlLink', 'lightgravel', '', 'underline')

" }}}
" Java {{{

call GoodWolfHL('javaCommentTitle', 'gravel', '')
call GoodWolfHL('javaDocTags', 'snow', '', 'none')
call GoodWolfHL('javaDocParam', 'plain', '', '')

" }}}
" REPLs {{{
" This isn't a specific plugin, but just useful highlight classes for anything
" that might want to use them.

call GoodWolfHL('replPrompt', 'tardis', '', 'bold')

" }}}
" Mail {{{

call GoodWolfHL('mailSubject', 'orange', '', 'bold')
call GoodWolfHL('mailHeader', 'lightgravel', '', '')
call GoodWolfHL('mailHeaderKey', 'lightgravel', '', '')
call GoodWolfHL('mailHeaderEmail', 'snow', '', '')
call GoodWolfHL('mailURL', 'toffee', '', 'underline')
call GoodWolfHL('mailSignature', 'gravel', '', 'none')

call GoodWolfHL('mailQuoted1', 'gravel', '', 'none')
call GoodWolfHL('mailQuoted2', 'dress', '', 'none')
call GoodWolfHL('mailQuoted3', 'dirtyblonde', '', 'none')
call GoodWolfHL('mailQuoted4', 'orange', '', 'none')
call GoodWolfHL('mailQuoted5', 'lime', '', 'none')

" }}}
" Markdown {{{

call GoodWolfHL('markdownHeadingRule', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownListMarker', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownItalic', 'snow', '', 'bold')
call GoodWolfHL('markdownBold', 'snow', '', 'bold')
call GoodWolfHL('markdownH1', 'orange', '', 'bold')
call GoodWolfHL('markdownH2', 'lime', '', 'bold')
call GoodWolfHL('markdownH3', 'lime', '', 'none')
call GoodWolfHL('markdownH4', 'lime', '', 'none')
call GoodWolfHL('markdownH5', 'lime', '', 'none')
call GoodWolfHL('markdownH6', 'lime', '', 'none')
call GoodWolfHL('markdownLinkText', 'toffee', '', 'underline')
call GoodWolfHL('markdownIdDeclaration', 'toffee')
call GoodWolfHL('markdownAutomaticLink', 'toffee', '', 'bold')
call GoodWolfHL('markdownUrl', 'toffee', '', 'bold')
call GoodWolfHL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call GoodWolfHL('markdownCode', 'dirtyblonde', '', 'none')
call GoodWolfHL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call GoodWolfHL('pythonBuiltin',     'plain')
call GoodWolfHL('pythonBuiltinObj',  'plain')
call GoodWolfHL('pythonBuiltinFunc', 'plain')
call GoodWolfHL('pythonEscape',      'plain')
call GoodWolfHL('pythonException',   'plain', '', 'none')
call GoodWolfHL('pythonExceptions',  'plain', '', 'none')
call GoodWolfHL('pythonPrecondit',   'plain', '', 'none')
call GoodWolfHL('pythonDecorator',   'plain', '', 'none')
call GoodWolfHL('pythonRun',         'plain', '', 'none')
call GoodWolfHL('pythonCoding',      'plain', '', 'bold')

" }}}
" Vim {{{

call GoodWolfHL('helpHyperTextJump', 'dress', '', 'none')
call GoodWolfHL('helpHyperTextEntry', 'lightgravel', '', 'none')
call GoodWolfHL('helpExample', 'coffee', '', 'none')
call GoodWolfHL('helpHeadline', 'dirtyblonde', '', 'none')
call GoodWolfHL('helpHeader', 'plain', '', 'bold')
call GoodWolfHL('helpOption', 'dress', '', 'none')
call GoodWolfHL('helpSpecial', 'dirtyblonde', '', 'none')
call GoodWolfHL('helpCommand', 'dirtyblonde', '', 'none')
call GoodWolfHL('helpNote', 'fg', '', 'underline')
call GoodWolfHL('helpWarning', 'fg', '', 'bold,underline')
call GoodWolfHL('vimEnvvar', 'dirtyblonde', '', 'none')
call GoodWolfHL('qfFileName', 'lightgravel', '', 'none')
call GoodWolfHL('qfSeparator', 'gravel', '', 'none')

" }}}
" Typescript {{{

call GoodWolfHL('typescriptInterpolation', 'brightgravel', 'darkgravel', 'none')
call GoodWolfHL('typescriptInterpolationDelimiter', 'dirtyblonde', 'darkgravel', 'bold')

" }}}
" Powershell {{{

call GoodWolfHL('ps1InterpolationDelimiter', 'lime', 'bg', 'bold')

" }}}
" git {{{

call GoodWolfHL('gitCommitSummary', 'fg', 'bg', 'bold')
call GoodWolfHL('gitCommitOverflow', 'taffy', 'bg', 'bold')
call GoodWolfHL('gitCommitDiscardedFile', 'orange', 'bg')
call GoodWolfHL('gitCommitSelectedFile', 'lime', 'bg')
call GoodWolfHL('gitCommitBranch', 'dirtyblonde', 'bg')

call GoodWolfHL('gitrebaseCommit', 'dirtyblonde', 'bg')
call GoodWolfHL('gitrebaseReword', 'orange', 'bg')
call GoodWolfHL('gitrebaseSquash', 'toffee', 'bg')
call GoodWolfHL('gitrebaseFixup', 'coffee', 'bg')
call GoodWolfHL('gitrebaseDrop', 'taffy', 'bg')
call GoodWolfHL('gitrebaseEdit', 'dalespale', 'bg')

" }}}
" mine {{{

call GoodWolfHL('BufferNumber', 'lightgravel', 'bg')
call GoodWolfHL('BufferFlags', 'dirtyblonde', 'bg')
call GoodWolfHL('BufferCurrentName', 'fg', 'bg', 'bold')
call GoodWolfHL('BufferAlternateName', 'dalespale', 'bg')
call GoodWolfHL('BufferName', 'fg', 'bg', 'none')

" }}}
" vimplug {{{

call GoodWolfHL('plugH2', 'lime', '', 'none')
call GoodWolfHL('plugName', 'toffee', '', 'none')
call GoodWolfHL('plugSha', 'dirtyblonde', '', 'none')
call GoodWolfHL('plugEdge', 'lightgravel', '', 'none')
call GoodWolfHL('plugRelDate', 'green', '', 'none')

" }}}
" rust {{{

call GoodWolfHL('rustAttribute', 'toffee', '', 'none')
call GoodWolfHL('rustStructure', 'brightgravel', '', 'none')
call GoodWolfHL('rustKeyword', 'brightgravel', '', 'none')
call GoodWolfHL('rustTypedef', 'brightgravel', '', 'none')
call GoodWolfHL('rustConditional', 'brightgravel', '', 'none')
call GoodWolfHL('rustRepeat', 'brightgravel', '', 'none')
call GoodWolfHL('rustQuestionMark', 'taffy', 'bg', 'none')
call GoodWolfHL('rustDerive', 'toffee', 'bg', 'none')
call GoodWolfHL('rustDeriveTrait', 'toffee', 'bg', 'none')
call GoodWolfHL('rustSelf', 'fg', 'bg', 'bold')
call GoodWolfHL('rustOperator', 'brightgravel', 'bg', 'bold')
call GoodWolfHL('rustMacro', 'fg', 'bg', 'none')
call GoodWolfHL('rustEscape', 'lime', 'bg', 'bold')
call GoodWolfHL('rustEscapeUnicode', 'lime', 'bg', 'bold')

" }}}

" }}}
