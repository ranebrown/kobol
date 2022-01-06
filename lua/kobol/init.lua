local lush = require "lush"
local base = require "kobol.base_theme"
local plugins = require "kobol.plugins_theme"
local languages = require "kobol.languages_theme"

local M = {}

function M.load()
    if vim.g.colors_name then
        vim.cmd "hi clear"
    end

    vim.g.colors_name = "kobol"
    vim.o.termguicolors = true

    local theme = lush.merge { base, plugins, languages }
    lush(theme)
end

M.config = {
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,
    specialException = true,
    transparent = false,
    colors = {},
    overrides = {},
}

function M.setup(opts)
    M.config = vim.tbl_extend("force", M.config, opts or {})
end

return M
