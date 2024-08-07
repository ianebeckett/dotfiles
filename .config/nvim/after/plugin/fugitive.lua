local Ian_Fugitive = vim.api.nvim_create_augroup("Ian_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
    group = Ian_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>p", function()
            vim.cmd [[ Git push ]]
        end, opts)

        -- always rebase when pulling
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd [[ Git pull --rebase ]]
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ge", "<cmd>diffget //2<CR>") --"existing"
vim.keymap.set("n", "<leader>gi", "<cmd>diffget //3<CR>") --"incoming"
