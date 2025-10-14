vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },

  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },

  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics= {
          globals = { 'vim' },
      },
            workspace = {
        -- Make the server aware of Neovim runtime files (fixes "undefined global: vim)
        library = vim.api.nvim_get_runtime_file("/usr/share/nvim/runtime", true),
      },
      telemetry = {
        enable = false,
      },
    }
  }
}

vim.lsp.enable('lua_ls')
