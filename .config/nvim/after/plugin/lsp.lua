local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp_zero-zero-keybindings to learn the available actions
    --lsp_zero.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp_zero.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp_zero.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp_zero.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnotic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp_zero.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vnr", function() vim.lsp_zero.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp_zero.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp_zero.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    --install these lsps automatically 
    ensure_installed = {
        'clangd',
        'cssls',
        'html',
        'lua_ls',
    },
    --allow lsp_zero to set default configuration settings for every lsp
    --without this handler, we would have to require('lspconfig').[server].setup({}) for every server.
    handlers = {
        lsp_zero.default_setup,
    },
})

