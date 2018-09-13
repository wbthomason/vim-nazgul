" Nazgul - A very gray Vim theme

highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "nazgul"


let s:palette = {}

let s:palette.blackest = [232, '#141414']
let s:palette.black = [234, '#282828']
let s:palette.gray01 = [235, '#333333']
let s:palette.gray02 = [238, '#515151']
let s:palette.gray03 = [238, '#5b5b5b']
let s:palette.gray04 = [239, '#666666']
let s:palette.gray05 = [240, '#727272']
let s:palette.gray06 = [242, '#828282']
let s:palette.gray07 = [243, '#8c8c8c']
let s:palette.gray08 = [244, '#969696']
let s:palette.gray09 = [245, '#a0a0a0']
let s:palette.gray10 = [246, '#aaaaaa']
let s:palette.gray11 = [247, '#b5b5b5']
let s:palette.gray12 = [248, '#bfbfbf']
let s:palette.gray13 = [249, '#c9c9c9']
let s:palette.gray14 = [250, '#d3d3d3']
let s:palette.gray15 = [251, '#efefef']
let s:palette.white = [254, '#f9f9f9']

let s:palette.comments = copy(s:palette.gray10)

let s:palette.purple = [62, '#5f5fd7']
let s:palette.brown = [94, '#875f00']
let s:palette.blue = [24, '#005f87']
let s:palette.lightblue = [31, '#00afff']
let s:palette.green = [29, '#00875f']
let s:palette.red = [88, '#870000']
let s:palette.magenta = [89, '#87005f']

if has("nvim") && (has("gui_running") || &termguicolors)
    let g:terminal_color_0 = s:palette.gray01[1]
    let g:terminal_color_1 = s:palette.gray06[1]
    let g:terminal_color_2 = s:palette.gray03[1]
    let g:terminal_color_3 = s:palette.gray11[1]
    let g:terminal_color_4 = s:palette.gray02[1]
    let g:terminal_color_5 = s:palette.gray08[1]
    let g:terminal_color_6 = s:palette.gray09[1]
    let g:terminal_color_7 = s:palette.gray13[1]
    let g:terminal_color_8 = s:palette.gray03[1]
    let g:terminal_color_9 = s:palette.gray10[1]
    let g:terminal_color_10 = s:palette.gray07[1]
    let g:terminal_color_11 = s:palette.gray15[1]
    let g:terminal_color_12 = s:palette.gray05[1]
    let g:terminal_color_13 = s:palette.gray12[1]
    let g:terminal_color_14 = s:palette.gray14[1]
    let g:terminal_color_15 = s:palette.white[1]
endif

function! s:hi(group, fg_color, bg_color, style)
    let highlight_command = ['hi', a:group]
    if !empty(a:fg_color)
        let [ctermfg, guifg] = a:fg_color
        call add(highlight_command, printf('ctermfg=%d guifg=%s', ctermfg, guifg))
    endif
    if !empty(a:bg_color)
        let [ctermbg, guibg] = a:bg_color
        call add(highlight_command, printf('ctermbg=%d guibg=%s', ctermbg, guibg))
    endif
    if !empty(a:style)
        call add(highlight_command, printf('cterm=%s gui=%s', a:style, a:style))
    endif
    execute join(highlight_command, ' ')
endfunction


call s:hi('Normal', s:palette.gray13, s:palette.black, '')
set background=dark

call s:hi('Constant', s:palette.gray05, [], 'bold')
call s:hi('String', s:palette.gray10, [], '')
call s:hi('Number', s:palette.gray06, [], '')

call s:hi('Identifier', s:palette.gray08, [], 'none')
call s:hi('Function', s:palette.gray08, [], '')

call s:hi('Statement', s:palette.gray05, [], 'bold')
call s:hi('Operator', s:palette.gray05, [], 'none')
call s:hi('Keyword', s:palette.gray05, [], '')

call s:hi('PreProc', s:palette.gray07, [], 'none')

call s:hi('Type', s:palette.gray05, [], 'bold')

call s:hi('Special', s:palette.gray05, [], '')
call s:hi('SpecialComment', s:palette.comments, [], 'bold')

call s:hi('Title', s:palette.gray07, [], 'bold')
call s:hi('Todo', s:palette.purple, s:palette.black, '')
if has('nvim') || has('gui_running')
    call s:hi('Comment', s:palette.comments, [], 'italic')
else
    call s:hi('Comment', s:palette.comments, [], '')
endif

call s:hi('LineNr', s:palette.gray04, s:palette.gray01, 'none')
call s:hi('FoldColumn', s:palette.gray07, s:palette.gray01, 'none')
call s:hi('CursorLine', [], s:palette.gray01, 'none')
call s:hi('CursorLineNr', s:palette.gray14, s:palette.gray01, 'none')

call s:hi('Visual', s:palette.black, s:palette.gray06, '')
call s:hi('Search', s:palette.gray01, s:palette.gray11, 'none')
call s:hi('IncSearch', s:palette.black, s:palette.gray07, 'bold')

call s:hi('SpellBad', s:palette.red, s:palette.black, 'undercurl')
call s:hi('SpellCap', s:palette.red, s:palette.black, 'undercurl')
call s:hi('SpellLocal', s:palette.red, s:palette.black, 'undercurl')
call s:hi('SpellRare', s:palette.brown, s:palette.black, 'undercurl')

