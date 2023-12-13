local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {}) --search files
vim.keymap.set('n', '<leader>sg', builtin.git_files, {}) --search git
vim.keymap.set('n', '<leader>sp', function() --search project
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

