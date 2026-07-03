
## 快捷键

LSP buffer 启用后生效：

- `gd`：跳转到 definition
- `gr`：查找 references
- `gpr`：同 `gr`，保留 previous Neovim 配置中的肌肉记忆入口
- `gD`：跳转到 declaration
- `gi`：跳转到 implementation
- `gy`：跳转到 type definition
- `K`：hover 文档
- `gpd`：peek definition
- `gpi`：peek implementation
- `gpy`：peek type definition
- `gP`：关闭 preview window
- `<leader>rn`：rename symbol
- `<leader>ca`：code action
- `<leader>lf`：format 当前 buffer
- `[g` / `]g`：上一条/下一条 diagnostic
- quickfix/location list 中的 `gv`：垂直分屏打开当前条目，适合当前文件未保存时从 `gr`/`gd` 结果跳到其他文件继续改。


补全菜单的常用按键：

- 输入时自动弹出候选项。
- Go 输入 `.` 后会立即刷新 LSP 补全，例如 `rsp.` 会请求 `gopls` 返回 `rsp` 对应类型的字段 / 方法；C/C++ 输入 `.`, `->`, `::` 时同样会刷新。
- `<Tab>` / `<S-Tab>`：在候选项中上下选择。
- `<Enter>`：关闭补全菜单；如果已经用 `<Tab>` 选中候选项，保留当前选中内容。
- `<Ctrl-Space>`：手动刷新补全。
- 原生 omnifunc 仍然可用：`<Ctrl-X><Ctrl-O>`。

## Go 语法高亮

Go 的额外高亮规则放在：

```text
confs/dotprefix/vim/after/syntax/go.vim
```

当前 Go 高亮颜色参考 VS Code 默认 `Dark 2026` 主题，并启用 `vim-lsp` semantic highlighting：

- 注释：`#7285B7`
- 变量 / 参数 / 对象：`#FFFFFF`
- 函数 / 方法：`#EBBBFF`
- 类型：`#FFEEAD`
- 字符串：`#D1F1A9`
- 数字 / 常量：`#FFC58F`
- 关键字：`#EBBBFF`
- 运算符 / escape / format specifier：`#99FFFF`

Semantic token 支持由 `vim-lsp` 提供。配置入口：

```vim
let g:lsp_semantic_enabled = 1
```

颜色映射放在：

```text
confs/dotprefix/vim/after/plugin/lsp-semantic-dark2026.vim
```

它把 language server 返回的 token type 映射到 `LspSemanticVariable`、`LspSemanticMethod`、`LspSemanticType` 等 Vim highlight group。当前机器的 Vim 带有 `+textprop`，满足 classic Vim 使用 semantic token 高亮的条件。

这条规则会把类似下面的调用拆成不同 highlight group：

```go
client.Do(req)
```

- `client`：semantic token 生效后走 `LspSemanticVariable`；fallback 走 `goDark2026Variable`
- `Do`：semantic token 生效后走 `LspSemanticMethod`；fallback 走 `goDark2026Function`

这是基于 Vim syntax regex 的轻量规则，目的是改善常见 selector call 的可读性。它不会像 Tree-sitter 或 LSP semantic token 那样精确地区分 package function、struct method、field access 等语义。

## 以后需要其他语言时

下面这些 language server 通常是 Node/npm 生态，当前默认没有启用，也没有默认安装 Node/npm：

- JavaScript/TypeScript：`typescript-language-server`
- Shell：`bash-language-server`
- JSON：`json-languageserver`
- YAML：`yaml-language-server`
- Vimscript：`vim-language-server`
- Python pyright 替代 pylsp：`pyright-langserver`

需要启用它们时：

1. 在包列表里加 Node/npm：
   - apt/dnf：加入 `nodejs` 和 `npm`
   - Homebrew：加入 `node`
2. 运行 `pkgs/install.sh` 安装包。
3. 在 `confs/dotprefix/vimrc` 中增加对应 filetype 偏好，例如：

```vim
let g:lsp_settings_filetype_javascript = ['typescript-language-server']
let g:lsp_settings_filetype_typescript = ['typescript-language-server']
let g:lsp_settings_filetype_sh = ['bash-language-server']
let g:lsp_settings_filetype_json = ['json-languageserver']
let g:lsp_settings_filetype_yaml = ['yaml-language-server']
let g:lsp_settings_filetype_vim = ['vim-language-server']
```
