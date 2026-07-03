" Go syntax overrides inspired by VS Code's "Dark 2026" theme.
" This is regex-based syntax highlighting, not LSP semantic highlighting.
syntax match goSelectorObject /\<\h\w*\ze\.\h\w*\s*(/ containedin=ALLBUT,goComment,goString,goRawString,goCharacter
syntax match goMethodCall /\.\zs\h\w*\ze\s*(/ containedin=ALLBUT,goComment,goString,goRawString,goCharacter

highlight! goDark2026Text     ctermfg=15  guifg=#FFFFFF
highlight! goDark2026Comment  ctermfg=103 guifg=#7285B7
highlight! goDark2026Keyword  ctermfg=219 guifg=#EBBBFF
highlight! goDark2026Function ctermfg=219 guifg=#EBBBFF
highlight! goDark2026Variable ctermfg=15  guifg=#FFFFFF
highlight! goDark2026Type     ctermfg=229 guifg=#FFEEAD
highlight! goDark2026String   ctermfg=193 guifg=#D1F1A9
highlight! goDark2026Number   ctermfg=215 guifg=#FFC58F
highlight! goDark2026Operator ctermfg=159 guifg=#99FFFF
highlight! goDark2026Error    ctermfg=125 guifg=#A92049

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

highlight! link goFunction               goDark2026Function
highlight! link goFunctionCall           goDark2026Function
highlight! link goBuiltins               goDark2026Function
highlight! link goMethodCall             goDark2026Function

highlight! link goField                  goDark2026Variable
highlight! link goVarAssign              goDark2026Variable
highlight! link goVarDefs                goDark2026Variable
highlight! link goSelectorObject         goDark2026Variable

highlight! link goParamName              goDark2026Number
highlight! link goReceiverVar            goDark2026Number
highlight! link goBoolean                goDark2026Number
highlight! link goPredefinedIdentifiers  goDark2026Number
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

highlight! link goSpaceError             goDark2026Error
highlight! link goEscapeError            goDark2026Error
