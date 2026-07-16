" Vim port of VS Code's built-in "Dark 2026" theme.
" Generated from VS Code's active colorThemeData on 2026-07-16.

set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'dark2026'

" Editor chrome
highlight Normal       guifg=#bbbebf guibg=#121314 ctermfg=250 ctermbg=233
highlight NormalNC     guifg=#8c8c8c guibg=#121314 ctermfg=245 ctermbg=233
highlight Cursor       guifg=#121314 guibg=#bbbebf ctermfg=233 ctermbg=250
highlight CursorLine                  guibg=#242526               ctermbg=235 gui=NONE cterm=NONE
highlight CursorColumn                guibg=#242526               ctermbg=235
highlight ColorColumn                 guibg=#242526               ctermbg=235
highlight LineNr       guifg=#858889 guibg=#121314 ctermfg=244 ctermbg=233
highlight CursorLineNr guifg=#bbbebf guibg=#242526 ctermfg=250 ctermbg=235 gui=NONE cterm=NONE
highlight SignColumn   guifg=#858889 guibg=#121314 ctermfg=244 ctermbg=233
highlight FoldColumn   guifg=#858889 guibg=#121314 ctermfg=244 ctermbg=233
highlight Folded       guifg=#8c8c8c guibg=#242526 ctermfg=245 ctermbg=235
highlight NonText      guifg=#454647 guibg=#121314 ctermfg=238 ctermbg=233
highlight SpecialKey  guifg=#454647 guibg=#121314 ctermfg=238 ctermbg=233
highlight Whitespace   guifg=#454647 guibg=#121314 ctermfg=238 ctermbg=233
highlight EndOfBuffer  guifg=#121314 guibg=#121314 ctermfg=233 ctermbg=233
highlight VertSplit    guifg=#2a2b2c guibg=#121314 ctermfg=236 ctermbg=233
highlight WinSeparator guifg=#2a2b2c guibg=#121314 ctermfg=236 ctermbg=233

" Selection and search
highlight Visual       guifg=NONE    guibg=#276782 ctermfg=NONE ctermbg=24
highlight VisualNOS    guifg=NONE    guibg=#276782 ctermfg=NONE ctermbg=24
highlight Search       guifg=#f0f6fc guibg=#276782 ctermfg=255  ctermbg=24
highlight IncSearch    guifg=#0d1117 guibg=#79c0ff ctermfg=233  ctermbg=117
highlight CurSearch    guifg=#0d1117 guibg=#79c0ff ctermfg=233  ctermbg=117
highlight MatchParen   guifg=#f0f6fc guibg=#3994bc ctermfg=255  ctermbg=67 gui=bold cterm=bold

" Menus and status lines
highlight Pmenu        guifg=#bfbfbf guibg=#202122 ctermfg=250 ctermbg=235
highlight PmenuSel     guifg=#ffffff guibg=#297aa0 ctermfg=15  ctermbg=31
highlight PmenuSbar                   guibg=#2a2b2c               ctermbg=236
highlight PmenuThumb                  guibg=#8c8c8c               ctermbg=245
highlight StatusLine   guifg=#bfbfbf guibg=#191a1b ctermfg=250 ctermbg=234 gui=NONE cterm=NONE
highlight StatusLineNC guifg=#8c8c8c guibg=#191a1b ctermfg=245 ctermbg=234 gui=NONE cterm=NONE
highlight TabLine      guifg=#8c8c8c guibg=#191a1b ctermfg=245 ctermbg=234 gui=NONE cterm=NONE
highlight TabLineSel   guifg=#bfbfbf guibg=#121314 ctermfg=250 ctermbg=233 gui=NONE cterm=NONE
highlight TabLineFill  guifg=#2a2b2c guibg=#191a1b ctermfg=236 ctermbg=234
highlight WildMenu     guifg=#ffffff guibg=#297aa0 ctermfg=15  ctermbg=31
highlight Title        guifg=#79c0ff guibg=NONE    ctermfg=117 ctermbg=NONE gui=bold cterm=bold
highlight Directory    guifg=#79c0ff guibg=NONE    ctermfg=117 ctermbg=NONE
highlight Question     guifg=#7ee787 guibg=NONE    ctermfg=114 ctermbg=NONE
highlight MoreMsg      guifg=#79c0ff guibg=NONE    ctermfg=117 ctermbg=NONE
highlight ModeMsg      guifg=#bbbebf guibg=NONE    ctermfg=250 ctermbg=NONE gui=bold cterm=bold

