local lush = require "lush"
local hsl = lush.hsl

local c = require("kobol.colors").colors
local ch = require("kobol.colors").hsl_colors
local base = require "kobol.base_theme"

---@diagnostic disable: undefined-global
local plugins = lush(function()
    return {
        -- gitsigns: https://github.com/lewis6991/gitsigns.nvim
        GitSignsAdd { fg = c.green },
        GitSignsChange { fg = c.blue },
        GitSignsDelete { fg = c.red },
        GitSignsChangeDelete { fg = c.orange },

        -- barbar: https://github.com/romgrk/barbar.nvim
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

        -- cmp: https://github.com/hrsh7th/nvim-cmp
        CmpItemAbbr { fg = c.fg4 }, -- The abbr field (portion of word that isn't the match).
        CmpItemAbbrDeprecated { fg = c.fg4, gui = "strikethrough" }, -- The deprecated item's abbr field.
        CmpItemAbbrMatch { fg = c.fg, gui = "bold" }, -- The matched characters highlight.
        CmpItemAbbrMatchFuzzy { fg = c.fg, gui = "bold" }, -- The fuzzy matched characters highlight.
        CmpItemMenu { fg = c.fg3, gui = "italic" }, -- The menu field (source e.g. [lsp])
        CmpItemKindDefault { fg = c.fg4 },
        CmpItemKindKeyword { base.TSKeyword },
        CmpItemKindVariable { fg = c.aqua },
        CmpItemKindConstant { base.TSConstant },
        CmpItemKindReference { fg = c.lilac },
        CmpItemKindValue { fg = c.lilac },
        CmpItemKindFunction { base.TSFunction },
        CmpItemKindMethod { base.TSMethod },
        CmpItemKindConstructor { fg = c.blue },
        CmpItemKindClass { fg = c.yellow },
        CmpItemKindInterface { fg = c.yellow },
        CmpItemKindStruct { fg = c.yellow },
        CmpItemKindEvent { fg = c.yellow },
        CmpItemKindEnum { fg = c.yellow },
        CmpItemKindUnit { fg = c.yellow },
        CmpItemKindModule { base.TSNamespace },
        CmpItemKindProperty { fg = c.green },
        CmpItemKindField { base.TSField },
        CmpItemKindTypeParameter { base.TSParameter },
        CmpItemKindEnumMember { fg = c.green },
        CmpItemKindOperator { fg = c.green },
        CmpItemKindSnippet { fg = c.fg4 },

        -- notify: https://github.com/rcarriga/nvim-notify
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

        -- lightspeed: https://github.com/ggandor/lightspeed.nvim
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
        LightspeedUniqueChar { LightspeedUnlabeledMatch },
        LightspeedPendingOpArea { base.Visual },
        LightspeedCursor { base.Cursor },

        -- alpha: https://github.com/goolord/alpha-nvim
        AlphaShortcut { fg = c.orange, gui = "bold" },
        AlphaTitle { fg = c.yellow },
        AlphaFooter { fg = c.fg, gui = "bold,italic" },
        AlphaIcon { fg = c.blue },

        -- galaxyline: https://github.com/NTBBloodbath/galaxyline.nvim
        GalaxylineAccent { fg = c.accent_blue, bg = c.bg4 }, -- left side accent bar
        GalaxylineNormal { fg = c.fg4, bg = c.bg4 }, -- text for left and right sections
        GalaxylineNormalBold { fg = c.fg4, bg = c.bg4, gui = "bold" }, -- bold text for left and right sections
        GalaxylineLMSep { fg = c.bg1, bg = c.bg1 }, -- separator between left and middle
        GalaxylineLRSep { fg = c.bg1, bg = c.bg4 }, -- separator between left/middle or middle/right
        GalaxylineMiddleNormal { fg = base.Comment.fg, bg = c.bg1 }, -- text for middle section
        GalaxyLineMiddleError { fg = base.DiagnosticError.fg, bg = c.bg1 }, -- middle section LSP error
        GalaxyLineMiddleWarn { fg = base.DiagnosticWarn.fg, bg = c.bg1 }, -- middle section LSP warning
        GalaxyLineMiddleInfo { fg = base.DiagnosticInfo.fg, bg = c.bg1 }, -- middle section LSP information
        GalaxyLineMiddleHint { fg = base.DiagnosticHint.fg, bg = c.bg1 }, -- middle section LSP hint
        GalaxyLineLRWarn { fg = c.yellow, bg = c.bg4 }, -- trailing whitespace, mixed indentation
        GalaxyLinePerc { fg = c.fg4, bg = c.bg1, gui = "bold" }, -- line percentage
        GalaxylinePercSep { fg = c.bg4, bg = c.bg4 }, -- separator after line percentage
        GalaxyLineScroll { fg = c.green, bg = c.bg4 }, -- file precentage scroll bar
        GalaxyLineBarSep { fg = c.blue, bg = c.bg4 }, -- vertical bar separator
        GalaxylineInactive { fg = c.ifg, bg = c.ibg }, -- inactive window statusline
        GalaxylineSL { fg = c.fg, bg = c.accent_blue }, -- short line primary color
        GalaxylineSLSep { fg = c.accent_blue, bg = c.bg1 }, -- short line separator
        GalaxylineInactiveSep { fg = c.ibg, bg = c.bg1 }, -- inactive window separator

        -- conflict-marker: https://github.com/rhysd/conflict-marker.vim
        ConflictMarkerOurs { base.DiffAdd },
        ConflictMarkerTheirs { base.DiffDelete },
        ConflictMarkerCommonAncestorsHunk { base.DiffChange },

        -- hlslens: https://github.com/kevinhwang91/nvim-hlslens
        HlSearchNear { fg = c.bg, bg = c.yellow, gui = "bold" },
        HlSearchLens { base.Folded },
        HlSearchLensNear { base.Search },
        HlSearchFloat { HlSearchNear }, -- not sure what this one does
    }
end)

-- return our parsed theme for extension or use else where.
return plugins
