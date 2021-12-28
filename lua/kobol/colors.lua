local hsl = require("lush").hsl
local lush = require "lush"

local M = {}

M.colors = {

    -- foreground shades
    fg1 = "#405860",
    fg2 = "#4d616b",
    fg3 = "#65737e",
    fg4 = "#adb5c0",
    fg5 = "#d8dee9",

    -- background shades
    bg1 = "#17262e",
    bg2 = "#192932",
    bg3 = "#1b2b34",
    bg4 = "#223642",
    bg5 = "#29414f",

    -- base colors from https://github.com/voronianski/oceanic-next-color-scheme
    bg = "#1B2B34",
    base0 = "#1B2B34",
    base1 = "#343D46",
    base2 = "#4F5B66",
    base3 = "#65737E",
    base4 = "#A7ADBA",
    base5 = "#C0C5CE",
    base6 = "#CDD3DE",
    base7 = "#D8DEE9",
    fg = "#D8DEE9",
    red = "#EC5f67",
    orange = "#F99157",
    yellow = "#FAC863",
    green = "#99C794",
    aqua = "#5FB3B3",
    blue = "#6699CC",
    lilac = "#C594C5",
    brown = "#AB7967",

    -- extra colors
    accent_blue = "#224b73",
    dark_aqua = "#4b8a8d",
    dark_green = "#2d4a46",
    dark_blue = "#29445a",
    dark_red = "#45353e",

    -- extra fg & bg colors
    bg_middle = "#17262e", -- statusline middle background
    bg_lr = "#223642", -- statusline left/right background
    fge = "#adb5c0", -- statusline text
    ibg = "#233845", -- inactive background
    ifg = "#767c84", -- inactive foreground
}

-- create table of matching HSL colors
M.hsl_colors = {}
for k, v in pairs(M.colors) do
    M.hsl_colors[k] = hsl(v)
end

if vim.o.background == "light" then
    -- TODO
end

return M
