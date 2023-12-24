vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.encoding = "utf-8"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

--use undofile and undotree intead of swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 9 --all the single-digit relative numbers look like a bracket
vim.opt.updatetime = 50

vim.opt.colorcolumn = { "80" }
vim.opt.signcolumn = "yes"

--vim.diagnostic.config({
--    signs = {
--        text = {
--            [vim.diagnostic.severity.ERROR] = '',
--            [vim.diagnostic.severity.WARN] = '',
--            [vim.diagnostic.severity.HINT] = '',
--            [vim.diagnostic.severity.INFO] = '',
--        }
--    }
--})

--netrw settings
vim.g.netrw_banner = 0 -- hidden
--vim.g.netrw_liststyle = 3 -- tree, useful for seeing the shape of new projects

--bracket expansion
--inoremap (; (<CR>);<C-c>O
--inoremap (, (<CR>),<C-c>O
--inoremap {; {<CR>};<C-c>O
--inoremap {, {<CR>},<C-c>O
--inoremap [; [<CR>];<C-c>O
--inoremap [, [<CR>],<C-c>O
