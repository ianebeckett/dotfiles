require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        ignore_focus = {},
        always_divide_middle = false,
        globalstatus = false,
    },
    sections = {
        lualine_a = {},
        lualine_b = { 'filename', 'branch', },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'encoding' },
        lualine_y = {},
        lualine_z = {}
    }
}

--require('lualine').hide()
