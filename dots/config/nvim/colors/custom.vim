" tokyo_custom.vim
" A custom Vim colorscheme based on your palette

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "custom"

" Define palette
let s:palette = {
  \ 'black':      '#06080a',
  \ 'bg0':        '#1a1b26',
  \ 'bg1':        '#232433',
  \ 'bg2':        '#2a2b3d',
  \ 'bg3':        '#32344a',
  \ 'bg4':        '#3b3d57',
  \ 'bg_red':     '#ff7a93',
  \ 'diff_red':   '#F7768E',
  \ 'bg_green':   '#b9f27c',
  \ 'diff_green': '#9ECE6A',
  \ 'bg_blue':    '#7da6ff',
  \ 'diff_blue':  '#3e5380',
  \ 'fg':         '#d4daf5',
  \ 'red':        '#F7768E',
  \ 'orange':     '#FF9E64',
  \ 'yellow':     '#FF9E64',
  \ 'green':      '#9ECE6A',
  \ 'blue':       '#7AA2F7',
  \ 'purple':     '#ad8ee6',
  \ 'grey':       '#444B6A',
  \ 'cyan':       '#7dcfff',
  \ 'none':       'NONE',
  \ 'diff_add_bg':  '#20303b',
  \ 'diff_del_bg':  '#37222c',
  \ 'diff_chg_bg':  '#272d43',
  \ 'diff_txt_bg':  '#394b70',
  \ 'diff_yellow':  '#FFD000',
  \ }

"  \ 'yellow':     '#E0AF68',

" Helper to simplify hi command
"function! s:Hi(group, guifg, guibg, gui)
  "execute 'hi ' . a:group
        "\ . ' guifg=' . a:guifg
        "\ . ' guibg=' . a:guibg
        "\ . ' gui='   . a:gui
"endfunction
function! s:Hi(group, fg, bg, attr)
  let l:cmd = 'highlight ' . a:group

  " Use GUI colors as-is
  let l:cmd .= ' guifg=' . a:fg . ' guibg=' . a:bg . ' gui=' . a:attr

  " Only use ctermfg if it's not a hex color (cterm doesn't support hex)
  if a:fg =~ '^#'
    let ctermfg = 'NONE'
  else
    let ctermfg = a:fg
  endif

  if a:bg =~ '^#'
    let ctermbg = 'NONE'
  else
    let ctermbg = a:bg
  endif

  let l:cmd .= ' ctermfg=' . ctermfg . ' ctermbg=' . ctermbg . ' cterm=' . a:attr

  execute l:cmd
endfunction

"function! s:Hi(group, fg, bg, attr)
  "execute 'highlight ' . a:group
        "\ . ' guifg=' . a:fg
        "\ . ' guibg=' . a:bg
        "\ . ' gui='   . a:attr
        "\ . ' ctermfg=' . a:fg
        "\ . ' ctermbg=' . a:bg
        "\ . ' cterm='   . a:attr
"endfunction

" UI Highlights
"call s:Hi('Normal',        s:palette.fg,       s:palette.bg0, 'NONE')
"call s:Hi('NormalFloat',        s:palette.fg,       s:palette.bg0, 'NONE')
"call s:Hi('CursorLine',    'NONE',             s:palette.bg0, 'NONE')
"call s:Hi('CursorColumn',  'NONE',             s:palette.bg1, 'NONE')
"call s:Hi('LineNr',        s:palette.grey,     s:palette.bg0, 'NONE')
"call s:Hi('CursorLineNr',  s:palette.orange,     s:palette.bg0, 'bold')
"call s:Hi('Pmenu',         s:palette.fg,       s:palette.bg2, 'NONE')
"call s:Hi('PmenuSel',      s:palette.bg0,      s:palette.blue, 'NONE')
"call s:Hi('PmenuSbar',     'NONE',             s:palette.bg3, 'NONE')
"call s:Hi('PmenuThumb',    'NONE',             s:palette.blue, 'NONE')
"call s:Hi('EndOfBuffer',   s:palette.grey,      s:palette.bg0, 'NONE')

call s:Hi('Normal',        s:palette.fg,       'NONE', 'NONE')
call s:Hi('NormalFloat',        s:palette.fg,       'NONE', 'NONE')
call s:Hi('CursorLine',    'NONE',             'NONE', 'NONE')
call s:Hi('CursorColumn',  'NONE',             'NONE', 'NONE')
call s:Hi('LineNr',        s:palette.grey,     'NONE', 'NONE')
call s:Hi('CursorLineNr',  s:palette.orange,     'NONE', 'bold')

