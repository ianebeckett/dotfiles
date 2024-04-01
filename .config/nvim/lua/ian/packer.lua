-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --colorscheme
    use 'ellisonleao/gruvbox.nvim'
    use 'tomasiser/vim-code-dark'

    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
    use 'nvim-treesitter/nvim-treesitter-context'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --telescope needs ripgrep
    --telescope-fzf-native can improve performance
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    --nvim-cmp
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- snippets
    use {
        'L3MON4D3/LuaSnip',
        tag = "v2.*",
    }

    use 'rafamadriz/friendly-snippets'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- lsp package manager
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- completions
            { 'hrsh7th/cmp-nvim-lsp' },
        }
    }
end)
