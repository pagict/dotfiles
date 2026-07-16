" VS Code Dark 2026 semantic token mapping for vim-lsp.
" Values come from VS Code's active colorThemeData.
if exists('g:loaded_premium_lsp_semantic_dark2026')
  finish
endif
let g:loaded_premium_lsp_semantic_dark2026 = 1

function! s:dark2026_semantic_highlights() abort
  highlight! LspSemanticType          ctermfg=80  guifg=#4EC9B0
  highlight! LspSemanticClass         ctermfg=80  guifg=#4EC9B0
  highlight! LspSemanticEnum          ctermfg=80  guifg=#4EC9B0
  highlight! LspSemanticInterface     ctermfg=80  guifg=#4EC9B0
  highlight! LspSemanticStruct        ctermfg=80  guifg=#4EC9B0
  highlight! LspSemanticTypeParameter ctermfg=80  guifg=#4EC9B0

  highlight! LspSemanticVariable      ctermfg=252 guifg=#C9D1D9
  highlight! LspSemanticParameter     ctermfg=252 guifg=#C9D1D9
  highlight! LspSemanticProperty      ctermfg=117 guifg=#79C0FF
  highlight! LspSemanticEnumMember    ctermfg=117 guifg=#79C0FF
  highlight! LspSemanticEvent         ctermfg=117 guifg=#79C0FF

  highlight! LspSemanticFunction      ctermfg=183 guifg=#D2A8FF
  highlight! LspSemanticMethod        ctermfg=183 guifg=#D2A8FF
  highlight! LspSemanticMacro         ctermfg=183 guifg=#D2A8FF

  highlight! LspSemanticKeyword       ctermfg=210 guifg=#FF7B72
  highlight! LspSemanticModifier      ctermfg=210 guifg=#FF7B72
  highlight! LspSemanticComment       ctermfg=245 guifg=#8B949E
  highlight! LspSemanticString        ctermfg=153 guifg=#A5D6FF
  highlight! LspSemanticNumber        ctermfg=151 guifg=#B5CEA8
  highlight! LspSemanticRegexp        ctermfg=153 guifg=#A5D6FF
  highlight! LspSemanticOperator      ctermfg=252 guifg=#C9D1D9
  highlight! LspSemanticDecorator     ctermfg=183 guifg=#D2A8FF

  highlight! link LspSemanticReadonlyVariable LspSemanticVariable
  highlight! link LspSemanticDefinitionVariable LspSemanticVariable
  highlight! link LspSemanticDeclarationVariable LspSemanticVariable
  highlight! link LspSemanticModificationVariable LspSemanticVariable
  highlight! link LspSemanticDefaultLibraryVariable LspSemanticVariable

  highlight! link LspSemanticReadonlyParameter LspSemanticParameter
  highlight! link LspSemanticDefinitionParameter LspSemanticParameter
  highlight! link LspSemanticDeclarationParameter LspSemanticParameter
  highlight! link LspSemanticModificationParameter LspSemanticParameter

  highlight! link LspSemanticReadonlyProperty LspSemanticProperty
  highlight! link LspSemanticDefinitionProperty LspSemanticProperty
  highlight! link LspSemanticDeclarationProperty LspSemanticProperty
  highlight! link LspSemanticModificationProperty LspSemanticProperty

  highlight! link LspSemanticDefaultLibraryFunction LspSemanticFunction
  highlight! link LspSemanticDefinitionFunction LspSemanticFunction
  highlight! link LspSemanticDeclarationFunction LspSemanticFunction
  highlight! link LspSemanticDefaultLibraryMethod LspSemanticMethod
  highlight! link LspSemanticDefinitionMethod LspSemanticMethod
  highlight! link LspSemanticDeclarationMethod LspSemanticMethod
endfunction

augroup premium_lsp_semantic_dark2026
  autocmd!
  autocmd ColorScheme * call s:dark2026_semantic_highlights()
augroup END

call s:dark2026_semantic_highlights()