call s:Hi('VertSplit',     s:palette.bg2,      s:palette.bg0, 'NONE')
call s:Hi('StatusLine',    s:palette.fg,       s:palette.bg2, 'NONE')
call s:Hi('StatusLineNC',  s:palette.grey,     s:palette.bg1, 'NONE')
call s:Hi('Visual',        'NONE',             s:palette.bg3, 'NONE')
"call s:Hi('Pmenu',         s:palette.fg,       'NONE', 'NONE')
"call s:Hi('PmenuSel',      'NONE',      s:palette.blue, 'NONE')
"call s:Hi('PmenuSbar',     'NONE',             'NONE', 'NONE')
"call s:Hi('PmenuThumb',    'NONE',             s:palette.blue, 'NONE')
call s:Hi('Pmenu',         s:palette.fg,       s:palette.bg2, 'NONE')
call s:Hi('PmenuSel',      s:palette.bg0,      s:palette.blue, 'NONE')
call s:Hi('PmenuSbar',     'NONE',             s:palette.bg3, 'NONE')
call s:Hi('PmenuThumb',    'NONE',             s:palette.blue, 'NONE')
call s:Hi('EndOfBuffer',   s:palette.grey,      'NONE', 'NONE')
call s:Hi('Folded',   s:palette.blue,      s:palette.bg2, 'NONE')

" Search & Messages
call s:Hi('Search',        s:palette.bg0,      s:palette.orange, 'NONE')
call s:Hi('IncSearch',     s:palette.bg0,      s:palette.orange, 'NONE')
call s:Hi('Substitute',     s:palette.bg0,      s:palette.orange, 'NONE')
call s:Hi('MatchParen',    s:palette.red,      'NONE', 'bold')

" Syntax
call s:Hi('Comment',       s:palette.grey,     'NONE', 'italic')
call s:Hi('Constant',      s:palette.orange,   'NONE', 'NONE')
call s:Hi('String',        s:palette.green,    'NONE', 'NONE')
call s:Hi('Character',     s:palette.green,    'NONE', 'NONE')
call s:Hi('Number',        s:palette.orange,   'NONE', 'NONE')
call s:Hi('Boolean',       s:palette.orange,   'NONE', 'NONE')
call s:Hi('Float',         s:palette.orange,   'NONE', 'NONE')
call s:Hi('Identifier',    s:palette.blue,     'NONE', 'italic')
call s:Hi('Function',      s:palette.blue,     'NONE', 'bold')
call s:Hi('@variable',      s:palette.blue,     'NONE', 'bold')
call s:Hi('Statement',     s:palette.purple,   'NONE', 'NONE')
call s:Hi('Conditional',   s:palette.purple,   'NONE', 'NONE')
call s:Hi('Repeat',        s:palette.purple,   'NONE', 'NONE')
call s:Hi('Label',         s:palette.purple,   'NONE', 'NONE')
call s:Hi('Operator',      s:palette.fg,       'NONE', 'NONE')
call s:Hi('Keyword',       s:palette.purple,   'NONE', 'italic')
call s:Hi('Exception',     s:palette.red,      'NONE', 'NONE')
call s:Hi('PreProc',       s:palette.yellow,   'NONE', 'NONE')
call s:Hi('Include',       s:palette.yellow,   'NONE', 'NONE')
call s:Hi('Define',        s:palette.yellow,   'NONE', 'NONE')
call s:Hi('Macro',         s:palette.yellow,   'NONE', 'NONE')
call s:Hi('PreCondit',     s:palette.yellow,   'NONE', 'NONE')
call s:Hi('Type',          s:palette.green,    'NONE', 'NONE')
call s:Hi('StorageClass',  s:palette.green,    'NONE', 'NONE')
call s:Hi('Structure',     s:palette.green,    'NONE', 'NONE')
call s:Hi('Typedef',       s:palette.green,    'NONE', 'NONE')
call s:Hi('Special',       s:palette.red,      'NONE', 'NONE')
call s:Hi('SpecialChar',   s:palette.red,      'NONE', 'NONE')
call s:Hi('Tag',           s:palette.orange,   'NONE', 'NONE')
call s:Hi('Delimiter',     s:palette.fg,       'NONE', 'NONE')
call s:Hi('SpecialComment',s:palette.grey,     'NONE', 'NONE')
call s:Hi('Debug',         s:palette.red,      'NONE', 'NONE')
call s:Hi('shDerefSimple', s:palette.red,      'NONE', 'NONE')
call s:Hi('shDerefVar',    s:palette.red,      'NONE', 'NONE')
call s:Hi('shCmdSubRegion',s:palette.fg,      'NONE', 'NONE')
call s:Hi('shCommandSub',  s:palette.fg,      'NONE', 'NONE')
call s:Hi('shOption',      s:palette.fg,      'NONE', 'NONE')
call s:Hi('shHereDoc01',   s:palette.orange,      'NONE', 'NONE')

