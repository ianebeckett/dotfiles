vim.lsp.config['clangd'] = {
    cmd = { 'clangd', '--clang-tidy' },
    root_markers = {
        'compile_commands.json',
        'makefile',
        '.git'
    },
    filetypes = { 'c', 'cpp', 'h', 'hpp' },
    init_options = { '--std=c++17' },
}

vim.lsp.enable({'clangd'})