call s:hi('Error', s:palette.red, s:palette.black, 'bold')
call s:hi('ErrorMsg', s:palette.red, s:palette.black, '')
call s:hi('WarningMsg', s:palette.brown, s:palette.black, '')
call s:hi('ModeMsg', s:palette.gray10, [], '')
call s:hi('MoreMsg', s:palette.gray10, [], '')

call s:hi('MatchParen', s:palette.magenta, s:palette.black, '')

call s:hi('Cursor', [], s:palette.gray12, '')
call s:hi('Underlined', s:palette.gray08, [], 'underline')
call s:hi('SpecialKey', s:palette.gray04, [], '')
call s:hi('NonText', s:palette.gray04, [], '')
call s:hi('Directory', s:palette.gray08, [], '')

call s:hi('Pmenu', s:palette.gray10, s:palette.gray03, 'none')
call s:hi('PmenuSbar', s:palette.black, s:palette.gray15, 'none')
call s:hi('PmenuSel', s:palette.gray03, s:palette.gray10, '')
call s:hi('PmenuThumb', s:palette.gray03, s:palette.gray09, 'none')

call s:hi('StatusLine', s:palette.gray11, s:palette.gray03, 'none')
call s:hi('StatusLineNC', s:palette.gray04, s:palette.gray01, 'none')
call s:hi('WildMenu', s:palette.gray08, [], '')
call s:hi('VertSplit', s:palette.gray03, s:palette.gray03, 'none')

call s:hi('DiffAdd', s:palette.blackest, s:palette.green, '')
call s:hi('DiffChange', s:palette.blackest, s:palette.blue, '')
call s:hi('DiffDelete', s:palette.blackest, s:palette.red, '')
call s:hi('DiffText', s:palette.black, s:palette.lightblue, '')
call s:hi('DiffAdded', s:palette.green, s:palette.black, '')
call s:hi('DiffChanged', s:palette.blue, s:palette.black, '')
call s:hi('DiffRemoved', s:palette.red, s:palette.black, '')

hi! link Character Constant
hi! link Float Number
hi! link Boolean Number

hi! link SignColumn FoldColumn
hi! link ColorColumn FoldColumn
hi! link CursorColumn CursorLine

hi! link Folded LineNr
hi! link Conceal Normal
hi! link ErrorMsg Error

hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement

hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

hi! link SpecialChar Special
hi! link Tag Special
hi! link Delimiter Special
hi! link Debug Special
hi! link Question Special

hi! link VisualNOS Visual
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine

hi ALEError guifg=#ff727b ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl guisp=#9d0006
hi ALEWarning guifg=#fabd2f ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl guisp=#b57614
hi ALEInfo guifg=#83a598 ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl

hi RedSign guifg=#ff727b ctermfg=124 guibg=#333333 ctermbg=235 gui=NONE cterm=NONE
hi YellowSign guifg=#fabd2f ctermfg=214 guibg=#333333 ctermbg=235 gui=NONE cterm=NONE
hi GreenSign guifg=#b8bb26 ctermfg=142 guibg=#333333 ctermbg=235 gui=NONE cterm=NONE
hi BlueSign guifg=#83a598 ctermfg=109 guibg=#333333 ctermbg=235 gui=NONE cterm=NONE
hi AquaSign guifg=#8ec07c ctermfg=108 guibg=#333333 ctermbg=235 gui=NONE cterm=NONE

hi Todo guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=bold cterm=bold

hi ShadyFg3 guifg=#bdae93 ctermfg=248 guibg=NONE ctermbg=NONE
hi ShadyFg1 guifg=#ebdbb2 ctermfg=223 guibg=NONE ctermbg=NONE
hi ShadyBg2 guifg=#504945 ctermfg=239 guibg=NONE ctermbg=NONE
hi ShadyBlue guifg=#83a598 ctermfg=109 guibg=NONE ctermbg=NONE
hi ShadyBrightBlue guifg=#a5c7ff ctermfg=109 guibg=NONE ctermbg=NONE
hi ShadyAqua guibg=#8ec07c ctermbg=108
hi ShadyGray guifg=#928374 ctermfg=245 guibg=NONE ctermbg=NONE
hi ShadyYellow guifg=#fabd2f ctermfg=214 guibg=NONE ctermbg=NONE
hi ShadyOrange guifg=#fe8019 ctermfg=208 guibg=NONE ctermbg=NONE

hi! link ALEErrorSign RedSign
hi! link ALEWarningSign YellowSign
hi! link ALEStyleErrorSign RedSign
hi! link ALEStyleWarningSign YellowSign
hi! link ALEInfoSign BlueSign

hi! link SignifySignAdd GreenSign
hi! link SignifySignChange AquaSign
hi! link SignifySignDelete RedSign

hi! link StartifyBracket ShadyFg3
hi! link StartifyFile ShadyFg1
hi! link StartifyNumber ShadyBlue
hi! link StartifyPath ShadyGray
hi! link StartifySlash ShadyGray
hi! link StartifySection ShadyYellow
hi! link StartifySpecial ShadyBg2
hi! link StartifyHeader ShadyOrange
hi! link StartifyFooter ShadyBg2

hi! link Sneak ShadyAqua
hi! link SneakLabel ShadyAqua
hi! link SneakScope ShadyAqua

hi! link MatchParen ShadyOrange

hi! link DiffAdded GreenSign
hi! link DiffChanged BlueSign
hi! link DiffRemoved RedSign

hi! link SpellBad RedSign
