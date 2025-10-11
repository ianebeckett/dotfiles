local lsp_zero = require('lsp-zero')

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --["<C-Space>"] = cmp.mapping.complete(),
})

--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp_mappings,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    }
})

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
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ float = true, count = 1 }) end)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ float = true, count = -1 }) end)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup()
require('mason-lspconfig').setup({
    --install these lsps automatically
    ensure_installed = {
        'lua_ls',
        'eslint',
        'clangd',
        'jedi_language_server',
    },

    --allow lsp_zero to set default configuration settings for every lsp
    handlers = {
        lsp_zero.default_setup,
        require('mason-lspconfig').setup({
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    vim.lsp.config.lua_ls.setup(lua_opts)
                end,
            },
        })

    },
})
