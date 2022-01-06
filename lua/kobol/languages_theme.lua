local lush = require "lush"
local hsl = lush.hsl
local c = require("kobol.colors").colors
local ch = require("kobol.colors").hsl_colors
local base = require "kobol.base_theme"

---@diagnostic disable: undefined-global
local languages = lush(function()
    return {
        -- ssh
        sshconfigYesNo { fg = c.red },
        sshconfigNumber { base.Normal },
        sshconfigHostPort { base.Function },
        sshconfigVar { fg = c.aqua },
    }
end)

-- return our parsed theme for extension or use else where.
return languages
