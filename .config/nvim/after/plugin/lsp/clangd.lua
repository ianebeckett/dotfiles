vim.lsp.config['clangd'] = {
    cmd = { 'clangd', '--clang-tidy' },
    filetypes = { 'c', 'cpp', 'h', 'hpp' },
    root_markers = { '.clangd', 'compile_commands.json', '.git' },
    init_options = { '--std=c++17' },
}

vim.lsp.enable({'clangd'})
