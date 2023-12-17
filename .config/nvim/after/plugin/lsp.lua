--https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md
local lsp = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

vim.g.lsp_zero_ui_signcolumn = 0

lsp.preset({
    float_border = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = {
        preserve_mappings = false,
        omit = {},
    },
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
})

mason.setup({})

mason_lspconfig.setup({
    ensure_installed = {
        'cssls',
        'eslint',
        'html',
        'lua_ls',
        'pyright',
        'tailwindcss',
        'tsserver'
    },
    handlers = {
        lsp.default_setup,
    },
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings to learn the available actions
    --lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnotic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vnr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

