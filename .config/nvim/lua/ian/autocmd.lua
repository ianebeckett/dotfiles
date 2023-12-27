-- highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout = 50}
  augroup end
]]

-- open help buffer on the right side of a vertical split
vim.cmd [[
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup end
]]
