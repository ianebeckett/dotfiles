vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.encoding = "utf-8"

vim.opt.nu = true

-- I'm removing relative numbers because I don't often look at them,
-- and it's a hindrance for other people who look at my screen to communicate
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--TODO
--set splitbelow
--set splitright

vim.opt.smartindent = true

vim.opt.wrap = false

--use undofile and undotree intead of swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10 --all the single-digit relative numbers look like a bracket
vim.opt.updatetime = 50

vim.opt.colorcolumn = { "80" }
vim.opt.signcolumn = "yes"

--netrw settings
vim.g.netrw_banner = 0 -- hidden

