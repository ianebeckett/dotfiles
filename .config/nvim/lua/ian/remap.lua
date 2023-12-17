--we place plugin-specific remaps in their respective "after/plugin/foo.lua" 
--vim.keymap.set("n", "<leader><CR>", vim.cmd.w)
vim.keymap.set("i", "<C-c>", "<esc>")
vim.keymap.set("n", "Q", "<nop>")

--netrw window management
vim.keymap.set("n", "<leader>nw", vim.cmd.Ex) --"new" window, or "netrw"
vim.keymap.set("n", "<leader>vw", vim.cmd.Vex) --vertical window
--vim.keymap.set("n", "<leader>hw", vim.cmd.Hex) -- horizontal window

--centered cursor for half-page jumping 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--...and for jumping between search results 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

--line management
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

--delete selection into the black hole register,
--preserving state of main register
vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+Y")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

--quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<Cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<Cmd>lnext<CR>zz")

--edit all instances of cursor word in file
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")

--chmod +x current file without leaving vim
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true })

--tmux
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true })

