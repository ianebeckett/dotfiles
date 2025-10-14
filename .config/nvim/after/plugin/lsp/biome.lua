--https://neovim.io/doc/user/lsp.html#lsp-new-config
--https://neovim.io/doc/user/lsp.html#vim.lsp.ClientConfig
--https://www.youtube.com/watch?v=c6m7soMqDNw

local util = require 'lspconfig.util'

vim.lsp.config['biome'] = {
    root_markers = { '.clangd', 'compile_commands.json', },
    init_options = { '--std=c++17' },

    cmd = { 'biome', 'lsp-proxy' },
    filetypes = {
      'astro',
      'css',
      'graphql',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'svelte',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'vue',
    },
    single_file_support = false,

    root_dir = function(bufnr, on_dir)
        vim.api.nvim_echo({{"root_dir called"}}, true, {})
        vim.api.nvim_echo({{"bufnr: " .. tostring(bufnr)}}, true, {})
        vim.api.nvim_echo({{"on_dir: : " .. tostring(on_dir)}}, true, {})
        local bufname = vim.fn.bufname(bufnr)
        for _, ext in ipairs(extensions) do
            if bufname:match('%.' .. ext .. '$') then
                local cwd = vim.fn.getcwd()
                on_dir(cwd)
                return cwd
            end
        end
        on_dir(nil)
        return nil
    end,
}

-- based on example at https://neovim.io/doc/user/lsp.html#vim.lsp.enable()

vim.lsp.config('biome', {
})

--vim.lsp.enable('biome')