" Syntax palette: final TextMate rules from Dark 2026
highlight Comment      guifg=#8b949e guibg=NONE ctermfg=245 ctermbg=NONE gui=NONE cterm=NONE
highlight Constant     guifg=#79c0ff guibg=NONE ctermfg=117 ctermbg=NONE
highlight String       guifg=#a5d6ff guibg=NONE ctermfg=153 ctermbg=NONE
highlight Character    guifg=#a5d6ff guibg=NONE ctermfg=153 ctermbg=NONE
highlight Number       guifg=#b5cea8 guibg=NONE ctermfg=151 ctermbg=NONE
highlight Boolean      guifg=#79c0ff guibg=NONE ctermfg=117 ctermbg=NONE
highlight Float        guifg=#b5cea8 guibg=NONE ctermfg=151 ctermbg=NONE
highlight Identifier   guifg=#c9d1d9 guibg=NONE ctermfg=252 ctermbg=NONE gui=NONE cterm=NONE
highlight Function     guifg=#d2a8ff guibg=NONE ctermfg=183 ctermbg=NONE
highlight Statement    guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Conditional  guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Repeat       guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Label        guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Operator     guifg=#c9d1d9 guibg=NONE ctermfg=252 ctermbg=NONE
highlight Keyword      guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Exception    guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight PreProc      guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Include      guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Define       guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Macro        guifg=#d2a8ff guibg=NONE ctermfg=183 ctermbg=NONE
highlight PreCondit    guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Type         guifg=#4ec9b0 guibg=NONE ctermfg=80  ctermbg=NONE
highlight StorageClass guifg=#ff7b72 guibg=NONE ctermfg=210 ctermbg=NONE
highlight Structure    guifg=#4ec9b0 guibg=NONE ctermfg=80  ctermbg=NONE
highlight Typedef      guifg=#4ec9b0 guibg=NONE ctermfg=80  ctermbg=NONE
highlight Special      guifg=#d7ba7d guibg=NONE ctermfg=180 ctermbg=NONE
highlight SpecialChar  guifg=#d7ba7d guibg=NONE ctermfg=180 ctermbg=NONE
highlight Tag          guifg=#7ee787 guibg=NONE ctermfg=114 ctermbg=NONE
highlight Delimiter    guifg=#bbbebf guibg=NONE ctermfg=250 ctermbg=NONE
highlight SpecialComment guifg=#8b949e guibg=NONE ctermfg=245 ctermbg=NONE
highlight Debug        guifg=#ffa657 guibg=NONE ctermfg=215 ctermbg=NONE
highlight Underlined   guifg=#79c0ff guibg=NONE ctermfg=117 ctermbg=NONE gui=underline cterm=underline
highlight Ignore       guifg=#555555 guibg=NONE ctermfg=240 ctermbg=NONE
highlight Error        guifg=#ffa198 guibg=#490202 ctermfg=217 ctermbg=52
highlight Todo         guifg=#ffa657 guibg=NONE    ctermfg=215 ctermbg=NONE gui=bold cterm=bold

" Diff and diagnostics
highlight DiffAdd      guifg=#7ee787 guibg=#04260f ctermfg=114 ctermbg=22
highlight DiffChange   guifg=#ffa657 guibg=#5a1e02 ctermfg=215 ctermbg=52
highlight DiffDelete   guifg=#ffa198 guibg=#490202 ctermfg=217 ctermbg=52
highlight DiffText     guifg=#f0f6fc guibg=#276782 ctermfg=255 ctermbg=24 gui=bold cterm=bold
highlight ErrorMsg     guifg=#ffa198 guibg=#490202 ctermfg=217 ctermbg=52
highlight WarningMsg   guifg=#ffa657 guibg=NONE    ctermfg=215 ctermbg=NONE
highlight DiagnosticError guifg=#ffa198 guibg=NONE ctermfg=217 ctermbg=NONE
highlight DiagnosticWarn  guifg=#ffa657 guibg=NONE ctermfg=215 ctermbg=NONE
highlight DiagnosticInfo  guifg=#79c0ff guibg=NONE ctermfg=117 ctermbg=NONE
highlight DiagnosticHint  guifg=#8b949e guibg=NONE ctermfg=245 ctermbg=NONE

" Common plugin groups
highlight CurrentWord      guifg=NONE guibg=#242526 ctermfg=NONE ctermbg=235
highlight CurrentWordTwins guifg=NONE guibg=#242526 ctermfg=NONE ctermbg=235 gui=underline cterm=underline
highlight link LspErrorText DiagnosticError
highlight link LspWarningText DiagnosticWarn
highlight link LspInformationText DiagnosticInfo
highlight link LspHintText DiagnosticHint
