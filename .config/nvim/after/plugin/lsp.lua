--When checking nvim-lspconfig for defaults, remember that nvim-lspconfig
--defaults are in e.g. lsp/lua_ls.lua; the ones in lua/lspconfig/configs are
--deprecated and will be removed.

--lsp logs to ~/.local/state/nvim/lsp.log
--vim.lsp.log.set_level('debug')
--require('vim.lsp.log').set_format_func(vim.inspect)

--"vim.lsp.config('foo', { ... })" modifies lspconfig's defaults. Preferred.
--"vim.lsp.config['foo'] = { ... }" defines a new config seperate from lspconfig.
--"return { ... }" is for nvim-lspconfig's internal defaults. Don't use that.

-- For Lua:
-- I'm using the full config as opposed to the Neovim-specific one suggest in 
-- nvimm-lspconfig/lsp/lua_ls because I couldn't get that one to work.
-- This one probably works because I installed lua-langauge-server on my local machine.
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml',
    'stylua.toml', 'selene.toml', 'selene.yml', '.git',
  },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics= {
          globals = { 'vim' },
      },
      telemetry = {
        enable = false,
      },
      workspace = {
        --Make the server aware of Neovim runtime files (fixes "undefined global: vim)
        --TODO: set $VIMRUNTIME correctly and get this from there?
        --This way is not preferred, and is making lua_ls take 2 seconds to load.
        --See https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
        library = vim.api.nvim_get_runtime_file('', true),
      },
    }
  }
}

vim.lsp.config('clangd', {
    cmd = { 'clangd', '--clang-tidy' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'h', 'hpp' },
    init_options = { '--std=c++17' }, --TODO: remove line
})

--vim.lsp.config('eslint', {
--    --we need to see if nvm-lspconfig defaults work to see if we should submit an issue
--
--    --eslint LSP settings references:
--    --https://github.com/esmuellert/nvim-eslint?tab=readme-ov-file
--    --https://github.com/microsoft/vscode-eslint/blob/790646388696511b2665a4d119bf0fb713dd990d/%24shared/settings.ts#L156-L178
--    --https://github.com/Microsoft/vscode-eslint#settings-options
--    --https://github.com/microsoft/vscode-languageserver-node (search for vscode-languageserver-protocol)
--    settings = {
--        debug = true, -- what does this even do?
--        useFlatConfig = true,
--        codeActionOnSave = { enable = false, mode = 'all' },
--        format = false, -- use Prettier
--        quiet = false,
--        workingDirectory = { mode = 'location' },
--    },
--})

vim.lsp.enable({
    'lua_ls',
    'clangd',
--    'eslint',
});

--TODO: configure this stuff
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
