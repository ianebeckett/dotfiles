--netrw settings
vim.g.netrw_banner = 0 -- hidden

vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.encoding = "utf-8"
vim.opt.statusline="%f %= bufnr %n column %9.9c byte %9.9o: 0x%2.2B %{&fileencoding}"

vim.opt.nu = true
vim.opt.relativenumber = true
 -- high scrolloff minimizes vertical scanning with eyes
 -- set to rows / 2 - 1 to prevent text from moving when spamming jkjkjk
vim.opt.scrolloff = 21

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










