" Misc
call s:Hi('Underlined',    s:palette.blue,     'NONE', 'underline')
call s:Hi('Ignore',        s:palette.bg2,      'NONE', 'NONE')
call s:Hi('Error',         s:palette.red,      s:palette.bg0, 'NONE')
call s:Hi('Todo',          s:palette.grey,   'NONE', 'italic')
call s:Hi('Extmarks',          s:palette.grey,   'NONE', 'NONE')
call s:Hi('LazyNormal',        s:palette.fg,       s:palette.bg0, 'NONE')
call s:Hi('LazyNormalNC',        'NONE',       s:palette.bg0, 'NONE')
" Diff mode (vimdiff, :Gdiff, Diffview)
call s:Hi('DiffAdd',    'NONE',          s:palette.diff_add_bg, 'NONE')
call s:Hi('DiffChange', 'NONE',          s:palette.diff_chg_bg, 'NONE')
call s:Hi('DiffDelete', s:palette.bg4,   s:palette.diff_del_bg, 'NONE')
call s:Hi('DiffText',   'NONE',          s:palette.diff_txt_bg, 'bold')

" Neovim standard groups (gitsigns, statuslines, LSP link to these)
call s:Hi('Added',   s:palette.diff_green, 'NONE', 'NONE')
call s:Hi('Changed', s:palette.blue,       'NONE', 'NONE')
call s:Hi('Removed', s:palette.diff_red,   'NONE', 'NONE')

" Patch/diff filetype syntax
call s:Hi('diffAdded',     s:palette.diff_green, 'NONE', 'NONE')
call s:Hi('diffRemoved',   s:palette.diff_red,   'NONE', 'NONE')
call s:Hi('diffChanged',   s:palette.diff_yellow,       'NONE', 'NONE')
call s:Hi('diffFile',      s:palette.fg,       'NONE', 'bold')
call s:Hi('diffNewFile',   s:palette.green,      'NONE', 'NONE')
call s:Hi('diffOldFile',   s:palette.red,        'NONE', 'NONE')
call s:Hi('diffIndexLine', s:palette.purple,     'NONE', 'NONE')
call s:Hi('diffLine',      s:palette.grey,       'NONE', 'italic')
call s:Hi('diffSubname',   s:palette.blue,       'NONE', 'NONE')

" Treesitter diff parser
hi! link @diff.plus  diffAdded
hi! link @diff.minus diffRemoved
hi! link @diff.delta diffChanged

" Base severity colors
call s:Hi('DiagnosticError', s:palette.red,    'NONE', 'NONE')
call s:Hi('DiagnosticWarn',  s:palette.yellow, 'NONE', 'NONE')
call s:Hi('DiagnosticInfo',  s:palette.blue,   'NONE', 'NONE')
call s:Hi('DiagnosticHint',  s:palette.green,  'NONE', 'NONE')
call s:Hi('DiagnosticOk',    s:palette.green,  'NONE', 'NONE')

" Sign column
hi! link DiagnosticSignError DiagnosticError
hi! link DiagnosticSignWarn  DiagnosticWarn
hi! link DiagnosticSignInfo  DiagnosticInfo
hi! link DiagnosticSignHint  DiagnosticHint

" Virtual text
hi! link DiagnosticVirtualTextError DiagnosticError
hi! link DiagnosticVirtualTextWarn  DiagnosticWarn
hi! link DiagnosticVirtualTextInfo  DiagnosticInfo
hi! link DiagnosticVirtualTextHint  DiagnosticHint

" Floating window
hi! link DiagnosticFloatingError DiagnosticError
hi! link DiagnosticFloatingWarn  DiagnosticWarn
hi! link DiagnosticFloatingInfo  DiagnosticInfo
hi! link DiagnosticFloatingHint  DiagnosticHint

" Git
hi! link gitcommitSelectedFile Added
hi! link gitcommitDiscarded Removed
hi! link gitcommitDiscardedFile Removed
hi! link gitcommitDiscardedType Removed
hi! link gitcommitUntrackedFile Removed
hi! link gitcommitHeader Normal

" Markdown
hi! link markdownOrderedListMarker Statement
hi! link RenderMarkdownInlineHighlight Statement
hi! link RenderMarkdownChecked String
