" Go syntax overrides mapped to VS Code's "Dark 2026" theme.
" This is regex-based syntax highlighting, not LSP semantic highlighting.
syntax match goSelectorObject /\<\h\w*\ze\.\h\w*\s*(/ containedin=ALLBUT,goComment,goString,goRawString,goCharacter
syntax match goMethodCall /\.\zs\h\w*\ze\s*(/ containedin=ALLBUT,goComment,goString,goRawString,goCharacter

" vim-polyglot creates these groups only when its optional Go highlighting is
" enabled. Keep fallbacks here so definitions still work with the stock syntax.
syntax match goDarkFunctionDecl /\<func\>\s\+\%(([^)]*)\s*\)\?\zs\h\w*/ containedin=ALLBUT,goComment,goString,goRawString,goCharacter

" Highlight printf-style verbs even when the verb is the first string content.
" This also handles argument indexes, flags, width and precision.
syntax match goDarkFormatSpecifier /%\%(%\|\%([[]\d\+[]]\)\?[-#0 +]*\%([[]\d\+[]]\*\|\*\|\d\+\)\?\%(\.\%([[]\d\+[]]\*\|\*\|\d\+\)\?\)\?\%([[]\d\+[]]\)\?[vTtbcdoqxXUeEfFgGspw]\)/ contained containedin=goString,goRawString

" Stock Vim does not identify a user-defined type in `var name Type`.
" Match from `var`, then use \zs so only the variable name or following
" pointer/package-qualified type receives the type highlight.
syntax region goDarkDeclaredType start=/\<var\>\s\+\h\w*\%(\s*,\s*\h\w*\)*\s\+/hs=e+1 end=/\ze\s*\%(=\|$\)/ keepend containedin=ALLBUT,goComment,goString,goRawString,goCharacter

highlight! goDark2026Text     ctermfg=250 guifg=#BBBEBF
highlight! goDark2026Comment  ctermfg=245 guifg=#8B949E
highlight! goDark2026Keyword  ctermfg=210 guifg=#FF7B72
highlight! goDark2026Function ctermfg=183 guifg=#D2A8FF
highlight! goDark2026Variable ctermfg=252 guifg=#C9D1D9
highlight! goDark2026Type     ctermfg=80  guifg=#4EC9B0
highlight! goDark2026String   ctermfg=153 guifg=#A5D6FF
highlight! goDark2026Number   ctermfg=151 guifg=#B5CEA8
highlight! goDark2026Operator ctermfg=252 guifg=#C9D1D9
highlight! goDark2026Error    ctermfg=217 ctermbg=52 guifg=#FFA198 guibg=#490202

highlight! link goComment                goDark2026Comment
highlight! link goPackage                goDark2026Keyword
highlight! link goImport                 goDark2026Keyword
highlight! link goVar                    goDark2026Keyword
highlight! link goConst                  goDark2026Keyword
highlight! link goDeclaration            goDark2026Keyword
highlight! link goStatement              goDark2026Keyword
highlight! link goConditional            goDark2026Keyword
highlight! link goLabel                  goDark2026Keyword
highlight! link goRepeat                 goDark2026Keyword
highlight! link goTypeDecl               goDark2026Keyword
highlight! link goDeclType               goDark2026Keyword

highlight! link goType                   goDark2026Type
highlight! link goSignedInts             goDark2026Type
highlight! link goUnsignedInts           goDark2026Type
highlight! link goFloats                 goDark2026Type
highlight! link goComplexes              goDark2026Type
highlight! link goExtraType              goDark2026Type
highlight! link goReceiverType           goDark2026Type
highlight! link goTypeConstructor        goDark2026Type
highlight! link goTypeName               goDark2026Type
highlight! link goParamType              goDark2026Type
highlight! link goDarkDeclaredType        goDark2026Type

highlight! link goFunction               goDark2026Function
highlight! link goFunctionCall           goDark2026Function
highlight! link goBuiltins               goDark2026Function
highlight! link goMethodCall             goDark2026Function
highlight! link goDarkFunctionDecl        goDark2026Function

highlight! link goField                  goDark2026Variable
highlight! link goVarAssign              goDark2026Variable
highlight! link goVarDefs                goDark2026Variable
highlight! link goSelectorObject         goDark2026Variable

highlight! link goParamName              goDark2026Variable
highlight! link goReceiverVar            goDark2026Variable
highlight! link goBoolean                Constant
highlight! link goConstants              Constant
highlight! link goPredefinedIdentifiers  Constant
highlight! link goDecimalInt             goDark2026Number
highlight! link goHexadecimalInt         goDark2026Number
highlight! link goOctalInt               goDark2026Number
highlight! link goBinaryInt              goDark2026Number
highlight! link goFloat                  goDark2026Number
highlight! link goHexadecimalFloat       goDark2026Number
highlight! link goImaginaryDecimal       goDark2026Number
highlight! link goImaginaryHexadecimal   goDark2026Number
highlight! link goImaginaryOctal         goDark2026Number
highlight! link goImaginaryBinary        goDark2026Number
highlight! link goImaginaryFloat         goDark2026Number
highlight! link goImaginaryHexadecimalFloat goDark2026Number

highlight! link goString                 goDark2026String
highlight! link goRawString              goDark2026String
highlight! link goImportString           goDark2026String
highlight! link goCharacter              goDark2026String

highlight! link goOperator               goDark2026Operator
highlight! link goPointerOperator        goDark2026Operator
highlight! link goVarArgs                goDark2026Operator
highlight! link goSpecialString          goDark2026Operator
highlight! link goFormatSpecifier        goDark2026Operator
highlight! link goDarkFormatSpecifier    goDark2026Operator

highlight! link goSpaceError             goDark2026Error
highlight! link goEscapeError            goDark2026Error
