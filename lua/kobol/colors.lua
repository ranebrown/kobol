local hsl = require("lush").hsl
local lush = require "lush"

local M = {}

M.colors = {

    -- foreground shades
    fg1 = "#405860",
    fg2 = "#4D616B",
    fg3 = "#65737E",
    fg4 = "#ADB5C0",
    fg = "#D8DEE9",

    -- background shades
    bg1 = "#17262E",
    bg2 = "#192932",
    bg = "#1B2B34",
    bg4 = "#223642",
    bg5 = "#29414F",

    -- extra fg & bg colors
    ibg = "#233845", -- inactive background
    ifg = "#767c84", -- inactive foreground
    fbg = "#1e313b", -- fold bg

    -- original oceanic-next shades
    base0 = "#1B2B34",
    base1 = "#343D46",
    base2 = "#4F5B66",
    base3 = "#65737E",
    base4 = "#A7ADBA",
    base5 = "#C0C5CE",
    base6 = "#CDD3DE",
    base7 = "#D8DEE9",

    -- base colors
    red = "#EC5f67",
    orange = "#F99157",
    yellow = "#FAC863",
    green = "#99C794",
    aqua = "#5FB3B3",
    blue = "#6699CC",
    lilac = "#C594C5",
    brown = "#AB7967",

    -- extra colors
    grey_blue =  "#4d708c",
    accent_blue = "#224b73",
    dark_aqua = "#4b8a8d",
    dark_green = "#2d4a46",
    dark_blue = "#29445a",
    dark_red = "#45353e",
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
