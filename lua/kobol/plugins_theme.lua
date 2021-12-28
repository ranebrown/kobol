local lush = require "lush"
local hsl = lush.hsl

local c = require("kobol.colors").colors
local ch = require("kobol.colors").hsl_colors
local base = require "kobol.base_theme"

---@diagnostic disable: undefined-global
local plugins = lush(function()
    return {
        -- GitGutter
        GitGutterAdd { fg = c.green },
        GitGutterChange { fg = c.blue },
        GitGutterDelete { fg = c.red },
        GitGutterChangeDelete { fg = c.orange },

        -- Barbar
        BufferTabpageFill { fg = c.bg4, bg = c.bg1 },
        BufferTabpages { fg = c.bg4, gui = "bold" },
        BufferCurrent { base.TabLineSel },
        BufferCurrentMod { fg = c.green, gui = "bold" },
        BufferCurrentSign { fg = c.aqua },
        BufferVisible { fg = c.fg4, bg = c.bg1, gui = "bold" },
        BufferVisibleMod { fg = c.green, bg = c.bg1, gui = "bold" },
        BufferVisibleSign { fg = c.bg4, bg = c.bg1 },
        BufferInactive { base.TabLine },
        BufferInactiveMod { fg = "#65876d", bg = c.bg1, gui = "bold" },
        BufferInactiveSign { BufferTabpageFill },

        -- Cmp
        CmpItemAbbr { fg = c.fg4 }, -- The abbr field (portion of word that isn't the match).
        CmpItemAbbrDeprecated { fg = c.fg4, gui = "strikethrough" }, -- The deprecated item's abbr field.
        CmpItemAbbrMatch { fg = c.fg, gui = "bold" }, -- The matched characters highlight.
        CmpItemAbbrMatchFuzzy { fg = c.fg, gui = "bold" }, -- The fuzzy matched characters highlight.
        CmpItemMenu { fg = c.fg3, gui = "italic" }, -- The menu field (source e.g. [lsp])
        CmpItemKindDefault { fg = c.fg4 },
        CmpItemKindKeyword { fg = c.aqua },
        CmpItemKindVariable { fg = c.aqua },
        CmpItemKindConstant { fg = c.aqua },
        CmpItemKindReference { fg = c.lilac },
        CmpItemKindValue { fg = c.lilac },
        CmpItemKindFunction { fg = c.blue },
        CmpItemKindMethod { fg = c.blue },
        CmpItemKindConstructor { fg = c.blue },
        CmpItemKindClass { fg = c.yellow },
        CmpItemKindInterface { fg = c.yellow },
        CmpItemKindStruct { fg = c.yellow },
        CmpItemKindEvent { fg = c.yellow },
        CmpItemKindEnum { fg = c.yellow },
        CmpItemKindUnit { fg = c.yellow },
        CmpItemKindModule { fg = c.orange },
        CmpItemKindProperty { fg = c.green },
        CmpItemKindField { fg = c.green },
        CmpItemKindTypeParameter { fg = c.green },
        CmpItemKindEnumMember { fg = c.green },
        CmpItemKindOperator { fg = c.green },
        CmpItemKindSnippet { fg = c.fg4 },

        -- Notify
        NotifyERRORBorder { fg = c.red },
        NotifyWARNBorder { fg = c.yellow },
        NotifyINFOBorder { fg = c.blue },
        NotifyDEBUGBorder { fg = c.lilac },
        NotifyTRACEBorder { fg = c.green },
        NotifyERRORIcon { fg = c.red },
        NotifyWARNIcon { fg = c.yellow },
        NotifyINFOIcon { fg = c.blue },
        NotifyDEBUGIcon { fg = c.lilac },
        NotifyTRACEIcon { fg = c.green },
        NotifyERRORTitle { fg = c.red },
        NotifyWARNTitle { fg = c.yellow },
        NotifyINFOTitle { fg = c.blue },
        NotifyDEBUGTitle { fg = c.lilac },
        NotifyTRACETitle { fg = c.green },
        NotifyERRORBody { base.Normal },
        NotifyWARNBody { base.Normal },
        NotifyINFOBody { base.Normal },
        NotifyDEBUGBody { base.Normal },
        NotifyTRACEBody { base.Normal },

        -- Lightspeed
        LightspeedLabel { fg = c.yellow, gui = "bold,underline" },
        LightspeedLabelOverlapped { fg = c.yellow, gui = "underline" },
        LightspeedLabelDistant { fg = c.blue, gui = "bold,underline" },
        LightspeedLabelDistantOverlapped { fg = c.blue, gui = "underline" },
        LightspeedShortcut { fg = c.yellow, gui = "bold,underline,reverse" },
        LightspeedShortcutOverlapped { fg = c.yellow, gui = "underline,reverse" },
        LightspeedMaskedChar { fg = c.fg4 },
        LightspeedGreyWash { base.Comment },
        LightspeedUnlabeledMatch { fg = c.fg, gui = "bold" },
        LightspeedOneCharMatch { fg = c.yellow, gui = "bold,reverse" },
        LightspeedUniqueChar {LightspeedUnlabeledMatch},
        LightspeedPendingOpArea {base.Visual},
        LightspeedCursor { base.Cursor },
    }
end)

-- return our parsed theme for extension or use else where.
return plugins
