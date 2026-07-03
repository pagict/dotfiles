" VS Code Dark 2026 semantic token mapping for vim-lsp.
" Go variables are white and methods/functions are purple in the observed theme.
if exists('g:loaded_premium_lsp_semantic_dark2026')
  finish
endif
let g:loaded_premium_lsp_semantic_dark2026 = 1

function! s:dark2026_semantic_highlights() abort
  highlight! LspSemanticType          ctermfg=229 guifg=#FFEEAD
  highlight! LspSemanticClass         ctermfg=229 guifg=#FFEEAD
  highlight! LspSemanticEnum          ctermfg=229 guifg=#FFEEAD
  highlight! LspSemanticInterface     ctermfg=229 guifg=#FFEEAD
  highlight! LspSemanticStruct        ctermfg=229 guifg=#FFEEAD
  highlight! LspSemanticTypeParameter ctermfg=229 guifg=#FFEEAD

  highlight! LspSemanticVariable      ctermfg=15  guifg=#FFFFFF
  highlight! LspSemanticParameter     ctermfg=15  guifg=#FFFFFF
  highlight! LspSemanticProperty      ctermfg=15  guifg=#FFFFFF
  highlight! LspSemanticEnumMember    ctermfg=215 guifg=#FFC58F
  highlight! LspSemanticEvent         ctermfg=15  guifg=#FFFFFF

  highlight! LspSemanticFunction      ctermfg=219 guifg=#EBBBFF
  highlight! LspSemanticMethod        ctermfg=219 guifg=#EBBBFF
  highlight! LspSemanticMacro         ctermfg=219 guifg=#EBBBFF

  highlight! LspSemanticKeyword       ctermfg=219 guifg=#EBBBFF
  highlight! LspSemanticModifier      ctermfg=219 guifg=#EBBBFF
  highlight! LspSemanticComment       ctermfg=103 guifg=#7285B7
  highlight! LspSemanticString        ctermfg=193 guifg=#D1F1A9
  highlight! LspSemanticNumber        ctermfg=215 guifg=#FFC58F
  highlight! LspSemanticRegexp        ctermfg=193 guifg=#D1F1A9
  highlight! LspSemanticOperator      ctermfg=159 guifg=#99FFFF
  highlight! LspSemanticDecorator     ctermfg=219 guifg=#EBBBFF

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
