vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.encoding = "utf-8"

vim.opt.nu = true
vim.opt.relativenumber = true
 -- high scrolloff minimizes vertical scanning with eyes
 -- low scrolloff helps with seeing the entirey of large code blocks at once
vim.opt.scrolloff = 999

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

vim.opt.updatetime = 50

vim.opt.colorcolumn = { "80" }
vim.opt.signcolumn = "yes"

--netrw settings
vim.g.netrw_banner = 0 -- hidden





























































