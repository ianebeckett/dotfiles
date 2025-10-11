--todo
--go to def
--find references
--rename
--format
--diagnostic as virtual text
--go to implementation?
--etc

vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' }, -- Command and arguments to start the server.
  filetypes = { 'lua' }, -- Filetypes to automatically attach to.

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
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
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("/usr/share/nvim/runtime", true),
      },
      telemetry = {
        enable = false,
      },
    }
  }
}

vim.lsp.enable('lua_ls')

--lsp_zero.on_attach(function(client, bufnr)
--    local opts = { buffer = bufnr, remap = false }
--
--    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
--    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--    --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.definition() end, opts) -- TODO: doesn't do anthing
--    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--end)
