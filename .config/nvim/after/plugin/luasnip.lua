if vim.g.snippets ~= "luasnip" then
    return
end

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false,
    ext_opts = nil,
}

require("luasnip.loaders.from_vscode").lazy_load()
