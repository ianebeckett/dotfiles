local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp_zero-zero-keybindings to learn the available actions
    --lsp_zero.default_keymaps({buffer = bufnr})
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.definition() end, opts) -- TODO: doesn't do anthing
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    --xd may be preferable to dx to mentally separate diagnostic from deletion and avoid the prefix-hotkey issue
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts) -- TODO: doesn't do anthing
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    --install these lsps automatically
    ensure_installed = {
        'jedi_language_server',
        'clangd',
        'lua_ls',
    },
    --allow lsp_zero to set default configuration settings for every lsp
    --without this handler, we would have to require('lspconfig').[server].setup({...}) for every server.
    handlers = {
        lsp_zero.default_setup,
    },
})

--custom settings for each server

-- lua: version luaJIT, make lsp aware of neovim
local lua_opts = lsp_zero.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)
