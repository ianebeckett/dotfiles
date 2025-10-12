vim.lsp.config['eslint'] = {
  debug = true,
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  root_markers = {
    'eslint.config.mjs',
    'eslint.config.js',
    'eslint.config.cjs',
    'eslint.config.ts',
    'eslint.config.mts',
    'eslint.config.cts',
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
    '.git',
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
    'svelte',
    'astro',
  },
  --eslint LSP settings references:
  --https://github.com/esmuellert/nvim-eslint?tab=readme-ov-file
  --https://github.com/microsoft/vscode-eslint/blob/790646388696511b2665a4d119bf0fb713dd990d/%24shared/settings.ts#L156-L178
  --https://github.com/Microsoft/vscode-eslint#settings-options
  --https://github.com/microsoft/vscode-languageserver-node (search for vscode-languageserver-protocol)
  settings = {
    validate = 'on',
    --packageManager = nil, --deprecated
    useESLintClass = true,
    useFlatConfig = true,
    experimental = { useFlatConfig = false, },
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = 'separateLine',
      },
      showDocumentation = {
        enable = true,
      },
    },
    codeActionOnSave = {
      enable = false,
      mode = 'all',
    },
    format = false, -- use Prettier
    quiet = false,
    onIgnoredFiles = 'off',
    options = {},
    rulesCustomizations = {},
    run = 'onType',
    problems = { shortenToSingleLine = false, },
    nodePath = '',
   -- workspaceFolder = function(bufnr)
   --     local git_dir = M.resolve_git_dir(bufnr)
   --     return {
   --         uri = vim.uri_from_fname(git_dir),
   --         name = vim.fn.fnamemodify(git_dir, ':t'),
   --     }
   -- end,
    workingDirectory = { mode = 'location' },
  },
}

vim.lsp.enable({'eslint'})
